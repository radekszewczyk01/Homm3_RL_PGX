#!/usr/bin/env bash
# Koszt drzewa przeszukiwania. Wymaga pakietu mctx.
#
# Sieci celowo NIE MA - apriori jest rownomierne na akcjach dopuszczalnych,
# wartosc zerowa. Gdyby byla, nie dalo by sie odroznic kosztu drzewa od kosztu
# splotow, a nas interesuje drzewo.
set -euo pipefail
cd "$(dirname "$0")/.."
source uruchom/00_srodowisko.sh

python3 -c "import mctx" 2>/dev/null || { echo "brak mctx: pip install mctx"; exit 1; }

echo
echo "### koszt decyzji dla kolejnych konfiguracji"
python3 eksperymenty.py --wyniki "$WYNIKI" drzewo \
    --presety odniesienie III_II III_II_IV I_2 I_4 wszystko \
    --wsad 128 --symulacje 32 --polityka gumbel --max-rozwazanych 16

echo
echo "### jak koszt drzewa rosnie z |A| - to jest glowny wynik klasy I"
python3 eksperymenty.py --wyniki "$WYNIKI" klasa1 \
    --wsad 1024 --symulacje 150 --drzewo --wsad-drzewa 64 --polityka gumbel

echo
echo "### to samo dla PUCT, do porownania polityk"
python3 eksperymenty.py --wyniki "${WYNIKI}_puct" drzewo \
    --presety odniesienie I_4 \
    --wsad 128 --symulacje 32 --polityka muzero

echo
echo "gotowe."
