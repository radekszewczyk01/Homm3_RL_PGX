#!/usr/bin/env bash
# Uruchamia dowolna komende w kontenerze z JAX-em i dostepem do licznikow.
# Na tym serwerze JAX siedzi tylko w obrazie, wiec TO JEST domyslne wejscie
# do wszystkiego - skrypty z uruchom/ tez.
#
#   ./uruchom/w_dockerze.sh uruchom/01_szybkie.sh
#   ./uruchom/w_dockerze.sh uruchom/04_liczniki_l2.sh
#   KARTA=all ./uruchom/w_dockerze.sh python3 narzedzia/sprawdz_zegar.py --karta 1
#   ./uruchom/w_dockerze.sh bash                      # interaktywnie
#
# KARTA=0|1|2   przekazuje jedna karte; w kontenerze widac ja jako numer 0
# KARTA=all     przekazuje wszystkie trzy; wtedy numery sa jak na hoscie
#               i mozna wybrac karte przez CUDA_VISIBLE_DEVICES albo --karta
#
# DLACZEGO TE TRZY UPRAWNIENIA
# ----------------------------
# Liczniki sprzetowe sa poza zwykla piaskownica kontenera. Bez nich ncu
# zglasza ERR_NVGPU_NO_PERMISSION i nie pomaga na to bycie rootem w
# kontenerze - to uprawnienie jadra, nie uzytkownika:
#
#   --cap-add=SYS_ADMIN                 dostep do licznikow
#   --cap-add=SYS_PTRACE                podlaczenie sie do procesu
#   --security-opt seccomp=unconfined   wywolania systemowe profilera
#
# Jesli mimo tego ncu odmawia, na hoscie moze byc ustawione
# NVreg_RestrictProfilingToAdminUsers=1 (plik /etc/modprobe.d/*nvidia*).
set -euo pipefail

OBRAZ=${OBRAZ:-homm3_profil:latest}
KATALOG=${KATALOG:-$(cd "$(dirname "$0")/.." && pwd)}
MONTAZ=${MONTAZ:-/work}
KARTA=${KARTA:-0}
UDZIAL_PAM=${UDZIAL_PAM:-0.8}

# Literowka w sciezce montazu konczy sie tak, ze docker po cichu zaklada
# pusty katalog i pomiar leci na nieaktualnym kodzie. Dlatego sprawdzamy.
[[ -d "$KATALOG/homm3" ]] || {
  echo "W $KATALOG nie ma katalogu homm3/. Zla sciezka?"; exit 1; }

docker image inspect "$OBRAZ" >/dev/null 2>&1 || {
  echo "Nie ma obrazu $OBRAZ. Zbuduj go:"
  echo
  echo "  docker build -f Dockerfile.profil -t homm3_profil:latest \\"
  echo "      --build-arg BAZA=homm3_az_v2:latest ."
  echo
  echo "albo wskaz inny:  OBRAZ=homm3_az_v2:latest $0 $*"
  echo "(obraz bez Nsight Compute wystarczy do wszystkiego poza"
  echo " uruchom/04_liczniki_l2.sh)"
  exit 1; }

if [[ "$KARTA" == "all" ]]; then
  GPU_ARG="all"
  WIDOCZNE=""                       # numery jak na hoscie
else
  GPU_ARG="device=${KARTA}"
  WIDOCZNE="0"                      # jedna przekazana karta to numer 0
fi

# -it tylko gdy jest terminal; inaczej przebieg z tmuksa albo z potoku
# wywala sie na "the input device is not a TTY"
TTY_ARG=()
[[ -t 0 && -t 1 ]] && TTY_ARG=(-it)

echo "obraz:   $OBRAZ"
echo "katalog: $KATALOG -> $MONTAZ"
echo "karta:   $KARTA (--gpus $GPU_ARG)"

exec docker run --rm "${TTY_ARG[@]}" \
  --gpus "$GPU_ARG" \
  --cap-add=SYS_ADMIN \
  --cap-add=SYS_PTRACE \
  --security-opt seccomp=unconfined \
  -v "$KATALOG:$MONTAZ" \
  -w "$MONTAZ" \
  ${WIDOCZNE:+-e CUDA_VISIBLE_DEVICES=$WIDOCZNE} \
  -e XLA_PYTHON_CLIENT_MEM_FRACTION="$UDZIAL_PAM" \
  -e XLA_PYTHON_CLIENT_PREALLOCATE=false \
  "$OBRAZ" \
  "$@"
