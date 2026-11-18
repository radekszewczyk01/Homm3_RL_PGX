#!/usr/bin/env bash
# Pomiary CZASOWE. Kolejnosc nie jest dowolna.
#
# Najpierw sprawdzamy zegar, potem odtwarzamy liczbe z pracy, i tylko jesli
# OBIE te rzeczy wyjda - mierzymy cokolwiek nowego. Odwrotna kolejnosc raz
# nas kosztowala weekend: zmierzylismy spadek dwukrotny i szukalismy go
# w kodzie, a siedzial w zablokowanym zegarze karty.
#
# PROBNIE=1 skraca wszystko do minimum; wyniki sa wtedy bez wartosci.
set -euo pipefail
cd "$(dirname "$0")/.."
source uruchom/00_srodowisko.sh

if [[ "${PROBNIE:-0}" == "1" ]]; then
  echo "### PRZEBIEG PROBNY - wyniki bez wartosci, sprawdzamy tylko, ze dziala"
  SEKUNDY=3; GIER=2; KROKI=2; POWT=2; POWT_BRAMA=2
  WSADY_ODN="128 256"; WSADY_REZ="64 128"; KANALY="0 9"; WSAD_ABL=8
  OGRANICZ=(--max-konfiguracji 2)
else
  SEKUNDY=${SEKUNDY:-20}; GIER=${GIER:-30}; KROKI=${KROKI:-50}
  POWT=${POWT:-5}; POWT_BRAMA=${POWT_BRAMA:-8}
  WSADY_ODN=${WSADY_ODN:-"1024 1280 1536 1792 2048 2176 2304 2560 3072 4096"}
  WSADY_REZ=${WSADY_REZ:-"512 640 768 896 1024 1152 1280 1536 1792 2048 2304 2560"}
  KANALY=${KANALY:-"0 9 18"}; WSAD_ABL=${WSAD_ABL:-2048}
  OGRANICZ=()
fi

echo
echo "### 1/5  czy zegar karty nie jest zablokowany"
echo "###      (przy bezczynnosci tego nie widac, wiec karta zostaje obciazona)"
python3 narzedzia/sprawdz_zegar.py --karta "${CUDA_VISIBLE_DEVICES:-0}" \
    --sekundy "$SEKUNDY"

echo
echo "### 2/5  czy nowa petla pomiarowa odtwarza 371 011 krokow/s z pracy"
echo "###      rozbieznosc tutaj uniewaznia KAZDA liczbe czasowa ponizej"
python3 eksperymenty.py --wyniki "$WYNIKI" zgodnosc --gier "$GIER" --czas \
    --kroki "$KROKI" --powtorzenia "$POWT_BRAMA"

echo
echo "### 3/5  krzywa przepustowosci dla konfiguracji odniesienia"
echo "###      szczyt ma wypasc przy wsadzie okolo 2048, a za nim zalamanie"
python3 eksperymenty.py --wyniki "$WYNIKI" klasa2 \
    --preset odniesienie --kanaly 0 \
    --wsady $WSADY_ODN --kroki "$KROKI" --powtorzenia "$POWT"

echo
echo "### 4/5  TEST REGULY PROJEKTOWEJ: rosnacy D ma przesuwac optimum w dol"
echo "###      przewidywania: D x1.00 -> 1819,  x1.50 -> 1211,  x2.00 -> 908"
python3 eksperymenty.py --wyniki "$WYNIKI" klasa2 \
    --preset III_II --kanaly $KANALY \
    --wsady $WSADY_REZ --kroki "$KROKI" --powtorzenia "$POWT"

echo
echo "### 5/5  ablacja i narastanie z czasem obok liczb z kompilatora"
python3 eksperymenty.py --wyniki "$WYNIKI" ablacja3 --wsad "$WSAD_ABL" --czas \
    --kroki "$KROKI" --powtorzenia "$POWT" "${OGRANICZ[@]}"
python3 eksperymenty.py --wyniki "$WYNIKI" narastanie --wsad "$WSAD_ABL" --czas \
    --kroki "$KROKI" --powtorzenia "$POWT" "${OGRANICZ[@]}"

echo
echo "gotowe. wyniki w $WYNIKI/"
