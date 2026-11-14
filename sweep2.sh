#!/bin/bash
export CUDA_VISIBLE_DEVICES=0
mkdir -p /work/liczniki_pelne
for B in 1024 2048 4096; do
  echo ">>> pelny profil, wsad $B  $(date +%H:%M:%S)"
  ncu --cache-control none \
      --metrics gpu__time_duration.sum,lts__t_sector_hit_rate.pct,dram__bytes.sum.per_second \
      --csv --target-processes all \
    python3 src/benchark.py \
      --engine v3 --batches $B --steps 3 --repeats 1 \
      --no-mcts --no-sims-sweep --no-analysis --no-env-stats --ignore-foreign \
      --tag ncu --out /work/liczniki_pelne/bench_$B.json \
    > /work/liczniki_pelne/ncu_$B.csv 2>/dev/null
done
echo ">>> KONIEC  $(date +%H:%M:%S)"
