#!/usr/bin/env bash
# Koszt drzewa przeszukiwania. Wymaga pakietu mctx.
#
# Sieci celowo NIE MA - apriori jest rownomierne na akcjach dopuszczalnych,
# wartosc zerowa. Gdyby byla, nie dalo by sie odroznic kosztu drzewa od kosztu
# splotow, a nas interesuje drzewo.
#
# Pomiar jest czasowy, wiec nic innego nie powinno wtedy liczyc na maszynie.
# PROBNIE=1 skraca wszystko do minimum; wyniki sa wtedy bez wartosci - przy
# malym wsadzie i kilku symulacjach narzut wywolania przewaza nad praca
# i kolumna 'spowolnienie' wychodzi mniejsza od jednosci, co jest bez sensu.
set -euo pipefail
cd "$(dirname "$0")/.."
source uruchom/00_srodowisko.sh

python3 -c "import mctx" 2>/dev/null || {
  echo "Brak mctx w tym obrazie. Dolozenie: pip install mctx"
  echo "(Dockerfile.profil robi to sam - przebuduj obraz.)"
  exit 1; }

if [[ "${PROBNIE:-0}" == "1" ]]; then
  echo "### PRZEBIEG PROBNY - wyniki bez wartosci, sprawdzamy tylko, ze dziala"
  PRESETY="odniesienie I_2"; WSAD=16; SYM=4; MAXR=4; POWT=2; KROKI=2
  WSAD_K1=8; SYM_K1=8
  OGRANICZ=(--max-konfiguracji 2)
else
  PRESETY=${PRESETY:-"odniesienie III_II III_II_IV I_2 I_4 wszystko"}
  WSAD=${WSAD:-128}; SYM=${SYM:-32}; MAXR=${MAXR:-16}
  POWT=${POWT:-3}; KROKI=${KROKI:-50}
  WSAD_K1=${WSAD_K1:-1024}; SYM_K1=${SYM_K1:-150}
  OGRANICZ=()
fi

echo
echo "### 1/3  koszt decyzji dla kolejnych konfiguracji"
python3 eksperymenty.py --wyniki "$WYNIKI" drzewo \
    --presety $PRESETY \
    --wsad "$WSAD" --symulacje "$SYM" --polityka gumbel \
    --max-rozwazanych "$MAXR" --powtorzenia "$POWT" --kroki "$KROKI"

echo
echo "### 2/3  jak koszt drzewa rosnie z |A| - to jest glowny wynik klasy I"
python3 eksperymenty.py --wyniki "$WYNIKI" klasa1 \
    --wsad "$WSAD_K1" --symulacje "$SYM_K1" --drzewo \
    --wsad-drzewa "$WSAD" --polityka gumbel "${OGRANICZ[@]}"

echo
echo "### 3/3  to samo dla PUCT, do porownania polityk"
python3 eksperymenty.py --wyniki "${WYNIKI}_puct" drzewo \
    --presety odniesienie I_4 \
    --wsad "$WSAD" --symulacje "$SYM" --polityka muzero \
    --powtorzenia "$POWT" --kroki "$KROKI"

echo
echo "gotowe. wyniki w $WYNIKI/ i ${WYNIKI}_puct/"
