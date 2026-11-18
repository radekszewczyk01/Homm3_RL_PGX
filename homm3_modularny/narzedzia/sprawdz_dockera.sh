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
    *"runtime=nvidia"*|*"CDI"*)
      echo " Trzeba zmienic sposob przekazywania kart w"
      echo " uruchom/w_dockerze.sh. Przeslij mi ten wydruk, dopisze."
      ;;
  esac
else
  echo " NIC NIE DZIALA - problem jest po stronie hosta, nie obrazu."
  echo
  echo " Do poproszenia promotora (wymaga roota, kazde z osobna moze"
  echo " wystarczyc):"
  echo
  echo "   sudo ldconfig"
  echo "        odswieza spis bibliotek; naprawia przypadek, w ktorym spis"
  echo "        wymienia plik usuniety przy aktualizacji sterownika"
  echo
  echo "   sudo nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml"
  echo "        przegenerowuje specyfikacje urzadzen na nowo"
  echo
  echo "   sudo apt-get install --reinstall libnvidia-egl-wayland1"
  echo "        przywraca sama brakujaca biblioteke"
  echo
  echo " Tymczasem mozna policzyc to, co nie potrzebuje karty wcale:"
  echo "   nic z tego repozytorium, bo JAX jest tylko w obrazie."
fi
echo "=============================================================="
