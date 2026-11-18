#!/usr/bin/env bash
# Wspolne ustawienia dla wszystkich pomiarow. Zaladuj przez: source 00_srodowisko.sh
#
# KARTA ZERO JEST ZABLOKOWANA NA 1155 MHz
# ---------------------------------------
# W kazdym stanie, od bezczynnosci do pelnego obciazenia. To daje liczby
# o polowe nizsze i nic w kodzie tego nie pokazuje. Sprawdzenie:
#
#   nvidia-smi --query-gpu=index,clocks.sm,clocks.max.sm,utilization.gpu \
#              --format=csv
#
# Jesli zegar biezacy jest rowny granicznemu przy zerowym obciazeniu, karta
# jest zablokowana. Przywrocenie (wymaga uprawnien):  nvidia-smi -rgc -i 0
#
# Dopoki to nie jest naprawione: KAZDY POMIAR CZASOWY NA KARCIE JEDEN.
# Liczby z kompilatora (flopy, bajty, jadra) sa odporne na ten problem
# i mozna je zbierac gdziekolwiek.

export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:-1}

# Na karcie jeden siedzi czesto obcy proces, wiec nie bierzemy calej pamieci.
export XLA_PYTHON_CLIENT_MEM_FRACTION=${XLA_PYTHON_CLIENT_MEM_FRACTION:-0.6}
export XLA_PYTHON_CLIENT_PREALLOCATE=false

# Powtarzalnosc: bez tego kompilator moze wybrac inny plan przy kazdym
# uruchomieniu i porownanie konfiguracji przestaje byc uczciwe.
export XLA_FLAGS="${XLA_FLAGS} --xla_gpu_deterministic_ops=true"

export WYNIKI=${WYNIKI:-wyniki}
mkdir -p "$WYNIKI"

echo "karta:        ${CUDA_VISIBLE_DEVICES}"
echo "udzial pam.:  ${XLA_PYTHON_CLIENT_MEM_FRACTION}"
echo "wyniki:       ${WYNIKI}"
nvidia-smi --query-gpu=index,name,clocks.sm,clocks.max.sm,utilization.gpu,memory.used \
           --format=csv 2>/dev/null || echo "(nvidia-smi niedostepne)"
