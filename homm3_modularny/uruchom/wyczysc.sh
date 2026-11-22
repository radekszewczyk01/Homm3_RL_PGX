#!/usr/bin/env bash
# Usuwa katalogi wynikow, ktore naleza do roota.
#
# PO CO TO JEST
# -------------
# Kontener chodzil jako root, wiec wszystko, co w nim powstalo w zamontowanym
# katalogu, nalezy na hoscie do roota - i wlasnych wynikow nie da sie usunac:
#
#     rm: cannot remove 'wyniki/liczniki_k9/ncu_8192.csv': Permission denied
#
# Od teraz kontener oddaje pliki na wyjsciu (patrz uruchom/_wstrzyknij.sh),
# wiec nowe przebiegi tego problemu nie maja. Ten skrypt jest do tego, co
# zostalo po starych - usuwa je przez kontener, bo tam mamy roota, zamiast
# wymagac sudo na hoscie.
#
# UZYCIE
#   ./uruchom/wyczysc.sh                 # pokaz, co by usunal, i spytaj
#   ./uruchom/wyczysc.sh --tak           # usun bez pytania
#   ./uruchom/wyczysc.sh wyniki rysunki  # tylko wskazane katalogi
#   ./uruchom/wyczysc.sh --oddaj         # NIE usuwaj, tylko oddaj pliki
#
# Ostatni tryb jest zwykle tym, czego chcesz, jesli wyniki sa jeszcze
# potrzebne: zmienia tylko wlasciciela, nie rusza zawartosci.
set -euo pipefail
cd "$(dirname "$0")/.."

PYTAJ=1
ODDAJ=0
KATALOGI=()
for a in "$@"; do
  case "$a" in
    --tak)   PYTAJ=0 ;;
    --oddaj) ODDAJ=1 ;;
    -h|--help) sed -n '2,24p' "$0" | sed 's/^# \?//'; exit 0 ;;
    *)       KATALOGI+=("$a") ;;
  esac
done

# Domyslnie wszystko, co produkuja etapy
if [[ ${#KATALOGI[@]} -eq 0 ]]; then
  for k in wyniki wyniki_* rysunki tabele; do
    [[ -e "$k" ]] && KATALOGI+=("$k")
  done
fi

if [[ ${#KATALOGI[@]} -eq 0 ]]; then
  echo "Nie ma czego czyscic - zadnego z katalogow wynikow nie znalazlem."
  exit 0
fi

echo "Katalogi:"
for k in "${KATALOGI[@]}"; do
  # ile w nich jest i czyje to, zeby bylo widac, czy problem w ogole istnieje
  ILE=$(find "$k" -type f 2>/dev/null | wc -l)
  ROOTA=$(find "$k" -type f -uid 0 2>/dev/null | wc -l)
  ROZMIAR=$(du -sh "$k" 2>/dev/null | cut -f1)
  printf '  %-24s %6s plikow, z tego %s roota, %s\n' \
    "$k" "$ILE" "$ROOTA" "$ROZMIAR"
done
echo

if [[ "$ODDAJ" == "1" ]]; then
  echo "Tryb --oddaj: zmieniam wlasciciela na $(id -un):$(id -gn),"
  echo "zawartosci NIE ruszam."
else
  echo "USUNE te katalogi w calosci. Jesli wyniki sa jeszcze potrzebne,"
  echo "przerwij i uzyj  ./uruchom/wyczysc.sh --oddaj"
fi
echo

if [[ "$PYTAJ" == "1" ]]; then
  read -r -p "Dalej? [t/N] " ODP
  [[ "$ODP" == "t" || "$ODP" == "T" ]] || { echo "Przerwane."; exit 1; }
fi

# Jedno wejscie do kontenera na wszystko. Zmienne idą przez srodowisko, zeby
# nazwy katalogow nie przechodzily przez interpretacje powloki wewnatrz -c.
if [[ "$ODDAJ" == "1" ]]; then
  KATALOGI_LISTA="${KATALOGI[*]}" \
  CEL="$(id -u):$(id -g)" \
  ./uruchom/w_dockerze.sh bash -c '
    for k in $KATALOGI_LISTA; do
      [[ -e "$k" ]] && chown -R "$CEL" "$k" && echo "  oddane: $k"
    done'
else
  KATALOGI_LISTA="${KATALOGI[*]}" \
  ./uruchom/w_dockerze.sh bash -c '
    for k in $KATALOGI_LISTA; do
      [[ -e "$k" ]] && rm -rf -- "$k" && echo "  usuniete: $k"
    done'
fi

echo
echo "Gotowe. Sprawdzenie:"
for k in "${KATALOGI[@]}"; do
  if [[ -e "$k" ]]; then
    ROOTA=$(find "$k" -type f -uid 0 2>/dev/null | wc -l)
    printf '  %-24s istnieje, plikow roota: %s\n' "$k" "$ROOTA"
  else
    printf '  %-24s usuniety\n' "$k"
  fi
done
