#!/usr/bin/env python3
"""
Benchmark silnika HoMM3 w JAX - wersja dla GPU.

Mierzy:
  0. statystyki srodowiska: dlugosc epizodu, rozklad liczby akcji legalnych,
     w trybie losowym i zachlannym
  1. przepustowosc krokow symulacji wzgledem rozmiaru wsadu
  2. czas kompilacji XLA (lowering i compile osobno) oraz pierwszego wykonania
  3. zajetosc pamieci (biezaca i SZCZYTOWA) -> bajty na stan D oraz stala c
     we wzorze pamieciowym drzewa
  4. FLOP-y, bajty, osiagnieta przepustowosc pamieci i ZBIOR ROBOCZY
     -> diagnoza ograniczenia wydajnosci i progu rezydencji w pamieci L2
  5. przepustowosc decyzji MCTS wzgledem wsadu, num_simulations i max_depth,
     dla polityki PUCT (muzero_policy) oraz Gumbel (gumbel_muzero_policy)
  6. pobor mocy -> dzule na decyzje

ZMIANY W TEJ WERSJI
-------------------
  * SHARDING WIELOKARTOWY. Petla rolloutu ogranicza sharding wyjscia jawnie.
        Bez tego stan zwrocony przez program ma inny uklad na urzadzeniach
        niz wejsciowy (vmap(init) wewnatrz petli nie dziedziczy shardingu)
        i DRUGIE wywolanie konczy sie bledem niezgodnosci.
  * ZAOKRAGLANIE WSADOW do wielokrotnosci liczby urzadzen zamiast ich
        odrzucania (przy 3 kartach odrzucane bylo wszystko).
  * PAMIEC SZCZYTOWA. bytes_in_use probkowane po zakonczeniu wywolania nie
        pokazuje szczytu drzewa MCTS - a to on decyduje o OOM.
  * TRYB AKCJI random/greedy. Przy grze czysto losowej obie strony prawie
        nigdy nie atakuja i bitwy nie koncza sie w rozsadnym czasie, przez
        co porownanie dlugosci epizodu z silnikiem referencyjnym (gdzie
        przeciwnikiem jest StupidAI) jest niewazne.
  * MAX_DEPTH w MCTS. mctx domyslnie ustawia max_depth = num_simulations;
        czas decyzji rosnie empirycznie jak N^2.4.
  * STALA c: bytes_per_tree_edge = mem_temp_bytes / (B*(N+1)*|A|).
  * ZBIOR ROBOCZY w podsumowaniu - wyjasnia prog wydajnosci.

UZYCIE
    python3 benchark.py --selftest
    (dalsze komendy w KOMENDY-seria-2.md)

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


# Parametry karty uzywane wylacznie do interpretacji wynikow.
# RTX 5000 Ada: 576 GB/s, 72 MiB L2.
DEFAULT_PEAK_BW_GBS = 576.0
DEFAULT_L2_MIB = 72.0


# ===========================================================================
# WYBOR SILNIKA
# ===========================================================================

def load_engine(version, quiet=True):
    """Zwraca (env, modul). Silniki v2 i v3 maja zgodny interfejs."""
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


def device_memory_bytes(peak=False):
    """Zajetosc pamieci urzadzen.

    peak=True zwraca szczyt od ostatniego zerowania. Wartosc biezaca
    (bytes_in_use) probkowana PO zakonczeniu wywolania nie pokazuje
    szczytowego zapotrzebowania drzewa MCTS - a to ono decyduje o OOM.
    """
    key = "peak_bytes_in_use" if peak else "bytes_in_use"
    try:
        total = 0
        for d in jax.local_devices():
            st = d.memory_stats()
            if st:
                total += int(st.get(key, 0))
        return total or None
    except Exception:
        return None


def reset_peak_memory():
    for d in jax.local_devices():
        try:
            d.clear_memory_stats()
        except Exception:
            pass


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

        # nvidia-smi i pynvml enumeruja WSZYSTKIE karty, takze ukryte przez
        # CUDA_VISIBLE_DEVICES. Bez filtrowania pomiar sumuje moc kart
        # bezczynnych (oraz cudzego obciazenia), co zawyza J/decyzje
        # o czynnik rowny liczbie kart w maszynie.
        vis = os.environ.get("CUDA_VISIBLE_DEVICES", "")
        self._visible = None
        if vis and vis.strip() and vis.strip() != "(wszystkie)":
            try:
                self._visible = [int(x) for x in vis.split(",") if x.strip()]
            except ValueError:
                self._visible = None

        try:
            import pynvml
            pynvml.nvmlInit()
            self._nvml = pynvml
            n = pynvml.nvmlDeviceGetCount()
            idx = self._visible if self._visible is not None else range(n)
            self._handles = [pynvml.nvmlDeviceGetHandleByIndex(i)
                             for i in idx if i < n]
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
                    if self._visible is not None:
                        rows = [r for i, r in enumerate(rows)
                                if i in self._visible]
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
            "power_devices": len(self._handles) or None,
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
            f"wsad {batch} nie dzieli sie przez liczbe urzadzen {n_dev}")
    return jax.device_put(jax.random.split(key, batch), sharding)


def _is_batched(x, batch):
    return getattr(x, "ndim", 0) >= 1 and x.shape[:1] == (batch,)


def place_batched(tree, batch, sharding):
    """Umieszcza na urzadzeniach wszystkie liscie z wiodacym wymiarem wsadu."""
    if len(jax.devices()) == 1:
        return tree
    return jax.tree_util.tree_map(
        lambda x: jax.device_put(x, sharding) if _is_batched(x, batch) else x,
        tree)


# ===========================================================================
# ANALIZA SKOMPILOWANEGO PROGRAMU
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
    """Dopisuje osiagnieta przepustowosc, moc obliczeniowa i zbior roboczy.

    Sama intensywnosc arytmetyczna NIE rozstrzyga o ograniczeniu wydajnosci.
    Jesli zarowno wykorzystanie pasma, jak i mocy obliczeniowej jest niskie,
    program jest ograniczony latencja lancucha zaleznosci, a nie zasobem.
    """
    t = out.get("wall_s_best")
    byts = out.get("bytes_accessed")
    flops = out.get("flops")
    arg = out.get("mem_argument_bytes")
    outb = out.get("mem_output_bytes")
    if arg and outb:
        out["working_set_mib"] = round((arg + outb) / 2 ** 20, 2)
    if not (t and byts):
        return out
    bw = byts / t / 1e9
    out["achieved_bw_gbs"] = round(bw, 2)
    out["bw_utilisation_pct"] = round(100.0 * bw / peak_bw_gbs, 3)
    if flops:
        out["achieved_gflops"] = round(flops / t / 1e9, 2)
    return out


def diagnose(bw_pct):
    if bw_pct is None:
        return "brak danych"
    if bw_pct > 60:
        return "ograniczenie przepustowoscia pamieci"
    if bw_pct < 10:
        return ("ograniczenie latencja lancucha zaleznosci "
                "(pasmo i moc wykorzystane w znikomym stopniu)")
    return "ograniczenie mieszane"


# ===========================================================================
# WYBOR AKCJI W ROLLOUCIE TESTOWYM
# ===========================================================================

def pick_actions(states, key, mode, mod):
    """Wybor akcji w rolloucie testowym.

    random  - jednostajnie po akcjach legalnych; wiekszosc z nich to ruchy,
              wiec przy obu stronach losowych bitwy praktycznie sie nie
              koncza (zmierzone: ok. 1700 krokow na epizod)
    greedy  - preferuje ataki (plaszczyzny AMOVE i SHOOT), gdy sa dostepne;
              odpowiednik zachowania prostego przeciwnika i jedyny tryb
              porownywalny z pomiarem na silniku referencyjnym, gdzie
              przeciwnikiem jest StupidAI
    """
    if mode == "random":
        return jax.random.categorical(
            key, jnp.where(states.legal_action_mask, 0.0, -1e9), axis=-1)

    plane = jnp.arange(mod.MAX_ACTIONS) % mod.N_PLANES
    is_board = jnp.arange(mod.MAX_ACTIONS) < mod.N_BOARD_ACTIONS
    is_attack = is_board & (plane != mod.PLANE_MOVE)
    bonus = jnp.where(is_attack, 8.0, 0.0)
    return jax.random.categorical(
        key, jnp.where(states.legal_action_mask, bonus, -1e9), axis=-1)


# ===========================================================================
# BENCHMARK 0: STATYSTYKI SRODOWISKA
# ===========================================================================

def bench_env_stats(env, mod, batch, n_steps, sharding, mode="random"):
    """Dlugosc epizodu i rozklad liczby akcji legalnych."""
    key = jax.random.PRNGKey(1)
    states = jax.jit(jax.vmap(env.init))(shard_keys(key, batch, sharding))
    states = place_batched(states, batch, sharding)

    def one_step(carry, _):
        states, key = carry
        key, k_act, k_step, k_reset = jax.random.split(key, 4)
        nlegal = states.legal_action_mask.sum(axis=-1)
        actions = pick_actions(states, k_act, mode, mod)
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
        "action_mode": mode,
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

def build_rollout(env, batch, n_steps, sharding=None):
    """Petla losowych ruchow z automatycznym resetem, zwinieta w lax.scan.

    scan zamiast petli pythonowej: mierzymy czas silnika, a nie narzut
    interpretera i kolejkowania wywolan asynchronicznych.

    Sharding wyjscia jest ograniczany jawnie. Bez tego stan zwrocony przez
    program ma inny uklad na urzadzeniach niz stan wejsciowy (bo vmap(init)
    wewnatrz petli nie dziedziczy shardingu), przez co DRUGIE wywolanie
    skompilowanego programu konczy sie bledem niezgodnosci shardingu.

    UWAGA metodologiczna: fresh = vmap(env.init)(...) wykonuje sie w KAZDYM
    kroku, niezaleznie od tego, czy ktorykolwiek epizod sie zakonczyl. Pomiar
    zawiera wiec pelen koszt resetu srodowiska na krok i jest z tego powodu
    zachowawczy wzgledem rzeczywistej przepustowosci silnika.
    """
    multi = sharding is not None and len(jax.devices()) > 1

    def constrain(tree):
        if not multi:
            return tree
        return jax.tree_util.tree_map(
            lambda x: (jax.lax.with_sharding_constraint(x, sharding)
                       if _is_batched(x, batch) else x),
            tree)

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
        return (constrain(states), key), None

    def run(states, key):
        (states, key), _ = jax.lax.scan(
            one_step, (states, key), None, length=n_steps)
        return constrain(states), key

    return run


def bench_steps(env, batch, n_steps, sharding, repeats, want_analysis,
                peak_bw_gbs):
    key = jax.random.PRNGKey(0)
    states = jax.jit(jax.vmap(env.init))(shard_keys(key, batch, sharding))
    states = place_batched(states, batch, sharding)
    run = build_rollout(env, batch, n_steps, sharding)

    t0 = time.perf_counter()
    lowered = jax.jit(run).lower(states, key)
    t_lower = time.perf_counter() - t0

    t0 = time.perf_counter()
    compiled = lowered.compile()
    t_compile = time.perf_counter() - t0

    analysis = analyse_compiled(compiled) if want_analysis else {}

    reset_peak_memory()
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
        "mem_peak_bytes": device_memory_bytes(peak=True),
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
               max_considered=16, max_depth=None,
               conv_width=64, head_width=256):
    """Buduje funkcje decyzyjna oparta na mctx.

    POPRAWKA DYSKONTA
    -----------------
    Do recurrent_fn trafia zanurzenie wezla RODZICA, czyli stan sprzed
    wykonania akcji. Gracza uprawnionego do ruchu w rodzicu odczytujemy
    wiec bezposrednio, przed wywolaniem env.step.

      * reward   - z perspektywy gracza, ktory wykonal ruch (prev_player),
                   a nie tego, ktory bedzie ruszal sie nastepny;
      * discount - -1 tylko przy faktycznej zmianie strony. HoMM3 nie jest
                   gra naprzemienna: kolejka wynika z inicjatywy i ta sama
                   strona potrafi dzialac kilka razy z rzedu. Pomiar na
                   silniku v3 daje 48,6% przejsc BEZ zmiany strony, wiec
                   bezwarunkowe -1 byloby bledne w polowie drzewa.

    MAX_DEPTH
    ---------
    mctx domyslnie ustawia max_depth = num_simulations. Czas decyzji rosnie
    empirycznie jak N^2.4; ograniczenie glebokosci jest kandydatem na
    zrodlo tej superliniowosci.
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

        reward = st.rewards[jnp.arange(batch), prev_player]

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
                max_depth=max_depth,
                max_num_considered_actions=max_considered,
                invalid_actions=~states.legal_action_mask).action
    elif policy == "muzero":
        def decide(params, states, key):
            root = make_root(params, states)
            return mctx.muzero_policy(
                params, key, root, recurrent_fn,
                num_simulations=n_sims,
                max_depth=max_depth,
                invalid_actions=~states.legal_action_mask,
                dirichlet_fraction=0.25).action
    else:
        raise ValueError(f"nieznana polityka: {policy}")

    return decide, params, n_params


def bench_mcts(env, mod, batch, n_sims, sharding, repeats, want_analysis,
               sample_power=False, policy="muzero", max_considered=16,
               max_depth=None, peak_bw_gbs=DEFAULT_PEAK_BW_GBS):
    decide, params, n_params = build_mcts(
        env, mod, batch, n_sims, policy=policy,
        max_considered=max_considered, max_depth=max_depth)

    key = jax.random.PRNGKey(0)
    states = jax.jit(jax.vmap(env.init))(shard_keys(key, batch, sharding))
    states = place_batched(states, batch, sharding)

    t0 = time.perf_counter()
    lowered = jax.jit(decide).lower(params, states, key)
    t_lower = time.perf_counter() - t0
    t0 = time.perf_counter()
    compiled = lowered.compile()
    t_compile = time.perf_counter() - t0

    analysis = analyse_compiled(compiled) if want_analysis else {}

    reset_peak_memory()
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
        "max_depth": max_depth,
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
        "mem_peak_bytes": device_memory_bytes(peak=True),
    }
    out.update(analysis)

    # stala c ze wzoru pamieciowego M = B*N*(D + c*|A|)
    tree_entries = batch * (n_sims + 1) * mod.MAX_ACTIONS
    out["tree_entries"] = tree_entries
    if out.get("mem_temp_bytes"):
        out["bytes_per_tree_edge"] = round(
            out["mem_temp_bytes"] / tree_entries, 3)
    if out.get("mem_peak_bytes"):
        out["peak_bytes_per_tree_edge"] = round(
            out["mem_peak_bytes"] / tree_entries, 3)

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
    print("=" * 78)
    print("AUTOTEST ZALEZNOSCI")
    print("=" * 78)
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

    print("  [5] max_depth przechodzi do mctx ... ", end="", flush=True)
    try:
        env, mod = load_engine("v3")
        sharding, n_dev = make_sharding()
        b = 8 * n_dev
        r = bench_mcts(env, mod, b, 16, sharding, 1, False, False,
                       policy="muzero", max_depth=4)
        print(f"OK ({r['decisions_per_s']:.1f} dec/s przy max_depth=4)")
    except Exception as exc:
        print(f"BLAD: {type(exc).__name__}: {exc}")
        print("     -> ta wersja mctx moze nie przyjmowac max_depth;")
        print("        uzywaj --max-depth tylko jesli ten test przechodzi")
        ok = False

    print("  [6] sharding wielokartowy ... ", end="", flush=True)
    try:
        env, mod = load_engine("v3")
        sharding, n_dev = make_sharding()
        b = 64 * n_dev
        r = bench_steps(env, b, 5, sharding, 2, False, DEFAULT_PEAK_BW_GBS)
        print(f"OK ({n_dev} urzadzen, wsad {b}, "
              f"{r['steps_per_s']:,.0f} krokow/s)")
    except Exception as exc:
        print(f"BLAD: {type(exc).__name__}: {str(exc)[:80]}")
        traceback.print_exc()
        ok = False

    print("\n  [7] weryfikacja poprawki dyskonta ... ", end="", flush=True)
    try:
        env, _ = load_engine("v3")
        vinit = jax.jit(jax.vmap(env.init))
        vstep = jax.jit(jax.vmap(env.step))
        key = jax.random.PRNGKey(0)
        st = vinit(jax.random.split(key, 256))
        same = total = 0
        for i in range(40):
            k1, k2 = jax.random.split(jax.random.fold_in(key, i))
            prev = st.current_player
            logits = jnp.where(st.legal_action_mask, 0.0, -1e9)
            a = jax.random.categorical(k1, logits, axis=-1)
            st = vstep(st, a, jax.random.split(k2, 256))
            live = ~(st.terminated | st.truncated)
            same += int(((st.current_player == prev) & live).sum())
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
    return ([512, 1024, 2048, 4096, 8192, 16384] if on_gpu
            else [16, 32, 64, 128, 256, 512, 1024])


def round_batches(batches, n_dev):
    """Zaokragla wsady do wielokrotnosci liczby urzadzen zamiast je odrzucac."""
    if n_dev == 1:
        return sorted(set(batches)), []
    out, changed = [], []
    for b in batches:
        r = max(n_dev, int(round(b / n_dev)) * n_dev)
        if r != b:
            changed.append((b, r))
        out.append(r)
    return sorted(set(out)), changed


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
        print("\n  !! Cudze procesy na kartach:")
        for f in foreign:
            print(f"       pid {f}")
        print("     Wyniki moga byc zaburzone. "
              "--ignore-foreign wycisza to ostrzezenie.")
    print("=" * 78)

    batches, changed = round_batches(
        args.batches or default_batches(n_dev, on_gpu), n_dev)
    if changed:
        print(f"\n  Wsady zaokraglone do wielokrotnosci {n_dev}: "
              + ", ".join(f"{a}->{c}" for a, c in changed))
        print("  Do porownania miedzy konfiguracjami podawaj wsady jawnie,")
        print("  jako wielokrotnosci 6 (np. 2046 4098 8190).")

    policies = (["muzero", "gumbel"] if args.policy == "both"
                else [args.policy])
    modes = (["random", "greedy"] if args.action_mode == "both"
             else [args.action_mode])
    outfile = args.out or f"bench_{args.tag}_{args.engine}.json"

    results = {
        "machine": info, "tag": args.tag, "engine": args.engine,
        "foreign_processes": foreign,
        "config": {"n_steps": args.steps, "num_simulations": args.sims,
                   "repeats": args.repeats, "batches": batches,
                   "policies": policies, "action_modes": modes,
                   "max_considered_actions": args.max_considered,
                   "max_depth": args.max_depth,
                   "peak_bw_gbs": args.peak_bw, "l2_mib": args.l2_mib},
        "env_stats": [], "steps": [], "mcts": [], "sims_sweep": [],
        "errors": [],
    }

    def save():
        with open(outfile, "w") as f:
            json.dump(results, f, indent=2)

    def record_error(where, exc):
        results["errors"].append({
            "where": where, "type": type(exc).__name__,
            "message": str(exc)[:500],
            "traceback": traceback.format_exc()[-2000:],
        })
        save()

    save()

    # ---------------------------------------------------------------
    if not args.no_env_stats:
        print("\n[0/3] Statystyki srodowiska")
        b = min(1024, max(batches))
        b = max(n_dev, int(round(b / n_dev)) * n_dev)
        for mode in modes:
            try:
                es = bench_env_stats(env, mod, b, args.env_stats_steps,
                                     sharding, mode)
            except Exception as exc:
                print(f"  [{mode}] PRZERWANO: {type(exc).__name__}: "
                      f"{str(exc)[:60]}")
                if args.debug:
                    traceback.print_exc()
                record_error(f"env_stats[{mode}]", exc)
                continue
            results["env_stats"].append(es)
            save()
            ref = "   (VcmiEnv + StupidAI: 17,0)" if mode == "greedy" else ""
            print(f"  tryb {mode}")
            print(f"    dlugosc epizodu   {es['mean_episode_len']} "
                  f"krokow{ref}")
            print(f"    zakonczen         {es['episodes_finished']} "
                  f"na {es['total_steps']} krokow")
            print(f"    akcje legalne     {es['legal_actions_mean']} "
                  f"+/- {es['legal_actions_std']}   "
                  f"[{es['legal_actions_min']}--{es['legal_actions_max']}], "
                  f"p05/50/95 = {es['legal_actions_p05']:.0f}/"
                  f"{es['legal_actions_p50']:.0f}/"
                  f"{es['legal_actions_p95']:.0f}")
            print(f"    udzial            "
                  f"{100*es['legal_actions_mean']/mod.MAX_ACTIONS:.1f}% "
                  f"z |A| = {mod.MAX_ACTIONS}")

    # ---------------------------------------------------------------
    print(f"\n[1/3] Kroki symulacji ({args.steps} krokow na pomiar)")
    print(f"{'wsad':>7} {'kroki/s':>13} {'czas':>8} {'std':>7} {'compile':>8} "
          f"{'B/stan':>8} {'zbior':>9} {'GB/s':>7} {'%BW':>6}")
    for b in batches:
        try:
            r = bench_steps(env, b, args.steps, sharding, args.repeats,
                            args.analysis, args.peak_bw)
        except Exception as exc:
            print(f"{b:>7}   PRZERWANO: {type(exc).__name__}: {str(exc)[:55]}")
            if args.debug:
                traceback.print_exc()
            record_error(f"steps[batch={b}]", exc)
            break
        results["steps"].append(r)
        save()
        ws = r.get("working_set_mib") or 0
        print(f"{b:>7} {r['steps_per_s']:>13,.0f} {r['wall_s_best']:>8.3f} "
              f"{r['wall_s_std']:>7.4f} {r['compile_s']:>8.1f} "
              f"{(r.get('bytes_per_state') or 0):>8,.0f} "
              f"{ws:>8.1f}M {(r.get('achieved_bw_gbs') or 0):>7.1f} "
              f"{(r.get('bw_utilisation_pct') or 0):>6.2f}")
        if r["wall_s_best"] > args.time_budget:
            print("        (budzet czasu wyczerpany, przerywam)")
            break

    # ---------------------------------------------------------------
    if not args.no_mcts:
        for pol in policies:
            label = ("PUCT / muzero_policy" if pol == "muzero"
                     else f"Gumbel / m = {args.max_considered}")
            depth = ("" if args.max_depth is None
                     else f", max_depth = {args.max_depth}")
            print(f"\n[2/3] Decyzje MCTS -- {label}  "
                  f"(num_simulations = {args.sims}{depth})")
            print(f"{'wsad':>7} {'decyzje/s':>11} {'ms/dec':>9} "
                  f"{'kroki/s':>12} {'szczyt':>9} {'B/krawedz':>10} "
                  f"{'moc W':>7} {'J/dec':>9}")
            for b in [x for x in batches if x <= args.max_mcts_batch]:
                try:
                    r = bench_mcts(env, mod, b, args.sims, sharding,
                                   args.repeats, args.analysis, args.power,
                                   policy=pol,
                                   max_considered=args.max_considered,
                                   max_depth=args.max_depth,
                                   peak_bw_gbs=args.peak_bw)
                except Exception as exc:
                    print(f"{b:>7}   PRZERWANO: {type(exc).__name__}: "
                          f"{str(exc)[:55]}")
                    if args.debug:
                        traceback.print_exc()
                    record_error(f"mcts[{pol},batch={b}]", exc)
                    break
                results["mcts"].append(r)
                save()
                pk = (f"{r['mem_peak_bytes']/2**30:.2f}G"
                      if r.get("mem_peak_bytes") else "-")
                bpe = r.get("bytes_per_tree_edge") or 0
                print(f"{b:>7} {r['decisions_per_s']:>11,.2f} "
                      f"{r['ms_per_decision']:>9.3f} "
                      f"{r['env_steps_per_s']:>12,.0f} {pk:>9} "
                      f"{bpe:>10.2f} {r.get('power_w_mean') or 0:>7.0f} "
                      f"{r.get('joules_per_decision') or 0:>9.4f}")
                if r["wall_s_best"] > args.time_budget:
                    break

        # -----------------------------------------------------------
        if results["mcts"] and not args.no_sims_sweep:
            b = min(args.sims_sweep_batch,
                    max(r["batch"] for r in results["mcts"]))
            b = max(n_dev, int(round(b / n_dev)) * n_dev)
            for pol in policies:
                label = "PUCT" if pol == "muzero" else "Gumbel"
                print(f"\n[3/3] Skalowanie wzgledem num_simulations "
                      f"-- {label}  (wsad = {b})")
                print(f"{'symulacje':>10} {'decyzje/s':>12} {'ms/dec':>10} "
                      f"{'szczyt':>9} {'B/krawedz':>10} {'wykladnik':>10}")
                prev = None
                for ns in args.sims_list:
                    try:
                        r = bench_mcts(env, mod, b, ns, sharding,
                                       args.repeats, args.analysis, False,
                                       policy=pol,
                                       max_considered=args.max_considered,
                                       max_depth=args.max_depth,
                                       peak_bw_gbs=args.peak_bw)
                    except Exception as exc:
                        print(f"{ns:>10}   PRZERWANO: {type(exc).__name__} "
                              f"({str(exc)[:35]})")
                        if args.debug:
                            traceback.print_exc()
                        record_error(f"sims_sweep[{pol},n={ns}]", exc)
                        break
                    results["sims_sweep"].append(r)
                    save()
                    exp = ""
                    if prev is not None and r["ms_per_decision"] > 0:
                        e = (np.log(r["ms_per_decision"] / prev[1])
                             / np.log(ns / prev[0]))
                        r["local_exponent"] = round(float(e), 3)
                        exp = f"{e:.2f}"
                    prev = (ns, r["ms_per_decision"])
                    pk = (f"{r['mem_peak_bytes']/2**30:.2f}G"
                          if r.get("mem_peak_bytes") else "-")
                    bpe = r.get("bytes_per_tree_edge") or 0
                    print(f"{ns:>10} {r['decisions_per_s']:>12,.2f} "
                          f"{r['ms_per_decision']:>10.3f} {pk:>9} "
                          f"{bpe:>10.2f} {exp:>10}")

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
        ws = [(r["batch"], r["working_set_mib"]) for r in results["steps"]
              if r.get("working_set_mib")]
        if ws:
            print("Zbior roboczy (argumenty + wyjscie), MiB:")
            print("  " + "  ".join(f"{b}:{w:.0f}" for b, w in ws))
            print(f"  L2 tej karty: {args.l2_mib:.0f} MiB. Prog wydajnosci")
            print("  powinien wypasc tam, gdzie zbior roboczy wraz z buforami")
            print("  tymczasowymi przestaje sie w niej miescic.")
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
            print(f"Diagnoza:       {diagnose(m)}")

    if results["mcts"]:
        for pol in policies:
            sub = [r for r in results["mcts"] if r["policy"] == pol]
            if not sub:
                continue
            pm = max(sub, key=lambda r: r["decisions_per_s"])
            name = "PUCT  " if pol == "muzero" else "Gumbel"
            print(f"Szczyt {name}:  {pm['decisions_per_s']:>13,.2f} "
                  f"decyzji/s przy wsadzie {pm['batch']}  "
                  f"({pm['decisions_per_s']*3600*24:,.0f}/dobe)")
            if pm.get("joules_per_decision"):
                print(f"                {pm['joules_per_decision']:>13.4f} "
                      f"J/decyzje")
            bpe = [r["bytes_per_tree_edge"] for r in sub
                   if r.get("bytes_per_tree_edge")]
            if bpe:
                results[f"bytes_per_tree_edge_{pol}"] = round(
                    float(np.mean(bpe)), 2)
                print(f"                {float(np.mean(bpe)):>13.2f} "
                      f"B na krawedz drzewa (stala c)")
        if len(policies) == 2:
            best = {}
            for pol in policies:
                sub = [r for r in results["mcts"] if r["policy"] == pol]
                if sub:
                    best[pol] = max(r["decisions_per_s"] for r in sub)
            if len(best) == 2 and best.get("muzero"):
                ratio = best["gumbel"] / best["muzero"]
                results["gumbel_vs_puct_throughput"] = round(ratio, 3)
                print(f"\nGumbel / PUCT (ta sama liczba symulacji): "
                      f"{ratio:.2f}x przepustowosci")
                print("Uwaga: to porownanie KOSZTU, nie jakosci. Przewaga")
                print("Gumbla ma polegac na dorownywaniu PUCT przy MNIEJSZEJ")
                print("liczbie symulacji - to wymaga pojedynkow, nie zegara.")

    if results["sims_sweep"]:
        exps = [r["local_exponent"] for r in results["sims_sweep"]
                if r.get("local_exponent")]
        if exps:
            results["scaling_exponent_N"] = round(float(np.mean(exps)), 3)
            print(f"\nWykladnik skalowania czasu decyzji wzgledem N: "
                  f"{float(np.mean(exps)):.2f} "
                  f"(rozrzut {float(np.std(exps)):.2f})")
            print("Wartosc istotnie wieksza od 1 oznacza, ze podwojenie liczby")
            print("symulacji kosztuje znacznie wiecej niz dwukrotnie.")

    if results["steps"] and results["mcts"]:
        by_batch = {r["batch"]: r["steps_per_s"] for r in results["steps"]}
        print()
        for pol in policies:
            sub = [r for r in results["mcts"]
                   if r["policy"] == pol and r["batch"] in by_batch]
            ratios = [by_batch[r["batch"]] / r["env_steps_per_s"]
                      for r in sub if r["env_steps_per_s"]]
            if ratios:
                name = "PUCT" if pol == "muzero" else "Gumbel"
                results[f"tree_step_cost_{pol}"] = round(
                    float(np.mean(ratios)), 1)
                print(f"Krok w drzewie ({name}) jest "
                      f"{float(np.mean(ratios)):.0f}x drozszy niz krok "
                      f"czystej symulacji (przy tym samym wsadzie).")
        print("Waskie gardlo lezy po stronie przeszukiwania, nie srodowiska.")

    after = foreign_processes()
    if after != foreign:
        print("\n  !! Zbior cudzych procesow zmienil sie w trakcie pomiaru.")
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
    ap.add_argument("--max-depth", type=int, default=None,
                    help="max_depth drzewa; domyslnie mctx uzywa "
                         "num_simulations")
    ap.add_argument("--action-mode", default="random",
                    choices=["random", "greedy", "both"],
                    help="polityka w rolloucie statystyk srodowiska")
    ap.add_argument("--max-mcts-batch", type=int, default=1024)
    ap.add_argument("--sims-sweep-batch", type=int, default=512)
    ap.add_argument("--sims-list", type=int, nargs="*",
                    default=[16, 25, 50, 100, 150])
    ap.add_argument("--env-stats-steps", type=int, default=200)
    ap.add_argument("--no-env-stats", action="store_true")
    ap.add_argument("--time-budget", type=float, default=60.0)
    ap.add_argument("--peak-bw", type=float, default=DEFAULT_PEAK_BW_GBS,
                    help="szczytowa przepustowosc pamieci karty [GB/s]")
    ap.add_argument("--l2-mib", type=float, default=DEFAULT_L2_MIB,
                    help="rozmiar pamieci L2 karty [MiB]")
    ap.add_argument("--no-mcts", action="store_true")
    ap.add_argument("--no-sims-sweep", action="store_true")
    ap.add_argument("--no-analysis", dest="analysis", action="store_false")
    ap.add_argument("--power", action="store_true")
    ap.add_argument("--ignore-foreign", action="store_true")
    ap.add_argument("--debug", action="store_true")
    ap.add_argument("--selftest", action="store_true")
    ap.add_argument("--out", default=None)
    args = ap.parse_args()

    if args.selftest:
        sys.exit(selftest())
    run_suite(args)


if __name__ == "__main__":
    main()