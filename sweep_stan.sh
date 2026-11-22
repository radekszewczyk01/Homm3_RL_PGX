#!/bin/bash
export CUDA_VISIBLE_DEVICES=0
mkdir -p /work/stan

WSADY_0="1026 1536 2047 2176 2305 2433 2562 2815 3073 4094"
WSADY_5240="684 1024 1365 1450 1536 1622 1708 1877 2048 2729"
WSADY_10479="513 768 1023 1088 1152 1217 1281 1408 1536 2047"

for W in 0 5240 10479; do
  eval "LISTA=\$WSADY_$W"
  echo "############ wypelnienie $W  $(date +%H:%M:%S)"

  # 1) przepustowosc - bez profilera, czysty pomiar czasu
   HOMM3_WYPELNIENIE=$W python3 src/benchark.py \
    --engine v3 --batches $LISTA --steps 100 --repeats 3 \
    --no-mcts --no-sims-sweep --no-env-stats --ignore-foreign \
    --tag stan$W --out /work/stan/tput_$W.json > /work/stan/tput_$W.log 2>&1
  # 2) liczniki - osobno dla kazdego wsadu
  for B in $LISTA; do
    echo ">>> W=$W B=$B  $(date +%H:%M:%S)"
    HOMM3_WYPELNIENIE=$W ncu --kernel-name regex:^input_reduce_fusion \
        --launch-count 10 --cache-control none \
        --metrics gpu__time_duration.sum,lts__t_sector_hit_rate.pct,dram__bytes.sum.per_second \
        --csv --target-processes all \
      python3 src/benchark.py \
        --engine v3 --batches $B --steps 5 --repeats 1 \
        --no-mcts --no-sims-sweep --no-analysis --no-env-stats --ignore-foreign \
        --tag ncu --out /work/stan/bench_${W}_${B}.json \
      > /work/stan/ncu_${W}_${B}.csv 2>/dev/null
  done
done
echo ">>> KONIEC  $(date +%H:%M:%S)"
