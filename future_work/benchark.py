#!/usr/bin/env python3
"""
Benchmark silnika HoMM3 w JAX - wersja dla GPU.

Mierzy:
  0. statystyki srodowiska: dlugosc epizodu, rozklad liczby akcji legalnych
  1. przepustowosc krokow symulacji wzgledem rozmiaru wsadu
  2. czas kompilacji XLA (lowering i compile osobno) oraz pierwszego wykonania
  3. zajetosc pamieci -> bajty na stan D (analitycznie i empirycznie)
  4. FLOP-y, bajty i OSIAGNIETA przepustowosc pamieci -> wlasciwa diagnoza
     ograniczenia wydajnosci
  5. przepustowosc decyzji MCTS wzgledem wsadu i wzgledem num_simulations,
     dla polityki PUCT (muzero_policy) oraz Gumbel (gumbel_muzero_policy)
  6. pobor mocy -> dzule na decyzje

ZMIANY WZGLEDEM WERSJI POPRZEDNIEJ
----------------------------------
  * DYSKONTO. Bylo `discount = -1` bezwarunkowo, co zaklada gre naprzemienna.
        HoMM3 naprzemienna nie jest - kolejka wynika z inicjatywy i ta sama
        strona potrafi dzialac kilka razy z rzedu. Teraz znak odwracany jest
        tylko przy faktycznej zmianie strony.
  * ZNAK NAGRODY. Bylo indeksowanie `st.rewards[..., st.current_player]` na
        stanie PO kroku, czyli po graczu NASTEPNYM. mctx oczekuje nagrody
        z perspektywy gracza, ktory wykonal ruch. Teraz indeksujemy po
        `prev_player` odczytanym ze stanu rodzica.
  * PowerSampler._stop kolidowalo z metoda Thread._stop -> _stop_evt.
  * WYBOR POLITYKI: --policy {muzero,gumbel,both}.
  * ROOFLINE. Sama intensywnosc arytmetyczna nie rozstrzyga o ograniczeniu.
        Liczymy osiagnieta przepustowosc pamieci i odnosimy ja do szczytowej;
        jesli obie wartosci sa niskie, program jest ograniczony LATENCJA,
        a nie przepustowoscia.
  * D wyznaczane z mem_argument_bytes/batch (dokladne) zamiast z regresji
        po mem_bytes (zaszumione przez alokator).

UZYCIE
    python3 benchark.py --selftest
    (dalsze komendy w pliku KOMENDY.md)

WAZNE
    XLA_PYTHON_CLIENT_PREALLOCATE=false musi byc ustawione, inaczej pomiar
    pamieci pokaze stala wartosc. Dockerfile ustawia to automatycznie.

    Wyniki zapisywane sa po KAZDYM punkcie pomiarowym, wiec przerwanie
    Ctrl+C nie niszczy dotychczasowej pracy.
"""

import argparse
import contextlib
import importlib
import io
import json
import os
import platform
import socket
import subprocess
import sys
import threading
import time
import traceback
from datetime import datetime, timezone

import numpy as np

import jax
import jax.numpy as jnp
from jax.sharding import Mesh, NamedSharding
from jax.sharding import PartitionSpec as P


# Szczytowa przepustowosc pamieci [GB/s]. RTX 5000 Ada: 576 GB/s.
# Sluzy wylacznie do wyliczenia stopnia wykorzystania - nie wplywa na pomiar.
DEFAULT_PEAK_BW_GBS = 576.0


# ===========================================================================
# WYBOR SILNIKA
# ===========================================================================

def load_engine(version, quiet=True):
    """Zwraca (env, modul). Silniki v2 i v3 maja zgodny interfejs.

    Import silnika wypisuje informacje o puli stworow - przechwytujemy je,
    zeby nie zasmiecaly tabeli wynikow.
    """
    buf = io.StringIO()
    ctx = contextlib.redirect_stdout(buf) if quiet else contextlib.nullcontext()
    with ctx:
        mod = importlib.import_module(f"jax_engine_{version}")
    cls = getattr(mod, f"HoMM3Env{version.upper()}")
    for line in buf.getvalue().splitlines():
        if line.startswith("[pula]"):
            print(f"  {line}")
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
    return {
        "host": socket.gethostname(),
        "timestamp": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "platform": devs[0].platform,
        "device_kind": devs[0].device_kind,
        "n_devices": len(devs),
        "cuda_visible": os.environ.get("CUDA_VISIBLE_DEVICES", "(wszystkie)"),
        "cpu": cpu_model(),
        "cpu_cores": os.cpu_count(),
        "gpus": [" / ".join(g) for g in
                 nvidia_query(["name", "memory.total", "driver_version"])],
        "jax_version": jax.__version__,
        "python": sys.version.split()[0],
        "preallocate": os.environ.get("XLA_PYTHON_CLIENT_PREALLOCATE",
                                      "(domyslne = true)"),
    }


def foreign_processes():
    """Cudze procesy na kartach. Uwaga: nvidia-smi widzi WSZYSTKIE karty,
    takze te ukryte przez CUDA_VISIBLE_DEVICES."""
    try:
        out = subprocess.run(
            ["nvidia-smi", "--query-compute-apps=pid,used_memory",
             "--format=csv,noheader,nounits"],
            capture_output=True, text=True, timeout=10)
        me = str(os.getpid())
        seen, res = set(), []
        for line in out.stdout.strip().splitlines():
            line = line.strip()
            if not line or line.startswith(me) or line in seen:
                continue
            seen.add(line)
            res.append(line)
        return res
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
    """Probkuje pobor mocy i utylizacje kart w tle.

    UWAGA: pole sygnalizujace zatrzymanie MUSI nazywac sie inaczej niz
    `_stop` - threading.Thread ma wlasna metode o tej nazwie i przeslanie
    jej obiektem Event konczy sie TypeError w Thread.join().
    """

    def __init__(self, interval=0.25):
        super().__init__(daemon=True)
        self.interval = interval
        self._stop_evt = threading.Event()
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
        while not self._stop_evt.is_set():
            try:
                if self._nvml:
                    p = sum(self._nvml.nvmlDeviceGetPowerUsage(h) / 1000.0
                            for h in self._handles)
                    u = np.mean([self._nvml.nvmlDeviceGetUtilizationRates(h).gpu
                                 for h in self._handles])
                    self.power.append(float(p))
                    self.util.append(float(u))
                else:
                    rows = nvidia_query(["power.draw", "utilization.gpu"])
                    if rows:
                        self.power.append(sum(float(r[0]) for r in rows))
                        self.util.append(
                            float(np.mean([float(r[1]) for r in rows])))
            except Exception:
                pass
            self._stop_evt.wait(self.interval)

    def stop(self):
        self._stop_evt.set()
        self.join(timeout=5)
        if not self.power:
            return {}
        return {
            "power_w_mean": round(float(np.mean(self.power)), 1),
            "power_w_max": round(float(np.max(self.power)), 1),
            "util_pct_mean": (round(float(np.mean(self.util)), 1)
                              if self.util else None),
            "power_samples": len(self.power),
        }


# ===========================================================================
# SHARDING
# ===========================================================================

def make_sharding():
    devs = jax.devices()
    mesh = Mesh(np.array(devs).reshape(len(devs)), axis_names=("b",))
    return NamedSharding(mesh, P("b")), len(devs)


def shard_keys(key, batch, sharding):
    n_dev = len(jax.devices())
    if batch % n_dev:
        raise ValueError(
            f"wsad {batch} nie dzieli sie przez liczbe urzadzen {n_dev}; "
            f"najblizsze poprawne: {batch // n_dev * n_dev} lub "
            f"{(batch // n_dev + 1) * n_dev}")
    return jax.device_put(jax.random.split(key, batch), sharding)


# ===========================================================================
# ANALIZA SKOMPILOWANEGO PROGRAMU  (zastepuje ncu, bez uprawnien)
# ===========================================================================

def analyse_compiled(compiled):
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
                info["arithmetic_intensity"] = round(
                    float(flops) / float(byts), 3)
    except Exception as exc:
        info["cost_analysis_error"] = str(exc)[:200]
    try:
        ma = compiled.memory_analysis()
        info["mem_argument_bytes"] = int(ma.argument_size_in_bytes)
        info["mem_output_bytes"] = int(ma.output_size_in_bytes)
        info["mem_temp_bytes"] = int(ma.temp_size_in_bytes)
    except Exception:
        pass
    return info


def add_roofline(out, peak_bw_gbs):
    """Dopisuje osiagnieta przepustowosc i moc obliczeniowa.

    Sama intensywnosc arytmetyczna NIE rozstrzyga o ograniczeniu wydajnosci.
    Jesli zarowno wykorzystanie pasma, jak i mocy obliczeniowej jest niskie,
    program jest ograniczony latencja lancucha zaleznosci, a nie zasobem.
    """
    t = out.get("wall_s_best")
    byts = out.get("bytes_accessed")
    flops = out.get("flops")
    if not (t and byts):
        return out
    bw = byts / t / 1e9
    out["achieved_bw_gbs"] = round(bw, 2)
    out["bw_utilisation_pct"] = round(100.0 * bw / peak_bw_gbs, 3)
    if flops:
        out["achieved_gflops"] = round(flops / t / 1e9, 2)
    return out


def diagnose(bw_pct, gflops, peak_bw_gbs):
    if bw_pct is None:
        return "brak danych"
    if bw_pct > 60:
        return "ograniczenie przepustowoscia pamieci"
    if bw_pct < 10:
        return ("ograniczenie latencja lancucha zaleznosci "
                "(pasmo i moc wykorzystane w znikomym stopniu)")
    return "ograniczenie mieszane"


# ===========================================================================
# BENCHMARK 0: STATYSTYKI SRODOWISKA
# ===========================================================================

def bench_env_stats(env, batch, n_steps, sharding):
    """Dlugosc epizodu i rozklad liczby akcji legalnych.

    Obie wielkosci sa potrzebne w pracy: pierwsza jako najtansza weryfikacja
    wiernosci wzgledem silnika referencyjnego (ktory daje ok. 16,8 kroku),
    druga jako podstawa oszacowania pokrycia przestrzeni akcji przez MCTS.
    """
    key = jax.random.PRNGKey(1)
    states = jax.jit(jax.vmap(env.init))(shard_keys(key, batch, sharding))

    def one_step(carry, _):
        states, key = carry
        key, k_act, k_step, k_reset = jax.random.split(key, 4)
        nlegal = states.legal_action_mask.sum(axis=-1)
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
        return (states, key), (nlegal, done)

    @jax.jit
    def run(states, key):
        _, (nlegal, done) = jax.lax.scan(
            one_step, (states, key), None, length=n_steps)
        return nlegal, done

    nlegal, done = run(states, key)
    nlegal = np.asarray(nlegal).reshape(-1)
    n_done = int(np.asarray(done).sum())

    return {
        "batch": batch,
        "n_steps": n_steps,
        "total_steps": int(n_steps * batch),
        "episodes_finished": n_done,
        "mean_episode_len": (round(n_steps * batch / n_done, 2)
                             if n_done else None),
        "legal_actions_mean": round(float(nlegal.mean()), 2),
        "legal_actions_std": round(float(nlegal.std()), 2),
        "legal_actions_min": int(nlegal.min()),
        "legal_actions_max": int(nlegal.max()),
        "legal_actions_p05": float(np.percentile(nlegal, 5)),
        "legal_actions_p50": float(np.percentile(nlegal, 50)),
        "legal_actions_p95": float(np.percentile(nlegal, 95)),
    }


# ===========================================================================
# BENCHMARK 1: KROKI SYMULACJI
# ===========================================================================

def build_rollout(env, batch, n_steps):
    """Petla losowych ruchow z automatycznym resetem, zwinieta w lax.scan.

    scan zamiast petli pythonowej: mierzymy czas silnika, a nie narzut
    interpretera i kolejkowania wywolan asynchronicznych.
    """
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


def bench_steps(env, batch, n_steps, sharding, repeats, want_analysis,
                peak_bw_gbs):
    key = jax.random.PRNGKey(0)
    states = jax.jit(jax.vmap(env.init))(shard_keys(key, batch, sharding))
    run = build_rollout(env, batch, n_steps)

    t0 = time.perf_counter()
    lowered = jax.jit(run).lower(states, key)
    t_lower = time.perf_counter() - t0

    t0 = time.perf_counter()
    compiled = lowered.compile()
    t_compile = time.perf_counter() - t0

    analysis = analyse_compiled(compiled) if want_analysis else {}

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
    if out.get("mem_argument_bytes"):
        out["bytes_per_state"] = round(out["mem_argument_bytes"] / batch, 1)
    add_roofline(out, peak_bw_gbs)
    return out


# ===========================================================================
# BENCHMARK 2: DECYZJE MCTS
# ===========================================================================

def build_mcts(env, mod, batch, n_sims, policy="muzero",
               max_considered=16, conv_width=64, head_width=256):
    """Buduje funkcje decyzyjna opartą na mctx.

    POPRAWKA DYSKONTA
    -----------------
    Do recurrent_fn trafia zanurzenie wezla RODZICA, czyli stan sprzed
    wykonania akcji. Gracza uprawnionego do ruchu w rodzicu odczytujemy
    wiec bezposrednio, przed wywolaniem env.step.

      * reward  - z perspektywy gracza, ktory wykonal ruch (prev_player),
                  a nie tego, ktory bedzie ruszal sie nastepny;
      * discount - -1 tylko przy faktycznej zmianie strony. HoMM3 nie jest
                  gra naprzemienna: kolejka wynika z inicjatywy i ta sama
                  strona potrafi dzialac kilka razy z rzedu. Bezwarunkowe
                  -1 powodowaloby systematyczny blad propagacji wartosci
                  przy kazdej serii ruchow jednej strony.
    """
    import mctx
    import flax.linen as nn

    Cch, R, K = mod.C, mod.BOARD_ROWS, mod.BOARD_COLS

    class Net(nn.Module):
        @nn.compact
        def __call__(self, x):
            for _ in range(3):
                x = nn.relu(nn.Conv(conv_width, (3, 3), padding="SAME")(x))
            board = nn.Conv(8, (1, 1))(x).reshape((x.shape[0], -1))
            flat = x.reshape((x.shape[0], -1))
            h = nn.relu(nn.Dense(head_width)(flat))
            glob = nn.Dense(2)(h)
            return (jnp.concatenate([board, glob], axis=-1),
                    nn.tanh(nn.Dense(1)(h)).squeeze(-1))

    net = Net()
    params = net.init(jax.random.PRNGKey(0), jnp.zeros((1, R, K, Cch)))
    n_params = int(sum(x.size for x in jax.tree_util.tree_leaves(params)))

    def recurrent_fn(params, rng, action, st):
        # st = stan RODZICA (przed wykonaniem akcji)
        prev_player = st.current_player
        st = jax.vmap(env.step)(st, action, jax.random.split(rng, batch))

        logits, value = net.apply(params, st.observation)
        logits = jnp.where(st.legal_action_mask, logits, -1e9)

        # nagroda z perspektywy gracza, ktory wykonal ruch
        reward = st.rewards[jnp.arange(batch), prev_player]

        # znak odwracamy tylko przy zmianie strony
        same_player = st.current_player == prev_player
        discount = jnp.where(
            st.terminated, 0.0, jnp.where(same_player, 1.0, -1.0))

        return mctx.RecurrentFnOutput(
            reward=reward.astype(jnp.float32),
            discount=discount.astype(jnp.float32),
            prior_logits=logits.astype(jnp.float32),
            value=value.astype(jnp.float32)), st

    def make_root(params, states):
        logits, value = net.apply(params, states.observation)
        return mctx.RootFnOutput(
            prior_logits=jnp.where(
                states.legal_action_mask, logits, -1e9).astype(jnp.float32),
            value=value.astype(jnp.float32),
            embedding=states)

    if policy == "gumbel":
        def decide(params, states, key):
            root = make_root(params, states)
            return mctx.gumbel_muzero_policy(
                params, key, root, recurrent_fn,
                num_simulations=n_sims,
                max_num_considered_actions=max_considered,
                invalid_actions=~states.legal_action_mask).action
    elif policy == "muzero":
        def decide(params, states, key):
            root = make_root(params, states)
            return mctx.muzero_policy(
                params, key, root, recurrent_fn,
                num_simulations=n_sims,
                invalid_actions=~states.legal_action_mask,
                dirichlet_fraction=0.25).action
    else:
        raise ValueError(f"nieznana polityka: {policy}")

    return decide, params, n_params


def bench_mcts(env, mod, batch, n_sims, sharding, repeats, want_analysis,
               sample_power=False, policy="muzero", max_considered=16,
               peak_bw_gbs=DEFAULT_PEAK_BW_GBS):
    decide, params, n_params = build_mcts(
        env, mod, batch, n_sims, policy=policy, max_considered=max_considered)

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
        "policy": policy,
        "max_considered_actions": max_considered if policy == "gumbel" else None,
        "batch": batch,
        "num_simulations": n_sims,
        "net_params": n_params,
        "lower_s": round(t_lower, 3),
        "compile_s": round(t_compile, 3),
        "first_run_s": round(t_first, 4),
        "wall_s_best": round(best, 4),
        "wall_s_median": round(float(np.median(times)), 4),
        "decisions_per_s": round(batch / best, 2),
        "env_steps_per_s": round(batch * n_sims / best, 1),
        "ms_per_decision": round(1000.0 * best / batch, 4),
        "mem_bytes": device_memory_bytes(),
    }
    out.update(analysis)
    add_roofline(out, peak_bw_gbs)
    out.update(power)
    if power.get("power_w_mean"):
        out["joules_per_decision"] = round(
            power["power_w_mean"] * best / batch, 5)
    return out


# ===========================================================================
# AUTOTEST ZALEZNOSCI
# ===========================================================================

def selftest():
    """Sprawdza zestaw bibliotek na minimalnym przykladzie.

    Jesli tu wystapi blad, przyczyna lezy w wersjach pakietow, nie w kodzie
    silnika.
    """
    print("=" * 74)
    print("AUTOTEST ZALEZNOSCI")
    print("=" * 74)
    ok = True

    import importlib.metadata as md
    for pkg in ["jax", "jaxlib", "chex", "flax", "optax", "mctx", "pgx",
                "numpy"]:
        try:
            print(f"  {pkg:<10} {md.version(pkg)}")
        except Exception:
            print(f"  {pkg:<10} BRAK")
            ok = False

    print(f"\n  urzadzenia: {jax.devices()}")

    print("\n  [1] podstawowy jit + vmap ... ", end="", flush=True)
    try:
        f = jax.jit(jax.vmap(lambda x: x * 2))
        assert float(f(jnp.ones(4))[0]) == 2.0
        print("OK")
    except Exception as exc:
        print(f"BLAD: {exc}")
        traceback.print_exc()
        ok = False

    print("  [2] mctx na sztucznym drzewie ... ", end="", flush=True)
    try:
        import mctx
        B, A = 4, 3

        def rec(params, rng, action, emb):
            return mctx.RecurrentFnOutput(
                reward=jnp.zeros(B, jnp.float32),
                discount=-jnp.ones(B, jnp.float32),
                prior_logits=jnp.zeros((B, A), jnp.float32),
                value=jnp.zeros(B, jnp.float32)), emb

        root = mctx.RootFnOutput(
            prior_logits=jnp.zeros((B, A), jnp.float32),
            value=jnp.zeros(B, jnp.float32),
            embedding=jnp.zeros((B, 1), jnp.float32))
        out = mctx.muzero_policy({}, jax.random.PRNGKey(0), root, rec,
                                 num_simulations=4)
        assert out.action.shape == (B,)
        print("OK")
    except Exception as exc:
        print(f"BLAD: {type(exc).__name__}: {exc}")
        traceback.print_exc()
        print("\n  -> Zestaw wersji jest niezgodny. Uzyj obrazu Dockera")
        print("     z przypietymi wersjami.")
        ok = False

    print("  [3] gumbel_muzero_policy ... ", end="", flush=True)
    try:
        import mctx
        B, A = 4, 8

        def rec(params, rng, action, emb):
            return mctx.RecurrentFnOutput(
                reward=jnp.zeros(B, jnp.float32),
                discount=-jnp.ones(B, jnp.float32),
                prior_logits=jnp.zeros((B, A), jnp.float32),
                value=jnp.zeros(B, jnp.float32)), emb

        root = mctx.RootFnOutput(
            prior_logits=jnp.zeros((B, A), jnp.float32),
            value=jnp.zeros(B, jnp.float32),
            embedding=jnp.zeros((B, 1), jnp.float32))
        out = mctx.gumbel_muzero_policy(
            {}, jax.random.PRNGKey(0), root, rec,
            num_simulations=8, max_num_considered_actions=4)
        assert out.action.shape == (B,)
        print("OK")
    except Exception as exc:
        print(f"BLAD: {type(exc).__name__}: {exc}")
        traceback.print_exc()
        ok = False

    print("  [4] silnik + obie polityki ... ", end="", flush=True)
    try:
        env, mod = load_engine("v3")
        sharding, n_dev = make_sharding()
        b = 8 * n_dev
        msgs = []
        for pol in ("muzero", "gumbel"):
            r = bench_mcts(env, mod, b, 8, sharding, 1, False, False,
                           policy=pol, max_considered=4)
            msgs.append(f"{pol} {r['decisions_per_s']:.1f} dec/s")
        print("OK (" + ", ".join(msgs) + f", wsad {b})")
    except Exception as exc:
        print(f"BLAD: {type(exc).__name__}: {exc}")
        traceback.print_exc()
        ok = False

    print("\n  [5] weryfikacja poprawki dyskonta ... ", end="", flush=True)
    try:
        env, _ = load_engine("v3")
        vinit = jax.jit(jax.vmap(env.init))
        vstep = jax.jit(jax.vmap(env.step))
        key = jax.random.PRNGKey(0)
        st = vinit(jax.random.split(key, 256))
        same = 0
        total = 0
        for i in range(40):
            k1, k2 = jax.random.split(jax.random.fold_in(key, i))
            prev = st.current_player
            logits = jnp.where(st.legal_action_mask, 0.0, -1e9)
            a = jax.random.categorical(k1, logits, axis=-1)
            st = vstep(st, a, jax.random.split(k2, 256))
            live = ~(st.terminated | st.truncated)
            same += int((( st.current_player == prev) & live).sum())
            total += int(live.sum())
        pct = 100.0 * same / max(total, 1)
        print(f"OK ({pct:.1f}% przejsc BEZ zmiany strony)")
        print(f"       -> bezwarunkowe discount=-1 byloby bledne "
              f"w {pct:.1f}% przejsc")
    except Exception as exc:
        print(f"BLAD: {type(exc).__name__}: {exc}")
        traceback.print_exc()
        ok = False

    print("\n" + ("Wszystko dziala." if ok else "Sa problemy - patrz wyzej."))
    return 0 if ok else 1


# ===========================================================================
# STEROWANIE
# ===========================================================================

def default_batches(n_dev, on_gpu):
    base = ([512, 1024, 2048, 4096, 8192, 16384, 32768] if on_gpu
            else [16, 32, 64, 128, 256, 512, 1024])
    return [b for b in base if b % n_dev == 0]


def run_suite(args):
    sharding, n_dev = make_sharding()
    info = machine_info()
    on_gpu = info["platform"] != "cpu"

    print("=" * 78)
    for k, v in info.items():
        print(f"  {k:<15} {v}")
    env, mod = load_engine(args.engine)

    foreign = foreign_processes()
    if foreign and not args.ignore_foreign:
        print("\n  !! Cudze procesy na kartach (nvidia-smi widzi wszystkie,")
        print("     takze ukryte przez CUDA_VISIBLE_DEVICES):")
        for f in foreign:
            print(f"       pid {f}")
        print("     Wyniki moga byc zaburzone. "
              "--ignore-foreign wycisza to ostrzezenie.")
    print("=" * 78)

    batches = args.batches or default_batches(n_dev, on_gpu)
    bad = [b for b in batches if b % n_dev]
    if bad:
        print(f"\n  Odrzucone wsady (niepodzielne przez {n_dev}): {bad}")
        batches = [b for b in batches if b % n_dev == 0]
    if not batches:
        sys.exit(f"Zaden wsad nie dzieli sie przez {n_dev} urzadzen.")

    policies = (["muzero", "gumbel"] if args.policy == "both"
                else [args.policy])
    outfile = args.out or f"bench_{args.tag}_{args.engine}.json"

    results = {
        "machine": info, "tag": args.tag, "engine": args.engine,
        "foreign_processes": foreign,
        "config": {"n_steps": args.steps, "num_simulations": args.sims,
                   "repeats": args.repeats, "batches": batches,
                   "policies": policies,
                   "max_considered_actions": args.max_considered,
                   "peak_bw_gbs": args.peak_bw},
        "env_stats": None, "steps": [], "mcts": [], "sims_sweep": [],
        "errors": [],
    }

    def save():
        with open(outfile, "w") as f:
            json.dump(results, f, indent=2)

    def record_error(where, exc):
        results["errors"].append({
            "where": where,
            "type": type(exc).__name__,
            "message": str(exc)[:500],
            "traceback": traceback.format_exc()[-2000:],
        })
        save()

    save()

    # ---------------------------------------------------------------
    if not args.no_env_stats:
        print("\n[0/3] Statystyki srodowiska")
        try:
            b = min(1024, max(batches))
            b = b - (b % n_dev) or n_dev
            es = bench_env_stats(env, b, args.env_stats_steps, sharding)
            results["env_stats"] = es
            save()
            print(f"  srednia dlugosc epizodu   {es['mean_episode_len']} "
                  f"krokow  (VcmiEnv: 16,8)")
            print(f"  akcje legalne  srednia    {es['legal_actions_mean']} "
                  f"+/- {es['legal_actions_std']}")
            print(f"                 zakres     {es['legal_actions_min']} -- "
                  f"{es['legal_actions_max']}  "
                  f"(percentyle 5/50/95: {es['legal_actions_p05']:.0f} / "
                  f"{es['legal_actions_p50']:.0f} / "
                  f"{es['legal_actions_p95']:.0f})")
            print(f"                 udzial     "
                  f"{100*es['legal_actions_mean']/mod.MAX_ACTIONS:.1f}% "
                  f"przestrzeni |A| = {mod.MAX_ACTIONS}")
        except Exception as exc:
            print(f"  PRZERWANO: {type(exc).__name__}: {str(exc)[:70]}")
            if args.debug:
                traceback.print_exc()
            record_error("env_stats", exc)

    # ---------------------------------------------------------------
    print(f"\n[1/3] Kroki symulacji ({args.steps} krokow na pomiar)")
    print(f"{'wsad':>7} {'kroki/s':>13} {'czas':>8} {'std':>7} {'compile':>8} "
          f"{'B/stan':>8} {'GB/s':>8} {'%BW':>7}")
    for b in batches:
        try:
            r = bench_steps(env, b, args.steps, sharding, args.repeats,
                            args.analysis, args.peak_bw)
        except Exception as exc:
            print(f"{b:>7}   PRZERWANO: {type(exc).__name__}: {str(exc)[:60]}")
            if args.debug:
                traceback.print_exc()
            record_error(f"steps[batch={b}]", exc)
            break
        results["steps"].append(r)
        save()
        bps = r.get("bytes_per_state")
        bw = r.get("achieved_bw_gbs")
        pct = r.get("bw_utilisation_pct")
        print(f"{b:>7} {r['steps_per_s']:>13,.0f} {r['wall_s_best']:>8.3f} "
              f"{r['wall_s_std']:>7.4f} {r['compile_s']:>8.1f} "
              f"{(bps or 0):>8,.0f} {(bw or 0):>8.1f} {(pct or 0):>7.2f}")
        if r["wall_s_best"] > args.time_budget:
            print("        (budzet czasu wyczerpany, przerywam)")
            break

    # ---------------------------------------------------------------
    if not args.no_mcts:
        for pol in policies:
            label = ("PUCT / muzero_policy" if pol == "muzero"
                     else f"Gumbel / m = {args.max_considered}")
            print(f"\n[2/3] Decyzje MCTS -- {label}  "
                  f"(num_simulations = {args.sims})")
            print(f"{'wsad':>7} {'decyzje/s':>11} {'ms/dec':>9} "
                  f"{'kroki/s':>12} {'compile':>8} {'pamiec':>8} "
                  f"{'moc W':>7} {'J/dec':>9}")
            for b in [x for x in batches if x <= args.max_mcts_batch]:
                try:
                    r = bench_mcts(env, mod, b, args.sims, sharding,
                                   args.repeats, args.analysis, args.power,
                                   policy=pol,
                                   max_considered=args.max_considered,
                                   peak_bw_gbs=args.peak_bw)
                except Exception as exc:
                    print(f"{b:>7}   PRZERWANO: {type(exc).__name__}: "
                          f"{str(exc)[:60]}")
                    if args.debug:
                        traceback.print_exc()
                    record_error(f"mcts[{pol},batch={b}]", exc)
                    break
                results["mcts"].append(r)
                save()
                mem = (f"{r['mem_bytes']/2**30:.2f}G" if r["mem_bytes"]
                       else "-")
                pw = f"{r.get('power_w_mean') or 0:.0f}"
                jd = f"{r.get('joules_per_decision') or 0:.4f}"
                print(f"{b:>7} {r['decisions_per_s']:>11,.2f} "
                      f"{r['ms_per_decision']:>9.3f} "
                      f"{r['env_steps_per_s']:>12,.0f} "
                      f"{r['compile_s']:>8.1f} {mem:>8} {pw:>7} {jd:>9}")
                if r["wall_s_best"] > args.time_budget:
                    break

        # -----------------------------------------------------------
        if results["mcts"] and not args.no_sims_sweep:
            done = [r for r in results["mcts"]]
            b = min(args.sims_sweep_batch,
                    max(r["batch"] for r in done))
            b = b - (b % n_dev) or n_dev
            for pol in policies:
                label = "PUCT" if pol == "muzero" else "Gumbel"
                print(f"\n[3/3] Skalowanie MCTS wzgledem num_simulations "
                      f"-- {label}  (wsad = {b})")
                print(f"{'symulacje':>10} {'decyzje/s':>12} "
                      f"{'ms/dec':>10} {'pamiec':>9}")
                for ns in args.sims_list:
                    try:
                        r = bench_mcts(env, mod, b, ns, sharding,
                                       args.repeats, False, False,
                                       policy=pol,
                                       max_considered=args.max_considered,
                                       peak_bw_gbs=args.peak_bw)
                    except Exception as exc:
                        print(f"{ns:>10}   PRZERWANO: {type(exc).__name__} "
                              f"({str(exc)[:40]})")
                        if args.debug:
                            traceback.print_exc()
                        record_error(f"sims_sweep[{pol},n={ns}]", exc)
                        break
                    results["sims_sweep"].append(r)
                    save()
                    mem = (f"{r['mem_bytes']/2**30:.2f}G" if r["mem_bytes"]
                           else "-")
                    print(f"{ns:>10} {r['decisions_per_s']:>12,.2f} "
                          f"{r['ms_per_decision']:>10.3f} {mem:>9}")

    # ---------------------------------------------------------------
    print("\n" + "=" * 78)
    if results["steps"]:
        peak = max(results["steps"], key=lambda r: r["steps_per_s"])
        print(f"Szczyt krokow:  {peak['steps_per_s']:>13,.0f} /s "
              f"przy wsadzie {peak['batch']}")
        bps = [r["bytes_per_state"] for r in results["steps"]
               if r.get("bytes_per_state")]
        if bps:
            results["bytes_per_state"] = round(float(np.mean(bps)), 1)
            print(f"Rozmiar stanu:  {np.mean(bps):>13,.0f} B "
                  f"(rozrzut {np.std(bps):.1f} B)")
        tmp = [r["mem_temp_bytes"] / r["batch"] for r in results["steps"]
               if r.get("mem_temp_bytes")]
        if tmp:
            print(f"Bufory tymcz.:  {np.mean(tmp):>13,.0f} B na srodowisko")
        bw = [r.get("bw_utilisation_pct") for r in results["steps"]
              if r.get("bw_utilisation_pct")]
        gf = [r.get("achieved_gflops") for r in results["steps"]
              if r.get("achieved_gflops")]
        if bw:
            m = float(np.mean(bw))
            print(f"Pasmo pamieci:  {m:>13.2f} % szczytowego "
                  f"({args.peak_bw:.0f} GB/s)")
            if gf:
                print(f"Moc oblicz.:    {float(np.mean(gf)):>13.1f} GFLOP/s")
            print(f"Diagnoza:       {diagnose(m, gf, args.peak_bw)}")
    if results["mcts"]:
        for pol in policies:
            sub = [r for r in results["mcts"] if r["policy"] == pol]
            if not sub:
                continue
            pm = max(sub, key=lambda r: r["decisions_per_s"])
            d = pm["decisions_per_s"]
            name = "PUCT  " if pol == "muzero" else "Gumbel"
            print(f"Szczyt {name}:  {d:>13,.2f} decyzji/s "
                  f"przy wsadzie {pm['batch']}  "
                  f"({d*3600*24:,.0f}/dobe)")
            if pm.get("joules_per_decision"):
                print(f"                {pm['joules_per_decision']:>13.4f} "
                      f"J/decyzje")
        if len(policies) == 2:
            best = {}
            for pol in policies:
                sub = [r for r in results["mcts"] if r["policy"] == pol]
                if sub:
                    best[pol] = max(r["decisions_per_s"] for r in sub)
            if len(best) == 2 and best["muzero"]:
                ratio = best["gumbel"] / best["muzero"]
                results["gumbel_vs_puct_throughput"] = round(ratio, 3)
                print(f"\nGumbel / PUCT (ta sama liczba symulacji): "
                      f"{ratio:.2f}x przepustowosci")
                print("Uwaga: to porownanie kosztu, nie jakosci. Przewaga")
                print("Gumbla polega na dorownywaniu PUCT przy MNIEJSZEJ")
                print("liczbie symulacji - to wymaga pojedynkow, nie zegara.")

    if results["steps"] and results["mcts"]:
        s = max(r["steps_per_s"] for r in results["steps"])
        m = max(r["env_steps_per_s"] for r in results["mcts"])
        if m:
            print(f"\nKrok w drzewie jest {s/m:.0f}x drozszy niz krok "
                  f"czystej symulacji.")
            print("Waskie gardlo lezy po stronie przeszukiwania, nie "
                  "srodowiska.")

    after = foreign_processes()
    if after != foreign:
        print("\n  !! Zbior cudzych procesow zmienil sie w trakcie pomiaru "
              "- rozwaz powtorzenie.")
    results["foreign_processes_after"] = after
    save()
    print(f"\nZapisano {outfile}")


# ===========================================================================

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--tag", default="run")
    ap.add_argument("--engine", default="v3", choices=["v2", "v3"])
    ap.add_argument("--steps", type=int, default=100)
    ap.add_argument("--sims", type=int, default=100)
    ap.add_argument("--repeats", type=int, default=5)
    ap.add_argument("--batches", type=int, nargs="*", default=None)
    ap.add_argument("--policy", default="muzero",
                    choices=["muzero", "gumbel", "both"],
                    help="muzero = PUCT, gumbel = Gumbel MuZero")
    ap.add_argument("--max-considered", type=int, default=16,
                    help="max_num_considered_actions dla polityki gumbel")
    ap.add_argument("--max-mcts-batch", type=int, default=1024)
    ap.add_argument("--sims-sweep-batch", type=int, default=512)
    ap.add_argument("--sims-list", type=int, nargs="*",
                    default=[16, 25, 50, 100, 150])
    ap.add_argument("--env-stats-steps", type=int, default=200)
    ap.add_argument("--no-env-stats", action="store_true")
    ap.add_argument("--time-budget", type=float, default=60.0)
    ap.add_argument("--peak-bw", type=float, default=DEFAULT_PEAK_BW_GBS,
                    help="szczytowa przepustowosc pamieci karty [GB/s]")
    ap.add_argument("--no-mcts", action="store_true")
    ap.add_argument("--no-sims-sweep", action="store_true")
    ap.add_argument("--no-analysis", dest="analysis", action="store_false")
    ap.add_argument("--power", action="store_true")
    ap.add_argument("--ignore-foreign", action="store_true")
    ap.add_argument("--debug", action="store_true",
                    help="pelne stosy wywolan przy kazdym bledzie")
    ap.add_argument("--selftest", action="store_true",
                    help="sprawdz zgodnosc wersji bibliotek i wyjdz")
    ap.add_argument("--out", default=None)
    args = ap.parse_args()

    if args.selftest:
        sys.exit(selftest())
    run_suite(args)


if __name__ == "__main__":
    main()