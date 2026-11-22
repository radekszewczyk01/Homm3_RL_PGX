#!/usr/bin/env bash

# Wyznacz ścieżkę do katalogu, w którym leży dock-run.sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TTY_FLAG=""
[ -t 0 ] && TTY_FLAG="-t"

docker run --gpus "${GPUS:-all}" -i $TTY_FLAG --rm \
  --shm-size=8g --ipc=host \
  -e CUDA_VISIBLE_DEVICES="${CUDA_VISIBLE_DEVICES:-0,1,2}" \
  -v "$SCRIPT_DIR":/work -w /work \
  homm3-jax "$@"
