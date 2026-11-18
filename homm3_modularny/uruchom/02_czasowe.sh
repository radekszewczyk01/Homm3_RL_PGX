#!/usr/bin/env bash
# Pomiary CZASOWE. Kolejnosc nie jest dowolna.
#
# Najpierw sprawdzamy zegar, potem odtwarzamy liczbe z pracy, i tylko jesli
# OBIE te rzeczy wyjda - mierzymy cokolwiek nowego. Odwrotna kolejnosc raz
# nas kosztowala weekend: zmierzylismy spadek dwukrotny i szukalismy go
# w kodzie, a siedzial w zablokowanym zegarze karty.
set -euo pipefail
cd "$(dirname "$0")/.."
source uruchom/00_srodowisko.sh

echo
echo "### 1/5  czy zegar karty nie jest zablokowany"
echo "###      (przy bezczynnosci tego nie widac, wiec karta zostaje obciazona)"
python3 narzedzia/sprawdz_zegar.py --karta "$CUDA_VISIBLE_DEVICES" --sekundy 20

echo
echo "### 2/5  czy nowa petla pomiarowa odtwarza 371 011 krokow/s z pracy"
echo "###      rozbieznosc tutaj uniewaznia KAZDA liczbe czasowa ponizej"
python3 eksperymenty.py --wyniki "$WYNIKI" zgodnosc --gier 30 --czas \
    --kroki 50 --powtorzenia 8

echo
echo "### 3/5  krzywa przepustowosci dla konfiguracji odniesienia"
echo "###      szczyt ma wypasc przy wsadzie okolo 2048, a za nim zalamanie"
python3 eksperymenty.py --wyniki "$WYNIKI" klasa2 \
    --preset odniesienie --kanaly 0 \
    --wsady 1024 1280 1536 1792 2048 2176 2304 2560 3072 4096 \
    --kroki 50 --powtorzenia 5

echo
echo "### 4/5  TEST REGULY PROJEKTOWEJ: rosnacy D ma przesuwac optimum w dol"
echo "###      przewidywania: D x1.00 -> 1819,  x1.50 -> 1211,  x2.00 -> 908"
python3 eksperymenty.py --wyniki "$WYNIKI" klasa2 \
    --preset III_II --kanaly 0 9 18 \
    --wsady 512 640 768 896 1024 1152 1280 1536 1792 2048 2304 2560 \
    --kroki 50 --powtorzenia 5

echo
echo "### 5/5  ablacja i narastanie z czasem obok liczb z kompilatora"
python3 eksperymenty.py --wyniki "$WYNIKI" ablacja3 --wsad 2048 --czas \
    --kroki 50 --powtorzenia 5
python3 eksperymenty.py --wyniki "$WYNIKI" narastanie --wsad 2048 --czas \
    --kroki 50 --powtorzenia 5

echo
echo "gotowe. wyniki w $WYNIKI/"
