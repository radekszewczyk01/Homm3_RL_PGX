#!/usr/bin/env bash
# Wszystko, co NIE wymaga sprawnego zegara karty. Liczby z kompilatora.
# Czas: kilkanascie minut, glownie kompilacja.
set -euo pipefail
cd "$(dirname "$0")/.."
source uruchom/00_srodowisko.sh

echo
echo "### 1/5  zgodnosc konfiguracji odniesienia z wersja trzecia"
python3 eksperymenty.py --wyniki "$WYNIKI" zgodnosc --gier 50

echo
echo "### 2/5  semantyka mechanik"
python3 test_mechanik.py

echo
echo "### 3/5  pokrycie - czy mechaniki sie odpalaja"
python3 eksperymenty.py --wyniki "$WYNIKI" pokrycie --gier 40

echo
echo "### 4/5  ablacja klasy III"
python3 eksperymenty.py --wyniki "$WYNIKI" ablacja3 --wsad 1024

echo
echo "### 5/5  narastanie klas i skalowanie przestrzeni akcji"
python3 eksperymenty.py --wyniki "$WYNIKI" narastanie --wsad 1024
python3 eksperymenty.py --wyniki "$WYNIKI" klasa1 --wsad 1024 --symulacje 150

echo
echo "gotowe. wyniki w $WYNIKI/"
