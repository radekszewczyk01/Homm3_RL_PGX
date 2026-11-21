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
# BEZ_KARTY=1   bez karty wcale, JAX na procesorze
# BEZ_CDI=1     wymusza wstrzykniecie sterownika recznie (patrz nizej)
# BEZ_CDI=0     zabrania tego i kaze uzywac tylko --gpus
#
# TRZY DROGI DO KARTY I DLACZEGO SA TRZY
# --------------------------------------
# 1. --gpus (droga normalna). Docker wola srodowisko uruchomieniowe NVIDII,
#    ktore czyta specyfikacje urzadzen i montuje wymienione w niej biblioteki
#    sterownika. Dziala, dopoki specyfikacja zgadza sie z tym, co lezy na
#    hoscie. Na tej maszynie NIE ZGADZA SIE: spis prosi o
#    libnvidia-egl-wayland.so.1.1.21, a jest 1.1.23, i kontener nie wstaje.
#    Naprawa wymaga roota (przegenerowania specyfikacji).
#
# 2. Wstrzykniecie recznie (BEZ_CDI=1). Pomijamy cale srodowisko uruchomieniowe
#    NVIDII: podajemy wezly urzadzen przez --device i montujemy same biblioteki
#    sterownika, ktore sa potrzebne do obliczen. Nie potrzeba roota, bo wezly
#    /dev/nvidia* sa czytelne dla wszystkich, a biblioteki montujemy tylko do
#    odczytu. Biblioteki graficzne - czyli te zepsute - nie sa w ogole
#    dotykane, bo do liczenia nie sluza.
#
#    To NIE ZMIENIA tego, co mierzymy. Ten sam sterownik, te same biblioteki,
#    ten sam sprzet - inny jest tylko sposob, w jaki staja sie widoczne
#    w kontenerze.
#
# 3. Bez karty (BEZ_KARTY=1). Dla tej czesci eksperymentow, ktora od sprzetu
#    nie zalezy.
#
# Domyslnie skrypt probuje drogi pierwszej, a gdy nie wstaje - przechodzi na
# druga i mowi o tym wyraznie. Cichy zapas byl by gorszy od zadnego: trzeba
# wiedziec, ze maszyna jest w stanie nienaprawionym.
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
BEZ_KARTY=${BEZ_KARTY:-0}
BEZ_CDI=${BEZ_CDI:-auto}

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

# -it tylko gdy jest terminal; inaczej przebieg z tmuksa albo z potoku
# wywala sie na "the input device is not a TTY"
TTY_ARG=()
[[ -t 0 && -t 1 ]] && TTY_ARG=(-it)

WSPOLNE=(--rm -v "$KATALOG:$MONTAZ" -w "$MONTAZ")
PROFILOWANIE=(
  --cap-add=SYS_ADMIN
  --cap-add=SYS_PTRACE
  --security-opt seccomp=unconfined
)
PAMIEC=(
  -e XLA_PYTHON_CLIENT_MEM_FRACTION="$UDZIAL_PAM"
  -e XLA_PYTHON_CLIENT_PREALLOCATE=false
)

# ===========================================================================
# wstrzykniecie sterownika recznie
# ===========================================================================

# Katalogi, w ktorych szukamy bibliotek sterownika. Rozdzielone dwukropkiem,
# nadpisywalne - na innej dystrybucji moga lezec gdzie indziej.
IFS=: read -r -a KATALOGI_STEROWNIKA <<< \
  "${KATALOGI_STEROWNIKA:-/usr/lib/x86_64-linux-gnu:/lib/x86_64-linux-gnu:/usr/lib64}"

znajdz_biblioteke() {   # wzorzec -> sciezka najnowszej pasujacej
  local wzorzec="$1" kat p
  local -a trafienia
  for kat in "${KATALOGI_STEROWNIKA[@]}"; do
    [[ -d "$kat" ]] || continue
    trafienia=()
    while IFS= read -r p; do
      [[ -f "$p" ]] && trafienia+=("$p")
    done < <(compgen -G "$kat/$wzorzec" 2>/dev/null | sort -V || true)
    if ((${#trafienia[@]})); then
      printf '%s\n' "${trafienia[-1]}"   # najwyzsza wersja, nie dowiazanie
      return 0
    fi
  done
  return 1
}

# nazwa, pod ktora biblioteka ma byc widoczna w kontenerze  <-  wzorzec na hoscie
# Tylko to, co potrzebne do OBLICZEN. Zadnej grafiki, zadnego EGL-a.
BIBLIOTEKI=(
  "libcuda.so.1:libcuda.so.[0-9]*"
  "libnvidia-ptxjitcompiler.so.1:libnvidia-ptxjitcompiler.so.[0-9]*"
  "libnvidia-nvvm.so.4:libnvidia-nvvm.so.[0-9]*"
  "libnvidia-ml.so.1:libnvidia-ml.so.[0-9]*"
  "libcudadebugger.so.1:libcudadebugger.so.[0-9]*"
)

BRAKUJACE=()

zbuduj_argumenty_recznie() {
  ARGUMENTY_RECZNE=()
  BRAKUJACE=()

  # /dev/nvidia-uvm pojawia sie dopiero, gdy cokolwiek uzyje CUDA. Zwykle
  # tworzy go nvidia-modprobe, ktory jest setuid - czyli mozna go wywolac
  # bez roota. Bez tego wezla JAX nie zainicjuje karty.
  if [[ ! -e /dev/nvidia-uvm ]] && command -v nvidia-modprobe >/dev/null; then
    nvidia-modprobe -u -c 0 >/dev/null 2>&1 || true
  fi

  local w
  for w in /dev/nvidiactl /dev/nvidia-uvm /dev/nvidia-uvm-tools; do
    if [[ -e "$w" ]]; then
      ARGUMENTY_RECZNE+=(--device "$w")
    else
      BRAKUJACE+=("$w")
    fi
  done

  if [[ "$KARTA" == "all" ]]; then
    local znalezione=0
    for w in /dev/nvidia[0-9]*; do
      [[ -e "$w" ]] || continue
      ARGUMENTY_RECZNE+=(--device "$w")
      znalezione=1
    done
    ((znalezione)) || BRAKUJACE+=("/dev/nvidia0")
  else
    if [[ -e "/dev/nvidia${KARTA}" ]]; then
      ARGUMENTY_RECZNE+=(--device "/dev/nvidia${KARTA}")
    else
      BRAKUJACE+=("/dev/nvidia${KARTA}")
    fi
  fi

  local wpis nazwa wzorzec sciezka
  for wpis in "${BIBLIOTEKI[@]}"; do
    nazwa="${wpis%%:*}"
    wzorzec="${wpis#*:}"
    if sciezka=$(znajdz_biblioteke "$wzorzec"); then
      ARGUMENTY_RECZNE+=(-v "$sciezka:/usr/lib/x86_64-linux-gnu/$nazwa:ro")
    elif [[ "$nazwa" == libcuda.so.1 || "$nazwa" == libnvidia-ml.so.1 ]]; then
      BRAKUJACE+=("$nazwa")       # bez tych dwoch nie ma o czym mowic
    fi
  done

  # nvidia-smi przydaje sie w kontenerze do opisu otoczenia i do zegara
  [[ -x /usr/bin/nvidia-smi ]] \
    && ARGUMENTY_RECZNE+=(-v /usr/bin/nvidia-smi:/usr/bin/nvidia-smi:ro)

  # Sciezka poszukiwania: obraz ustawia /usr/local/nvidia/lib{,64}, a my
  # wkladamy biblioteki tam, gdzie leza normalnie. Podajemy jedno i drugie,
  # zeby nie liczyc na to, ze spis bibliotek w obrazie je zobaczy.
  ARGUMENTY_RECZNE+=(
    -e LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/nvidia/lib:/usr/local/nvidia/lib64:/usr/local/cuda/lib64
  )
  [[ "$KARTA" != "all" ]] && ARGUMENTY_RECZNE+=(-e CUDA_VISIBLE_DEVICES=0)
  return 0
}

# ===========================================================================
# wybor drogi
# ===========================================================================

ARGUMENTY_KARTY=()
OPIS_DROGI=""

if [[ "$BEZ_KARTY" == "1" ]]; then
  # Co z tego trybu jest WAZNE: wszystko, co nie zalezy od sprzetu - rozmiar
  # stanu D, przestrzen akcji, model pamieciowy drzewa, niezmienniki,
  # semantyka mechanik, pokrycie. Te liczby sa identyczne na procesorze
  # i na karcie, bo wynikaja z definicji, nie z pomiaru.
  #
  # Czego NIE WOLNO z niego brac: ani jednej liczby czasowej, ani zadnej
  # liczby z kompilatora (flopy, bajty, jadra) - procesor fuzjuje zupelnie
  # inaczej niz karta i wartosci sa nieporownywalne.
  ARGUMENTY_KARTY=(-e JAX_PLATFORMS=cpu)
  OPIS_DROGI="BRAK karty (JAX na procesorze)"
else
  if [[ "$KARTA" == "all" ]]; then
    GPU_ARG="all"
  else
    GPU_ARG="device=${KARTA}"
  fi

  ARGUMENTY_GPUS=(--gpus "$GPU_ARG" -e NVIDIA_DRIVER_CAPABILITIES="$CAPS")
  [[ "$KARTA" != "all" ]] && ARGUMENTY_GPUS+=(-e CUDA_VISIBLE_DEVICES=0)

  wstaje() {   # probuje uruchomic kontener z podanymi argumentami
    docker run --entrypoint /bin/true "${WSPOLNE[@]}" "${PROFILOWANIE[@]}" \
      "$@" "$OBRAZ" 2>&1 >/dev/null
  }

  if [[ "$BEZ_CDI" == "1" ]]; then
    zbuduj_argumenty_recznie
    ARGUMENTY_KARTY=("${ARGUMENTY_RECZNE[@]}")
    OPIS_DROGI="karta $KARTA, sterownik wstrzykniety recznie (wymuszone)"
  elif [[ "$BEZ_SPRAWDZENIA" == "1" ]]; then
    ARGUMENTY_KARTY=("${ARGUMENTY_GPUS[@]}")
    OPIS_DROGI="karta $KARTA (--gpus $GPU_ARG), bez sprawdzenia"
  else
    # Dwie sekundy teraz oszczedzaja zgadywania potem: blad srodowiska
    # uruchomieniowego wyglada identycznie jak blad w kodzie, a nim nie jest.
    if BLAD=$(wstaje "${ARGUMENTY_GPUS[@]}"); then
      ARGUMENTY_KARTY=("${ARGUMENTY_GPUS[@]}")
      OPIS_DROGI="karta $KARTA (--gpus $GPU_ARG), mozliwosci sterownika: $CAPS"
    else
      MONTAZ_PADL=0
      grep -q "failed to fulfil mount request" <<<"$BLAD" && MONTAZ_PADL=1

      if [[ "$BEZ_CDI" == "0" || "$MONTAZ_PADL" != "1" ]]; then
        echo "Kontener nie wstaje. Docker powiedzial tyle:"
        echo
        echo "  $BLAD"
        echo
        if grep -qi "could not select device driver\|nvidia-container-cli" <<<"$BLAD"; then
          echo "Srodowisko uruchomieniowe NVIDII nie odpowiada. Sprawdz:"
          echo "  nvidia-smi                       # czy sterownik zyje"
          echo "  docker info | grep -i runtime    # czy nvidia jest na liscie"
        fi
        echo "Pelna diagnostyka: ./narzedzia/sprawdz_dockera.sh"
        exit 1
      fi

      # Droga normalna padla na montowaniu bibliotek - probujemy recznie.
      zbuduj_argumenty_recznie
      if ((${#BRAKUJACE[@]})); then
        echo "Droga przez --gpus nie dziala (nieaktualny spis bibliotek),"
        echo "a wstrzykniecie recznie tez sie nie uda - brakuje:"
        printf '  %s\n' "${BRAKUJACE[@]}"
        echo
        echo "Pelna diagnostyka: ./narzedzia/sprawdz_dockera.sh"
        exit 1
      fi
      if BLAD2=$(wstaje "${ARGUMENTY_RECZNE[@]}"); then
        ARGUMENTY_KARTY=("${ARGUMENTY_RECZNE[@]}")
        OPIS_DROGI="karta $KARTA, sterownik wstrzykniety recznie (zapas)"
        echo "================================================================"
        echo " UWAGA: droga przez --gpus NIE DZIALA na tej maszynie."
        echo " Spis bibliotek sterownika jest nieaktualny i kontener nie"
        echo " wstaje. Omijam go i wstrzykuje sterownik recznie."
        echo
        echo " Pomiary sa wazne - ten sam sprzet, ten sam sterownik, te same"
        echo " biblioteki. Inny jest tylko sposob, w jaki staja sie widoczne."
        echo
        echo " Host nadal wymaga naprawy przez administratora:"
        echo "   sudo nvidia-ctk cdi generate --output=/var/run/cdi/nvidia.yaml"
        echo " Wymuszenie tej drogi bez komunikatu:  BEZ_CDI=1"
        echo "================================================================"
      else
        echo "Nie wstaje ani przez --gpus, ani recznie."
        echo
        echo "--gpus powiedzial:"
        echo "  $BLAD"
        echo
        echo "recznie powiedzialo:"
        echo "  $BLAD2"
        echo
        echo "Pelna diagnostyka: ./narzedzia/sprawdz_dockera.sh"
        exit 1
      fi
    fi
  fi
fi

echo "obraz:   $OBRAZ"
echo "katalog: $KATALOG -> $MONTAZ"
echo "karta:   $OPIS_DROGI"

if [[ "$BEZ_KARTY" == "1" ]]; then
  exec docker run "${TTY_ARG[@]}" "${WSPOLNE[@]}" \
    "${ARGUMENTY_KARTY[@]}" "$OBRAZ" "$@"
fi

exec docker run "${TTY_ARG[@]}" "${WSPOLNE[@]}" "${PROFILOWANIE[@]}" \
  "${PAMIEC[@]}" "${ARGUMENTY_KARTY[@]}" "$OBRAZ" "$@"
