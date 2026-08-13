#!/usr/bin/env python3
"""
Benchmark silnika HoMM3 w JAX - wersja rozszerzona.

Mierzy szesc grup wielkosci:
  1. przepustowosc krokow symulacji wzgledem rozmiaru wsadu
  2. czas kompilacji XLA (osobno lowering i compile)
  3. zajetosc pamieci -> empiryczne bajty na stan D
  4. FLOP-y i bajty z cost_analysis -> intensywnosc arytmetyczna
  5. przepustowosc decyzji MCTS wzgledem wsadu i wzgledem num_simulations
  6. pobor mocy -> dzule na decyzje

Dodatkowo porownuje silniki v2 i v3, czego iloraz jest empirycznym
wspolczynnikiem dylatacji eta z rozdzialu o zakresie mechanik.

UZYCIE
    python bench.py --tag laptop-cpu --engine v3
    CUDA_VISIBLE_DEVICES=0     python bench.py --tag 1gpu --engine v3 --power
    CUDA_VISIBLE_DEVICES=0,1,2 python bench.py --tag 3gpu --engine v3 --power
    CUDA_VISIBLE_DEVICES=0     python bench.py --tag 1gpu-v2 --engine v2

WAZNE
    Ustaw XLA_PYTHON_CLIENT_PREALLOCATE=false, inaczej pomiar pamieci
    pokaze stala wartosc zamiast rzeczywistej.
"""

import argparse
import importlib
import json
import os
import platform
import socket
import subprocess
import sys
import threading
import time
from datetime import datetime, timezone

import numpy as np

import jax
import jax.numpy as jnp
from jax.sharding import Mesh, NamedSharding
from jax.sharding import PartitionSpec as P


# ===========================================================================
# WYBOR SILNIKA
# ===========================================================================

def load_engine(version):
    """Zwraca (env, modul). Silniki v2 i v3 maja zgodny interfejs."""
    mod = importlib.import_module(f"jax_engine_{version}")
    cls = getattr(mod, f"HoMM3Env{version.upper()}")
    return cls(), mod


# ===========================================================================
# METADANE I MONITORING
# ===========================================================================

def cpu_model():
    try:
        with open("/proc/cpuinfo") as f:
            for line in f:
                if line.startswith("model name"):
                    return line.split(":", 1)[1].strip()
    except OSError:
        pass
    return platform.processor() or "nieznany"


def nvidia_query(fields):
    try:
        out = subprocess.run(
            ["nvidia-smi", f"--query-gpu={','.join(fields)}",
             "--format=csv,noheader,nounits"],
            capture_output=True, text=True, timeout=10)
        if out.returncode == 0:
            return [[p.strip() for p in line.split(",")]
                    for line in out.stdout.strip().splitlines()]
    except (OSError, subprocess.SubprocessError):
        pass
    return []


def machine_info():
    devs = jax.devices()
    gpus = nvidia_query(["name", "memory.total", "driver_version"])
    return {
        "host": socket.gethostname(),
        "timestamp": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "platform": devs[0].platform,
        "device_kind": devs[0].device_kind,
        "n_devices": len(devs),
        "cpu": cpu_model(),
        "cpu_cores": os.cpu_count(),
        "gpus": [" / ".join(g) for g in gpus],
        "jax_version": jax.__version__,
        "python": sys.version.split()[0],
        "preallocate": os.environ.get("XLA_PYTHON_CLIENT_PREALLOCATE", "(domyslne)"),
    }


def foreign_processes():
    """Sprawdza, czy na kartach siedza cudze procesy - zaburzaja pomiar."""
    try:
        out = subprocess.run(
            ["nvidia-smi", "--query-compute-apps=pid,used_memory",
             "--format=csv,noheader,nounits"],
            capture_output=True, text=True, timeout=10)
        me = str(os.getpid())
        return [l.strip() for l in out.stdout.strip().splitlines()
                if l.strip() and not l.strip().startswith(me)]
    except (OSError, subprocess.SubprocessError):
        return []


def device_memory_bytes():
    try:
        total = 0
        for d in jax.local_devices():
            st = d.memory_stats()
            if st:
                total += int(st.get("bytes_in_use", 0))
        return total or None
    except Exception:
        return None


class PowerSampler(threading.Thread):
    """Probkuje pobor mocy i utylizacje w tle."""

    def __init__(self, interval=0.25):
        super().__init__(daemon=True)
        self.interval = interval
        self._stop = threading.Event()
        self.power, self.util = [], []
        try:
            import pynvml
            pynvml.nvmlInit()
            self._nvml = pynvml
            self._handles = [pynvml.nvmlDeviceGetHandleByIndex(i)
                             for i in range(pynvml.nvmlDeviceGetCount())]
        except Exception:
            self._nvml = None
            self._handles = []

    def run(self):
        while not self._stop.is_set():
            if self._nvml:
                try:
                    p = sum(self._nvml.nvmlDeviceGetPowerUsage(h) / 1000.0
                            for h in self._handles)
                    u = np.mean([self._nvml.nvmlDeviceGetUtilizationRates(h).gpu
                                 for h in self._handles])
                    self.power.append(p)
                    self.util.append(float(u))
                except Exception:
                    pass
            else:
                rows = nvidia_query(["power.draw", "utilization.gpu"])
                if rows:
                    try:
                        self.power.append(sum(float(r[0]) for r in rows))
                        self.util.append(
                            float(np.mean([float(r[1]) for r in rows])))
                    except ValueError:
                        pass
            self._stop.wait(self.interval)

    def stop(self):
        self._stop.set()
        self.join(timeout=3)
        return {
            "power_w_mean": round(float(np.mean(self.power)), 1) if self.power else None,
            "power_w_max": round(float(np.max(self.power)), 1) if self.power else None,
            "util_pct_mean": round(float(np.mean(self.util)), 1) if self.util else None,
            "n_samples": len(self.power),
        }


# ===========================================================================
# SHARDING
# ===========================================================================

def make_sharding():
    devs = jax.devices()
    mesh = Mesh(np.array(devs).reshape(len(devs)), axis_names=("b",))
    return NamedSharding(mesh, P("b")), len(devs)


def shard_keys(key, batch, sharding):
    return jax.device_put(jax.random.split(key, batch), sharding)


# ===========================================================================
# ANALIZA SKOMPILOWANEGO PROGRAMU
# ===========================================================================

def analyse_compiled(compiled):
    """FLOP-y, bajty, rozmiary buforow. Bez uprawnien i bez ncu."""
    info = {}
    try:
        ca = compiled.cost_analysis()
        if isinstance(ca, (list, tuple)):
            ca = ca[0] if ca else {}
        if isinstance(ca, dict):
            flops = ca.get("flops")
            byts = ca.get("bytes accessed")
            info["flops"] = float(flops) if flops else None
            info["bytes_accessed"] = float(byts) if byts else None
            if flops and byts:
                info["arithmetic_intensity"] = round(float(flops) / float(byts), 3)
    except Exception as exc:
        info["cost_analysis_error"] = str(exc)
    try:
        ma = compiled.memory_analysis()
        info["mem_argument_bytes"] = int(ma.argument_size_in_bytes)
        info["mem_output_bytes"] = int(ma.output_size_in_bytes)
        info["mem_temp_bytes"] = int(ma.temp_size_in_bytes)
    except Exception:
        pass
    return info


# ===========================================================================
# BENCHMARK 1: KROKI SYMULACJI
# ===========================================================================

def build_rollout(env, batch, n_steps):
    def one_step(carry, _):
        states, key = carry
        key, k_act, k_step, k_reset = jax.random.split(key, 4)
        logits = jnp.where(states.legal_action_mask, 0.0, -1e9)
        actions = jax.random.categorical(k_act, logits, axis=-1)
        states = jax.vmap(env.step)(
            states, actions, jax.random.split(k_step, batch))
        done = states.terminated | states.truncated
        fresh = jax.vmap(env.init)(jax.random.split(k_reset, batch))
        states = jax.tree_util.tree_map(
            lambda a, b: jnp.where(
                done.reshape((-1,) + (1,) * (a.ndim - 1)), b, a),
            states, fresh)
        return (states, key), None

    def run(states, key):
        (states, key), _ = jax.lax.scan(
            one_step, (states, key), None, length=n_steps)
        return states, key

    return run


def bench_steps(env, batch, n_steps, sharding, repeats, want_analysis):
    key = jax.random.PRNGKey(0)
    states = jax.jit(jax.vmap(env.init))(shard_keys(key, batch, sharding))

    run = build_rollout(env, batch, n_steps)

    # --- kompilacja mierzona w dwoch fazach ---
    t0 = time.perf_counter()
    lowered = jax.jit(run).lower(states, key)
    t_lower = time.perf_counter() - t0

    t0 = time.perf_counter()
    compiled = lowered.compile()
    t_compile = time.perf_counter() - t0

    analysis = analyse_compiled(compiled) if want_analysis else {}

    # --- rozgrzewka (pierwsze faktyczne wykonanie) ---
    t0 = time.perf_counter()
    states, key = compiled(states, key)
    jax.block_until_ready(states.active_unit_idx)
    t_first = time.perf_counter() - t0

    times = []
    for _ in range(repeats):
        t0 = time.perf_counter()
        states, key = compiled(states, key)
        jax.block_until_ready(states.active_unit_idx)
        times.append(time.perf_counter() - t0)

    best = min(times)
    out = {
        "batch": batch,
        "n_steps": n_steps,
        "lower_s": round(t_lower, 3),
        "compile_s": round(t_compile, 3),
        "first_run_s": round(t_first, 4),
        "wall_s_best": round(best, 4),
        "wall_s_median": round(float(np.median(times)), 4),
        "wall_s_std": round(float(np.std(times)), 5),
        "steps_per_s": round(batch * n_steps / best, 1),
        "mem_bytes": device_memory_bytes(),
    }
    out.update(analysis)
    return out


# ===========================================================================
# BENCHMARK 2: DECYZJE MCTS
# ===========================================================================

def build_mcts(env, mod, batch, n_sims):
    import mctx
    import flax.linen as nn

    C, R, K = mod.C, mod.BOARD_ROWS, mod.BOARD_COLS

    class Net(nn.Module):
        @nn.compact
        def __call__(self, x):
            for f in (64, 64, 64):
                x = nn.relu(nn.Conv(f, (3, 3), padding="SAME")(x))
            board = nn.Conv(8, (1, 1))(x).reshape((x.shape[0], -1))
            flat = x.reshape((x.shape[0], -1))
            h = nn.relu(nn.Dense(256)(flat))
            glob = nn.Dense(2)(h)
            return (jnp.concatenate([board, glob], axis=-1),
                    nn.tanh(nn.Dense(1)(h)).squeeze(-1))

    net = Net()
    params = net.init(jax.random.PRNGKey(0), jnp.zeros((1, R, K, C)))

    def recurrent_fn(params, rng, action, st):
        st = jax.vmap(env.step)(st, action, jax.random.split(rng, batch))
        logits, value = net.apply(params, st.observation)
        logits = jnp.where(st.legal_action_mask, logits, -1e9)
        reward = st.rewards[jnp.arange(batch), st.current_player]
        discount = jnp.where(st.terminated, 0.0, -1.0).astype(jnp.float32)
        return mctx.RecurrentFnOutput(
            reward=reward, discount=discount,
            prior_logits=logits, value=value), st

    def decide(params, states, key):
        logits, value = net.apply(params, states.observation)
        root = mctx.RootFnOutput(
            prior_logits=jnp.where(states.legal_action_mask, logits, -1e9),
            value=value, embedding=states)
        return mctx.muzero_policy(
            params, key, root, recurrent_fn,
            num_simulations=n_sims,
            invalid_actions=~states.legal_action_mask,
            dirichlet_fraction=0.25).action

    return decide, params


def bench_mcts(env, mod, batch, n_sims, sharding, repeats, want_analysis,
               sample_power=False):
    try:
        decide, params = build_mcts(env, mod, batch, n_sims)
    except ImportError as exc:
        return {"skipped": f"brak zaleznosci: {exc}"}

    key = jax.random.PRNGKey(0)
    states = jax.jit(jax.vmap(env.init))(shard_keys(key, batch, sharding))

    t0 = time.perf_counter()
    lowered = jax.jit(decide).lower(params, states, key)
    t_lower = time.perf_counter() - t0
    t0 = time.perf_counter()
    compiled = lowered.compile()
    t_compile = time.perf_counter() - t0

    analysis = analyse_compiled(compiled) if want_analysis else {}

    t0 = time.perf_counter()
    a = compiled(params, states, key)
    jax.block_until_ready(a)
    t_first = time.perf_counter() - t0

    sampler = PowerSampler() if sample_power else None
    if sampler:
        sampler.start()

    times = []
    for i in range(repeats):
        k = jax.random.fold_in(key, i)
        t0 = time.perf_counter()
        a = compiled(params, states, k)
        jax.block_until_ready(a)
        times.append(time.perf_counter() - t0)

    power = sampler.stop() if sampler else {}

    best = min(times)
    out = {
        "batch": batch,
        "num_simulations": n_sims,
        "lower_s": round(t_lower, 3),
        "compile_s": round(t_compile, 3),
        "first_run_s": round(t_first, 4),
        "wall_s_best": round(best, 4),
        "decisions_per_s": round(batch / best, 2),
        "env_steps_per_s": round(batch * n_sims / best, 1),
        "mem_bytes": device_memory_bytes(),
    }
    out.update(analysis)
    out.update(power)
    if power.get("power_w_mean"):
        out["joules_per_decision"] = round(
            power["power_w_mean"] * best / batch, 4)
    return out


# ===========================================================================
# STEROWANIE
# ===========================================================================

def default_batches(n_dev, on_gpu):
    base = ([512, 1024, 2048, 4096, 8192, 16384, 32768, 65536] if on_gpu
            else [16, 32, 64, 128, 256, 512, 1024])
    return [b for b in base if b % n_dev == 0]


def run_suite(args):
    sharding, n_dev = make_sharding()
    info = machine_info()
    on_gpu = info["platform"] != "cpu"
    env, mod = load_engine(args.engine)

    print("=" * 74)
    for k, v in info.items():
        print(f"  {k:<14} {v}")
    foreign = foreign_processes()
    if foreign:
        print("\n  !! CUDZE PROCESY NA KARTACH - pomiar moze byc zaburzony:")
        for f in foreign:
            print(f"     {f}")
    print("=" * 74)

    batches = args.batches or default_batches(n_dev, on_gpu)
    results = {
        "machine": info, "tag": args.tag, "engine": args.engine,
        "foreign_processes": foreign,
        "config": {"n_steps": args.steps, "num_simulations": args.sims,
                   "repeats": args.repeats},
        "steps": [], "mcts": [], "sims_sweep": [],
    }

    # ---------------------------------------------------------------
    print(f"\n[1/3] Kroki symulacji ({args.steps} krokow na pomiar)")
    print(f"{'wsad':>7} {'kroki/s':>14} {'czas':>9} {'lower':>7} "
          f"{'compile':>8} {'1. wyk.':>9} {'pamiec':>10} {'I=F/B':>7}")
    for b in batches:
        try:
            r = bench_steps(env, b, args.steps, sharding, args.repeats,
                            args.analysis)
        except Exception as exc:
            print(f"{b:>7}   PRZERWANO: {type(exc).__name__}: "
                  f"{str(exc)[:60]}")
            break
        results["steps"].append(r)
        mem = f"{r['mem_bytes']/2**30:.2f}G" if r["mem_bytes"] else "-"
        ai = f"{r.get('arithmetic_intensity', float('nan')):.2f}"
        print(f"{b:>7} {r['steps_per_s']:>14,.0f} {r['wall_s_best']:>9.3f} "
              f"{r['lower_s']:>7.1f} {r['compile_s']:>8.1f} "
              f"{r['first_run_s']:>9.3f} {mem:>10} {ai:>7}")
        if r["wall_s_best"] > args.time_budget:
            print("      (budzet czasu wyczerpany)")
            break

    # ---------------------------------------------------------------
    if not args.no_mcts:
        print(f"\n[2/3] Decyzje MCTS (num_simulations = {args.sims})")
        print(f"{'wsad':>7} {'decyzje/s':>12} {'kroki/s':>14} "
              f"{'compile':>8} {'pamiec':>10} {'moc [W]':>9} {'J/dec':>8}")
        for b in [x for x in batches if x <= args.max_mcts_batch]:
            try:
                r = bench_mcts(env, mod, b, args.sims, sharding,
                               args.repeats, args.analysis, args.power)
            except Exception as exc:
                print(f"{b:>7}   PRZERWANO: {type(exc).__name__}")
                break
            if "skipped" in r:
                print(f"      pominieto: {r['skipped']}")
                break
            results["mcts"].append(r)
            mem = f"{r['mem_bytes']/2**30:.2f}G" if r["mem_bytes"] else "-"
            pw = f"{r.get('power_w_mean') or 0:.0f}"
            jd = f"{r.get('joules_per_decision') or 0:.3f}"
            print(f"{b:>7} {r['decisions_per_s']:>12,.2f} "
                  f"{r['env_steps_per_s']:>14,.0f} {r['compile_s']:>8.1f} "
                  f"{mem:>10} {pw:>9} {jd:>8}")
            if r["wall_s_best"] > args.time_budget:
                break

        # -----------------------------------------------------------
        if results["mcts"] and not args.no_sims_sweep:
            b = min(args.sims_sweep_batch,
                    max(r["batch"] for r in results["mcts"]))
            print(f"\n[3/3] Skalowanie MCTS wzgledem num_simulations "
                  f"(wsad = {b})")
            print(f"{'symulacje':>10} {'decyzje/s':>12} {'czas/dec [ms]':>15}")
            for ns in args.sims_list:
                try:
                    r = bench_mcts(env, mod, b, ns, sharding, args.repeats,
                                   False, False)
                except Exception as exc:
                    print(f"{ns:>10}   PRZERWANO: {type(exc).__name__}")
                    break
                if "skipped" in r:
                    break
                results["sims_sweep"].append(r)
                print(f"{ns:>10} {r['decisions_per_s']:>12,.2f} "
                      f"{1000/r['decisions_per_s']:>15.3f}")

    # ---------------------------------------------------------------
    print("\n" + "=" * 74)
    if results["steps"]:
        peak = max(results["steps"], key=lambda r: r["steps_per_s"])
        print(f"Szczyt krokow:  {peak['steps_per_s']:>14,.0f} /s "
              f"przy wsadzie {peak['batch']}")
        # empiryczne bajty na stan
        pts = [(r["batch"], r["mem_bytes"]) for r in results["steps"]
               if r["mem_bytes"]]
        if len(pts) >= 3:
            x = np.array([p[0] for p in pts], float)
            y = np.array([p[1] for p in pts], float)
            slope, intercept = np.polyfit(x, y, 1)
            results["bytes_per_state_measured"] = float(slope)
            print(f"Pamiec na stan: {slope:,.0f} B "
                  f"(staly narzut {intercept/2**20:,.0f} MiB)")
    if results["mcts"]:
        pm = max(results["mcts"], key=lambda r: r["decisions_per_s"])
        d = pm["decisions_per_s"]
        print(f"Szczyt decyzji: {d:>14,.2f} /s przy wsadzie {pm['batch']}")
        print(f"                {d*3600:,.0f} /h, {d*3600*24:,.0f} /dobe")
        if pm.get("joules_per_decision"):
            print(f"Energia:        {pm['joules_per_decision']:.3f} J/decyzje")

    after = foreign_processes()
    if after != foreign:
        print("\n  !! Zmienil sie zbior cudzych procesow w trakcie pomiaru.")
    results["foreign_processes_after"] = after

    fname = args.out or f"bench_{args.tag}_{args.engine}.json"
    with open(fname, "w") as f:
        json.dump(results, f, indent=2)
    print(f"\nZapisano {fname}")


# ===========================================================================

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--tag", default="run")
    ap.add_argument("--engine", default="v3", choices=["v2", "v3"])
    ap.add_argument("--steps", type=int, default=100)
    ap.add_argument("--sims", type=int, default=150)
    ap.add_argument("--repeats", type=int, default=5)
    ap.add_argument("--batches", type=int, nargs="*", default=None)
    ap.add_argument("--max-mcts-batch", type=int, default=8192)
    ap.add_argument("--sims-sweep-batch", type=int, default=1024)
    ap.add_argument("--sims-list", type=int, nargs="*",
                    default=[25, 50, 100, 200, 400])
    ap.add_argument("--time-budget", type=float, default=90.0)
    ap.add_argument("--no-mcts", action="store_true")
    ap.add_argument("--no-sims-sweep", action="store_true")
    ap.add_argument("--no-analysis", dest="analysis", action="store_false",
                    help="pomin cost_analysis (szybsze)")
    ap.add_argument("--power", action="store_true",
                    help="probkuj pobor mocy podczas MCTS")
    ap.add_argument("--out", default=None)
    args = ap.parse_args()
    run_suite(args)


if __name__ == "__main__":
    main()