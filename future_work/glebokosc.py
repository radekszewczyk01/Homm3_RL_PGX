#!/usr/bin/env python3
"""
Pomiar geometrii drzewa MCTS: glebokosci oraz rozproszenia odwiedzin
w korzeniu.

PO CO
-----
Dwa pomiary z serii benchmarkow wskazuja posrednio, ze koszt przeszukiwania
w mctx rosnie z GLEBOKOSCIA drzewa, a nie z liczba rozwazanych akcji:

  * ograniczenie max_depth do 20 daje 1,45x przyspieszenia i obniza wykladnik
    skalowania czasu decyzji z 2,52 do 2,08;
  * polityka Gumbel jest tym SZYBSZA, im wieksze m (czyli im wiecej akcji
    rozwaza w korzeniu) - co jest sprzeczne z intuicja, dopoki nie zauwazy
    sie, ze rozproszenie budzetu po wielu akcjach daje drzewo plytsze.

Ten skrypt sprawdza to WPROST: odczytuje z obiektu drzewa zwracanego przez
mctx tablice rodzicow i liczy z niej glebokosc kazdego wezla. Zamienia
wnioskowanie posrednie na pomiar.

Mierzy takze liczbe roznych akcji odwiedzonych w korzeniu - wielkosc, ktora
pozwala odroznic "przeszukiwanie waskie i glebokie" od "szerokiego
i plytkiego".

UZYCIE
    python3 glebokosc.py                       # zestaw domyslny
    python3 glebokosc.py --batch 512 --sims 150
    python3 glebokosc.py --only puct-ref,gumbel-m16

Plik musi lezec obok benchark.py i jax_engine_v3.py.
"""

import argparse
import json
import time

import numpy as np

import jax
import jax.numpy as jnp

import mctx
import flax.linen as nn

from benchark import load_engine, make_sharding, shard_keys, place_batched


# ===========================================================================
# SIEC I FUNKCJA REKURENCYJNA  (identyczne jak w benchark.py)
# ===========================================================================

def build_probe(env, mod, batch, n_sims, policy, max_considered=16,
                max_depth=None, pb_c_init=1.25,
                conv_width=64, head_width=256):
    """Zwraca funkcje, ktora zamiast akcji oddaje geometrie drzewa.

    Z drzewa wyciagamy tylko dwie male tablice - tablice rodzicow oraz
    liczby odwiedzin dzieci korzenia. Zanurzenia (pelne stany gry) zostaja
    na urzadzeniu; ich sciaganie na hosta byloby niepotrzebnym transferem
    setek megabajtow.
    """
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

    def recurrent_fn(params, rng, action, st):
        prev_player = st.current_player          # stan RODZICA
        st = jax.vmap(env.step)(st, action, jax.random.split(rng, batch))
        logits, value = net.apply(params, st.observation)
        logits = jnp.where(st.legal_action_mask, logits, -1e9)
        reward = st.rewards[jnp.arange(batch), prev_player]
        same = st.current_player == prev_player
        discount = jnp.where(st.terminated, 0.0,
                             jnp.where(same, 1.0, -1.0))
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

    def probe(params, states, key):
        root = make_root(params, states)
        if policy == "gumbel":
            out = mctx.gumbel_muzero_policy(
                params, key, root, recurrent_fn,
                num_simulations=n_sims, max_depth=max_depth,
                max_num_considered_actions=max_considered,
                invalid_actions=~states.legal_action_mask)
        else:
            out = mctx.muzero_policy(
                params, key, root, recurrent_fn,
                num_simulations=n_sims, max_depth=max_depth,
                pb_c_init=pb_c_init,
                invalid_actions=~states.legal_action_mask,
                dirichlet_fraction=0.25)
        tree = out.search_tree
        return tree.parents, tree.children_visits[:, 0, :]

    return probe, params


# ===========================================================================
# GLEBOKOSC Z TABLICY RODZICOW
# ===========================================================================

def depths_from_parents(parents):
    """Glebokosc kazdego wezla; -1 dla wezlow nierozwinietych.

    Wezel potomny zawsze dostaje indeks wiekszy od rodzica (mctx nadaje
    indeksy w kolejnosci rozwijania), wiec wystarczy jedno przejscie
    w przod - bez rekurencji i bez sortowania.
    """
    parents = np.asarray(parents)
    B, n = parents.shape
    depth = np.full((B, n), -1, dtype=np.int32)
    depth[:, 0] = 0                                   # korzen
    rows = np.arange(B)
    for i in range(1, n):
        p = parents[:, i]
        ok = p >= 0
        safe = np.clip(p, 0, n - 1)
        d = depth[rows, safe]
        depth[:, i] = np.where(ok & (d >= 0), d + 1, -1)
    return depth


def summarise(parents, root_visits, label, cfg):
    depth = depths_from_parents(parents)
    valid = depth >= 0
    per_game_max = depth.max(axis=1)
    flat = depth[valid]

    rv = np.asarray(root_visits)
    distinct = (rv > 0).sum(axis=1)

    return {
        "label": label,
        **cfg,
        "wezlow_rozwinietych": float(valid.sum(axis=1).mean()),
        "glebokosc_max_srednia": float(per_game_max.mean()),
        "glebokosc_max_p95": float(np.percentile(per_game_max, 95)),
        "glebokosc_max_globalna": int(per_game_max.max()),
        "glebokosc_srednia": float(flat.mean()),
        "glebokosc_mediana": float(np.median(flat)),
        "akcje_w_korzeniu_srednio": float(distinct.mean()),
        "akcje_w_korzeniu_max": int(distinct.max()),
    }


# ===========================================================================

def run_one(env, mod, batch, n_sims, policy, max_considered, max_depth,
            sharding, label, pb_c_init=1.25):
    probe, params = build_probe(env, mod, batch, n_sims, policy,
                                max_considered, max_depth, pb_c_init)
    key = jax.random.PRNGKey(0)
    states = jax.jit(jax.vmap(env.init))(shard_keys(key, batch, sharding))
    states = place_batched(states, batch, sharding)

    t0 = time.perf_counter()
    fn = jax.jit(probe)
    parents, rv = fn(params, states, key)
    jax.block_until_ready(parents)
    t_first = time.perf_counter() - t0

    t0 = time.perf_counter()
    parents, rv = fn(params, states, jax.random.fold_in(key, 1))
    jax.block_until_ready(parents)
    t_run = time.perf_counter() - t0

    cfg = {"polityka": policy, "wsad": batch, "symulacje": n_sims,
           "m": max_considered if policy == "gumbel" else None,
           "max_depth": max_depth,
           "pb_c_init": pb_c_init if policy == "muzero" else None,
           "ms_na_decyzje": round(1000.0 * t_run / batch, 4),
           "czas_kompilacji_s": round(t_first - t_run, 1)}
    return summarise(parents, rv, label, cfg)


ZESTAW = {
    # etykieta         polityka   m     max_depth  pb_c_init
    "puct-ref":       ("muzero",  None, None,      1.25),
    "puct-c3":        ("muzero",  None, None,      3.0),
    "puct-c5":        ("muzero",  None, None,      5.0),
    "puct-c10":       ("muzero",  None, None,      10.0),
    "puct-c20":       ("muzero",  None, None,      20.0),
    "puct-d20":       ("muzero",  None, 20,        1.25),
    "gumbel-m16":     ("gumbel",  16,   None,      1.25),
    "gumbel-m64":     ("gumbel",  64,   None,      1.25),
    "gumbel-m1322":   ("gumbel",  1322, None,      1.25),
}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--engine", default="v3", choices=["v2", "v3"])
    ap.add_argument("--batch", type=int, default=256)
    ap.add_argument("--sims", type=int, default=100)
    ap.add_argument("--only", default=None,
                    help="lista etykiet po przecinku")
    ap.add_argument("--sweep-pb-c", dest="sweep_pb_c", type=float,
                    default=1.25,
                    help="stala eksploracji uzywana w przemiataniu po N")
    ap.add_argument("--sims-sweep", type=int, nargs="*",
                    default=[50, 100, 150, 200],
                    help="dla PUCT: jak glebokosc rosnie z N "
                         "(pusta lista wylacza)")
    ap.add_argument("--out", default="glebokosc.json")
    args = ap.parse_args()

    env, mod = load_engine(args.engine)
    sharding, n_dev = make_sharding()
    b = max(n_dev, int(round(args.batch / n_dev)) * n_dev)

    print("=" * 92)
    print(f"  GEOMETRIA DRZEWA MCTS   silnik {args.engine}, wsad {b}, "
          f"N = {args.sims}, urzadzen {n_dev}")
    print("=" * 92)

    wyniki = []
    labels = (args.only.split(",") if args.only else list(ZESTAW))

    hdr = (f"{'konfiguracja':<16} {'c_puct':>7} {'wezly':>7} {'gleb.':>7} "
           f"{'gleb.':>7} {'gleb.':>7} {'akcje':>7} {'ms/dec':>9}")
    sub = (f"{'':<16} {'':>7} {'rozw.':>7} {'max sr':>7} {'max p95':>7} "
           f"{'srednia':>7} {'korzen':>7} {'':>9}")
    print("\n" + hdr)
    print(sub)
    print("-" * 92)

    for lab in labels:
        if lab not in ZESTAW:
            print(f"  [nieznana etykieta] {lab}")
            continue
        pol, m, md, cpuct = ZESTAW[lab]
        try:
            r = run_one(env, mod, b, args.sims, pol, m or 16, md,
                        sharding, lab, pb_c_init=cpuct)
        except Exception as exc:
            print(f"{lab:<16}   BLAD: {type(exc).__name__}: {str(exc)[:50]}")
            continue
        wyniki.append(r)
        cp = r.get("pb_c_init")
        print(f"{lab:<16} {(f'{cp:.2f}' if cp else '-'):>7} "
              f"{r['wezlow_rozwinietych']:>7.0f} "
              f"{r['glebokosc_max_srednia']:>7.1f} "
              f"{r['glebokosc_max_p95']:>7.0f} "
              f"{r['glebokosc_srednia']:>7.2f} "
              f"{r['akcje_w_korzeniu_srednio']:>7.1f} "
              f"{r['ms_na_decyzje']:>9.3f}")

    # ------------------------------------------------------------------
    if args.sims_sweep:
        print(f"\nJak glebokosc rosnie z liczba symulacji (PUCT, wsad {b}):")
        print(f"{'N':>6} {'gleb. max sr':>13} {'gleb. srednia':>14} "
              f"{'akcje korzen':>13} {'ms/dec':>9} {'gleb./N':>9}")
        print("-" * 70)
        for ns in args.sims_sweep:
            try:
                r = run_one(env, mod, b, ns, "muzero", 16, None,
                            sharding, f"puct-N{ns}",
                            pb_c_init=args.sweep_pb_c)
            except Exception as exc:
                print(f"{ns:>6}   BLAD: {type(exc).__name__}")
                continue
            wyniki.append(r)
            print(f"{ns:>6} {r['glebokosc_max_srednia']:>13.1f} "
                  f"{r['glebokosc_srednia']:>14.2f} "
                  f"{r['akcje_w_korzeniu_srednio']:>13.1f} "
                  f"{r['ms_na_decyzje']:>9.3f} "
                  f"{r['glebokosc_max_srednia']/ns:>9.3f}")

    # ------------------------------------------------------------------
    print("\n" + "=" * 92)
    ref = next((w for w in wyniki if w["label"] == "puct-ref"), None)
    g16 = next((w for w in wyniki if w["label"] == "gumbel-m16"), None)
    gwd = next((w for w in wyniki if w["label"] == "gumbel-m1322"), None)

    if ref and gwd:
        print(f"PUCT:          glebokosc {ref['glebokosc_max_srednia']:.1f}, "
              f"akcji w korzeniu {ref['akcje_w_korzeniu_srednio']:.1f}, "
              f"{ref['ms_na_decyzje']:.2f} ms/dec")
        print(f"Gumbel m=1322: glebokosc {gwd['glebokosc_max_srednia']:.1f}, "
              f"akcji w korzeniu {gwd['akcje_w_korzeniu_srednio']:.1f}, "
              f"{gwd['ms_na_decyzje']:.2f} ms/dec")
        if gwd["glebokosc_max_srednia"] > 0:
            rd = ref["glebokosc_max_srednia"] / gwd["glebokosc_max_srednia"]
            rt = ref["ms_na_decyzje"] / gwd["ms_na_decyzje"]
            print(f"\nStosunek glebokosci {rd:.2f}x, stosunek czasu {rt:.2f}x.")
            print("Jesli obie liczby sa zblizone, koszt jest funkcja")
            print("glebokosci drzewa - co potwierdza wyjasnienie przyjete")
            print("w rozdziale o przeszukiwaniu.")
    cvar = [w for w in wyniki if w["label"].startswith("puct-c")
            or w["label"] == "puct-ref"]
    if len(cvar) > 1:
        print("\nWplyw stalej eksploracji na ksztalt drzewa:")
        print(f"{'c_puct':>8} {'akcji w korzeniu':>18} {'glebokosc':>11} "
              f"{'ms/dec':>9}")
        for w in sorted(cvar, key=lambda x: x["pb_c_init"] or 0):
            print(f"{w['pb_c_init']:>8.2f} "
                  f"{w['akcje_w_korzeniu_srednio']:>18.1f} "
                  f"{w['glebokosc_max_srednia']:>11.1f} "
                  f"{w['ms_na_decyzje']:>9.3f}")
        print("Jesli liczba akcji w korzeniu rosnie z c_puct, degeneracja")
        print("jest skutkiem doboru parametru, a nie wlasnoscia reguly.")

    if g16 and gwd:
        print(f"\nGumbel m=16 vs m=1322: glebokosc "
              f"{g16['glebokosc_max_srednia']:.1f} vs "
              f"{gwd['glebokosc_max_srednia']:.1f}, akcji w korzeniu "
              f"{g16['akcje_w_korzeniu_srednio']:.1f} vs "
              f"{gwd['akcje_w_korzeniu_srednio']:.1f}.")
        print("Mniejsze m oznacza wezsze i glebsze przeszukiwanie.")

    with open(args.out, "w") as f:
        json.dump({"config": {"engine": args.engine, "batch": b,
                              "sims": args.sims, "n_devices": n_dev},
                   "wyniki": wyniki}, f, indent=2)
    print(f"\nZapisano {args.out}")


if __name__ == "__main__":
    main()