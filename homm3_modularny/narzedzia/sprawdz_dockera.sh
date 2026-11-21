#!/usr/bin/env bash
# Znajduje sposob uruchomienia kontenera, ktory na tej maszynie dziala.
#
# PO CO
# -----
# Po aktualizacji sterownika srodowisko uruchomieniowe NVIDII potrafi odmowic
# startu kontenera, bo chce zamontowac plik biblioteki, ktorego na hoscie juz
# nie ma. Objaw wyglada jak awaria kodu, a nia nie jest. Sposobow obejscia
# jest kilka i roznia sie tym, ktore biblioteki sterownika sa montowane oraz
# ktorym mechanizmem - zamiast probowac ich po kolei recznie, ten skrypt
# przechodzi przez wszystkie i mowi, ktory wstaje.
#
# Testem jest `nvidia-smi -L` w kontenerze: jesli wypisze karty, kontener
# wstal i widzi sprzet. Nie uruchamiamy nic z JAX-a, zeby nie mieszac dwoch
# roznych problemow.
#
#   ./narzedzia/sprawdz_dockera.sh
#   ./narzedzia/sprawdz_dockera.sh homm3_az_v2:latest     # inny obraz
set -uo pipefail

OBRAZ=${1:-${OBRAZ:-homm3_profil:latest}}
STARY=${STARY:-homm3_az_v2:latest}

echo "=============================================================="
echo " Diagnostyka uruchamiania kontenera"
echo " obraz: $OBRAZ"
echo "=============================================================="

# --- 1. co obraz sam sobie narzuca ------------------------------------
echo
echo "--- czego obraz zada od sterownika"
docker image inspect "$OBRAZ" --format '{{range .Config.Env}}{{println .}}{{end}}' \
  2>/dev/null | grep -i "NVIDIA" || echo "  (obraz nic nie narzuca)"

# --- 2. jakie biblioteki EGL faktycznie leza na hoscie ----------------
echo
echo "--- punkt wejscia i komenda obrazu"
docker image inspect "$OBRAZ" \
  --format '  entrypoint: {{.Config.Entrypoint}}{{println}}  cmd: {{.Config.Cmd}}' \
  2>/dev/null || echo "  (nie udalo sie odczytac - czy obraz istnieje?)"

echo
echo "--- biblioteki EGL/Wayland na hoscie"
ls -la /usr/lib/x86_64-linux-gnu/libnvidia-egl-wayland* 2>/dev/null \
  || echo "  (nie ma ani jednej - stad blad montowania)"
echo
echo "--- czy ldcache wymienia plik, ktorego nie ma"
if command -v ldconfig >/dev/null; then
  ldconfig -p 2>/dev/null | grep -i "egl-wayland" || echo "  (nie ma w cache)"
else
  echo "  (brak ldconfig)"
fi

# --- 3. wersje -------------------------------------------------------
echo
echo "--- wersje"
nvidia-smi --query-gpu=driver_version --format=csv,noheader -i 0 2>/dev/null \
  | head -1 | sed 's/^/  sterownik: /'
command -v nvidia-container-cli >/dev/null \
  && nvidia-container-cli --version 2>&1 | head -1 | sed 's/^/  cli: /' \
  || echo "  cli: brak nvidia-container-cli w PATH"
command -v nvidia-ctk >/dev/null \
  && nvidia-ctk --version 2>&1 | head -1 | sed 's/^/  ctk: /' \
  || echo "  ctk: brak nvidia-ctk w PATH"
docker info --format '{{json .Runtimes}}' 2>/dev/null | sed 's/^/  runtimes: /'
ls /etc/cdi/*.yaml /var/run/cdi/*.yaml 2>/dev/null | sed 's/^/  CDI: /' \
  || echo "  CDI: brak plikow specyfikacji"

# --- 4. proby --------------------------------------------------------
echo
echo "--- proby uruchomienia (test: nvidia-smi -L w kontenerze)"
echo

ZWYCIEZCA=""
ZWYCIEZCA_JAX=-1      # -1 nie sprawdzano, 0 nie dziala, 1 dziala

proba() {   # opis, komenda...
  local opis="$1"; shift
  printf ' %-50s ' "$opis"
  local wyj
  if wyj=$("$@" 2>&1); then
    local ile
    ile=$(grep -c "^GPU" <<<"$wyj" || true)
    echo "DZIALA (kart widocznych: $ile)"
    [[ -z "$ZWYCIEZCA" ]] && ZWYCIEZCA="$opis"
    return 0
  fi
  # z dlugiego bledu dockera bierzemy tylko to, co cokolwiek mowi
  local krotko
  krotko=$(grep -oP '(?<=error during container init: ).*' <<<"$wyj" | head -1)
  [[ -z "$krotko" ]] && krotko=$(tail -1 <<<"$wyj")
  echo "nie"
  echo "     ${krotko:0:140}"
  return 1
}

D=(docker run --rm)

proba "gpus device=0, caps compute,utility" \
  "${D[@]}" --gpus device=0 -e NVIDIA_DRIVER_CAPABILITIES=compute,utility \
  --entrypoint nvidia-smi "$OBRAZ" -L

proba "gpus device=0, caps compute" \
  "${D[@]}" --gpus device=0 -e NVIDIA_DRIVER_CAPABILITIES=compute \
  --entrypoint nvidia-smi "$OBRAZ" -L

proba "gpus device=0, caps utility" \
  "${D[@]}" --gpus device=0 -e NVIDIA_DRIVER_CAPABILITIES=utility \
  --entrypoint nvidia-smi "$OBRAZ" -L

proba "gpus all, caps compute,utility" \
  "${D[@]}" --gpus all -e NVIDIA_DRIVER_CAPABILITIES=compute,utility \
  --entrypoint nvidia-smi "$OBRAZ" -L

proba "runtime=nvidia (stara droga)" \
  "${D[@]}" --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0 \
  -e NVIDIA_DRIVER_CAPABILITIES=compute,utility \
  --entrypoint nvidia-smi "$OBRAZ" -L

proba "device nvidia.com/gpu=0 (CDI)" \
  "${D[@]}" --device nvidia.com/gpu=0 --entrypoint nvidia-smi "$OBRAZ" -L

proba "gpus device=0, BEZ caps (tak jak bylo)" \
  "${D[@]}" --gpus device=0 --entrypoint nvidia-smi "$OBRAZ" -L

# --- wstrzykniecie sterownika recznie, z pominieciem srodowiska NVIDII ---
# Ta droga nie czyta specyfikacji urzadzen wcale, wiec jej nieaktualnosc
# nic nie szkodzi. Montujemy tylko biblioteki potrzebne do obliczen - zadnej
# grafiki, czyli nie dotykamy tego, co jest zepsute.
echo
echo "--- wstrzykniecie sterownika recznie (pomija srodowisko NVIDII)"
RECZNE=()
for W in /dev/nvidiactl /dev/nvidia-uvm /dev/nvidia-uvm-tools /dev/nvidia0; do
  [[ -e "$W" ]] && RECZNE+=(--device "$W")
done
BRAK_RECZNE=()
for PARA in "libcuda.so.1:libcuda.so.[0-9]*" \
            "libnvidia-ml.so.1:libnvidia-ml.so.[0-9]*" \
            "libnvidia-ptxjitcompiler.so.1:libnvidia-ptxjitcompiler.so.[0-9]*" \
            "libnvidia-nvvm.so.4:libnvidia-nvvm.so.[0-9]*"; do
  NAZWA="${PARA%%:*}"; WZOR="${PARA#*:}"
  PLIK=$(compgen -G "/usr/lib/x86_64-linux-gnu/$WZOR" 2>/dev/null \
         | sort -V | tail -1 || true)
  if [[ -n "$PLIK" && -f "$PLIK" ]]; then
    RECZNE+=(-v "$PLIK:/usr/lib/x86_64-linux-gnu/$NAZWA:ro")
    echo "    znalazlem  $NAZWA  ->  $(basename "$PLIK")"
  else
    BRAK_RECZNE+=("$NAZWA")
    echo "    BRAK       $NAZWA  (wzorzec $WZOR)"
  fi
done
[[ -x /usr/bin/nvidia-smi ]] \
  && RECZNE+=(-v /usr/bin/nvidia-smi:/usr/bin/nvidia-smi:ro)
if [[ ! -e /dev/nvidia-uvm ]]; then
  echo "    /dev/nvidia-uvm nie istnieje - probuje nvidia-modprobe -u -c 0"
  command -v nvidia-modprobe >/dev/null \
    && { nvidia-modprobe -u -c 0 >/dev/null 2>&1 \
         && echo "    utworzony" || echo "    nie udalo sie"; } \
    || echo "    brak nvidia-modprobe"
  [[ -e /dev/nvidia-uvm ]] && RECZNE+=(--device /dev/nvidia-uvm)
fi
echo
if ((${#BRAK_RECZNE[@]})); then
  echo " nie probuje - bez tych bibliotek nie ma sensu"
else
  proba "recznie: --device + biblioteki obliczeniowe" \
    "${D[@]}" "${RECZNE[@]}" --entrypoint nvidia-smi "$OBRAZ" -L
  # samo nvidia-smi to nie dowod, ze policzy - sprawdzamy jeszcze CUDA
  printf ' %-50s ' "recznie: czy JAX widzi karte"
  if WYJ=$("${D[@]}" "${RECZNE[@]}" \
           -e LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/nvidia/lib:/usr/local/nvidia/lib64:/usr/local/cuda/lib64 \
           "$OBRAZ" python3 -c "import jax; print(jax.devices())" 2>&1); then
    echo "DZIALA"
    echo "     $(tail -1 <<<"$WYJ")"
    ZWYCIEZCA_JAX=1
  else
    echo "nie"
    echo "     $(tail -2 <<<"$WYJ" | tr '\n' ' ' | cut -c1-200)"
    ZWYCIEZCA_JAX=0
  fi
fi

if [[ "$OBRAZ" != "$STARY" ]]; then
  echo
  echo "--- ten sam test na starym obrazie $STARY"
  echo "    (jesli stary dziala a nowy nie, winna jest moja warstwa"
  echo "     z Dockerfile.profil; jesli oba nie dzialaja, winny jest host)"
  proba "stary obraz, gpus device=0, caps compute,utility" \
    "${D[@]}" --gpus device=0 -e NVIDIA_DRIVER_CAPABILITIES=compute,utility \
    --entrypoint nvidia-smi "$STARY" -L
  proba "stary obraz, gpus device=0, BEZ caps" \
    "${D[@]}" --gpus device=0 --entrypoint nvidia-smi "$STARY" -L
fi

# --- 5. wniosek ------------------------------------------------------
echo
echo "=============================================================="
if [[ -n "$ZWYCIEZCA" ]]; then
  echo " DZIALA: $ZWYCIEZCA"
  echo
  case "$ZWYCIEZCA" in
    *"caps compute,utility"*|*"BEZ caps"*)
      echo " To jest domyslne zachowanie uruchom/w_dockerze.sh - nic nie"
      echo " trzeba zmieniac."
      ;;
    *"caps compute"*)
      echo " Uruchamiaj z wezszymi mozliwosciami sterownika:"
      echo "     CAPS=compute ./uruchom/w_dockerze.sh ..."
      echo " Uwaga: bez 'utility' w kontenerze NIE BEDZIE nvidia-smi, wiec"
      echo " etap 'zegar' i opis otoczenia w wynikach beda niepelne."
      ;;
    *"gpus all"*)
      echo " Uruchamiaj z wszystkimi kartami i wybieraj zmienna srodowiskowa:"
      echo "     KARTA=all CUDA_VISIBLE_DEVICES=0 ./uruchom/w_dockerze.sh ..."
      ;;
    *"recznie"*)
      echo " Droga normalna nie dziala, ale wstrzykniecie recznie dziala."
      echo " uruchom/w_dockerze.sh przechodzi na nia SAM, gdy --gpus padnie"
      echo " na montowaniu bibliotek - czyli nic nie musisz robic. Wymuszenie"
      echo " bez komunikatu za kazdym razem:  BEZ_CDI=1"
      echo
      echo " Pomiary z tej drogi sa wazne: ten sam sprzet, ten sam sterownik,"
      echo " te same biblioteki. Inny jest tylko sposob, w jaki staja sie"
      echo " widoczne w kontenerze."
      ;;
    *"runtime=nvidia"*|*"CDI"*)
      echo " Trzeba zmienic sposob przekazywania kart w"
      echo " uruchom/w_dockerze.sh. Przeslij mi ten wydruk, dopisze."
      ;;
  esac
  if [[ "$ZWYCIEZCA_JAX" == "0" ]]; then
    echo
    echo " ALE UWAGA: nvidia-smi dziala, a JAX karty NIE WIDZI. Czyli samo"
    echo " uruchomienie kontenera to jeszcze nie wszystko - brakuje czegos"
    echo " po stronie CUDA. Przeslij mi wydruk z linii 'recznie: czy JAX"
    echo " widzi karte', bo tam jest powiedziane, czego."
  fi
  echo
  echo " Host nadal wymaga naprawy przez administratora - obejscie nie"
  echo " zastepuje naprawy:"
  echo "   sudo nvidia-ctk cdi generate --output=/var/run/cdi/nvidia.yaml"
else
  echo " NIC NIE DZIALA - problem jest po stronie hosta, nie obrazu."
  echo
  echo " Do poproszenia administratora (wymaga roota). Nadpisz ISTNIEJACY"
  echo " plik specyfikacji, nie zakladaj drugiego w innym katalogu - dwie"
  echo " specyfikacje tego samego dostawcy bija sie o nazwy urzadzen:"
  echo
  echo "   sudo nvidia-ctk cdi generate --output=/var/run/cdi/nvidia.yaml"
  echo "        przegenerowuje spis urzadzen na nowo"
  echo
  echo "   sudo ldconfig"
  echo "        odswieza spis bibliotek; zrob to PRZED przegenerowaniem,"
  echo "        jesli spis urzadzen po przegenerowaniu nadal ma stara wersje"
  echo
  echo "   sudo apt-get install --reinstall libnvidia-egl-wayland1"
  echo "        przywraca sama brakujaca biblioteke"
  echo
  echo " Tymczasem da sie policzyc to, co od sprzetu nie zalezy - rozmiar"
  echo " stanu, przestrzen akcji, model pamieciowy drzewa, niezmienniki,"
  echo " semantyke mechanik i pokrycie:"
  echo
  echo "   ./uruchom/kolejka.sh --bez-karty"
  echo
  echo " Kontener bez przekazanej karty wstaje normalnie, bo wtedy zadne"
  echo " z tych bibliotek nie sa montowane."
fi
echo "=============================================================="
