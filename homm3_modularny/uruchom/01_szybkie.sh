#!/usr/bin/env bash
# Wszystko, co NIE wymaga sprawnego zegara karty. Liczby z kompilatora.
# Czas: kilkanascie do dwudziestu kilku minut, glownie kompilacja.
#
# PROBNIE=1 skraca wszystko do absolutnego minimum - sluzy tylko do
# sprawdzenia, ze skrypt startuje i dochodzi do konca. Wyniki z takiego
# przebiegu sa bez wartosci i nie wolno ich uzywac.
set -euo pipefail
cd "$(dirname "$0")/.."
source uruchom/00_srodowisko.sh

if [[ "${PROBNIE:-0}" == "1" ]]; then
  echo "### PRZEBIEG PROBNY - wyniki bez wartosci, sprawdzamy tylko, ze dziala"
  GIER=2; WSAD=8; PROB=200; DODATKOWO=(--bez-kosztu); SYMULACJE=8
  OGRANICZ=(--max-konfiguracji 2)
  PRESETY_POKRYCIE=(--presety odniesienie I_bufy)
else
  GIER=${GIER:-50}; WSAD=${WSAD:-1024}; PROB=${PROB:-4000}
  DODATKOWO=(); SYMULACJE=${SYMULACJE:-150}
  OGRANICZ=(); PRESETY_POKRYCIE=()
fi

echo
echo "### 1/5  zgodnosc konfiguracji odniesienia z wersja trzecia"
python3 eksperymenty.py --wyniki "$WYNIKI" zgodnosc --gier "$GIER"

echo
echo "### 2/5  semantyka mechanik"
python3 test_mechanik.py --prob "$PROB" "${DODATKOWO[@]}"

echo
echo "### 3/5  pokrycie - czy mechaniki sie odpalaja"
python3 eksperymenty.py --wyniki "$WYNIKI" pokrycie --gier "$GIER" "${PRESETY_POKRYCIE[@]}"

echo
echo "### 4/5  ablacja klasy III"
python3 eksperymenty.py --wyniki "$WYNIKI" ablacja3 --wsad "$WSAD" "${OGRANICZ[@]}"

echo
echo "### 5/5  narastanie klas i skalowanie przestrzeni akcji"
python3 eksperymenty.py --wyniki "$WYNIKI" narastanie --wsad "$WSAD" "${OGRANICZ[@]}"
python3 eksperymenty.py --wyniki "$WYNIKI" klasa1 --wsad "$WSAD" \
    --symulacje "$SYMULACJE" "${OGRANICZ[@]}"

echo
echo "gotowe. wyniki w $WYNIKI/"
