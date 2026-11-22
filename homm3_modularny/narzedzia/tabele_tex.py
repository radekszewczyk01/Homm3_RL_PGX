#!/usr/bin/env python3
"""Zamienia pliki wynikow na tablice LaTeX-a.

PO CO TO JEST
-------------
Liczby w tym artykule zmienialy sie po kazdej poprawce silnika - po zmianie
puli stworow, po poprawieniu sufitu calkowitego, po przejsciu na odczyt
sasiadow. Tablica przepisana recznie do pliku .tex cicho rozjezdza sie wtedy
z plikiem wynikow i nikt tego nie widzi do recenzji. Dlatego kazda tablica
w artykule ma byc GENEROWANA z pliku wynikow, a nie przepisywana.

Dodatkowo kazda tablica dostaje w komentarzu naglowkowym sciezke zrodla,
date pomiaru, zaplecze i zrodlo puli stworow - zeby po pol roku dalo sie
odpowiedziec na pytanie, skad ta liczba.

Uruchomienie (nie wymaga karty, czyta tylko pliki):
    python3 narzedzia/tabele_tex.py --wyniki wyniki --wyjscie artykul/tabele
    python3 narzedzia/tabele_tex.py --wyniki wyniki_bez_karty --tylko ablacja3
"""
import argparse
import datetime
import glob
import json
import os
import sys


# ---------------------------------------------------------------------------

def wczytaj(sciezka):
    with open(sciezka) as f:
        return json.load(f)


def znajdz(katalog, nazwa):
    """Plik wynikow moze lezec w katalogu glownym albo w podkatalogu etapu."""
    wzory = (os.path.join(katalog, f"{nazwa}.json"),
             os.path.join(katalog, "*", f"{nazwa}.json"),
             os.path.join(katalog, f"*{nazwa}*.json"))
    for w in wzory:
        trafienia = sorted(glob.glob(w))
        if trafienia:
            return trafienia[0]
    return None


def esc(s):
    """LaTeX nie lubi podkreslen w tekscie."""
    return str(s).replace("_", r"\_").replace("%", r"\%")


def lb(x):
    """Liczba calkowita z nielamliwym odstepem tysiecy, jak chce siunitx."""
    return f"{round(float(x)):,}".replace(",", r"\,")


# Etykiety konfiguracji po angielsku - artykul jest po angielsku, a pliki
# wynikow maja etykiety polskie. Czego tu nie ma, idzie jak stoi.
ANG = {
    "odniesienie (wszystko)": "reference (all class III)",
    "rdzen (nic z klasy III)": "bare core (no class III)",
    "bez zdolnosci znoszacej kare": "without penalty-cancelling ability",
    "bez wszystkich wielocelowych": "without all multi-target mechanics",
    "bez oddech": "without breath attack",
    "bez trojglowy": "without three-headed attack",
    "bez dookolny": "without all-around attack",
    "bez wyssanie": "without life drain",
    "bez powrot": "without return after strike",
    "bez podwojny_atak": "without double attack",
    "bez kara_zwarcia": "without melee penalty",
    "bez bez_kary_zwarcia": "without penalty cancellation",
    "bez wielokrotny_kontratak": "without multiple retaliation",
    "rdzen": "bare core",
    "odniesienie": "reference",
    "III": "class III",
    "III_II": "classes II+III",
    "III_II_IV": "classes II+III+IV",
    "wszystko": "all classes",
    "I_4": "class I (4 spells)",
}


def nazwa(s):
    s = str(s)
    return esc(ANG.get(s, ANG.get(s.replace(" (zachlanny)", ""), s)))


def naglowek(zrodlo, dane):
    """Komentarz o pochodzeniu liczb - zostaje w pliku .tex na zawsze."""
    srod = {}
    if isinstance(dane, dict):
        srod = dane.get("otoczenie", {}) or {}
    elif isinstance(dane, list) and dane and isinstance(dane[0], dict):
        srod = dane[0].get("otoczenie", {}) or {}

    linie = [
        "% " + "-" * 72,
        f"%  WYGENEROWANE z {zrodlo}",
        f"%  przez narzedzia/tabele_tex.py, {datetime.date.today().isoformat()}",
        "%  NIE EDYTUJ RECZNIE - przegeneruj po kazdej zmianie pomiarow.",
    ]
    for klucz, opis in (("zaplecze", "zaplecze"),
                        ("urzadzenia", "urzadzenia"),
                        ("jax", "wersja JAX"),
                        ("pula_zrodlo", "pula stworow"),
                        ("pula_stworow", "stworow w puli"),
                        ("pula_awaryjna", "PULA AWARYJNA"),
                        ("pula_poprawki", "poprawki w puli")):
        if klucz in srod:
            linie.append(f"%  {opis}: {srod[klucz]}")
    if srod.get("pula_awaryjna"):
        linie.append("%  UWAGA: pomiar na puli awaryjnej - liczby zalezne od "
                     "zawartosci puli sa NIEWAZNE.")
    linie.append("% " + "-" * 72)
    return "\n".join(linie)


def tabela(naglowki, wiersze, wyrownanie, podpis, etykieta, zrodlo, dane,
           uwaga=None):
    cz = [naglowek(zrodlo, dane), r"\begin{table}[t]", r"  \centering",
          f"  \\caption{{{podpis}}}", f"  \\label{{{etykieta}}}",
          f"  \\begin{{tabular}}{{{wyrownanie}}}", r"    \toprule",
          "    " + " & ".join(naglowki) + r" \\", r"    \midrule"]
    for w in wiersze:
        cz.append("    " + " & ".join(w) + r" \\")
    cz += [r"    \bottomrule", r"  \end{tabular}"]
    if uwaga:
        cz.append(f"  \\\\[2pt]\n  \\footnotesize {uwaga}")
    cz += [r"\end{table}", ""]
    return "\n".join(cz)


def kps(w):
    """Przepustowosc pod oboma nazwami, jakie wystepuja w plikach wynikow."""
    for k in ("krokow_na_sekunde", "krokow_na_s"):
        if k in w:
            return w[k]
    return None


def wzgledem(wartosc, odniesienie):
    """Zmiana w procentach wobec konfiguracji pelnej, ze znakiem."""
    if not odniesienie:
        return "---"
    d = 100.0 * (wartosc - odniesienie) / odniesienie
    if abs(d) < 0.005:
        return r"$0.00$"
    return f"${d:+.2f}$"


# ---------------------------------------------------------------------------
# ablacja klasy III
# ---------------------------------------------------------------------------

def tab_ablacja3(katalog):
    zrodlo = znajdz(katalog, "ablacja3")
    if not zrodlo:
        return None, "nie znalazlem ablacja3.json"
    dane = wczytaj(zrodlo)
    wiersze_we = dane["wiersze"] if isinstance(dane, dict) else dane
    if not wiersze_we:
        return None, "ablacja3.json jest pusty"

    pelna = wiersze_we[0]
    B = pelna.get("wsad", "?")
    ma_czas = kps(pelna) is not None

    naglowki = [r"configuration", r"$\Delta$ flops [\%]",
                r"$\Delta$ bytes [\%]", r"kernels", r"buffers"]
    wyr = "lrrrr"
    if ma_czas:
        naglowki.append(r"$\Delta$ steps/s [\%]")
        wyr += "r"

    wiersze = []
    for w in wiersze_we:
        etyk = nazwa(w.get("konfiguracja", "?"))
        if w is pelna:
            kom = [f"\\textbf{{{etyk}}}",
                   f"\\textbf{{{lb(w['flopy_na_krok'])}}}",
                   f"\\textbf{{{lb(w['bajty_na_krok'])}}}",
                   f"\\textbf{{{w['jadra']}}}",
                   f"\\textbf{{{lb(w.get('bajty_tymczasowe', 0))}}}"]
            if ma_czas:
                kom.append(f"\\textbf{{{lb(kps(w))}}}")
            wiersze.append(kom)
            continue
        kom = [etyk,
               wzgledem(w["flopy_na_krok"], pelna["flopy_na_krok"]),
               wzgledem(w["bajty_na_krok"], pelna["bajty_na_krok"]),
               f"${w['jadra'] - pelna['jadra']:+d}$",
               wzgledem(w.get("bajty_tymczasowe", 0),
                        pelna.get("bajty_tymczasowe", 0))]
        if ma_czas:
            kom.append(wzgledem(kps(w), kps(pelna)))
        wiersze.append(kom)

    uwaga = (f"First row: absolute values for the full configuration at "
             f"$B = {B}$. Remaining rows: change relative to it when the named "
             f"mechanic is removed from the compiled program. Operation, byte "
             f"and kernel counts are deterministic properties of the "
             f"compilation and are not comparable across batch sizes.")
    return tabela(naglowki, wiersze, wyr,
                  "Cost of each class~III mechanic, measured by removing it "
                  "from the compiled program.",
                  "tab:ablacja3", zrodlo, dane, uwaga), None


# ---------------------------------------------------------------------------
# narastanie klas
# ---------------------------------------------------------------------------

def tab_narastanie(katalog):
    zrodlo = znajdz(katalog, "narastanie")
    if not zrodlo:
        return None, "nie znalazlem narastanie.json"
    dane = wczytaj(zrodlo)
    wiersze_we = dane["wiersze"] if isinstance(dane, dict) else dane
    if not wiersze_we:
        return None, "narastanie.json jest pusty"

    baza = wiersze_we[0]
    ma_czas = kps(baza) is not None
    naglowki = [r"configuration", r"$\nact$", r"$\nstate$ [B]",
                r"flops/step", r"bytes/step", r"kernels"]
    wyr = "lrrrrr"
    if ma_czas:
        naglowki.append(r"steps/s")
        wyr += "r"

    wiersze = []
    for w in wiersze_we:
        kom = [nazwa(w.get("konfiguracja", "?")),
               lb(w.get("A", 0)), lb(w.get("D", 0)),
               lb(w["flopy_na_krok"]), lb(w["bajty_na_krok"]),
               str(w["jadra"])]
        if ma_czas:
            kom.append(lb(kps(w)))
        wiersze.append(kom)

    # stosunki od dolu do gory - to jest wlasciwy wynik tej tablicy
    ostatni = wiersze_we[-1]
    uwaga = (f"From the bare core to the full configuration, bytes moved per "
             f"step grow by a factor of "
             f"{ostatni['bajty_na_krok'] / baza['bajty_na_krok']:.2f} while "
             f"operations grow by only "
             f"{ostatni['flopy_na_krok'] / baza['flopy_na_krok']:.2f}: the "
             f"cost of expressing more of the game is predominantly memory "
             f"traffic.")
    return tabela(naglowki, wiersze, wyr,
                  "Cumulative cost of adding mechanic classes.",
                  "tab:narastanie", zrodlo, dane, uwaga), None


# ---------------------------------------------------------------------------
# rozklad liczby akcji dopuszczalnych
# ---------------------------------------------------------------------------

def tab_akcje(katalog):
    zrodlo = znajdz(katalog, "akcje")
    if not zrodlo:
        return None, "nie znalazlem akcje.json"
    dane = wczytaj(zrodlo)
    wiersze_we = dane["wiersze"] if isinstance(dane, dict) else dane
    if not wiersze_we:
        return None, "akcje.json jest pusty"

    naglowki = [r"configuration", r"$\nact$", r"mean", r"median",
                r"p95", r"\% of $\nact$", r"episode"]
    wiersze = []
    for w in wiersze_we:
        wiersze.append([
            nazwa(w.get("konfiguracja", "?")),
            lb(w.get("A", 0)),
            f"{w.get('srednia', 0):.2f}",
            f"{w.get('mediana', 0):.0f}",
            f"{w.get('p95', 0):.0f}",
            f"{w.get('udzial_procent', 0):.2f}",
            f"{w.get('dlugosc_epizodu', 0):,.1f}".replace(",", "~"),
        ])
    uwaga = ("The nominal action space grows faster than the number of legal "
             "actions, so the fraction of the fixed-shape buffer that carries "
             "information falls as mechanics are added.")
    return tabela(naglowki, wiersze, "lrrrrrr",
                  "Nominal against legal action count.",
                  "tab:akcje", zrodlo, dane, uwaga), None


# ---------------------------------------------------------------------------
# porownanie z PGX i regula progu
# ---------------------------------------------------------------------------

def tab_pgx(katalog):
    zrodlo = znajdz(katalog, "porownanie_pgx")
    if not zrodlo:
        return None, "nie znalazlem porownanie_pgx.json"
    dane = wczytaj(zrodlo)
    if not dane:
        return None, "porownanie_pgx.json jest pusty"

    C_L2 = 72 * 2**20
    nazwy = list(dict.fromkeys(w["srodowisko"] for w in dane))
    wiersze = []
    for n in nazwy:
        gr = [w for w in dane if w["srodowisko"] == n]
        naj = max(gr, key=lambda w: kps(w) or 0.0)
        D = naj.get("D_bajtow", 0)
        B = naj["wsad"]
        wiersze.append([
            esc(n),
            lb(naj.get("akcji", 0)), lb(D), lb(B),
            lb(0.57 * C_L2 / (2 * D)) if D else "---",
            lb(kps(naj)),
            f"{2 * B * D / C_L2:.3f}" if D else "---",
        ])
    uwaga = ("All environments measured on the same accelerator with the same "
             "harness. $B^{\\star}$ is the measured throughput optimum over "
             "the sweep; the predicted column applies "
             "Eq.~(\\ref{eq:design-rule}). A measured optimum at the edge of "
             "the sweep is a lower bound, not an optimum.")
    return tabela([r"environment", r"$\nact$", r"$\nstate$ [B]",
                   r"$B^{\star}$", r"predicted", r"steps/s",
                   r"$2B^{\star}\nstate / C_{L2}$"],
                  wiersze, "lrrrrrr",
                  "The residency rule across independent environments on one "
                  "device.",
                  "tab:pgx", zrodlo, dane, uwaga), None


# ---------------------------------------------------------------------------

GENERATORY = {
    "ablacja3": tab_ablacja3,
    "narastanie": tab_narastanie,
    "akcje": tab_akcje,
    "pgx": tab_pgx,
}


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--wyniki", default=os.environ.get("WYNIKI", "wyniki"))
    p.add_argument("--wyjscie", default="artykul/tabele")
    p.add_argument("--tylko", nargs="+", choices=sorted(GENERATORY),
                   help="generuj tylko wymienione tablice")
    a = p.parse_args()

    if not os.path.isdir(a.wyniki):
        print(f"Katalog wynikow nie istnieje: {a.wyniki}", file=sys.stderr)
        print("Podaj --wyniki albo ustaw zmienna WYNIKI.", file=sys.stderr)
        sys.exit(1)

    os.makedirs(a.wyjscie, exist_ok=True)
    wybrane = a.tylko or sorted(GENERATORY)
    ile = 0
    for nazwa in wybrane:
        tekst, blad = GENERATORY[nazwa](a.wyniki)
        if tekst is None:
            print(f"  pominieto {nazwa}: {blad}")
            continue
        sciezka = os.path.join(a.wyjscie, f"tab_{nazwa}.tex")
        with open(sciezka, "w") as f:
            f.write(tekst)
        print(f"  zapisane {sciezka}")
        ile += 1

    print(f"\n  {ile} z {len(wybrane)} tablic. W artykule wlacz je przez")
    print(f"  \\input{{{os.path.basename(a.wyjscie)}/tab_<nazwa>}}")
    if ile < len(wybrane):
        print("\n  Brakujace tablice wymagaja przebiegow na karcie:")
        print("    ./uruchom/w_dockerze.sh python3 eksperymenty.py ablacja3 "
              "--wsad 2048 --czas")
        print("    ./uruchom/w_dockerze.sh python3 eksperymenty.py narastanie "
              "--wsad 2048 --czas")
        print("    ./uruchom/w_dockerze.sh python3 eksperymenty.py akcje "
              "--presety odniesienie I_4 wszystko --wsad 2048 --kroki 100")
        print("    ./uruchom/w_dockerze.sh python3 narzedzia/porownanie_pgx.py")


if __name__ == "__main__":
    main()
