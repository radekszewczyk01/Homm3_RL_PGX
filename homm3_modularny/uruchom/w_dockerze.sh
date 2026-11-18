#!/usr/bin/env bash
# Uruchamia dowolna komende w kontenerze z JAX-em i dostepem do licznikow.
# Na tym serwerze JAX siedzi tylko w obrazie, wiec TO JEST domyslne wejscie
# do wszystkiego - skrypty z uruchom/ tez.
#
#   ./uruchom/w_dockerze.sh uruchom/01_szybkie.sh
#   KARTA=all ./uruchom/w_dockerze.sh python3 narzedzia/sprawdz_zegar.py --karta 1
#   ./uruchom/w_dockerze.sh bash                      # interaktywnie
#
# KARTA=0|1|2   przekazuje jedna karte; w kontenerze widac ja jako numer 0
# KARTA=all     przekazuje wszystkie trzy; wtedy numery sa jak na hoscie
#
# DLACZEGO OGRANICZAMY MOZLIWOSCI STEROWNIKA DO compute,utility
# -------------------------------------------------------------
# Srodowisko uruchomieniowe NVIDII montuje do kontenera biblioteki sterownika
# wedlug zmiennej NVIDIA_DRIVER_CAPABILITIES. Jesli obraz prosi o 'all',
# montowane sa tez biblioteki graficzne - EGL, Wayland, OpenGL. Po aktualizacji
# sterownika lista tych plikow bywa nieaktualna i kontener nie startuje:
#
#   failed to fulfil mount request:
#   open /usr/lib/x86_64-linux-gnu/libnvidia-egl-wayland.so.1.1.21:
#   no such file or directory
#
# Do obliczen i do nvidia-smi grafika nie jest potrzebna wcale, a ncu dziala
# na 'compute,utility'. Wiec nie naprawiamy listy bibliotek (do tego trzeba
# roota i ldconfig), tylko o te biblioteki nie prosimy.
#
# Jesli kiedys bedzie potrzebna grafika: CAPS=all ./uruchom/w_dockerze.sh ...
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
set -euo pipefail

OBRAZ=${OBRAZ:-homm3_profil:latest}
KATALOG=${KATALOG:-$(cd "$(dirname "$0")/.." && pwd)}
MONTAZ=${MONTAZ:-/work}
KARTA=${KARTA:-0}
UDZIAL_PAM=${UDZIAL_PAM:-0.8}
CAPS=${CAPS:-compute,utility}
BEZ_SPRAWDZENIA=${BEZ_SPRAWDZENIA:-0}

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

WSPOLNE=(
  --rm
  --gpus "$GPU_ARG"
  --cap-add=SYS_ADMIN
  --cap-add=SYS_PTRACE
  --security-opt seccomp=unconfined
  -v "$KATALOG:$MONTAZ"
  -w "$MONTAZ"
  -e NVIDIA_DRIVER_CAPABILITIES="$CAPS"
  -e XLA_PYTHON_CLIENT_MEM_FRACTION="$UDZIAL_PAM"
  -e XLA_PYTHON_CLIENT_PREALLOCATE=false
)
[[ -n "$WIDOCZNE" ]] && WSPOLNE+=(-e CUDA_VISIBLE_DEVICES="$WIDOCZNE")

# --- sprawdzenie, czy kontener w ogole wstaje ---------------------------
# Dwie sekundy teraz oszczedzaja zgadywania potem: blad srodowiska
# uruchomieniowego wyglada identycznie jak blad w kodzie, a nim nie jest.
if [[ "$BEZ_SPRAWDZENIA" != "1" ]]; then
  # --entrypoint na sztywno: gdyby obraz mial wlasny punkt wejscia, 'true'
  # staloby sie jego argumentem i sprawdzenie padalo by bez winy sterownika
  BLAD=$(docker run --entrypoint /bin/true "${WSPOLNE[@]}" "$OBRAZ" \
         2>&1 >/dev/null) || {
    echo "Kontener nie wstaje. Docker powiedzial tyle:"
    echo
    echo "  $BLAD"
    echo
    if grep -q "failed to fulfil mount request" <<<"$BLAD"; then
      PLIK=$(grep -oP '(?<=open )[^:]+' <<<"$BLAD" | head -1)
      echo "To jest nieaktualna lista bibliotek sterownika, nie blad w kodzie."
      echo "Srodowisko uruchomieniowe NVIDII chce zamontowac plik, ktorego"
      echo "na hoscie nie ma:"
      echo
      echo "  $PLIK"
      echo
      echo "Sprawdz, co faktycznie lezy obok:"
      echo "  ls -la $(dirname "${PLIK:-/usr/lib/x86_64-linux-gnu}")/libnvidia-egl-wayland*"
      echo
      echo "Ten skrypt prosi juz tylko o NVIDIA_DRIVER_CAPABILITIES=$CAPS,"
      echo "wiec jesli blad nadal dotyczy biblioteki graficznej, znaczy, ze"
      echo "obraz wymusza swoje. Sprawdz:"
      echo "  docker image inspect $OBRAZ | grep -i NVIDIA_DRIVER_CAP"
      echo
      echo "Naprawa po stronie hosta (wymaga roota, do poproszenia promotora):"
      echo "  sudo ldconfig        # odswieza liste bibliotek"
      echo "  sudo nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml"
      echo
      echo "Obejscie, jesli nic z powyzszego: CAPS=compute ./uruchom/w_dockerze.sh ..."
    elif grep -qi "could not select device driver\|nvidia-container-cli" <<<"$BLAD"; then
      echo "Srodowisko uruchomieniowe NVIDII nie odpowiada. Sprawdz:"
      echo "  nvidia-smi                      # czy sterownik zyje"
      echo "  docker info | grep -i runtime    # czy nvidia jest na liscie"
    fi
    exit 1
  }
fi

echo "obraz:   $OBRAZ"
echo "katalog: $KATALOG -> $MONTAZ"
echo "karta:   $KARTA (--gpus $GPU_ARG), mozliwosci sterownika: $CAPS"

exec docker run "${TTY_ARG[@]}" "${WSPOLNE[@]}" "$OBRAZ" "$@"
