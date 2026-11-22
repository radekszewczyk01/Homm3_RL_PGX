#!/usr/bin/env python3
"""
Najkrotszy mozliwy przebieg silnika, do podstawienia pod ncu.

Robi dokladnie tyle, ile trzeba, zeby skompilowac krok i wykonac go kilka
razy. Zadnej analizy, zadnego wypisywania wynikow, zadnego drzewa - inaczej
ncu zbieralby liczniki z jader, ktore nas nie interesuja, a profilowanie
trwaloby wielokrotnie dluzej (ncu serializuje jadra).

    python3 narzedzia/krotki_przebieg.py --preset III_II --kanaly 9 \\
        --wsad 2048 --kroki 5
"""

import argparse
import dataclasses
import os
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import jax                                                   # noqa: E402
import jax.numpy as jnp                                      # noqa: E402

from homm3 import preset, zbuduj                             # noqa: E402
from homm3.pomiar import losuj_legalne                       # noqa: E402


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--preset", default="III_II")
    p.add_argument("--kanaly", type=int, default=0)
    p.add_argument("--wsad", type=int, default=2048)
    p.add_argument("--kroki", type=int, default=5)
    p.add_argument("--czary", nargs="*", default=None)
    p.add_argument("--gather", action="store_true",
                   help="fala zasiegu odczytem sasiadow zamiast iloczynem "
                        "macierzowym (ta sama semantyka, inny koszt)")
    p.add_argument("--cicho", action="store_true")
    args = p.parse_args()

    zmiany = {"kanaly_wypelniajace": args.kanaly,
              "nazwa": f"{args.preset}_k{args.kanaly}"}
    if args.czary is not None:
        zmiany["czary"] = tuple(c for c in args.czary if c)
    if args.gather:
        zmiany["zasieg_gatherem"] = True
        zmiany["nazwa"] = zmiany["nazwa"] + "_gather"
    kfg = dataclasses.replace(preset(args.preset), **zmiany)
    env = zbuduj(kfg)

    klucz = jax.random.PRNGKey(0)
    st = jax.jit(jax.vmap(env.init))(jax.random.split(klucz, args.wsad))
    krok = jax.jit(jax.vmap(env.step))

    def jeden(s, k):
        k1, k2 = jax.random.split(k)
        return krok(s, losuj_legalne(s, k1),
                    jax.random.split(k2, args.wsad))

    # kompilacja poza pomiarem
    st = jeden(st, jax.random.fold_in(klucz, 999))
    jax.block_until_ready(st)

    t0 = time.perf_counter()
    for i in range(args.kroki):
        st = jeden(st, jax.random.fold_in(klucz, i))
    jax.block_until_ready(st)
    dt = time.perf_counter() - t0

    if not args.cicho:
        # na stderr, zeby nie mieszac sie z CSV ncu na stdout
        print(f"[krotki_przebieg] preset={args.preset} kanaly={args.kanaly} "
              f"wsad={args.wsad} kroki={args.kroki} "
              f"D={sum(l.nbytes for l in jax.tree.leaves(st)) // args.wsad} "
              f"czas={dt:.3f}s", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
