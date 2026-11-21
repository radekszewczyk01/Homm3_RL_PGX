#!/usr/bin/env python3
"""
Co faktycznie nie miesci sie w pamieci podrecznej.

PO CO TO JEST
-------------
Praca podaje regule projektowa B_opt = C_eff / (2D), opartej na zalozeniu, ze
wielkoscia rezydentna jest zbior roboczy 2BD: stan czytany plus stan pisany.
Skan z trzema rozmiarami stanu tego NIE potwierdzil - prog zalamania stanal
w miejscu przy B okolo 2480 dla D rosnacego od 11 827 do 23 707 bajtow.

W tych samych danych jest dowod, ze zalozenie jest falszywe: przy
D = 23 707 i wsadzie 1792 trafienia w L2 wynosza 100 procent, a 2BD to 81 MiB
przy pamieci L2 o rozmiarze 72 MiB. Gdyby 2BD bylo rezydentne, nie mieściloby
sie i trafienia musialyby spasc.

Ten skrypt wyznacza, ile bajtow jadro FAKTYCZNIE przenosi. Za progiem, gdy nic
sie nie cachuje, ruch do DRAM jest rowny sladowi pamieciowemu jadra:

    bajty = pasmo_DRAM [B/s] * czas_jadra [s]

Dzielac to przez wsad, dostajemy slad na jedno srodowisko - czyli wlasciwy
odpowiednik 2D w regule. Jesli wychodzi stale, niezaleznie od wypelnienia,
to regula wymaga poprawki: w mianowniku ma byc slad mierzonego jadra, a nie
rozmiar calego stanu.

UZYCIE
------
    python3 narzedzia/analiza_progu.py                      # wyniki/rezydencja.json
    python3 narzedzia/analiza_progu.py --plik inny.json
"""

import argparse
import json
import sys

L2_MIB = 72.0


def bajty_jadra(punkt):
    """Bajty przeniesione przez jadro w jednym wywolaniu.

    `dram` jest w GB/s, `czas_us` w mikrosekundach - oba sa srednimi po
    wywolaniach, wiec iloczyn dotyczy jednego wywolania.
    """
    return punkt["dram"] * 1e9 * punkt["czas_us"] * 1e-6


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--plik", default="wyniki/rezydencja.json")
    p.add_argument("--prog-nasycenia", type=float, default=30.0,
                   dest="prog_nasycenia",
                   help="trafienia w L2 ponizej tej wartosci traktujemy jako "
                        "pelne nasycenie, czyli brak cachowania")
    args = p.parse_args()

    try:
        dane = json.load(open(args.plik))
    except (OSError, json.JSONDecodeError) as e:
        print(f"Nie moge wczytac {args.plik}: {e}")
        print("Najpierw policz wykresy: narzedzia/wykres_rezydencji.py")
        return 1

    serie = dane.get("serie") or []
    punkty = dane.get("punkty") or []
    if not serie:
        print("Brak serii w pliku.")
        return 1

    print("=" * 78)
    print(" SLAD PAMIECIOWY MIERZONEGO JADRA (z ruchu do DRAM za progiem)")
    print("=" * 78)
    print()
    print(f"{'D [B]':>8} {'2D [B]':>9} {'slad/srod.':>11} {'slad/2D':>8}"
          f" {'punktow':>8}  wsady za progiem")
    print("-" * 78)

    wyniki = []
    for wpis in serie:
        dane_serii = wpis["dane"]
        if not dane_serii:
            continue
        D = dane_serii[0]["D"]
        nasycone = [r for r in dane_serii
                    if r["l2"] < args.prog_nasycenia and r["dram"] > 1]
        if not nasycone:
            print(f"{D:>8,} {2 * D:>9,} {'brak punktow za progiem':>30}")
            continue
        slady = [bajty_jadra(r) / r["wsad"] for r in nasycone]
        slad = sum(slady) / len(slady)
        rozrzut = (max(slady) - min(slady)) / slad * 100
        wyniki.append({"D": D, "slad": slad, "rozrzut_pct": rozrzut})
        print(f"{D:>8,} {2 * D:>9,} {slad:>11,.0f} {slad / (2 * D):>8.3f}"
              f" {len(nasycone):>8}  "
              f"{', '.join(str(r['wsad']) for r in nasycone)}")
        if rozrzut > 15:
            print(f"{'':>8} (rozrzut miedzy punktami {rozrzut:.0f}% - "
                  f"traktuj te liczbe ostroznie)")

    if len(wyniki) < 2:
        print("\nZa malo serii, zeby cokolwiek porownac.")
        return 0

    print()
    print("=" * 78)
    baza = wyniki[0]
    print(" CO Z TEGO WYNIKA")
    print("=" * 78)
    print()
    print(f" Slad jadra na jedno srodowisko:")
    for w in wyniki:
        print(f"   D = {w['D']:>6,} B  ({w['D'] / baza['D']:.2f}x)   "
              f"slad {w['slad']:>8,.0f} B  "
              f"({w['slad'] / baza['slad']:.2f}x)")
    print()

    rozjazd = max(w["slad"] for w in wyniki) / min(w["slad"] for w in wyniki)
    rozjazd_D = max(w["D"] for w in wyniki) / min(w["D"] for w in wyniki)

    if rozjazd < 1.15:
        print(f" Slad jest STALY ({rozjazd:.2f}x) mimo {rozjazd_D:.2f}x roznicy")
        print(f" w rozmiarze stanu. Czyli dosypane kanaly obserwacji NIE sa")
        print(f" czytane ani pisane przez to jadro, i dlatego prog sie nie")
        print(f" przesunal. To nie jest wynik negatywny dla reguly - to")
        print(f" wskazanie, ze w jej mianowniku powinien byc slad jadra,")
        print(f" a nie rozmiar calego stanu.")
        print()
        print(f" Poprawiona postac reguly:   B_opt = C_eff / slad_jadra")
        for w in wyniki[:1]:
            for udzial in (1.0, 0.57):
                c = udzial * L2_MIB * 2 ** 20
                print(f"   przy C_eff = {udzial:.2f} x {L2_MIB:.0f} MiB  ->  "
                      f"B_opt = {c / w['slad']:>6.0f}")
        prog = [p for p in punkty if p.get("B_polowiczny")]
        if prog:
            zm = sum(p["B_polowiczny"] for p in prog) / len(prog)
            print(f"   zmierzony prog (srednia z serii):      {zm:>6.0f}")
            print()
            print(f"   udzial uzyteczny wynikajacy z pomiaru: "
                  f"{zm * baza['slad'] / (L2_MIB * 2 ** 20):.2f} "
                  f"pojemnosci nominalnej")
    elif abs(rozjazd - rozjazd_D) / rozjazd_D < 0.2:
        print(f" Slad rosnie tak jak stan ({rozjazd:.2f}x wobec "
              f"{rozjazd_D:.2f}x), czyli jadro faktycznie czyta caly stan.")
        print(f" Wtedy stale prog w pomiarze oznacza, ze ogranicza nas co")
        print(f" innego niz rezydencja - i trzeba szukac dalej.")
    else:
        print(f" Slad rosnie {rozjazd:.2f}x przy {rozjazd_D:.2f}x wzrostu stanu,")
        print(f" czyli czesciowo. Jadro czyta czesc dosypanych danych.")
        print(f" Zadnej z dwoch prostych interpretacji nie da sie przyjac.")

    print()
    print(" UWAGA: to jest slad JEDNEGO jadra, tego, ktore dominuje w czasie.")
    print(" Caly krok to kilkaset jader i ich sumaryczny ruch jest wiekszy.")
    print(" Regula projektowa dotyczy jednak tego jadra, bo ono wyznacza prog.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
