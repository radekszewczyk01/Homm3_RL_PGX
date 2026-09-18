#!/usr/bin/env bash
# =====================================================================
#  Uruchamianie treningow rozdzialu 8 w tle.
#
#  Odporne na rozlaczenie sesji SSH: setsid odczepia proces od terminala,
#  wiec zamkniecie polaczenia (ani wylaczenie komputera lokalnego) go nie
#  przerywa.
#
#  UZYCIE
#      ./uruchom8.sh pilot          # przebieg probny, 25 min, 1 GPU
#      ./uruchom8.sh seria          # pelna seria, 15 przebiegow
#      ./uruchom8.sh stan           # sprawdzenie postepu
#      ./uruchom8.sh stop           # zatrzymanie wszystkiego
# =====================================================================

set -u

KATALOG="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOGI="${KATALOG}/logi"
BIEGI="${KATALOG}/runs"
DOCKER="${KATALOG}/../dock-run.sh"

mkdir -p "$LOGI" "$BIEGI"

# ---------------------------------------------------------------------
# Uruchomienie pojedynczego przebiegu na wskazanej karcie.
#   $1 = numer GPU, $2 = tag, $3 = ziarno, $4 = minuty, $5... = dodatkowe
# ---------------------------------------------------------------------
odpal() {
    local gpu="$1" tag="$2" seed="$3" minuty="$4"
    shift 4
    local nazwa="${tag}_s${seed}"
    local log="${LOGI}/${nazwa}.log"

    echo "GPU ${gpu}  ->  ${nazwa}  (${minuty} min)  log: ${log}"

    # setsid + nohup: proces przezywa zamkniecie sesji
    # python3 -u: bez buforowania, log zapisuje sie na biezaco
    setsid nohup env CUDA_VISIBLE_DEVICES="${gpu}" \
        "$DOCKER" python3 -u future_work/train8.py \
            --tag "${tag}" --seed "${seed}" --minutes "${minuty}" "$@" \
        > "${log}" 2>&1 < /dev/null &

    sleep 2
}

# ---------------------------------------------------------------------
case "${1:-pomoc}" in

pilot)
    echo "=== PRZEBIEG PROBNY ==="
    echo "Cel: sprawdzenie, czy agent w ogole sie uczy."
    echo "Czas: ok. 25 minut. Po zakonczeniu sprawdz ./uruchom8.sh stan"
    echo
    odpal 0 pilot 0 25
    echo
    echo "Mozesz sie rozlaczyc. Za pol godziny:"
    echo "    ./uruchom8.sh stan"
    ;;

seria)
    echo "=== SERIA WLASCIWA: 15 przebiegow x 3 h / 3 GPU = ok. 15 h ==="
    echo
    # Kolejka: 5 konfiguracji x 3 ziarna, po jednej na karte naraz.
    # Petla czeka na zwolnienie karty przed uruchomieniem kolejnego.
    cat > "${KATALOG}/.kolejka" << 'EOF'
puct-domyslny 0
puct-strojony 0
gumbel-m16 0
puct-domyslny 1
puct-strojony 1
gumbel-m16 1
puct-domyslny 2
puct-strojony 2
gumbel-m16 2
gumbel-m64 0
gumbel-m64 1
gumbel-m64 2
gumbel-m16-bez 0
gumbel-m16-bez 1
gumbel-m16-bez 2
EOF
    setsid nohup bash "${KATALOG}/uruchom8.sh" _pracownik \
        > "${LOGI}/kolejka.log" 2>&1 < /dev/null &
    sleep 1
    echo "Kolejka wystartowala w tle. Log: ${LOGI}/kolejka.log"
    echo "Mozesz sie rozlaczyc. Postep:  ./uruchom8.sh stan"
    ;;

_pracownik)
    # Wewnetrzny: przetwarza kolejke, trzy przebiegi naraz.
    MINUTY=180
    while read -r tag seed; do
        [ -z "$tag" ] && continue
        # czekaj na wolna karte
        while true; do
            for g in 0 1 2; do
                if [ ! -f "${KATALOG}/.zajete_${g}" ]; then
                    touch "${KATALOG}/.zajete_${g}"
                    dodatkowe=""
                    baza="$tag"
                    if [ "$tag" = "gumbel-m16-bez" ]; then
                        baza="gumbel-m16"
                        dodatkowe="--no-shaping"
                    fi
                    (
                        nazwa="${tag}_s${seed}"
                        log="${LOGI}/${nazwa}.log"
                        echo "$(date +%H:%M:%S) GPU ${g} -> ${nazwa}"
                        CUDA_VISIBLE_DEVICES="${g}" "$DOCKER" \
                            python3 -u future_work/train8.py \
                            --tag "${baza}" --seed "${seed}" \
                            --minutes "${MINUTY}" --odcinek 128 --krokow-uczenia 128 ${dodatkowe} \
                            > "${log}" 2>&1 < /dev/null
                        rm -f "${KATALOG}/.zajete_${g}"
                    ) &
                    sleep 5
                    break 2
                fi
            done
            sleep 30
        done
    done < "${KATALOG}/.kolejka"
    wait
    echo "$(date +%H:%M:%S) KOLEJKA ZAKONCZONA"
    ;;

stan)
    echo "=== STAN PRZEBIEGOW ==="
    printf "%-24s %-10s %s\n" "przebieg" "status" "postep"
    printf -- "-%.0s" {1..70}; echo
    for d in "${BIEGI}"/*/; do
        [ -d "$d" ] || continue
        n=$(basename "$d")
        s=$(cat "${d}/STATUS" 2>/dev/null || echo "BRAK")
        printf "%-24s %s\n" "$n" "$s"
    done
    echo
    echo "=== OSTATNIE WPISY W LOGACH ==="
    for f in "${LOGI}"/*.log; do
        [ -f "$f" ] || continue
        echo "--- $(basename "$f") ---"
        tail -n 3 "$f"
    done
    echo
    echo "=== KARTY ==="
    nvidia-smi --query-gpu=index,utilization.gpu,memory.used \
               --format=csv,noheader 2>/dev/null || echo "brak nvidia-smi"
    ;;

stop)
    echo "Zatrzymywanie wszystkich przebiegow..."
    pkill -f "uruchom8.sh _pracownik" 2>/dev/null || true
    pkill -f "train8.py" 2>/dev/null || true
    docker kill $(docker ps -q) 2>/dev/null || true
    rm -f "${KATALOG}"/.zajete_*
    echo "zatrzymano"
    ;;

*)
    sed -n '2,20p' "${BASH_SOURCE[0]}" | sed 's/^# \?//'
    ;;
esac