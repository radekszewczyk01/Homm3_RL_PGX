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
#
# KATALOG moze byc albo samym homm3_modularny, albo korzeniem repozytorium -
# to drugie jest potrzebne, zeby dalo sie uruchomic stary src/benchark.py
# do porownania, bo lezy piętro wyzej.
[[ -d "$KATALOG/homm3" || -d "$KATALOG/homm3_modularny/homm3" || -d "$KATALOG/src" ]] || {
  echo "W $KATALOG nie ma ani homm3/, ani homm3_modularny/homm3/, ani src/."
  echo "Zla sciezka? Przyklady:"
  echo "  KATALOG=\$HOME/Magisterka/Homm3_RL_PGX        # cale repozytorium"
  echo "  KATALOG=\$HOME/Magisterka/Homm3_RL_PGX/homm3_modularny"
  exit 1; }

# Sciezka do punktu wejscia liczona WZGLEDEM montazu, zeby dzialala niezaleznie
# od tego, czy montujemy homm3_modularny, czy caly korzen repozytorium.
MOJ_KATALOG=$(cd "$(dirname "$0")" && pwd)
if [[ "$MOJ_KATALOG" == "$KATALOG"/* ]]; then
  WZGLEDNY="${MOJ_KATALOG#"$KATALOG"/}"
elif [[ "$MOJ_KATALOG" == "$KATALOG" ]]; then
  WZGLEDNY="."
else
  echo "Skrypt lezy w $MOJ_KATALOG, a montujemy $KATALOG - nie zawiera go."
  echo "Ustaw KATALOG tak, zeby obejmowal ten skrypt."
  exit 1
fi
WRAPPER_HOST="$MOJ_KATALOG/_wstrzyknij.sh"
WRAPPER_KONTENER="$MONTAZ/$WZGLEDNY/_wstrzyknij.sh"

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

# ===========================================================================
# przekazanie zmiennych do kontenera
# ===========================================================================
# docker run NIE dziedziczy srodowiska - do kontenera trafia tylko to, co
# jawnie wymienione przez -e. Bez tej listy ustawienia skryptow etapow nie
# docieraly nigdzie, bo w kontenerze startowaly z wartosciami domyslnymi.
#
# Kosztowalo to jedna pomylke: tryb probny kolejki (--probnie) eksportowal
# PROBNIE=1 na hoscie i byl po cichu ignorowany w kontenerze, wiec "przebieg
# probny" liczyl sie w pelnym wymiarze - stad etap `szybkie` zajmujacy
# trzydziesci dwie minuty zamiast pieciu. Wyniki byly prawidlowe, zepsuty byl
# sam mechanizm skracania.
#
# PRZEKAZ="A B" dorzuca wlasne nazwy, gdy jednorazowo potrzeba czegos
# spoza tej listy.
# UID i GID hosta, zeby kontener oddal pliki na wyjsciu - inaczej wyniki
# naleza do roota i uzytkownik nie moze ich usunac ani nadpisac ("rm:
# Permission denied" na wlasnym katalogu wynikow). Uruchamianie kontenera
# jako --user nie przechodzi, bo ncu potrzebuje uprawnien, ktore z tym nie
# wspolgraja - wiec zostajemy rootem, a pliki oddajemy na wyjsciu.
WSPOLNE+=(-e "HOST_UID=$(id -u)" -e "HOST_GID=$(id -g)")

# Punkt wejscia jest TEN SAM dla kazdej drogi do karty, nie tylko dla
# recznego wstrzykniecia. Wczesniej ustawialismy go wylacznie tam, wiec
# oddawanie plikow dzialaloby na jednej drodze, a na dwoch pozostalych nie -
# i roznica wyszlaby dopiero przy pierwszym 'rm'.
WSPOLNE+=(--entrypoint "$WRAPPER_KONTENER")

ZMIENNE_ETAPOW=(
  PROBNIE DETERMINISTYCZNIE WYNIKI GATHER
  PRESET PRESETY KANALY WSADY KROKOW KROKI POWT POWT_BRAMA GIER SEKUNDY
  SRODOWISKA L2_BAJTOW
  WSADY_ODN WSADY_REZ WSAD_ABL WSAD SYM MAXR SYM_K1 WSAD_K1 SYMULACJE PROB
  ${PRZEKAZ:-}
)
for _z in "${ZMIENNE_ETAPOW[@]}"; do
  [[ -n "${!_z:-}" ]] && WSPOLNE+=(-e "$_z=${!_z}")
done
unset _z
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

  # Sciezka poszukiwania bibliotek i odswiezenie ich spisu robi punkt wejscia
  # uruchamiany w kontenerze - patrz uruchom/_wstrzyknij.sh. NIE przekazujemy
  # LD_LIBRARY_PATH zmienna dockera, bo to NADPISUJE wartosc z obrazu i wtyczka
  # CUDA przestaje znajdowac libcusparse; JAX zjezdza wtedy po cichu na
  # procesor, a pomiar wyglada na udany. Zdarzylo sie.
  # Punkt wejscia musi byc wykonywalny, bo montujemy go z hosta i obowiazuja
  # uprawnienia hosta. Po rozpakowaniu archiwum czasem nie sa.
  if [[ ! -x "$WRAPPER_HOST" ]]; then
    chmod +x "$WRAPPER_HOST" 2>/dev/null \
      || { BRAKUJACE+=("$WRAPPER_HOST (nie jest wykonywalny: chmod +x)"); }
  fi
  # punkt wejscia ustawiony raz, w WSPOLNE - dla wszystkich drog
  [[ "$KARTA" != "all" ]] && ARGUMENTY_RECZNE+=(-e CUDA_VISIBLE_DEVICES=0)
  return 0
}

# Czy JAX w kontenerze faktycznie widzi karte. Samo wstanie kontenera NIE
# WYSTARCZA: JAX przy braku ktorejkolwiek biblioteki CUDA wypisuje ostrzezenie
# i przechodzi na procesor, konczac sie kodem zero. Mierzenie wtedy dalej
# byloby najgorszym z mozliwych wynikow - liczby wygladaja normalnie i sa
# nieprawdziwe. Dlatego sprawdzamy to osobno i twardo.
SPRAWDZ_JAX='
import sys
import jax
d = jax.devices()
print(d)
sys.exit(0 if any(getattr(x, "platform", "") in ("gpu", "cuda") for x in d)
         else 3)'

jax_widzi_karte() {
  docker run "${WSPOLNE[@]}" "${PROFILOWANIE[@]}" "$@" "$OBRAZ" \
    python3 -c "$SPRAWDZ_JAX" 2>&1
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

  # Zwraca 0 gdy JAX widzi karte, 3 gdy wstal ale jest na procesorze,
  # cokolwiek innego gdy kontener nie wstal. Wynik w zmiennej WYJSCIE.
  sprobuj() {
    set +e
    WYJSCIE=$(jax_widzi_karte "$@")
    KOD=$?
    set -e
  }

  # Wspolna obsluga przypadku, w ktorym kontener wstaje, ale JAX siedzi
  # na procesorze. To jest pulapka, nie usterka drugiego rzedu: liczby wyjda
  # i beda wygladac normalnie.
  odmow_procesora() {   # wyjscie_z_jax
    echo "================================================================"
    echo " KONTENER WSTAJE, ALE JAX NIE WIDZI KARTY - przechodzi na procesor."
    echo
    echo " JAX powiedzial:"
    sed 's/^/   /' <<<"$1" | tail -12
    echo
    echo " NIE URUCHAMIAM pomiarow w tym stanie. Liczby wyszly by normalne"
    echo " i bylyby nieprawdziwe, a tego nie da sie potem rozpoznac."
    echo
    echo " Najczestsza przyczyna to brak ktorejs biblioteki zestawu"
    echo " narzedziowego CUDA w obrazie (cuSPARSE, cuBLAS, cuDNN). Gdzie leza:"
    echo
    echo "   BEZ_KARTY=1 ./uruchom/w_dockerze.sh bash -c '"
    echo "     ldconfig -p | grep -iE \"cusparse|cublas|cudnn\";"
    echo "     echo LD_LIBRARY_PATH=\$LD_LIBRARY_PATH;"
    echo "     pip list 2>/dev/null | grep -i nvidia'"
    echo
    echo " Jesli musisz policzyc to, co od sprzetu nie zalezy:"
    echo "   ./uruchom/kolejka.sh --bez-karty"
    echo "================================================================"
    exit 1
  }

  if [[ "$BEZ_CDI" == "1" ]]; then
    zbuduj_argumenty_recznie
    if ((${#BRAKUJACE[@]})); then
      echo "Wstrzykniecie recznie wymuszone, ale brakuje:"
      printf '  %s\n' "${BRAKUJACE[@]}"
      exit 1
    fi
    if [[ "$BEZ_SPRAWDZENIA" != "1" ]]; then
      sprobuj "${ARGUMENTY_RECZNE[@]}"
      if ((KOD == 3)); then
        odmow_procesora "$WYJSCIE"
      elif ((KOD != 0)); then
        echo "Kontener nie wstaje. Docker powiedzial tyle:"
        sed 's/^/  /' <<<"$WYJSCIE" | tail -5
        exit 1
      fi
    fi
    ARGUMENTY_KARTY=("${ARGUMENTY_RECZNE[@]}")
    OPIS_DROGI="karta $KARTA, sterownik wstrzykniety recznie (wymuszone)"
  elif [[ "$BEZ_SPRAWDZENIA" == "1" ]]; then
    ARGUMENTY_KARTY=("${ARGUMENTY_GPUS[@]}")
    OPIS_DROGI="karta $KARTA (--gpus $GPU_ARG), bez sprawdzenia"
  else
    # Kilka sekund teraz oszczedza zgadywania potem: blad srodowiska
    # uruchomieniowego wyglada identycznie jak blad w kodzie, a nim nie jest.
    sprobuj "${ARGUMENTY_GPUS[@]}"
    if ((KOD == 0)); then
      ARGUMENTY_KARTY=("${ARGUMENTY_GPUS[@]}")
      OPIS_DROGI="karta $KARTA (--gpus $GPU_ARG), mozliwosci sterownika: $CAPS"
    elif ((KOD == 3)); then
      odmow_procesora "$WYJSCIE"
    else
      BLAD="$WYJSCIE"
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
      # Tu sprawdzamy od razu JAX-em, a nie samym /bin/true. Pierwsza wersja
      # tego obejscia sprawdzala tylko, czy kontener wstaje - wstawal, JAX
      # zjechal na procesor i poszla cala seria pomiarow bezwartosciowych.
      sprobuj "${ARGUMENTY_RECZNE[@]}"
      BLAD2="$WYJSCIE"
      if ((KOD == 3)); then
        odmow_procesora "$BLAD2"
      fi
      if ((KOD == 0)); then
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
