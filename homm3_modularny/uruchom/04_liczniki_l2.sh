#!/usr/bin/env bash
# Liczniki sprzetowe: rezydencja w L2 wobec objetosci stanu.
#
# TO ZAMYKA TODO Z SEKCJI O L2
# ----------------------------
# Pierwsze podejscie bylo nieudane i wiadomo dlaczego. Sztuczne pole bylo
# doklejane PO kroku (monkey patch), wiec XLA wystawiala je jako osobne male
# jadro elementowe, a mierzona fuzja nadal operowala tylko na prawdziwych
# polach gry. Zbior roboczy mierzonego jadra sie nie zmienil, i dlatego prog
# zalamania stal przy B okolo 2048 dla wszystkich trzech rozmiarow stanu.
# To nie byl wynik "objetosc nie decyduje" - to byl niewykonany eksperyment.
#
# Teraz powiekszamy OBSERWACJE, ktora jest 90 procent stanu i jest
# przebudowywana w kazdym kroku wewnatrz glownej fuzji. Rozmiary stanu:
#
#   kanalow+ 0   D = 11 827   D/D0 = 1.00   B_opt z reguly ~1819
#   kanalow+ 9   D = 17 767   D/D0 = 1.50   B_opt z reguly ~1210
#   kanalow+18   D = 23 707   D/D0 = 2.00   B_opt z reguly ~907
#
# Jesli prog zalamania przesuwa sie zgodnie z ta kolumna - regula projektowa
# przewiduje. Jesli stoi w miejscu - znowu nie trafilismy w goraca sciezke
# i wynik trzeba odrzucic, a nie opisac.
#
# DWIE RZECZY, KTORE PSUJA TEN POMIAR
# -----------------------------------
# 1. --cache-control none jest OBOWIAZKOWE. Domyslne 'all' plucze pamiec
#    podreczna miedzy przebiegami powtorzeniowymi, czyli niszczy dokladnie to
#    ponowne uzycie miedzy jadrami, ktore badamy. Z domyslnym ustawieniem
#    trafienia wychodza plaskie 23 procent na calym zakresie i wyglada to na
#    wynik.
# 2. Nazwa jadra zmienia sie przy kazdej zmianie konfiguracji. Dlatego regex
#    wyznaczamy za kazdym razem, a nie przepisujemy z poprzedniego przebiegu.
#
# ncu serializuje jadra, wiec jego czas zegarowy NIE JEST przepustowoscia.
# Stosunki trafien sa wiarygodne, GB/s do DRAM tez - czas nie.
set -euo pipefail
cd "$(dirname "$0")/.."
source uruchom/00_srodowisko.sh

if [[ "${PROBNIE:-0}" == "1" ]]; then
  echo "### PRZEBIEG PROBNY - wyniki bez wartosci, sprawdzamy tylko, ze dziala"
  KANALY="0"; WSADY="256"; KROKOW=2
else
  KANALY=${KANALY:-"0 9 18"}
  WSADY=${WSADY:-"512 768 1024 1280 1536 1792 2048 2304 2560 3072 4096"}
  KROKOW=${KROKOW:-5}
fi
PRESET=${PRESET:-III_II}
METRYKI="gpu__time_duration.sum,lts__t_sector_hit_rate.pct,dram__bytes.sum.per_second,l1tex__t_sector_hit_rate.pct"

command -v ncu >/dev/null || {
  echo "Brak ncu. W obrazie trzeba zainstalowac cuda-nsight-compute, a"
  echo "kontener uruchomic z --cap-add=SYS_ADMIN --cap-add=SYS_PTRACE"
  echo "--security-opt seccomp=unconfined (patrz uruchom/w_dockerze.sh)."
  exit 1
}

echo "rozmiary stanu dla tego skanu:"
python3 eksperymenty.py stan --preset "$PRESET" --kanaly $KANALY
python3 eksperymenty.py stan --preset "$PRESET" --kanaly $KANALY --json \
    > "$WYNIKI/rozmiary_stanu.json"

for K in $KANALY; do
  KAT="$WYNIKI/liczniki_k${K}"
  mkdir -p "$KAT"

  echo
  echo "=== kanalow dodanych: $K ==========================================="
  echo "--- szukam jadra, ktore decyduje o czasie kroku"
  ncu --metrics gpu__time_duration.sum --csv --target-processes all \
      python3 narzedzia/krotki_przebieg.py --preset "$PRESET" --kanaly "$K" \
          --wsad 2048 --kroki 3 \
      > "$KAT/jadra.csv" 2>"$KAT/jadra.log" || true

  python3 narzedzia/najwazniejsze_jadro.py "$KAT/jadra.csv" \
      | tee "$KAT/jadra.txt"
  REGEX=$(python3 narzedzia/najwazniejsze_jadro.py "$KAT/jadra.csv" --tylko-regex)
  echo "--- regex: $REGEX"
  echo "$REGEX" > "$KAT/regex.txt"

  for B in $WSADY; do
    printf '    wsad %-6s ' "$B"
    if ncu --kernel-name "regex:$REGEX" --launch-count 10 \
           --cache-control none --metrics "$METRYKI" \
           --csv --target-processes all \
           python3 narzedzia/krotki_przebieg.py --preset "$PRESET" \
               --kanaly "$K" --wsad "$B" --kroki "$KROKOW" \
           > "$KAT/ncu_${B}.csv" 2>"$KAT/ncu_${B}.log"; then
      echo "ok"
    else
      echo "nie udalo sie (patrz $KAT/ncu_${B}.log)"
    fi
  done
done

echo
echo "=== wykresy i tabela ==============================================="
python3 narzedzia/wykres_rezydencji.py --katalog "$WYNIKI" \
    --rozmiary "$WYNIKI/rozmiary_stanu.json" --wyjscie rysunki

echo
echo "gotowe. Surowe CSV w $WYNIKI/liczniki_k*/, rysunki w rysunki/"
