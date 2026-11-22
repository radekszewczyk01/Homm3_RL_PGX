#!/usr/bin/env python3
"""Lapie PIERWSZE naruszenie niezmiennika i wypisuje wszystko o nim.

PO CO TO JEST
-------------
Przebieg `pokrycie` na presecie `wszystko` zglosil dwadziescia siedem razy
"wysysanie zycia przekroczylo pulap". Komunikat jest mylacy, bo niezmiennik
brzmi po prostu

    liczebnosc stosu nie moze przekroczyc liczebnosci poczatkowej

a wysysanie zycia jest jedyna mechanika, ktora legalnie liczebnosc podnosi -
wiec nazwa winy padla na nia. Tymczasem to samo `pokrycie` pokazalo, ze
w calej puli ZERO stworow ma te zdolnosc, czyli ten kod ani razu sie nie
wykonal. Winowajca jest wiec kto inny.

Liczebnosc moze wzrosnac dokladnie w dwoch miejscach kodu: w leczeniu
(`_ulecz`, ma pulap, nieczynne) i w `zadaj_obrazenia`, gdzie

    remaining = hp_before - dmg

a potem liczebnosc jest przeliczana z `remaining`. Jesli `dmg` jest UJEMNE,
to `remaining` rosnie i stos sie odradza. Ujemne obrazenia nie sa pojeciem
z gry, wiec albo arytmetyka ma dziure, albo ktoras linia tablicy stworow ma
niemozliwe wartosci (na przyklad minimalne obrazenia ponizej zera).

Dlatego ten skrypt robi dwie rzeczy po kolei:
  1. sprawdza SAMA TABLICE - czy kazda linia ma sensowne wartosci,
  2. odtwarza partie krok po kroku i przy pierwszym naruszeniu wypisuje
     pelny opis obu stosow, akcje i stan bufow.

Uruchomienie (na serwerze przez dockera):
    ./uruchom/w_dockerze.sh python3 narzedzia/zlap_naruszenie.py
    ./uruchom/w_dockerze.sh python3 narzedzia/zlap_naruszenie.py --preset wszystko --gier 200
"""
import argparse
import os
import sys

import jax
import jax.numpy as jnp
import numpy as np

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from homm3 import rdzen
from homm3.konfiguracja import PRESETY
from homm3.silnik import zbuduj


# ---------------------------------------------------------------------------
# 1. sprawdzenie samej tablicy stworow
# ---------------------------------------------------------------------------

def sprawdz_pule():
    """Kazda linia tablicy wobec tego, co silnik milcząco zaklada."""
    pula = np.asarray(rdzen.POOL)
    print("=" * 78)
    print("TABLICA STWOROW")
    print("=" * 78)
    print(f"  zrodlo: {rdzen.POOL_ZRODLO}")
    print(f"  linii:  {pula.shape[0]}, kolumn: {pula.shape[1]}")

    reguly = [
        ("zdrowie <= 0",                pula[:, rdzen.P_HP] <= 0),
        ("szybkosc <= 0",               pula[:, rdzen.P_SPD] <= 0),
        ("obrazenia min < 0",           pula[:, rdzen.P_MIN] < 0),
        ("obrazenia max < 0",           pula[:, rdzen.P_MAX] < 0),
        ("obrazenia min > max",         pula[:, rdzen.P_MIN] > pula[:, rdzen.P_MAX]),
        ("obrazenia max == 0",          pula[:, rdzen.P_MAX] == 0),
        ("atak < 0",                    pula[:, rdzen.P_ATK] < 0),
        ("obrona < 0",                  pula[:, rdzen.P_DEF] < 0),
        ("wartosc <= 0",                pula[:, rdzen.P_VAL] <= 0),
    ]

    zle = False
    for opis, maska in reguly:
        n = int(maska.sum())
        if n:
            zle = True
            idx = np.where(maska)[0]
            print(f"  BLAD  {opis}: {n} linii, numery {idx[:12].tolist()}")
            for i in idx[:5]:
                print(f"          linia {i}: hp={pula[i, rdzen.P_HP]:g} "
                      f"spd={pula[i, rdzen.P_SPD]:g} "
                      f"min={pula[i, rdzen.P_MIN]:g} "
                      f"max={pula[i, rdzen.P_MAX]:g} "
                      f"atk={pula[i, rdzen.P_ATK]:g} "
                      f"def={pula[i, rdzen.P_DEF]:g} "
                      f"wartosc={pula[i, rdzen.P_VAL]:g}")
        else:
            print(f"  OK    brak: {opis}")

    # zdolnosci: ktorych nie ma w tablicy ani razu
    print("\n  zdolnosci w tablicy (ile stworow ma ustawiona):")
    for nazwa, kol in (("dwuheksowe", rdzen.P_TWO), ("strzelcy", rdzen.P_SHOOT),
                       ("lataja", rdzen.P_FLY),
                       ("oddech", rdzen.P_BREATH), ("trojglowy", rdzen.P_3HEAD),
                       ("dookolny", rdzen.P_ALLAROUND), ("wyssanie", rdzen.P_DRAIN),
                       ("powrot", rdzen.P_RETURN),
                       ("podwojny_atak", rdzen.P_DBL),
                       ("bez_kontrataku", rdzen.P_NORET),
                       ("bez_kary_zwarcia", rdzen.P_NOMELEE)):
        try:
            n = int((pula[:, kol] > 0).sum())
        except (IndexError, AttributeError):
            print(f"    {nazwa:<18} kolumna nieobecna w tej tablicy")
            continue
        ozn = "   <-- ZERO, kod tej mechaniki nigdy sie nie wykona" if n == 0 else ""
        print(f"    {nazwa:<18} {n:4d}{ozn}")

    print(f"\n  najwyzsza szybkosc w puli: "
          f"{int(pula[:, rdzen.P_SPD].max())}  "
          f"(tyle wystarczy iteracji fali zasiegu)")
    return not zle


# ---------------------------------------------------------------------------
# 2. odtworzenie partii z kontrola po KAZDYM kroku
# ---------------------------------------------------------------------------

def opis_stosu(state, i):
    s = lambda p: int(np.asarray(getattr(state, p))[i])
    return (f"    stos {i:2d}  strona={s('side')}  zywy={bool(np.asarray(state.alive)[i])}\n"
            f"             liczebnosc={s('count')} (poczatkowa={s('count_start')})"
            f"  zycie_czola={s('hp_left')}  max_hp={s('max_hp')}\n"
            f"             atak={s('attack')} obrona={s('defense')}"
            f" obrazenia={s('min_damage')}..{s('max_damage')}"
            f" szybkosc={s('speed')} strzaly={s('shots')}")


def opis_ext(state, i, kfg):
    linie = []
    ext = state.ext
    for nazwa in ("blogoslawienstwo", "przyspieszenie", "morale", "szczescie"):
        tab = getattr(ext, nazwa, None)
        if tab is None:
            continue
        tab = np.asarray(tab)
        if tab.size:
            linie.append(f"{nazwa}={int(tab[i])}")
    return "             " + "  ".join(linie) if linie else ""


def dekoduj(a, kfg):
    a = int(a)
    if a < 1320:
        return f"ruch/atak: heks {a // 8}, kierunek {a % 8}"
    if a == 1320:
        return "czekanie"
    if a == 1321:
        return "obrona"
    s, h = divmod(a - 1322, 165)
    return f"czar {s} na heks {h}"


def odtworz(preset, gier, ziarno, maks_krokow):
    kfg = PRESETY[preset]
    env = zbuduj(kfg)
    init = jax.jit(env.init)
    step = jax.jit(env.step)

    print()
    print("=" * 78)
    print(f"ODTWARZANIE PARTII - preset {preset}, gier {gier}")
    print("=" * 78)

    for g in range(gier):
        key = jax.random.PRNGKey(ziarno + g)
        k0, key = jax.random.split(key)
        state = init(k0)
        poprzedni = state

        for krok in range(maks_krokow):
            mask = np.asarray(state.legal_action_mask)
            if not mask.any():
                break
            key, ka, ks = jax.random.split(key, 3)
            a = int(jax.random.choice(ka, np.where(mask)[0]))
            poprzedni = state
            state = step(state, a, ks)

            cnt = np.asarray(state.count)
            start = np.asarray(state.count_start)
            zle = np.where(cnt > start)[0]
            if zle.size:
                print(f"\n  NARUSZENIE: gra {g}, krok {krok}")
                print(f"  akcja {a} = {dekoduj(a, kfg)}")
                print(f"  stosy z liczebnoscia ponad poczatkowa: {zle.tolist()}")
                print(f"\n  --- PRZED krokiem ---")
                for i in zle:
                    print(opis_stosu(poprzedni, i))
                    e = opis_ext(poprzedni, i, kfg)
                    if e:
                        print(e)
                print(f"\n  --- PO kroku ---")
                for i in zle:
                    print(opis_stosu(state, i))
                    e = opis_ext(state, i, kfg)
                    if e:
                        print(e)

                print(f"\n  ZYCIE RAZEM (count-1)*max_hp + hp_left:")
                for i in zle:
                    for etap, st in (("przed", poprzedni), ("po", state)):
                        c = int(np.asarray(st.count)[i])
                        mh = int(np.asarray(st.max_hp)[i])
                        hl = int(np.asarray(st.hp_left)[i])
                        print(f"    stos {i} {etap:<5} = ({c}-1)*{mh} + {hl}"
                              f" = {(c - 1) * mh + hl}")
                    c0 = int(np.asarray(state.count_start)[i])
                    mh = int(np.asarray(state.max_hp)[i])
                    print(f"    stos {i} pulap = {c0}*{mh} = {c0 * mh}")

                print(f"\n  WNIOSEK")
                for i in zle:
                    przed = ((int(np.asarray(poprzedni.count)[i]) - 1)
                             * int(np.asarray(poprzedni.max_hp)[i])
                             + int(np.asarray(poprzedni.hp_left)[i]))
                    po = ((int(np.asarray(state.count)[i]) - 1)
                          * int(np.asarray(state.max_hp)[i])
                          + int(np.asarray(state.hp_left)[i]))
                    print(f"    stos {i}: zycie {przed} -> {po}"
                          f"  czyli obrazenia = {przed - po}"
                          + ("   UJEMNE - to jest ta dziura"
                             if po > przed else ""))
                return False

        if (g + 1) % 20 == 0:
            print(f"  gier bez naruszenia: {g + 1}")

    print(f"\n  {gier} gier bez naruszenia - przy tym ziarnie sie nie powtarza.")
    print("  Zwieksz --gier albo zmien --ziarno.")
    return True


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--preset", default="wszystko")
    p.add_argument("--gier", type=int, default=200)
    p.add_argument("--ziarno", type=int, default=0)
    p.add_argument("--maks-krokow", type=int, default=400)
    p.add_argument("--tylko-pula", action="store_true",
                   help="sprawdz tablice i wyjdz, bez odtwarzania partii")
    a = p.parse_args()

    pula_ok = sprawdz_pule()
    if a.tylko_pula:
        sys.exit(0 if pula_ok else 1)
    if not pula_ok:
        print("\n  Tablica ma niemozliwe wartosci - to najpewniej zrodlo")
        print("  naruszenia. Odtwarzam partie, zeby to potwierdzic.")

    czyste = odtworz(a.preset, a.gier, a.ziarno, a.maks_krokow)
    sys.exit(0 if (czyste and pula_ok) else 1)


if __name__ == "__main__":
    main()
