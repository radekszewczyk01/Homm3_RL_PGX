#!/bin/bash
export CUDA_VISIBLE_DEVICES=0
mkdir -p /work/liczniki_nc
for B in 1536 1792 2048 2304 2560 2816; do
  echo ">>> wsad $B  $(date +%H:%M:%S)"
  ncu --kernel-name regex:^input_reduce_fusion_2$ --launch-count 10 \
      --cache-control none \
      --metrics gpu__time_duration.sum,lts__t_sector_hit_rate.pct,dram__bytes.sum.per_second,l1tex__t_sector_hit_rate.pct \
      --csv --target-processes all \
    python3 src/benchark.py \
      --engine v3 --batches $B --steps 5 --repeats 1 \
      --no-mcts --no-sims-sweep --no-analysis --no-env-stats --ignore-foreign \
      --tag ncu --out /work/liczniki_nc/bench_$B.json \
    > /work/liczniki_nc/ncu_$B.csv 2>/dev/null
done
echo ">>> KONIEC  $(date +%H:%M:%S)"
