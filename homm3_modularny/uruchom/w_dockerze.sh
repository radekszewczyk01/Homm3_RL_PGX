#!/usr/bin/env bash
# Uruchamia dowolny skrypt pomiarowy w kontenerze z dostepem do licznikow.
#
#   ./uruchom/w_dockerze.sh uruchom/01_szybkie.sh
#   ./uruchom/w_dockerze.sh uruchom/04_liczniki_l2.sh
#   ./uruchom/w_dockerze.sh bash            # interaktywnie
#
# DLACZEGO TE TRZY UPRAWNIENIA
# ----------------------------
# Liczniki sprzetowe sa poza zwyklym piaskownica kontenera. Bez nich ncu
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
KARTA=${KARTA:-1}
UDZIAL_PAM=${UDZIAL_PAM:-0.6}

# Literowka w sciezce montazu konczy sie tak, ze docker po cichu zaklada
# pusty katalog i pomiar leci na nieaktualnym kodzie. Dlatego sprawdzamy.
[[ -d "$KATALOG/homm3" ]] || {
  echo "W $KATALOG nie ma katalogu homm3/. Zla sciezka?"; exit 1; }

echo "obraz:   $OBRAZ"
echo "katalog: $KATALOG -> $MONTAZ"
echo "karta:   $KARTA"

exec docker run --rm -it \
  --gpus "device=${KARTA}" \
  --cap-add=SYS_ADMIN \
  --cap-add=SYS_PTRACE \
  --security-opt seccomp=unconfined \
  -v "$KATALOG:$MONTAZ" \
  -w "$MONTAZ" \
  -e CUDA_VISIBLE_DEVICES=0 \
  -e XLA_PYTHON_CLIENT_MEM_FRACTION="$UDZIAL_PAM" \
  -e XLA_PYTHON_CLIENT_PREALLOCATE=false \
  "$OBRAZ" \
  "$@"
