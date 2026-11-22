#!/usr/bin/env python3
"""
Najkrotszy mozliwy przebieg silnika, do podstawienia pod ncu.

Robi dokladnie tyle, ile trzeba, zeby skompilowac krok i wykonac go kilka
razy. Zadnej analizy, zadnego wypisywania wynikow, zadnego drzewa - inaczej
ncu zbieralby liczniki z jader, ktore nas nie interesuja, a profilowanie
trwaloby wielokrotnie dluzej (ncu serializuje jadra).

    python3 narzedzia/krotki_przebieg.py --preset III_II --kanaly 9 \\
        --wsad 2048 --kroki 5

SRODOWISKA PGX
--------------
Z --pgx w miejsce --preset ten sam przebieg wykonuje sie na srodowisku z
biblioteki PGX, tym samym ukladem petli i tym samym losowaniem akcji z maski.
Po to, zeby dalo sie zebrac liczniki sprzetowe dla CUDZEJ implementacji i
sprawdzic, czy prog zalamania ma u niej to samo pochodzenie co u nas - czyli
czy poprawiony model progu (slad jadra, nie 2BD) przenosi sie miedzy
niezaleznymi programami, czy jest dopasowany do jednego.

    python3 narzedzia/krotki_przebieg.py --pgx chess --wsad 512 --kroki 5
"""

import argparse
import dataclasses
import os
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import jax                                                   # noqa: E402
import jax.numpy as jnp                                      # noqa: E402



def przebieg_pgx(nazwa, wsad, krokow, cicho):
    """Ten sam uklad petli co dla naszego silnika, ale na srodowisku PGX.

    Musi byc TEN SAM uklad, bo inaczej liczniki opisywalyby rozne programy:
    vmap po init, vmap po step z bezwarunkowym wznawianiem epizodow, akcja
    losowana z maski dopuszczalnych, kompilacja poza pomiarem.
    """
    import pgx
    from pgx.experimental import auto_reset

    env = pgx.make(nazwa)
    init = jax.jit(jax.vmap(env.init))
    krok = jax.jit(jax.vmap(auto_reset(env.step, env.init)))

    klucz = jax.random.PRNGKey(0)
    st = init(jax.random.split(klucz, wsad))

    def jeden(s, k):
        k1, k2 = jax.random.split(k)
        logity = jnp.where(s.legal_action_mask, 0.0, -1e9)
        a = jax.random.categorical(k1, logity, axis=-1)
        return krok(s, a, jax.random.split(k2, wsad))

    st = jeden(st, jax.random.fold_in(klucz, 999))
    jax.block_until_ready(st)

    t0 = time.perf_counter()
    for i in range(krokow):
        st = jeden(st, jax.random.fold_in(klucz, i))
    jax.block_until_ready(st)
    dt = time.perf_counter() - t0

    if not cicho:
        D = sum(l.nbytes for l in jax.tree.leaves(st)) // wsad
        print(f"[krotki_przebieg] pgx={nazwa} wsad={wsad} krokow={krokow} "
              f"D={D} czas={dt:.3f}s", file=sys.stderr)
    return 0


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--pgx", default=None,
                   help="nazwa srodowiska PGX (chess, go_19x19, shogi, ...) "
                        "zamiast naszego presetu")
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

    if args.pgx:
        return przebieg_pgx(args.pgx, args.wsad, args.kroki, args.cicho)

    # import tutaj, nie na gorze: wczytuje tablice stworow, a w trybie --pgx
    # nie jest potrzebny i tylko wypisuje ostrzezenia o puli
    from homm3 import preset, zbuduj
    from homm3.pomiar import losuj_legalne

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
