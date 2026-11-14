#!/usr/bin/env python3
"""
Wykresy do sekcji o rezydencji L2.

Czyta pliki CSV wyprodukowane przez `ncu --csv` i sklada trzy rysunki:
  fig_l2_sigmoid.pdf   - trafienia w L2 i pasmo DRAM wzgledem zbioru roboczego
  fig_cache_artifact.pdf - porownanie pomiaru z plukaniem pamieci i bez
  fig_throughput_l2.pdf  - przepustowosc zestawiona z trafieniami (jesli sa dane)

Uruchomienie:
    python3 wykresy_l2.py --katalog wyniki/liczniki --wyjscie rysunki/
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

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

BAJTOW_NA_STAN = 10479          # rozmiar wektora stanu [B]
L2_MIB = 72                     # nominalna pojemnosc L2 karty RTX 5000 Ada
SZCZYT_BW = 576.0               # szczytowe pasmo pamieci [GB/s]


def wczytaj_csv(sciezka):
    """Zwraca {nazwa_metryki: [wartosci]} oraz licznik nazw jader."""
    with open(sciezka) as f:
        linie = f.readlines()
    try:
        start = next(i for i, l in enumerate(linie) if l.startswith('"ID"'))
    except StopIteration:
        return None, None
    metryki = collections.defaultdict(list)
    jadra = collections.Counter()
    for wiersz in csv.DictReader(io.StringIO("".join(linie[start:]))):
        try:
            wartosc = float(wiersz["Metric Value"].replace(",", ""))
        except (ValueError, KeyError):
            continue
        metryki[wiersz["Metric Name"]].append(wartosc)
        jadra[wiersz["Kernel Name"]] += 1
    return metryki, jadra


def wczytaj_serie(katalog):
    """Zwraca liste rekordow posortowana po wsadzie."""
    seria = []
    for sciezka in glob.glob(os.path.join(katalog, "ncu_*.csv")):
        dopasowanie = re.search(r"ncu_(\d+)\.csv$", sciezka)
        if not dopasowanie:
            continue
        wsad = int(dopasowanie.group(1))
        metryki, jadra = wczytaj_csv(sciezka)
        if not metryki:
            continue
        srednia = lambda k: st.mean(metryki[k]) if metryki.get(k) else float("nan")
        seria.append({
            "wsad": wsad,
            "zbior_mb": 2 * wsad * BAJTOW_NA_STAN / 1e6,
            "zbior_mib": 2 * wsad * BAJTOW_NA_STAN / 2 ** 20,
            "l2": srednia("lts__t_sector_hit_rate.pct"),
            "l1": srednia("l1tex__t_sector_hit_rate.pct"),
            "dram": srednia("dram__bytes.sum.per_second") / 1e9,
            "czas_us": srednia("gpu__time_duration.sum") / 1000,
            "n": len(metryki.get("lts__t_sector_hit_rate.pct", [])),
            "jadra": sorted(jadra),
        })
    return sorted(seria, key=lambda r: r["wsad"])


def rysunek_sigmoida(seria, wyjscie):
    x = [r["zbior_mb"] for r in seria]
    fig, ax1 = plt.subplots(figsize=(6.0, 3.6))

    ax1.plot(x, [r["l2"] for r in seria], "o-", color="#1f3b73",
             label="L2 hit rate", linewidth=1.8, markersize=4.5)
    ax1.set_xlabel("Working set $2BD$ [MB]")
    ax1.set_ylabel("L2 hit rate [\\%]", color="#1f3b73")
    ax1.tick_params(axis="y", labelcolor="#1f3b73")
    ax1.set_ylim(0, 105)

    ax2 = ax1.twinx()
    ax2.plot(x, [r["dram"] for r in seria], "s--", color="#b3471f",
             label="DRAM throughput", linewidth=1.5, markersize=4)
    ax2.set_ylabel("DRAM throughput [GB/s]", color="#b3471f")
    ax2.tick_params(axis="y", labelcolor="#b3471f")
    ax2.set_ylim(0, SZCZYT_BW * 1.05)
    ax2.axhline(SZCZYT_BW, color="#b3471f", linewidth=0.8, alpha=0.35)

    # pas przejscia: od ostatniego punktu pelnej rezydencji do nasycenia
    pelne = [r for r in seria if r["l2"] > 99.0]
    nasyc = [r for r in seria if r["l2"] < 30.0]
    if pelne and nasyc:
        ax1.axvspan(pelne[-1]["zbior_mb"], nasyc[0]["zbior_mb"],
                    color="0.85", zorder=0)

    ax1.grid(True, linewidth=0.4, alpha=0.5)
    fig.tight_layout()
    fig.savefig(os.path.join(wyjscie, "fig_l2_sigmoid.pdf"))
    plt.close(fig)


def rysunek_artefakt(seria_plukana, seria_bez, wyjscie):
    fig, ax = plt.subplots(figsize=(6.0, 3.2))
    for seria, styl, etykieta, kolor in (
        (seria_bez, "o-", "cache-control none (preserved)", "#1f3b73"),
        (seria_plukana, "s--", "cache-control all (flushed, default)", "#777777"),
    ):
        if not seria:
            continue
        ax.plot([r["zbior_mb"] for r in seria], [r["l2"] for r in seria],
                styl, color=kolor, label=etykieta, linewidth=1.6, markersize=4.5)
    ax.set_xlabel("Working set $2BD$ [MB]")
    ax.set_ylabel("L2 hit rate [\\%]")
    ax.set_ylim(0, 105)
    ax.grid(True, linewidth=0.4, alpha=0.5)
    ax.legend(frameon=False, fontsize=8)
    fig.tight_layout()
    fig.savefig(os.path.join(wyjscie, "fig_cache_artifact.pdf"))
    plt.close(fig)


def wczytaj_przepustowosc(sciezka):
    """
    Wyciaga pary (wsad, kroki/s) z pliku wynikowego benchmarku.
    Format bywa rozny - jesli sie nie uda, wypisuje klucze i zwraca None,
    zebys mogl dopisac odpowiednie pole.
    """
    if not sciezka:
        return None
    if not os.path.exists(sciezka):
        print(f"  [uwaga] nie ma pliku {sciezka}")
        return None
    with open(sciezka) as f:
        dane = json.load(f)
    kroki = dane.get("steps") or dane.get("env_stats") or []
    pary = []
    for wpis in kroki:
        if not isinstance(wpis, dict):
            continue
        wsad = wpis.get("batch") or wpis.get("wsad") or wpis.get("B")
        tput = (wpis.get("steps_per_s") or wpis.get("kroki_s")
                or wpis.get("throughput") or wpis.get("sps"))
        if wsad and tput:
            pary.append((int(wsad), float(tput)))
    if not pary:
        print("  [uwaga] nie rozpoznano formatu przepustowosci.")
        print("  klucze najwyzszego poziomu:", list(dane))
        if isinstance(kroki, list) and kroki and isinstance(kroki[0], dict):
            print("  klucze pojedynczego pomiaru:", list(kroki[0]))
        return None
    return sorted(pary)


def rysunek_zestawienie(seria, przepustowosc, wyjscie):
    if not przepustowosc:
        return
    fig, ax1 = plt.subplots(figsize=(6.0, 3.6))
    ax1.plot([b for b, _ in przepustowosc], [t / 1000 for _, t in przepustowosc],
             "^-", color="#1b6b3a", linewidth=1.8, markersize=4.5)
    ax1.set_xlabel("Batch size $B$")
    ax1.set_ylabel("Throughput [$10^3$ steps/s]", color="#1b6b3a")
    ax1.tick_params(axis="y", labelcolor="#1b6b3a")

    ax2 = ax1.twinx()
    ax2.plot([r["wsad"] for r in seria], [r["l2"] for r in seria],
             "o--", color="#1f3b73", linewidth=1.5, markersize=4)
    ax2.set_ylabel("L2 hit rate [\\%]", color="#1f3b73")
    ax2.tick_params(axis="y", labelcolor="#1f3b73")
    ax2.set_ylim(0, 105)

    pelne = [r for r in seria if r["l2"] > 99.0]
    nasyc = [r for r in seria if r["l2"] < 30.0]
    if pelne and nasyc:
        ax1.axvspan(pelne[-1]["wsad"], nasyc[0]["wsad"], color="0.85", zorder=0)

    ax1.grid(True, linewidth=0.4, alpha=0.5)
    fig.tight_layout()
    fig.savefig(os.path.join(wyjscie, "fig_throughput_l2.pdf"))
    plt.close(fig)


def tabela_latex(seria):
    wiersze = []
    for r in seria:
        wiersze.append(
            f"    {r['wsad']} & {r['zbior_mb']:.1f} & {r['l2']:.2f} & "
            f"{r['dram']:.1f} & {100 * r['dram'] / SZCZYT_BW:.1f} \\\\"
        )
    return "\n".join(wiersze)


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--katalog", default="wyniki/liczniki",
                   help="katalog z podkatalogami liczniki_s, liczniki, liczniki_nc")
    p.add_argument("--przepustowosc", default=None,
                   help="plik JSON z krzywa przepustowosci (opcjonalnie)")
    p.add_argument("--wyjscie", default="rysunki")
    args = p.parse_args()

    os.makedirs(args.wyjscie, exist_ok=True)
    plt.rcParams.update({
        "font.size": 9, "axes.labelsize": 9, "legend.fontsize": 8,
        "xtick.labelsize": 8, "ytick.labelsize": 8,
        "text.usetex": False, "pdf.fonttype": 42,
    })

    glowna = wczytaj_serie(os.path.join(args.katalog, "liczniki_s"))
    plukana = wczytaj_serie(os.path.join(args.katalog, "liczniki"))
    bez = wczytaj_serie(os.path.join(args.katalog, "liczniki_nc"))

    if not glowna:
        print("Brak danych w liczniki_s/ - sprawdz sciezke --katalog.")
        return

    print(f"{'wsad':>6}{'zbior[MB]':>11}{'L2 hit%':>9}{'DRAM':>9}{'n':>5}  jadra")
    for r in glowna:
        print(f"{r['wsad']:6d}{r['zbior_mb']:11.1f}{r['l2']:9.2f}"
              f"{r['dram']:9.1f}{r['n']:5d}  {', '.join(r['jadra'])}")

    rysunek_sigmoida(glowna, args.wyjscie)
    if plukana:
        rysunek_artefakt(plukana, bez or glowna, args.wyjscie)
    rysunek_zestawienie(glowna, wczytaj_przepustowosc(args.przepustowosc),
                        args.wyjscie)

    # punkt polowiczny i regula projektowa
    ponizej = [r for r in glowna if r["l2"] < 50]
    powyzej = [r for r in glowna if r["l2"] >= 50]
    if ponizej and powyzej:
        a, b = powyzej[-1], ponizej[0]
        frakcja = (a["l2"] - 50) / (a["l2"] - b["l2"])
        wsad_50 = a["wsad"] + frakcja * (b["wsad"] - a["wsad"])
        print(f"\npunkt 50% trafien: wsad {wsad_50:.0f}, "
              f"zbior {2 * wsad_50 * BAJTOW_NA_STAN / 2 ** 20:.1f} MiB "
              f"({100 * 2 * wsad_50 * BAJTOW_NA_STAN / 2 ** 20 / L2_MIB:.0f}% L2)")
    kolano = [r for r in glowna if r["l2"] > 99.0]
    if kolano:
        k = kolano[-1]
        print(f"kolano (pelna rezydencja): wsad {k['wsad']}, "
              f"zbior {k['zbior_mib']:.1f} MiB "
              f"({100 * k['zbior_mib'] / L2_MIB:.0f}% L2)")

    print("\n--- wiersze tabeli do LaTeX-a ---")
    print(tabela_latex(glowna))
    print(f"\nRysunki zapisane w {args.wyjscie}/")


if __name__ == "__main__":
    main()