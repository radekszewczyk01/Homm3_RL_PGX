#!/usr/bin/env python3
"""
Analiza przebiegow treningowych do rozdzialu 8.

Czyta runs/*/historia.json (format wersja 2) i wytwarza:
    pomiary_rozdzial8.csv      wszystkie punkty kontrolne w jednej tabeli
    tabela_koncowa.tex         tabela wynikow koncowych (srednia, odchylenie,
                               przedzial Wilsona) gotowa do wklejenia
    krzywe_decyzje.pdf         wskaznik zwyciestw wzgledem liczby decyzji
    krzywe_start.pdf           powiekszenie pierwszych 150 tys. decyzji
    krzywe_korzen.pdf          liczba akcji w wezle glownym (degeneracja)
    dlugosc_partii.pdf         srednia liczba decyzji na partie

Uzycie:
    python3 analiza8.py                 # katalog runs/, wyniki do analiza/
    python3 analiza8.py --katalog runs --wyjscie analiza
"""

import argparse
import csv
import glob
import json
import math
import os

import numpy as np

try:
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    MA_WYKRESY = True
except ImportError:                                    # pragma: no cover
    MA_WYKRESY = False

# kolejnosc i opisy konfiguracji na wykresach i w tabeli
PORZADEK = [
    ("gumbel-m64",     "Gumbel, $m=64$"),
    ("gumbel-m16",     "Gumbel, $m=16$"),
    ("gumbel-m16-bez", "Gumbel, $m=16$, bez ksztaltowania"),
    ("puct-strojony",  "PUCT, $c=20$"),
    ("puct-domyslny",  "PUCT, $c=1{,}25$"),
]
KOLORY = {
    "gumbel-m64":     "#1b6ca8",
    "gumbel-m16":     "#4fa3d1",
    "gumbel-m16-bez": "#7fb069",
    "puct-strojony":  "#d98b2b",
    "puct-domyslny":  "#b3423f",
}

POLA = ["konfiguracja", "ziarno", "iteracja", "czas_s", "decyzje", "partie",
        "kroki_gradientu", "strata", "strata_polityki", "strata_wartosci",
        "akcje_w_korzeniu", "dec_na_s", "wskaznik_zwyciestw",
        "partii_rozegranych", "partii_nieskonczonych", "par_rozstrzygnietych"]


# ---------------------------------------------------------------------------
# wczytywanie
# ---------------------------------------------------------------------------

def wczytaj(katalog):
    """Zwraca slownik {konfiguracja: {ziarno: lista punktow}}."""
    dane = {}
    for sciezka in sorted(glob.glob(os.path.join(katalog, "*", "historia.json"))):
        with open(sciezka) as f:
            d = json.load(f)
        cfg = d.get("konfiguracja", {})
        tag = cfg.get("tag", "?")
        if tag == "pilot":
            continue
        if d.get("wersja") != 2:
            print(f"  POMIJAM {sciezka}: brak znacznika wersja=2 "
                  f"(przebieg sprzed poprawki)")
            continue
        if not cfg.get("ksztaltowanie", True):
            tag += "-bez"
        ziarno = int(cfg.get("seed", 0))
        punkty = sorted(d.get("punkty", []), key=lambda p: p["decyzje"])
        dane.setdefault(tag, {})[ziarno] = punkty
        print(f"  {tag:<16} s{ziarno}  punktow: {len(punkty):>3}  "
              f"decyzji: {punkty[-1]['decyzje']:,}")
    return dane


def zapisz_csv(dane, sciezka):
    with open(sciezka, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=POLA)
        w.writeheader()
        for tag, ziarna in dane.items():
            for ziarno, punkty in sorted(ziarna.items()):
                for p in punkty:
                    wiersz = {k: p.get(k, "") for k in POLA}
                    wiersz["konfiguracja"] = tag
                    wiersz["ziarno"] = ziarno
                    w.writerow(wiersz)


# ---------------------------------------------------------------------------
# statystyka
# ---------------------------------------------------------------------------

def wilson(wygrane, proby, z=1.96):
    """Przedzial ufnosci Wilsona dla proporcji."""
    if proby <= 0:
        return (float("nan"), float("nan"))
    p = wygrane / proby
    m = z * math.sqrt(p * (1 - p) / proby + z * z / (4 * proby * proby))
    return ((p + z * z / (2 * proby) - m) / (1 + z * z / proby),
            (p + z * z / (2 * proby) + m) / (1 + z * z / proby))


def podsumuj(dane):
    """Dla kazdej konfiguracji: wyniki koncowe i baza (iteracja 0)."""
    wynik = {}
    for tag, ziarna in dane.items():
        koncowe, bazy, decyzje, dlugosci, korzenie, przepustowosc = \
            [], [], [], [], [], []
        wygrane_sum = proby_sum = 0
        for ziarno, punkty in sorted(ziarna.items()):
            ostatni = punkty[-1]
            koncowe.append(ostatni["wskaznik_zwyciestw"])
            decyzje.append(ostatni["decyzje"])
            if ostatni.get("partie"):
                dlugosci.append(ostatni["decyzje"] / ostatni["partie"])
            if ostatni.get("akcje_w_korzeniu") is not None:
                korzenie.append(ostatni["akcje_w_korzeniu"])
            if ostatni.get("dec_na_s"):
                przepustowosc.append(ostatni["dec_na_s"])
            rozegrane = ostatni.get("partii_rozegranych", 0)
            proby_sum += rozegrane
            wygrane_sum += ostatni["wskaznik_zwyciestw"] * rozegrane
            zerowy = [p for p in punkty if p["iteracja"] == 0]
            if zerowy:
                bazy.append(zerowy[0]["wskaznik_zwyciestw"])
        lo, hi = wilson(wygrane_sum, proby_sum)
        wynik[tag] = {
            "ziarna": len(koncowe),
            "srednia": float(np.mean(koncowe)),
            "odchylenie": float(np.std(koncowe, ddof=1)) if len(koncowe) > 1
                          else 0.0,
            "mediana": float(np.median(koncowe)),
            "wyniki": koncowe,
            "wilson": (lo, hi),
            "prob": int(proby_sum),
            "baza": float(np.mean(bazy)) if bazy else float("nan"),
            "decyzje": float(np.mean(decyzje)),
            "dlugosc_partii": float(np.mean(dlugosci)) if dlugosci else float("nan"),
            "korzen": float(np.mean(korzenie)) if korzenie else float("nan"),
            "dec_na_s": float(np.mean(przepustowosc)) if przepustowosc else float("nan"),
        }
    return wynik


def lb(x, cyfry=3):
    """Liczba z przecinkiem dziesietnym, do LaTeX-a."""
    if x != x:
        return "---"
    return f"{x:.{cyfry}f}".replace(".", "{,}")


def tabela_tex(pods, sciezka):
    wiersze = []
    for tag, opis in PORZADEK:
        if tag not in pods:
            continue
        s = pods[tag]
        lo, hi = s["wilson"]
        wyniki = ", ".join(lb(w) for w in s["wyniki"])
        wiersze.append(
            f"{opis} & {lb(s['srednia'])} & {lb(s['odchylenie'])} & "
            f"[{lb(lo)}; {lb(hi)}] & {wyniki} & "
            f"{lb(s['decyzje'] / 1e6, 2)} & {lb(s['dlugosc_partii'], 0)} & "
            f"{lb(s['korzen'], 1)} \\\\")
    baza = np.nanmean([s["baza"] for s in pods.values()])
    tresc = r"""% wygenerowane przez analiza8.py
\begin{table}[htbp]
  \centering
  \caption{Jakosc treningu po trzech godzinach na jednej karcie. Wskaznik
    zwyciestw zmierzono w parach lustrzanych przeciwko polityce zachlannej
    (256 par, 512 partii na pomiar). Przedzial Wilsona policzono na wszystkich
    partiach z trzech ziaren lacznie. Siec nietrenowana osiaga """ + lb(baza) + r""".}
  \label{tab:jakosc-treningu}
  \begin{tabular}{lccccccc}
    \toprule
    Konfiguracja & Srednia & Odch. & Przedzial Wilsona & Wyniki ziaren &
    Decyzje [mln] & Dec./partie & Korzen \\
    \midrule
""" + "\n".join("    " + w for w in wiersze) + r"""
    \bottomrule
  \end{tabular}
\end{table}
"""
    with open(sciezka, "w") as f:
        f.write(tresc)


# ---------------------------------------------------------------------------
# wykresy
# ---------------------------------------------------------------------------

def siatka(ziarna, pole_x, pole_y, n=200, x_max=None):
    """Interpoluje przebiegi na wspolna siatke; zwraca (x, srednia, min, max)."""
    krzywe = [(np.array([p[pole_x] for p in punkty], float),
               np.array([p.get(pole_y, np.nan) for p in punkty], float))
              for punkty in ziarna.values() if len(punkty) > 1]
    if not krzywe:
        return None
    gorny = min(x[-1] for x, _ in krzywe)
    if x_max is not None:
        gorny = min(gorny, x_max)
    x = np.linspace(0, gorny, n)
    y = np.vstack([np.interp(x, xi, yi) for xi, yi in krzywe])
    return x, y.mean(axis=0), y.min(axis=0), y.max(axis=0)


def wykres(dane, pods, pole_y, tytul_y, sciezka, x_max=None, baza=None,
           tytul=None):
    fig, ax = plt.subplots(figsize=(6.4, 4.0))
    for tag, opis in PORZADEK:
        if tag not in dane:
            continue
        s = siatka(dane[tag], "decyzje", pole_y, x_max=x_max)
        if s is None:
            continue
        x, sr, lo, hi = s
        x = x / 1e6
        ax.fill_between(x, lo, hi, color=KOLORY[tag], alpha=0.15, linewidth=0)
        ax.plot(x, sr, color=KOLORY[tag], label=opis, linewidth=1.8)
    if baza is not None and baza == baza:
        ax.axhline(baza, color="0.35", linestyle="--", linewidth=1.0)
        ax.text(0.99, baza, " siec nietrenowana", transform=ax.get_yaxis_transform(),
                ha="right", va="bottom", fontsize=8, color="0.35")
    ax.set_xlabel("decyzje [mln]")
    ax.set_ylabel(tytul_y)
    if tytul:
        ax.set_title(tytul, fontsize=10)
    ax.grid(alpha=0.25, linewidth=0.6)
    ax.legend(fontsize=8, loc="best", frameon=False)
    ax.spines[["top", "right"]].set_visible(False)
    fig.tight_layout()
    fig.savefig(sciezka)
    plt.close(fig)


def wykres_dlugosci(dane, sciezka):
    """Srednia liczba decyzji na partie w funkcji liczby decyzji."""
    fig, ax = plt.subplots(figsize=(6.4, 4.0))
    for tag, opis in PORZADEK:
        if tag not in dane:
            continue
        for punkty in dane[tag].values():
            x = np.array([p["decyzje"] for p in punkty], float)
            partie = np.array([max(p.get("partie", 0), 1) for p in punkty], float)
            ax.plot(x / 1e6, x / partie, color=KOLORY[tag], alpha=0.8,
                    linewidth=1.3)
        ax.plot([], [], color=KOLORY[tag], label=opis, linewidth=1.8)
    ax.set_xlabel("decyzje [mln]")
    ax.set_ylabel("decyzji na partie (narastajaco)")
    ax.set_yscale("log")
    ax.grid(alpha=0.25, linewidth=0.6)
    ax.legend(fontsize=8, loc="best", frameon=False)
    ax.spines[["top", "right"]].set_visible(False)
    fig.tight_layout()
    fig.savefig(sciezka)
    plt.close(fig)


# ---------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--katalog", default="runs")
    ap.add_argument("--wyjscie", default="analiza")
    args = ap.parse_args()

    os.makedirs(args.wyjscie, exist_ok=True)
    print(f"czytam {args.katalog}/*/historia.json")
    dane = wczytaj(args.katalog)
    if not dane:
        print("brak danych w formacie wersja=2")
        return

    csv_sc = os.path.join(args.wyjscie, "pomiary_rozdzial8.csv")
    zapisz_csv(dane, csv_sc)
    pods = podsumuj(dane)
    tabela_tex(pods, os.path.join(args.wyjscie, "tabela_koncowa.tex"))

    print("\n=== WYNIKI KONCOWE ===")
    print(f"{'konfiguracja':<16} {'srednia':>8} {'odch.':>7} "
          f"{'Wilson':>18} {'baza':>7} {'dec/partie':>11}")
    for tag, _ in PORZADEK:
        if tag not in pods:
            continue
        s = pods[tag]
        lo, hi = s["wilson"]
        print(f"{tag:<16} {s['srednia']:>8.3f} {s['odchylenie']:>7.3f} "
              f"  [{lo:.3f}; {hi:.3f}] {s['baza']:>7.3f} "
              f"{s['dlugosc_partii']:>11.0f}")

    baza = float(np.nanmean([s["baza"] for s in pods.values()]))
    if MA_WYKRESY:
        wykres(dane, pods, "wskaznik_zwyciestw", "wskaznik zwyciestw",
               os.path.join(args.wyjscie, "krzywe_decyzje.pdf"), baza=baza)
        wykres(dane, pods, "wskaznik_zwyciestw", "wskaznik zwyciestw",
               os.path.join(args.wyjscie, "krzywe_start.pdf"),
               x_max=150_000, baza=baza, tytul="poczatek treningu")
        wykres(dane, pods, "akcje_w_korzeniu", "akcji w wezle glownym",
               os.path.join(args.wyjscie, "krzywe_korzen.pdf"))
        wykres_dlugosci(dane, os.path.join(args.wyjscie, "dlugosc_partii.pdf"))
        print(f"\nzapisano wykresy i tabele w {args.wyjscie}/")
    else:
        print("\nbrak matplotlib - zapisano tylko CSV i tabele LaTeX")
        print("instalacja: pip install --break-system-packages matplotlib")


if __name__ == "__main__":
    main()