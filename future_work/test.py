#!/usr/bin/env python3
"""
Diagnostyka tablicy statystyk stworow.

Sprawdza dwie rzeczy:
  1. ktore jednostki maja poszczegolne zdolnosci wedlug pliku .npy,
  2. czy zgadza sie to z plikiem CSV, z ktorego tablica powstala.

Rozbieznosc oznacza przesuniecie kolumn przy generowaniu tablicy - blad
powazny, bo wszystkie flagi zdolnosci sa wtedy przypisane niewlasciwym
stworom.

UZYCIE
    python3 diag_lut.py
    python3 diag_lut.py --lut ../homm3_static_lut.npy --csv ../creatures.csv
"""

import argparse
import csv
import os
import sys

import numpy as np


# Kolejnosc pol musi odpowiadac enumowi Stat z silnika.
STAT_NAMES = [
    "ATTACK", "DEFENSE", "MIN_DMG", "MAX_DMG", "HP", "SPEED", "AI_VALUE",
    "IS_FLYER", "IS_SHOOTER", "IS_TWO_HEX", "NO_RETALIATION", "IS_UNDEAD",
    "IS_SPELLCASTER", "SPELL_ID", "BREATH_ATTACK", "DOUBLE_ATTACK",
    "SPELL_RESIST", "SHOTS", "THREE_HEADED", "ALL_AROUND", "LIFE_DRAIN",
    "RETURN_AFTER_STRIKE", "NO_MELEE_PENALTY", "RETALIATIONS", "HAS_UNKNOWN",
]
STAT = {n: i for i, n in enumerate(STAT_NAMES)}

# Zdolnosci, ktorych pokrycie sprawdza smoke test silnika.
BADANE = ["BREATH_ATTACK", "THREE_HEADED", "ALL_AROUND", "LIFE_DRAIN",
          "RETURN_AFTER_STRIKE", "NO_RETALIATION", "DOUBLE_ATTACK",
          "NO_MELEE_PENALTY", "IS_TWO_HEX", "IS_FLYER", "IS_SHOOTER"]

# Jednostki, o ktorych wiadomo, ze powinny miec dana zdolnosc.
# Sluza za punkt kontrolny mapowania kolumn.
KONTROLA = {
    "THREE_HEADED": ["Cerberus"],
    "ALL_AROUND": ["Hydra", "Chaos Hydra"],
    "LIFE_DRAIN": ["Vampire", "Vampire Lord"],
    "NO_RETALIATION": ["Vampire", "Devil", "Arch Devil", "Cerberus"],
    "BREATH_ATTACK": ["Dragon", "Hydra"],       # dopasowanie po fragmencie
    "RETURN_AFTER_STRIKE": ["Harpy"],
}


def wczytaj_csv(path):
    """Zwraca (naglowek, wiersze) - wiersze jako listy stringow."""
    with open(path, newline="", encoding="utf-8") as f:
        r = list(csv.reader(f))
    return r[0], r[1:]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--lut", default="homm3_static_lut.npy")
    ap.add_argument("--csv", default=None,
                    help="plik zrodlowy; bez niego pomijana jest weryfikacja "
                         "mapowania kolumn")
    ap.add_argument("--vmin", type=float, default=60.0)
    ap.add_argument("--vmax", type=float, default=700.0)
    args = ap.parse_args()

    if not os.path.exists(args.lut):
        sys.exit(f"brak pliku {args.lut}")

    lut = np.load(args.lut)
    print(f"Tablica: {args.lut}   ksztalt {lut.shape}")
    if lut.shape[1] != len(STAT_NAMES):
        print(f"  !! tablica ma {lut.shape[1]} kolumn, enum Stat definiuje "
              f"{len(STAT_NAMES)} - mapowanie na pewno sie rozjezdza")

    # ------------------------------------------------------------------
    # nazwy jednostek: z CSV albo zastepcze
    naglowek, wiersze = (None, None)
    nazwy = [f"#{i}" for i in range(lut.shape[0])]
    if args.csv and os.path.exists(args.csv):
        naglowek, wiersze = wczytaj_csv(args.csv)
        if len(wiersze) == lut.shape[0]:
            kol_nazwa = naglowek.index("name") if "name" in naglowek else 1
            nazwy = [w[kol_nazwa] for w in wiersze]
        else:
            print(f"  !! CSV ma {len(wiersze)} wierszy, tablica "
                  f"{lut.shape[0]} - nazwy moga nie odpowiadac wierszom")

    # ------------------------------------------------------------------
    print("\n" + "=" * 74)
    print("ZDOLNOSCI WEDLUG TABLICY")
    print("=" * 74)
    for nazwa in BADANE:
        idx = STAT[nazwa]
        maska = lut[:, idx] > 0
        n = int(maska.sum())
        print(f"\n{nazwa}  ({n} jednostek)")
        if n == 0:
            print("    (brak)")
            continue
        for i in np.where(maska)[0][:12]:
            print(f"    {nazwy[i]:<22} ai_value {lut[i, STAT['AI_VALUE']]:>7.0f}")
        if n > 12:
            print(f"    ... i {n - 12} dalszych")

    # ------------------------------------------------------------------
    print("\n" + "=" * 74)
    print("KONTROLA MAPOWANIA KOLUMN")
    print("=" * 74)
    print("Sprawdzenie, czy znane jednostki maja przypisane wlasciwe flagi.\n")

    bledy = 0
    for nazwa, oczekiwane in KONTROLA.items():
        idx = STAT[nazwa]
        for wzorzec in oczekiwane:
            trafienia = [i for i, n in enumerate(nazwy) if wzorzec in n]
            if not trafienia:
                print(f"  [?] {nazwa:<20} {wzorzec:<16} "
                      f"nie znaleziono jednostki")
                continue
            for i in trafienia:
                ma = lut[i, idx] > 0
                znak = "OK " if ma else "!! "
                if not ma:
                    bledy += 1
                print(f"  [{znak}] {nazwa:<20} {nazwy[i]:<16} "
                      f"{'ma' if ma else 'NIE MA'} tej flagi")

    if bledy:
        print(f"\n  {bledy} niezgodnosci -- kolumny sa najprawdopodobniej "
              f"przesuniete wzgledem enumu Stat.")
    else:
        print("\n  Mapowanie kolumn zgodne z oczekiwaniami.")

    # ------------------------------------------------------------------
    if naglowek:
        print("\n" + "=" * 74)
        print("POROWNANIE NAGLOWKA CSV Z ENUMEM Stat")
        print("=" * 74)
        # naglowek CSV zawiera na poczatku unit_id i name
        csv_pola = [h.upper() for h in naglowek[2:]]
        print(f"{'poz.':>4}  {'enum Stat':<22} {'kolumna CSV':<22} zgodnosc")
        print("-" * 74)
        for i, nazwa in enumerate(STAT_NAMES):
            csv_nazwa = csv_pola[i] if i < len(csv_pola) else "(brak)"
            zgoda = "tak" if csv_nazwa == nazwa else "NIE"
            print(f"{i:>4}  {nazwa:<22} {csv_nazwa:<22} {zgoda}")
        print("\nJesli kolumny nie odpowiadaja sobie pozycyjnie, generator")
        print("tablicy zapisywal je w kolejnosci CSV, a silnik czyta je")
        print("w kolejnosci enumu Stat.")

    # ------------------------------------------------------------------
    print("\n" + "=" * 74)
    print(f"WPLYW FILTRA WARTOSCI  ai_value w [{args.vmin:.0f}, {args.vmax:.0f}]")
    print("=" * 74)
    v = lut[:, STAT["AI_VALUE"]]
    w_zakresie = (lut[:, STAT["HP"]] > 0) & (v >= args.vmin) & (v <= args.vmax)
    print(f"Pula po filtrze: {int(w_zakresie.sum())} z {lut.shape[0]} jednostek\n")
    print(f"{'zdolnosc':<22} {'w tablicy':>10} {'po filtrze':>11}   odrzucone")
    print("-" * 74)
    for nazwa in BADANE:
        idx = STAT[nazwa]
        maska = lut[:, idx] > 0
        po = int((maska & w_zakresie).sum())
        przed = int(maska.sum())
        odrzucone = ""
        if przed and not po:
            kto = [f"{nazwy[i]} ({v[i]:.0f})" for i in np.where(maska)[0][:3]]
            odrzucone = "  <- " + ", ".join(kto)
        print(f"{nazwa:<22} {przed:>10} {po:>11}{odrzucone}")

    print("\nZdolnosc obecna w tablicy, lecz nieobecna po filtrze, nie zostanie")
    print("nigdy aktywowana w symulacji ani przetestowana w smoke tescie.")


if __name__ == "__main__":
    main()