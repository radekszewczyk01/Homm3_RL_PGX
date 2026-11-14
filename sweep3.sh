#!/bin/bash
export CUDA_VISIBLE_DEVICES=0
mkdir -p /work/liczniki_s
for B in 512 768 1024 1280 1536 1792 2048 2176 2304 2432 2560 2688 2816 3072 3584 4096 6144 8192; do
  echo ">>> wsad $B  $(date +%H:%M:%S)"
  ncu --kernel-name regex:^input_reduce_fusion --launch-count 10 \
      --cache-control none \
      --metrics gpu__time_duration.sum,lts__t_sector_hit_rate.pct,dram__bytes.sum.per_second \
      --csv --target-processes all \
    python3 src/benchark.py \
      --engine v3 --batches $B --steps 5 --repeats 1 \
      --no-mcts --no-sims-sweep --no-analysis --no-env-stats --ignore-foreign \
      --tag ncu --out /work/liczniki_s/bench_$B.json \
    > /work/liczniki_s/ncu_$B.csv 2>/dev/null
done
echo ">>> KONIEC  $(date +%H:%M:%S)"
