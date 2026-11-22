#!/usr/bin/env python3
"""
Wskazuje jadro, ktore faktycznie decyduje o czasie kroku.

PO CO TO JEST
-------------
Skan rezydencji L2 ma sens tylko wtedy, gdy liczniki zbieramy z jadra, ktore
rzeczywiscie przetwarza stan. Jesli trafimy w jakies male jadro pomocnicze,
jego zbior roboczy nie zalezy od wsadu i wykres bedzie plaski - a plaski
wykres wyglada jak wynik, choc jest pomylka. Dokladnie tak przepadl pierwszy
podejscie do eksperymentu z powiekszonym stanem.

Nazwy jader zmieniaja sie przy kazdej zmianie konfiguracji, bo zmienia sie
drzewo fuzji. Dlatego regex do ncu wyznaczamy za kazdym razem, a nie
przepisujemy z poprzedniego przebiegu.

UZYCIE
------
    ncu --metrics gpu__time_duration.sum --csv --target-processes all \\
        python3 eksperymenty.py ... > /tmp/jadra.csv
    python3 narzedzia/najwazniejsze_jadro.py /tmp/jadra.csv
"""

import collections
import csv
import io
import re
import sys


def wczytaj(sciezka):
    with open(sciezka) as f:
        linie = f.readlines()
    try:
        start = next(i for i, l in enumerate(linie) if l.startswith('"ID"'))
    except StopIteration:
        print("Nie znalazlem naglowka CSV. Czy ncu w ogole cos zebral?",
              file=sys.stderr)
        return []
    return list(csv.DictReader(io.StringIO("".join(linie[start:]))))


def nazwa_dokladna(nazwa):
    """Sama nazwa jadra, bez listy argumentow."""
    return nazwa.split("(")[0].strip()


def main():
    argumenty = [a for a in sys.argv[1:] if not a.startswith("--")]
    tylko_regex = "--tylko-regex" in sys.argv
    if not argumenty:
        print(__doc__)
        return 1
    wiersze = wczytaj(argumenty[0])
    if not wiersze:
        return 1

    czas = collections.Counter()
    ile = collections.Counter()
    for w in wiersze:
        if "duration" not in w.get("Metric Name", ""):
            continue
        try:
            v = float(w["Metric Value"].replace(",", ""))
        except (ValueError, KeyError):
            continue
        nazwa = w["Kernel Name"]
        czas[nazwa] += v
        ile[nazwa] += 1

    if not czas:
        print("Brak metryki czasu. Dodaj --metrics gpu__time_duration.sum",
              file=sys.stderr)
        return 1

    razem = sum(czas.values())
    if tylko_regex:
        glowne = czas.most_common(1)[0][0]
        print(f"^{re.escape(nazwa_dokladna(glowne))}$")
        return 0

    print(f"{'udzial':>8} {'wywolan':>8} {'suma [us]':>12}  jadro")
    print("-" * 78)
    for nazwa, v in czas.most_common(15):
        print(f"{100 * v / razem:7.2f}% {ile[nazwa]:8d} {v / 1000:12.1f}  "
              f"{nazwa[:48]}")

    glowne = czas.most_common(1)[0][0]
    dokladna = nazwa_dokladna(glowne)
    print(f"\nDominuje: {glowne}")
    print(f"Udzial w czasie: {100 * czas[glowne] / razem:.1f}%")
    print(f"\nRegex do ncu:\n    --kernel-name regex:^{re.escape(dokladna)}$")

    # Ostrzezenie o mieszaniu jader: prefiks nazwy bywa wspolny dla kilku
    # ROZNYCH jader o roznych rozmiarach. Zbieranie licznikow po prefiksie
    # usrednia je razem, a wtedy iloczyn pasma i czasu nie jest sladem
    # zadnego z nich. Dlatego regex powyzej jest zakotwiczony z obu stron.
    prefiks = re.sub(r"[\d_]+$", "", dokladna)
    rodzina = [(n, v) for n, v in czas.items()
               if nazwa_dokladna(n).startswith(prefiks)]
    if len(rodzina) > 1:
        print(f"\nUWAGA: nazwe o tym samym prefiksie '{prefiks}' nosi "
              f"{len(rodzina)} roznych jader:")
        for n, v in sorted(rodzina, key=lambda x: -x[1]):
            print(f"    {100 * v / razem:6.2f}%  {nazwa_dokladna(n)}")
        print("  Zbieranie po prefiksie usrednia je razem i slad pamieciowy")
        print("  wyliczony z takich danych nie nalezy do zadnego z nich.")
        print("  Uzyj regexa zakotwiczonego, podanego wyzej.")
    if 100 * czas[glowne] / razem < 40:
        print("\nUWAGA: zadne jadro nie dominuje wyraznie. Zbierz liczniki "
              "z kilku\nnajwiekszych i podaj je osobno, albo zwaz je czasem.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
