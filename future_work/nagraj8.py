#!/usr/bin/env python3
"""
Zapis przebiegu pojedynczej bitwy do pliku JSON (na potrzeby wizualizacji).

Rozgrywa jedna bitwe miedzy dwoma agentami i zapisuje kazda klatke: pozycje,
liczebnosci, aktywny stos, wykonana akcje oraz nagrody. Plik wynikowy jest
samowystarczalny --- odtwarzacz nie potrzebuje ani JAX-a, ani silnika.

UZYCIE
    # siec z treningu przeciw polityce zachlannej
    python3 nagraj8.py --a runs/gumbel-m16_s0 --b zachlanna --seed 7

    # pelny agent z przeszukiwaniem
    python3 nagraj8.py --a runs/gumbel-m16_s0 --gracz-a mcts --b zachlanna

    # pojedynek dwoch wytrenowanych sieci
    python3 nagraj8.py --a runs/gumbel-m16_s0 --b runs/puct-strojony_s1 --seed 3

Aby nagrac te sama bitwe dla dwoch agentow (porownanie obok siebie), uzyj tego
samego --seed: stan poczatkowy zalezy wylacznie od niego.
"""

import argparse
import json
import os

import numpy as np
import jax
import jax.numpy as jnp

import train8 as T                      # ustawia katalog roboczy i importuje silnik
import ewal8 as E                       # wczytywanie punktow kontrolnych i gracze
import jax_engine_v3 as eng
from jax_engine_v3 import HoMM3EnvV3, N_PLANES, N_BOARD_ACTIONS


def lista(x):
    return np.asarray(x).tolist()


def opis_akcji(akcja):
    """Zwraca czytelny opis akcji o podanym numerze."""
    a = int(akcja)
    if a == N_BOARD_ACTIONS:
        return "czekanie"
    if a == N_BOARD_ACTIONS + 1:
        return "obrona"
    heks, plaszczyzna = a // N_PLANES, a % N_PLANES
    kierunki = ["gora-lewo", "gora-prawo", "prawo",
                "dol-prawo", "dol-lewo", "lewo"]
    if plaszczyzna == 0:
        return f"ruch na {heks}"
    if plaszczyzna == N_PLANES - 1:
        return f"strzal w {heks}"
    return f"ruch na {heks} + atak {kierunki[plaszczyzna - 1]}"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--a", required=True, help="katalog przebiegu albo zachlanna/losowa")
    ap.add_argument("--b", default="zachlanna")
    ap.add_argument("--gracz-a", default="siec",
                    choices=["siec", "mcts", "zachlanna", "losowa"])
    ap.add_argument("--gracz-b", default="siec",
                    choices=["siec", "mcts", "zachlanna", "losowa"])
    ap.add_argument("--seed", type=int, default=0,
                    help="ziarno stanu poczatkowego i przebiegu bitwy")
    ap.add_argument("--strona-a", type=int, default=0, choices=[0, 1])
    ap.add_argument("--sims", type=int, default=100)
    ap.add_argument("--max-krokow", type=int, default=600)
    ap.add_argument("--wyjscie", default=None)
    args = ap.parse_args()

    env = HoMM3EnvV3()
    siec = T.Siec()
    wzor = siec.init(jax.random.PRNGKey(0),
                     jnp.zeros((1, eng.BOARD_ROWS, eng.BOARD_COLS, eng.C)))

    def przygotuj(opis, rodzaj):
        if opis in ("zachlanna", "losowa"):
            return wzor, E.zbuduj_gracza(opis, env, siec, 1, args.sims,
                                         "gumbel", 1.25, 16), opis
        tag, polityka, c, m = E.konfiguracja_przebiegu(opis)
        params = E.wczytaj_params(opis, wzor)
        gracz = E.zbuduj_gracza(rodzaj, env, siec, 1, args.sims, polityka, c, m)
        return params, gracz, f"{os.path.basename(opis.rstrip('/'))}[{rodzaj}]"

    pa, graj_a, etyk_a = przygotuj(args.a, args.gracz_a)
    pb, graj_b, etyk_b = przygotuj(args.b, args.gracz_b)
    print(f"{etyk_a}  (strona {args.strona_a})   vs   {etyk_b}")

    # --- stan poczatkowy (wsad jednoelementowy: mctx wymaga wymiaru wsadu) ---
    key = jax.random.PRNGKey(args.seed)
    key, k_init = jax.random.split(key)
    st = jax.jit(jax.vmap(env.init))(jax.random.split(k_init, 1))
    krok = jax.jit(jax.vmap(env.step))

    stale = {
        "wiersze": eng.BOARD_ROWS,
        "kolumny": eng.BOARD_COLS,
        "jednostek": eng.MAX_UNITS,
        "agent_a": etyk_a,
        "agent_b": etyk_b,
        "strona_a": args.strona_a,
        "seed": args.seed,
        "przeszkody": lista(st.blocked[0]),
        "side": lista(st.side[0]),
        "is_two_hex": lista(st.is_two_hex[0]),
        "is_flyer": lista(st.is_flyer[0]),
        "is_shooter": lista(st.is_shooter[0]),
        "max_hp": lista(st.max_hp[0]),
        "speed": lista(st.speed[0]),
        "attack": lista(st.attack[0]),
        "defense": lista(st.defense[0]),
        "ai_value": lista(st.ai_value[0]),
        "count_start": lista(st.count_start[0]),
    }

    klatki = []

    def zapisz(akcja=None, kto=None):
        klatki.append({
            "pos_idx": lista(st.pos_idx[0]),
            "alive": lista(st.alive[0]),
            "count": lista(st.count[0]),
            "hp_left": lista(st.hp_left[0]),
            "shots": lista(st.shots[0]),
            "aktywny": int(st.active_unit_idx[0]),
            "gracz": int(st.current_player[0]),
            "terminated": bool(st.terminated[0]),
            "rewards": lista(st.rewards[0]),
            "akcja": None if akcja is None else int(akcja),
            "akcja_opis": None if akcja is None else opis_akcji(akcja),
            "akcja_jednostki": kto,
        })

    zapisz()
    for t in range(args.max_krokow):
        if bool(st.terminated[0]):
            break
        key, k_a, k_b, k_step = jax.random.split(key, 4)
        tura_a = int(st.current_player[0]) == args.strona_a
        akcja = (graj_a(pa, st, k_a) if tura_a else graj_b(pb, st, k_b))
        kto = int(st.active_unit_idx[0])
        st = krok(st, akcja, jax.random.split(k_step, 1))
        zapisz(akcja[0], kto)

    wynik = np.asarray(st.rewards[0])
    print(f"klatek: {len(klatki)}  zakonczona: {bool(st.terminated[0])}  "
          f"nagrody: {wynik.tolist()}")

    sciezka = args.wyjscie or (
        f"powtorka_{etyk_a.replace('[', '_').replace(']', '')}_"
        f"vs_{etyk_b.replace('[', '_').replace(']', '')}_s{args.seed}.json")
    with open(sciezka, "w") as f:
        json.dump({"stale": stale, "klatki": klatki}, f)
    print(f"zapisano: {os.path.join(os.getcwd(), sciezka)}")


if __name__ == "__main__":
    main()