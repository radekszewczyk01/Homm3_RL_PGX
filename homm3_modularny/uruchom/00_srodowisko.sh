#!/usr/bin/env bash
# Wspolne ustawienia dla wszystkich pomiarow. Zaladuj przez: source 00_srodowisko.sh
#
# ZEGAR KARTY
# -----------
# Karta zero miala zablokowany zegar na 1155 MHz w kazdym stanie, od
# bezczynnosci do pelnego obciazenia. Dawalo to liczby o polowe nizsze i nie
# zostawialo zadnego sladu w kodzie - wygladalo na regresje w silniku.
# Blokada zostala zdjeta i karta zero jest znowu punktem odniesienia, bo
# wszystkie liczby w pracy pochodza wlasnie z niej.
#
# To NIE ZNACZY, ze sprawdzanie przestalo byc potrzebne. Blokada moze wrocic
# przy kazdym `nvidia-smi -lgc` albo `-ac`, a przy bezczynnosci jest
# niewidoczna. Przed kazda seria pomiarow czasowych:
#
#   python3 narzedzia/sprawdz_zegar.py --karta 0
#
# Skrypt obciaza karte i probkuje zegar w trakcie, bo tylko tak widac roznice.
# Liczby z kompilatora (flopy, bajty, jadra) sa odporne na ten problem
# i mozna je zbierac gdziekolwiek.

export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:-0}

# Nie bierzemy calej pamieci karty: czasem siedzi na niej obcy proces,
# a przy skanach duzych wsadow wolimy dostac blad zamiast ubic komus prace.
export XLA_PYTHON_CLIENT_MEM_FRACTION=${XLA_PYTHON_CLIENT_MEM_FRACTION:-0.8}
export XLA_PYTHON_CLIENT_PREALLOCATE=false

# Powtarzalnosc: bez tego kompilator moze wybrac inny plan przy kazdym
# uruchomieniu i porownanie konfiguracji przestaje byc uczciwe.
export XLA_FLAGS="${XLA_FLAGS} --xla_gpu_deterministic_ops=true"

export WYNIKI=${WYNIKI:-wyniki}
mkdir -p "$WYNIKI"

# Na tym serwerze JAX jest tylko w obrazie dockerowym. Lepiej powiedziec to
# od razu, niz pozwolic kazdemu skryptowi wywalic sie osobno na importcie.
if ! python3 -c "import jax" 2>/dev/null; then
  echo
  echo "W tym srodowisku nie ma JAX-a - jestes na hoscie, nie w kontenerze."
  echo "Uruchom ten skrypt przez:"
  echo
  echo "    ./uruchom/w_dockerze.sh $0"
  echo
  return 1 2>/dev/null || exit 1
fi

echo "karta:        ${CUDA_VISIBLE_DEVICES}"
echo "udzial pam.:  ${XLA_PYTHON_CLIENT_MEM_FRACTION}"
echo "wyniki:       ${WYNIKI}"
nvidia-smi --query-gpu=index,name,pstate,clocks.sm,clocks.max.sm,clocks.applications.graphics,utilization.gpu,memory.used \
           --format=csv 2>/dev/null || echo "(nvidia-smi niedostepne)"
echo
echo "Kolumna clocks.applications.graphics inna niz [N/A] oznacza narzucony"
echo "zegar. Pelne sprawdzenie: python3 narzedzia/sprawdz_zegar.py --karta \$CUDA_VISIBLE_DEVICES"
