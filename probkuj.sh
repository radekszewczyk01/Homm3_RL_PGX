#!/bin/bash
# probkowanie utylizacji w tle
( for i in $(seq 1 250); do
    nvidia-smi --query-gpu=utilization.gpu,clocks.sm,power.draw \
      --format=csv,noheader,nounits -i 0
    sleep 0.2
  done > /tmp/util.csv ) &
PROBKA=$!

docker run --rm --gpus all -v /tmp/sierpien:/work -w /work homm3_az_v2:latest bash -c '
export CUDA_VISIBLE_DEVICES=0
python3 future_work/benchark.py --engine v3 --batches 4096 --steps 1500 --repeats 1 \
  --no-mcts --no-sims-sweep --no-analysis --no-env-stats --ignore-foreign \
  --tag util --out /tmp/u.json' 2>&1 | grep -A3 "kroki/s"

wait $PROBKA

python3 - <<'EOF'
w = [l.split(',') for l in open('/tmp/util.csv') if l.strip()]
u = [float(a[0]) for a in w]; c = [float(a[1]) for a in w]; p = [float(a[2]) for a in w]
akt = [i for i, v in enumerate(u) if v > 5]
if akt:
    a, b = akt[0], akt[-1]
    u, c, p = u[a:b+1], c[a:b+1], p[a:b+1]
print(f"probek w trakcie pracy: {len(u)}")
print(f"utylizacja:  srednia {sum(u)/len(u):6.1f} %   maks {max(u):5.1f} %")
print(f"zegar SM:    sredni  {sum(c)/len(c):6.0f} MHz  maks {max(c):5.0f} MHz")
print(f"pobor mocy:  sredni  {sum(p)/len(p):6.1f} W    maks {max(p):5.1f} W")
EOF
