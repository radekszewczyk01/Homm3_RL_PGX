#!/usr/bin/env bash
docker run --gpus "${GPUS:-all}" -it --rm \
  --shm-size=8g --ipc=host \
  -e CUDA_VISIBLE_DEVICES="${CUDA_VISIBLE_DEVICES:-0,1,2}" \
  -v "$(pwd)":/work -w /work \
  homm3-jax "$@"
