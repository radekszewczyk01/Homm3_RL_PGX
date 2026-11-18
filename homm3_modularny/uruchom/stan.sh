#!/usr/bin/env bash
# Gdzie jest kolejka pomiarow. Nie wchodzi do tmuksa, nic nie przerywa.
#
#   ./uruchom/stan.sh            # jednorazowo
#   ./uruchom/stan.sh -w         # odswieza co 20 s, Ctrl+C konczy
set -uo pipefail
cd "$(dirname "$0")/.."

SESJA=${SESJA:-pomiary}
WYNIKI=${WYNIKI:-wyniki}
STAN="$WYNIKI/stan.tsv"
LOGI="$WYNIKI/logi"

pokaz() {
  echo "=============================================================="
  echo " stan serii      $(date '+%Y-%m-%d %H:%M:%S')"
  echo "=============================================================="

  if tmux has-session -t "$SESJA" 2>/dev/null; then
    echo " sesja tmuksa '$SESJA': ZYJE"
    ZYJE=1
  else
    echo " sesja tmuksa '$SESJA': nie ma"
    ZYJE=0
  fi

  if [[ ! -f "$STAN" ]]; then
    echo
    echo " Nie ma $STAN - kolejka jeszcze nie startowala."
    echo " Uruchomienie:  ./uruchom/kolejka.sh --probnie"
    return
  fi

  echo
  printf ' %-12s %-16s %9s  %s\n' ETAP STAN CZAS UWAGA
  printf ' %-12s %-16s %9s  %s\n' "------------" "----------------" \
         "--------" "--------------------"
  local trwajacy=""
  while IFS=$'\t' read -r nazwa stan sek uwaga; do
    [[ -z "${nazwa:-}" ]] && continue
    local czas="-"
    [[ "${sek:-0}" != "0" ]] && czas="$((sek / 60))m $((sek % 60))s"
    local etykieta
    case "$stan" in
      zrobiony)  etykieta="OK    zrobiony" ;;
      blad)      etykieta="BLAD  blad" ;;
      trwa)      etykieta="->    trwa"; trwajacy="$nazwa" ;;
      pominiety) etykieta="--    pominiety" ;;
      *)         etykieta="      $stan" ;;
    esac
    printf ' %-12s %-16s %9s  %s\n' "$nazwa" "$etykieta" "$czas" "${uwaga:-}"
  done < "$STAN"

  # etap oznaczony jako trwajacy, ale sesja nie zyje = przerwane w polowie
  if [[ -n "$trwajacy" && "$ZYJE" == "0" ]]; then
    echo
    echo " UWAGA: etap '$trwajacy' zostal w stanie 'trwa', a sesji nie ma."
    echo " Czyli przebieg zostal przerwany (ubity proces, restart maszyny)."
    echo " Log: $LOGI/$trwajacy.log"
  fi

  if [[ -n "$trwajacy" && "$ZYJE" == "1" ]]; then
    echo
    echo " --- ostatnie 12 linii z $LOGI/$trwajacy.log ---"
    tail -12 "$LOGI/$trwajacy.log" 2>/dev/null | sed 's/^/ /' \
      || echo " (log jeszcze pusty)"
  fi

  if [[ "$ZYJE" == "0" && -z "$trwajacy" ]]; then
    echo
    echo " Seria zakonczona. Wyniki:"
    ls -1 "$WYNIKI"/*.json 2>/dev/null | sed 's/^/   /' || echo "   (brak JSON-ow)"
    ls -1 rysunki/*.pdf 2>/dev/null | sed 's/^/   /' || true
  fi
  echo
}

if [[ "${1:-}" == "-w" ]]; then
  while true; do clear; pokaz; sleep 20; done
else
  pokaz
fi
