#!/usr/bin/env bash
# Pomiary CZASOWE. Wymagaja karty bez zablokowanego zegara.
#
# KARTA ZERO JEST ZABLOKOWANA NA 1155 MHz - te pomiary na niej sa bezwartosciowe.
# 00_srodowisko.sh ustawia CUDA_VISIBLE_DEVICES=1. Zanim cokolwiek odpalisz,
# spojrz na wydruk nvidia-smi ponizej: zegar biezacy przy zerowym obciazeniu
# MUSI byc znacznie nizszy od granicznego.
set -euo pipefail
cd "$(dirname "$0")/.."
source uruchom/00_srodowisko.sh

echo
echo "### krzywa przepustowosci dla konfiguracji odniesienia"
echo "### szczyt powinien wypasc przy wsadzie okolo 2048"
python3 eksperymenty.py --wyniki "$WYNIKI" klasa2 \
    --kanaly 0 \
    --wsady 1024 1280 1536 1792 2048 2304 2560 3072 4096 \
    --kroki 50 --powtorzenia 5

echo
echo "### TEST REGULY PROJEKTOWEJ: rosnacy D ma przesuwac optimum w dol"
echo "### przewidywania: D x1.00 -> 2048,  x1.5 -> 1365,  x2.0 -> 1024"
python3 eksperymenty.py --wyniki "$WYNIKI" klasa2 \
    --kanaly 0 8 16 24 \
    --wsady 512 768 1024 1280 1536 1792 2048 2304 2560 3072 \
    --kroki 50 --powtorzenia 5

echo
echo "### ablacja klasy III z czasem obok liczb z kompilatora"
python3 eksperymenty.py --wyniki "$WYNIKI" ablacja3 --wsad 2048 --czas \
    --kroki 50 --powtorzenia 5

echo
echo "### narastanie klas z czasem"
python3 eksperymenty.py --wyniki "$WYNIKI" narastanie --wsad 2048 --czas \
    --kroki 50 --powtorzenia 5

echo
echo "gotowe. wyniki w $WYNIKI/"
