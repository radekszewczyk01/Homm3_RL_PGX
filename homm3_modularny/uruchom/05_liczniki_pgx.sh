#!/usr/bin/env bash
# Liczniki sprzetowe dla srodowisk PGX - czy poprawiony model progu przenosi
# sie na CUDZA implementacje.
#
# PO CO TO JEST
# ------------
# Poprawiony model progu mowi, ze zalamanie przepustowosci wypada tam, gdzie
# SLAD PAMIECIOWY mierzonego jadra przestaje sie miescic w L2:
#
#     B_thr ~ 0.95 * C_L2 / F,   F = slad jadra na jedno srodowisko
#
# Wersja z 2BD zostala obalona: optimum nie drgnelo przy dwukrotnej zmianie D
# w dwoch roznych implementacjach naszego silnika, a trafienia w L2 wynosily
# 100 procent przy zbiorze roboczym 139 MiB w pamieci 72 MiB.
#
# Ale poprawiony model jest na razie skalibrowany na JEDNYM srodowisku -
# naszym. Z pomiarow czasowych wiemy, ze szachy z PGX tez sie zalamuja, o
# czynnik 1,88, przy wsadzie miedzy 1024 i 1536. Czego NIE wiemy, to czy z
# tego samego powodu. Jesli zmierzony slad jadra szachow da prog tam, gdzie
# szachy faktycznie sie zalamuja, model przenosi sie miedzy niezaleznymi
# programami. Jesli nie - jest dopasowaniem i trzeba to napisac.
#
# To jest jedyny sposob, zeby odpowiedziec na to pytanie, bo czasy same w
# sobie moga sie zgadzac przypadkiem.
#
# UWAGA, TE SAME DWIE PULAPKI CO W 04
# -----------------------------------
# 1. --cache-control none jest OBOWIAZKOWE. Domyslne plukanie pamieci miedzy
#    przebiegami powtorzeniowymi niszczy dokladnie to ponowne uzycie miedzy
#    jadrami, ktore badamy, i daje plaski wynik wygladajacy na liczbe.
# 2. Wyrazenie na nazwe jadra musi byc ZAKOTWICZONE. Raz juz regex po
#    przedrostku zlapal trzy rozne jadra, ncu je usrednilo, a wyliczony slad
#    nie nalezal do zadnego z nich.
#
# ncu serializuje jadra, wiec jego czas zegarowy NIE JEST przepustowoscia.
# Stosunki trafien i GB/s do DRAM sa wiarygodne, czas nie.
set -euo pipefail
cd "$(dirname "$0")/.."
source uruchom/00_srodowisko.sh

if [[ "${PROBNIE:-0}" == "1" ]]; then
  echo "### PRZEBIEG PROBNY - sprawdzamy tylko, ze dziala"
  SRODOWISKA=${SRODOWISKA:-"chess"}; WSADY="128 256"; KROKOW=2
else
  # Domyslnie te dwa, bo tylko one zalamuja sie w mierzalnym zakresie.
  # go_9x9 rosnie do konca skanu, go_19x19 saturuje bez zalamania, shogi ma
  # powtarzalna niemonotoniczna krzywa - dla nich prog nie istnieje i nie ma
  # czego z modelem zestawiac.
  SRODOWISKA=${SRODOWISKA:-"chess"}
  # Zakres ma OBEJMOWAC zalamanie, nie konczyc sie przed nim. Dla szachow
  # szczyt wypada przy 512, a zalamanie miedzy 1024 i 1536.
  WSADY=${WSADY:-"128 256 384 512 640 768 896 1024 1152 1280 1536 2048 3072"}
  KROKOW=${KROKOW:-5}
fi
METRYKI="gpu__time_duration.sum,lts__t_sector_hit_rate.pct,dram__bytes.sum.per_second,l1tex__t_sector_hit_rate.pct"

command -v ncu >/dev/null || {
  echo "Brak ncu. W obrazie trzeba zainstalowac cuda-nsight-compute, a"
  echo "kontener uruchomic z --cap-add=SYS_ADMIN --cap-add=SYS_PTRACE"
  echo "--security-opt seccomp=unconfined (patrz uruchom/w_dockerze.sh)."
  exit 1
}

for SROD in $SRODOWISKA; do
  SKAN="$WYNIKI/skan_pgx_${SROD}"
  KAT="$SKAN/liczniki_k0"
  mkdir -p "$KAT"

  echo
  echo "=== $SROD ==========================================================="
  echo "katalog tego skanu: $SKAN"

  # rozmiar stanu wprost ze srodowiska, zeby nie przepisywac go recznie
  python3 - "$SROD" > "$SKAN/rozmiary_stanu.json" <<'PYEOF'
import json, sys
import jax, pgx
env = pgx.make(sys.argv[1])
s = jax.jit(env.init)(jax.random.PRNGKey(0))
D = sum(int(l.nbytes) for l in jax.tree_util.tree_leaves(s))
json.dump([{"kanalow_dodanych": 0, "kanalow": 0, "D": D,
            "A": int(env.num_actions), "srodowisko": sys.argv[1]}],
          sys.stdout, indent=2)
PYEOF

  python3 -c "
import json
d = json.load(open('$SKAN/rozmiary_stanu.json'))
assert d and 'D' in d[0], 'brak pol'
print(f\"  rozmiar stanu: D = {d[0]['D']:,} B, akcji {d[0]['A']:,}\")
" || { echo "Plik rozmiarow uszkodzony, nie zbieram licznikow."; exit 1; }

  echo "--- szukam jadra, ktore decyduje o czasie kroku"
  ncu --metrics gpu__time_duration.sum --csv --target-processes all \
      python3 narzedzia/krotki_przebieg.py --pgx "$SROD" \
          --wsad 512 --kroki 3 \
      > "$KAT/jadra.csv" 2>"$KAT/jadra.log" || true

  python3 narzedzia/najwazniejsze_jadro.py "$KAT/jadra.csv" | tee "$KAT/jadra.txt"
  REGEX=$(python3 narzedzia/najwazniejsze_jadro.py "$KAT/jadra.csv" --tylko-regex)
  echo "--- regex: $REGEX"
  echo "$REGEX" > "$KAT/regex.txt"

  for B in $WSADY; do
    printf '    wsad %-6s ' "$B"
    if ncu --kernel-name "regex:$REGEX" --launch-count 10 \
           --cache-control none --metrics "$METRYKI" \
           --csv --target-processes all \
           python3 narzedzia/krotki_przebieg.py --pgx "$SROD" \
               --wsad "$B" --kroki "$KROKOW" \
           > "$KAT/ncu_${B}.csv" 2>"$KAT/ncu_${B}.log"; then
      echo "ok"
    else
      echo "nie udalo sie (patrz $KAT/ncu_${B}.log)"
    fi
  done

  echo
  python3 narzedzia/wykres_rezydencji.py --katalog "$SKAN" \
      --rozmiary "$SKAN/rozmiary_stanu.json" \
      --wyjscie "rysunki/pgx_${SROD}" || true
done

echo
echo "=== slad jadra i prog, zestawienie ze naszym silnikiem ============="
PLIKI=()
for f in "$WYNIKI"/skan_*/rezydencja.json; do
  [[ -e "$f" ]] && PLIKI+=("$f")
done
if [[ ${#PLIKI[@]} -gt 0 ]]; then
  python3 narzedzia/analiza_progu.py --plik "${PLIKI[@]}" || true
else
  echo "Brak plikow rezydencja.json - uruchom najpierw 04_liczniki_l2.sh"
fi

echo
echo "CZYTANIE WYNIKU"
echo "  Interesuje nas jedna liczba: slad jadra na srodowisko (F) i prog"
echo "  0.95*C_L2/F zestawiony z wsadem, przy ktorym srodowisko faktycznie"
echo "  sie zalamuje. Dla szachow zalamanie wypada miedzy 1024 i 1536."
echo "  Jesli prog z modelu tam wypada, model przenosi sie na implementacje,"
echo "  ktorej nie pisalismy. Jesli nie - jest dopasowany do naszej i tak"
echo "  trzeba to napisac w artykule."
