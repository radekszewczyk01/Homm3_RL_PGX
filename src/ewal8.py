#!/usr/bin/env python3
"""
Ewaluacja koncowych sieci z rozdzialu 8: pojedynki i turniej.

Dwa braki ewaluacji prowadzonej w trakcie treningu uzupelnia ten skrypt:
  * mierzyla wylacznie siec bez przeszukiwania (argmax logitow), co faworyzuje
    metody uczace ostrej polityki; tutaj mozna wlaczyc pelnego agenta z MCTS
    (--gracz mcts), czyli ewaluacje poziomu drugiego;
  * jedynym przeciwnikiem byla polityka zachlanna, ktorej wynik nasyca sie
    okolo 0,7; turniej kazdy z kazdym porownuje sieci bezposrednio.

Kazdy pojedynek rozgrywany jest w parach lustrzanych: ta sama bitwa poczatkowa
dwa razy, ze stronami zamienionymi.

UZYCIE
    # jeden pojedynek: siec z przebiegu A przeciwko polityce zachlannej
    python3 ewal8.py --a runs/gumbel-m16_s0 --b zachlanna

    # pelny agent (siec + MCTS) przeciwko sieci bez przeszukiwania
    python3 ewal8.py --a runs/gumbel-m16_s0 --gracz-a mcts \
                     --b runs/puct-strojony_s0 --gracz-b mcts

    # turniej kazdy z kazdym po jednym ziarnie z kazdej konfiguracji
    python3 ewal8.py --turniej runs/gumbel-m64_s0 runs/gumbel-m16_s0 \
                     runs/gumbel-m16-bez_s0 runs/puct-strojony_s0 \
                     runs/puct-domyslny_s0 --par 128

Wyniki zapisywane sa do turniej.json oraz turniej.csv.
"""

import argparse
import glob
import itertools
import json
import os
import re

import numpy as np
import jax
import jax.numpy as jnp
from flax.serialization import from_bytes

import train8 as T          # ustawia katalog roboczy i importuje silnik
import jax_engine_v3 as eng
from jax_engine_v3 import HoMM3EnvV3, MAX_ACTIONS


# ---------------------------------------------------------------------------
# wczytywanie przebiegow
# ---------------------------------------------------------------------------

def ostatni_ckpt(kat):
    pliki = sorted(glob.glob(os.path.join(kat, "ckpt_*.msgpack")))
    if not pliki:
        raise SystemExit(f"brak punktow kontrolnych w {kat}")
    return pliki[-1]


def konfiguracja_przebiegu(kat):
    """Zwraca (tag, polityka, c_puct, m) na podstawie historia.json."""
    sciezka = os.path.join(kat, "historia.json")
    if os.path.exists(sciezka):
        with open(sciezka) as f:
            d = json.load(f)
        tag = d.get("konfiguracja", {}).get("tag")
        if tag in T.KONFIGURACJE:
            polityka, c, m, _ = T.KONFIGURACJE[tag]
            if not d.get("konfiguracja", {}).get("ksztaltowanie", True):
                tag += "-bez"
            return tag, polityka, c, m
    nazwa = os.path.basename(kat.rstrip("/"))
    tag = re.sub(r"_s\d+$", "", nazwa).replace("-bez", "")
    polityka, c, m, _ = T.KONFIGURACJE.get(tag, ("gumbel", 1.25, 16, ""))
    return nazwa, polityka, c, m


def wczytaj_params(kat, wzor):
    with open(ostatni_ckpt(kat), "rb") as f:
        return from_bytes(wzor, f.read())


# ---------------------------------------------------------------------------
# gracze
# ---------------------------------------------------------------------------

def zbuduj_gracza(rodzaj, env, siec, batch, n_sims, polityka, c_puct, m):
    """Zwraca funkcje (params, states, key) -> akcje."""
    if rodzaj == "mcts":
        decyduj = T.zbuduj_decyzje(env, siec, batch, n_sims,
                                   polityka, c_puct, m, ksztaltowanie=True)
        return lambda params, states, key: decyduj(params, states, key)[0]

    if rodzaj == "siec":
        def graj(params, states, key):
            logity, _ = siec.apply(params, states.observation)
            return jnp.argmax(
                jnp.where(states.legal_action_mask, logity, -1e9), axis=-1)
        return graj

    if rodzaj == "zachlanna":
        return lambda params, states, key: T.polityka_zachlanna(
            states, key, eng)

    if rodzaj == "losowa":
        return lambda params, states, key: jax.random.categorical(
            key, jnp.where(states.legal_action_mask, 0.0, -1e9), axis=-1)

    raise SystemExit(f"nieznany rodzaj gracza: {rodzaj}")


def zbuduj_pojedynek(env, graj_a, graj_b, n_par, max_krokow):
    """Pary lustrzane: A gra polowa partii jako gracz 0, polowa jako 1."""
    B = 2 * n_par
    strona_a = jnp.concatenate(
        [jnp.zeros(n_par, jnp.int32), jnp.ones(n_par, jnp.int32)])

    def krok(carry, _):
        pa, pb, states, key, wynik, zywe = carry
        key, k_a, k_b, k_step = jax.random.split(key, 4)

        akcja_a = graj_a(pa, states, k_a)
        akcja_b = graj_b(pb, states, k_b)
        tura_a = states.current_player == strona_a
        akcje = jnp.where(tura_a, akcja_a, akcja_b)

        states = jax.vmap(env.step)(
            states, akcje, jax.random.split(k_step, B))

        koniec = states.terminated & zywe
        r = states.rewards[jnp.arange(B), strona_a]
        wynik = jnp.where(koniec, r, wynik)
        zywe = zywe & (~states.terminated)
        return (pa, pb, states, key, wynik, zywe), None

    def pojedynek(params_a, params_b, key):
        k_init, k_gra = jax.random.split(key)
        klucze = jax.random.split(k_init, n_par)
        klucze = jnp.concatenate([klucze, klucze], axis=0)
        states = jax.vmap(env.init)(klucze)
        carry = (params_a, params_b, states, k_gra,
                 jnp.zeros(B), jnp.ones(B, jnp.bool_))
        (_, _, _, _, wynik, zywe), _ = jax.lax.scan(
            krok, carry, None, length=max_krokow)
        return wynik, zywe

    return pojedynek


# ---------------------------------------------------------------------------

def rozegraj(env, siec, wzor, opis_a, opis_b, args, seed=0):
    """Jeden pojedynek. opis_* to katalog przebiegu albo nazwa polityki."""
    B = 2 * args.par
    stale = {"zachlanna", "losowa"}

    def przygotuj(opis, rodzaj):
        if opis in stale:
            return wzor, zbuduj_gracza(opis, env, siec, B, args.sims,
                                       "gumbel", 1.25, 16), opis
        tag, polityka, c, m = konfiguracja_przebiegu(opis)
        params = wczytaj_params(opis, wzor)
        gracz = zbuduj_gracza(rodzaj, env, siec, B, args.sims,
                              polityka, c, m)
        etykieta = f"{os.path.basename(opis.rstrip('/'))}[{rodzaj}]"
        return params, gracz, etykieta

    pa, graj_a, etyk_a = przygotuj(opis_a, args.gracz_a)
    pb, graj_b, etyk_b = przygotuj(opis_b, args.gracz_b)

    pojedynek = jax.jit(zbuduj_pojedynek(env, graj_a, graj_b,
                                         args.par, args.max_krokow))
    wynik, zywe = pojedynek(pa, pb, jax.random.PRNGKey(seed))
    ocena = T.podsumuj_ewaluacje(wynik, zywe, args.par)
    ocena["a"] = etyk_a
    ocena["b"] = etyk_b
    print(f"{etyk_a:<34} vs {etyk_b:<34} "
          f"wsk {ocena['wskaznik_zwyciestw']:.3f}  "
          f"partii {ocena['partii_rozegranych']}  "
          f"nieskonczonych {ocena['partii_nieskonczonych']}")
    return ocena


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--a", help="katalog przebiegu albo zachlanna/losowa")
    ap.add_argument("--b", default="zachlanna")
    ap.add_argument("--gracz-a", default="siec",
                    choices=["siec", "mcts", "zachlanna", "losowa"])
    ap.add_argument("--gracz-b", default="siec",
                    choices=["siec", "mcts", "zachlanna", "losowa"])
    ap.add_argument("--turniej", nargs="*", default=None,
                    help="katalogi przebiegow do turnieju kazdy z kazdym")
    ap.add_argument("--par", type=int, default=256)
    ap.add_argument("--sims", type=int, default=100)
    ap.add_argument("--max-krokow", type=int, default=600)
    ap.add_argument("--seed", type=int, default=0)
    ap.add_argument("--wyjscie", default="analiza")
    args = ap.parse_args()

    os.makedirs(args.wyjscie, exist_ok=True)
    env = HoMM3EnvV3()
    siec = T.Siec()
    wzor = siec.init(jax.random.PRNGKey(0),
                     jnp.zeros((1, eng.BOARD_ROWS, eng.BOARD_COLS, eng.C)))
    print(f"urzadzenia: {jax.devices()}  par: {args.par}  "
          f"symulacji: {args.sims}")

    wyniki = []
    if args.turniej:
        for opis in args.turniej:
            wyniki.append(rozegraj(env, siec, wzor, opis, "zachlanna",
                                   args, args.seed))
        for a, b in itertools.combinations(args.turniej, 2):
            wyniki.append(rozegraj(env, siec, wzor, a, b, args, args.seed))
    else:
        if not args.a:
            raise SystemExit("podaj --a albo --turniej")
        wyniki.append(rozegraj(env, siec, wzor, args.a, args.b, args,
                               args.seed))

    sciezka = os.path.join(args.wyjscie, "turniej.json")
    stare = []
    if os.path.exists(sciezka):
        with open(sciezka) as f:
            stare = json.load(f)
    stare.extend(wyniki)
    with open(sciezka, "w") as f:
        json.dump(stare, f, indent=2)

    with open(os.path.join(args.wyjscie, "turniej.csv"), "w") as f:
        f.write("a,b,wskaznik_zwyciestw,partii_rozegranych,"
                "partii_nieskonczonych,par_rozstrzygnietych\n")
        for w in stare:
            f.write(f"{w['a']},{w['b']},{w['wskaznik_zwyciestw']},"
                    f"{w['partii_rozegranych']},{w['partii_nieskonczonych']},"
                    f"{w['par_rozstrzygnietych']}\n")
    print(f"\nzapisano {sciezka} oraz turniej.csv "
          f"({len(stare)} pojedynkow lacznie)")


if __name__ == "__main__":
    main()