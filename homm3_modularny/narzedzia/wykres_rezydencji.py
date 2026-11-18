#!/usr/bin/env python3
"""
Wykresy do eksperymentu o rezydencji w pamieci podrecznej.

Sklada trzy rysunki i jedna tabele:

  fig_rezydencja_wsad.pdf   trafienia w L2 wobec WSADU, osobna krzywa na kazdy
                            rozmiar stanu. Jesli regula projektowa dziala,
                            krzywe sa przesuniete wzgledem siebie.
  fig_rezydencja_zbior.pdf  te same dane wobec ZBIORU ROBOCZEGO 2BD. Jesli
                            regula dziala, krzywe NAKLADAJA SIE na jedna.
                            To jest wlasciwy test: ten sam zbior roboczy ma
                            dawac to samo zachowanie, niezaleznie od tego, czy
                            wziol sie z duzego wsadu, czy z duzego stanu.
  fig_prog_a_model.pdf      prog zmierzony wobec progu z reguly B_opt=C_eff/2D.

Czyta pliki z ncu w ukladzie, ktory zostawia uruchom/04_liczniki_l2.sh:

    wyniki/liczniki_k0/ncu_512.csv
    wyniki/liczniki_k9/ncu_512.csv
    ...
    wyniki/rozmiary_stanu.json

Uruchomienie:
    python3 narzedzia/wykres_rezydencji.py --katalog wyniki --wyjscie rysunki
"""

import argparse
import collections
import csv
import glob
import io
import json
import os
import re
import statistics as st
import sys

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt                              # noqa: E402

L2_MIB = 72.0            # nominalna pojemnosc L2 karty RTX 5000 Ada
SZCZYT_BW = 576.0        # szczytowe pasmo pamieci [GB/s]
UDZIAL_UZYTECZNY = 0.57  # C_eff / C_L2, zmierzone

KOLORY = ["#1f3b73", "#b3471f", "#1b6b3a", "#6b1b5a", "#7a6a1b"]
ZNAKI = ["o", "s", "^", "D", "v"]


def wczytaj_csv(sciezka):
    with open(sciezka) as f:
        linie = f.readlines()
    try:
        start = next(i for i, l in enumerate(linie) if l.startswith('"ID"'))
    except StopIteration:
        return None, None
    metryki = collections.defaultdict(list)
    jadra = collections.Counter()
    for w in csv.DictReader(io.StringIO("".join(linie[start:]))):
        try:
            v = float(w["Metric Value"].replace(",", ""))
        except (ValueError, KeyError):
            continue
        metryki[w["Metric Name"]].append(v)
        jadra[w["Kernel Name"]] += 1
    return metryki, jadra


def wczytaj_serie(katalog, D):
    seria = []
    for sciezka in glob.glob(os.path.join(katalog, "ncu_*.csv")):
        m = re.search(r"ncu_(\d+)\.csv$", sciezka)
        if not m:
            continue
        B = int(m.group(1))
        metryki, jadra = wczytaj_csv(sciezka)
        if not metryki:
            continue

        def srednia(k):
            return st.mean(metryki[k]) if metryki.get(k) else float("nan")

        seria.append({
            "wsad": B,
            "D": D,
            "zbior_mb": 2 * B * D / 1e6,
            "zbior_mib": 2 * B * D / 2 ** 20,
            "l2": srednia("lts__t_sector_hit_rate.pct"),
            "l1": srednia("l1tex__t_sector_hit_rate.pct"),
            "dram": srednia("dram__bytes.sum.per_second") / 1e9,
            "czas_us": srednia("gpu__time_duration.sum") / 1000,
            "n": len(metryki.get("lts__t_sector_hit_rate.pct", [])),
            "jadra": sorted(jadra),
        })
    return sorted(seria, key=lambda r: r["wsad"])


def polowiczny(seria, klucz="wsad"):
    """Punkt, w ktorym trafienia spadaja do 50 procent (interpolacja liniowa)."""
    ponizej = [r for r in seria if r["l2"] < 50]
    powyzej = [r for r in seria if r["l2"] >= 50]
    if not (ponizej and powyzej):
        return None
    a, b = powyzej[-1], ponizej[0]
    if a["l2"] == b["l2"]:
        return a[klucz]
    f = (a["l2"] - 50) / (a["l2"] - b["l2"])
    return a[klucz] + f * (b[klucz] - a[klucz])


def kolano(seria, klucz="wsad", prog=99.0):
    """Ostatni punkt pelnej rezydencji."""
    pelne = [r for r in seria if r["l2"] > prog]
    return pelne[-1][klucz] if pelne else None


def rysuj(serie, wyjscie, os_x, plik, etykieta_x):
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(6.0, 5.4), sharex=True)
    for i, (opis, seria) in enumerate(serie):
        if not seria:
            continue
        kol, zn = KOLORY[i % len(KOLORY)], ZNAKI[i % len(ZNAKI)]
        ax1.plot([r[os_x] for r in seria], [r["l2"] for r in seria],
                 zn + "-", color=kol, label=opis, linewidth=1.7,
                 markersize=4.2)
        ax2.plot([r[os_x] for r in seria], [r["dram"] for r in seria],
                 zn + "--", color=kol, linewidth=1.4, markersize=3.8)
    ax1.set_ylabel("L2 hit rate [\\%]")
    ax1.set_ylim(0, 105)
    ax1.grid(True, linewidth=0.4, alpha=0.5)
    ax1.legend(frameon=False, fontsize=8)
    ax2.set_ylabel("DRAM throughput [GB/s]")
    ax2.set_xlabel(etykieta_x)
    ax2.set_ylim(0, SZCZYT_BW * 1.05)
    ax2.axhline(SZCZYT_BW, color="0.5", linewidth=0.8, alpha=0.5)
    ax2.grid(True, linewidth=0.4, alpha=0.5)
    fig.tight_layout()
    fig.savefig(os.path.join(wyjscie, plik))
    plt.close(fig)


def rysuj_prog(punkty, wyjscie):
    if len(punkty) < 2:
        return
    fig, ax = plt.subplots(figsize=(5.4, 3.4))
    D = [p["D"] / 1000 for p in punkty]
    ax.plot(D, [p["B_model"] for p in punkty], "k--", linewidth=1.3,
            label="$B_{\\mathrm{opt}} = C_{\\mathrm{eff}}/2D$")
    zm = [p for p in punkty if p.get("B_polowiczny")]
    if zm:
        ax.plot([p["D"] / 1000 for p in zm],
                [p["B_polowiczny"] for p in zm], "o-", color=KOLORY[0],
                linewidth=1.6, markersize=5, label="punkt 50\\% trafien")
    kl = [p for p in punkty if p.get("B_kolano")]
    if kl:
        ax.plot([p["D"] / 1000 for p in kl], [p["B_kolano"] for p in kl],
                "s-", color=KOLORY[1], linewidth=1.6, markersize=5,
                label="ostatni punkt pelnej rezydencji")
    ax.set_xlabel("State size $D$ [kB]")
    ax.set_ylabel("Batch size $B$")
    ax.grid(True, linewidth=0.4, alpha=0.5)
    ax.legend(frameon=False, fontsize=8)
    fig.tight_layout()
    fig.savefig(os.path.join(wyjscie, "fig_prog_a_model.pdf"))
    plt.close(fig)


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--katalog", default="wyniki")
    p.add_argument("--rozmiary", default=None,
                   help="JSON z eksperymenty.py stan --json")
    p.add_argument("--wyjscie", default="rysunki")
    args = p.parse_args()
    os.makedirs(args.wyjscie, exist_ok=True)
    plt.rcParams.update({
        "font.size": 9, "axes.labelsize": 9, "legend.fontsize": 8,
        "xtick.labelsize": 8, "ytick.labelsize": 8,
        "text.usetex": False, "pdf.fonttype": 42,
    })

    # rozmiary stanu: z pliku, a jesli go nie ma, z arytmetyki kanalow
    rozmiary = {}
    if args.rozmiary and os.path.exists(args.rozmiary):
        for w in json.load(open(args.rozmiary)):
            rozmiary[int(w["kanalow_dodanych"])] = int(w["D"])
    katalogi = sorted(glob.glob(os.path.join(args.katalog, "liczniki_k*")),
                      key=lambda s: int(re.search(r"k(\d+)$", s).group(1)))
    if not katalogi:
        print(f"Nie ma katalogow liczniki_k* w {args.katalog}/.")
        return 1

    serie, punkty = [], []
    D0 = None
    for kat in katalogi:
        k = int(re.search(r"k(\d+)$", kat).group(1))
        if k in rozmiary:
            D = rozmiary[k]
        else:
            if D0 is None:
                print(f"Brak rozmiaru stanu dla k={k}. Podaj --rozmiary "
                      f"(plik z 'eksperymenty.py stan --json').")
                return 1
            D = D0 + k * 165 * 4
        if k == 0:
            D0 = D
        seria = wczytaj_serie(kat, D)
        if not seria:
            print(f"  [uwaga] {kat}: brak danych")
            continue
        wzgl = D / (D0 or D)
        serie.append((f"$D$ = {D:,} B  ($\\times${wzgl:.2f})".replace(",", " "),
                      seria))
        punkty.append({
            "kanalow": k, "D": D, "D_wzgl": wzgl,
            "B_polowiczny": polowiczny(seria, "wsad"),
            "B_kolano": kolano(seria, "wsad"),
            "zbior_polowiczny_mib": polowiczny(seria, "zbior_mib"),
            "zbior_kolano_mib": kolano(seria, "zbior_mib"),
            "B_model": UDZIAL_UZYTECZNY * L2_MIB * 2 ** 20 / (2 * D),
        })

    if not serie:
        return 1

    rysuj(serie, args.wyjscie, "wsad", "fig_rezydencja_wsad.pdf",
          "Batch size $B$")
    rysuj(serie, args.wyjscie, "zbior_mb", "fig_rezydencja_zbior.pdf",
          "Working set $2BD$ [MB]")
    rysuj_prog(punkty, args.wyjscie)

    # --- wydruk tekstowy ---
    print(f"\n{'kanalow':>8}{'D [B]':>10}{'D/D0':>7}"
          f"{'B 50%':>9}{'B kolano':>10}{'B z reguly':>12}"
          f"{'zbior 50% [MiB]':>17}{'% L2':>7}")
    print("-" * 80)
    for p in punkty:
        def f(v, fmt=".0f"):
            return "-" if v is None else format(v, fmt)
        udzial = ("-" if p["zbior_polowiczny_mib"] is None
                  else f"{100 * p['zbior_polowiczny_mib'] / L2_MIB:.0f}")
        print(f"{p['kanalow']:>8}{p['D']:>10,}{p['D_wzgl']:>7.2f}"
              f"{f(p['B_polowiczny']):>9}{f(p['B_kolano']):>10}"
              f"{p['B_model']:>12.0f}"
              f"{f(p['zbior_polowiczny_mib'], '.1f'):>17}{udzial:>7}")

    print("\nCZYTANIE WYNIKU")
    print("  Kolumna 'B 50%' ma malec tak jak 'B z reguly'. Jesli stoi")
    print("  w miejscu, dodany stan nie trafil do mierzonego jadra i")
    print("  eksperyment jest niewykonany, a nie negatywny.")
    print("  Kolumna 'zbior 50% [MiB]' ma byc STALA - ten sam zbior roboczy")
    print("  ma dawac to samo zachowanie niezaleznie od tego, skad sie wzial.")

    # --- wiersze tabeli do LaTeX-a ---
    print("\n--- wiersze tabeli do LaTeX-a (sekcja o L2) ---")
    for opis, seria in serie:
        print(f"% {opis}")
        for r in seria:
            print(f"    {r['wsad']} & {r['D']} & {r['zbior_mib']:.1f} & "
                  f"{r['l2']:.2f} & {r['dram']:.1f} & "
                  f"{100 * r['dram'] / SZCZYT_BW:.1f} \\\\")

    json.dump({"punkty": punkty,
               "serie": [{"opis": o, "dane": s} for o, s in serie]},
              open(os.path.join(args.katalog, "rezydencja.json"), "w"),
              indent=2, ensure_ascii=False)
    print(f"\nRysunki w {args.wyjscie}/, dane w "
          f"{args.katalog}/rezydencja.json")
    return 0


if __name__ == "__main__":
    sys.exit(main())
