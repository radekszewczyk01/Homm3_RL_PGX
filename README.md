# Homm3_RL_PGX

A vectorized environment for the tactical battle module of Heroes of Might and Magic III,
implemented as a pure tensor function in JAX and compiled with XLA.
The environment, the tree search and the neural network all run entirely on the
accelerator, in a single compiled program.

The code was written for a master's thesis, *"Vectorization of Turn-Based Tactical Game Environments on Hardware Accelerators for Reinforcement Learning Algorithms"* (*„Wektoryzacja środowisk turowych gier taktycznych na akceleratorach sprzętowych dla algorytmów uczenia ze wzmocnieniem"*), at Warsaw University of Technology.

## What's here

| Directory | Contents |
|---|---|
| `src/` | code: simulation engine, training loop, evaluation, recording, benchmarks |
| `data/` | static unit tables and engine input data |
| `wyniki/` | raw results of the throughput and search-cost measurements |
| `demo/` | recordings of played games and a sample replay |
| `scripts/` | launch script |

### Key files

- `src/jax_engine_v3.py`: the simulator, with the game rules as a pure tensor function
- `src/train8.py`: the AlphaZero loop (PUCT and Gumbel MuZero, via `mctx`)
- `src/ewal8.py`: evaluation and tournaments between models
- `src/nagraj8.py`: records a game's progress to a replay file
- `src/podglad8.py`: plays back a replay

## Quick start

```bash
pip install -r requirements.txt     # or: docker build -t homm3rl .

# watch a sample game
python src/podglad8.py --powtorka demo/przyklad_powtorki.json

# training
python src/train8.py --help
```

## Representation

**Observation**: an `11 × 15 × 12` grid. The board is hexagonal, with twelve channels per cell.

**Action space**: `a = 8h + p`, where `h` is the hex index and `p` is the operation plane:
`0` move, `1–6` melee attack in one of the six hex directions, `7` ranged attack.
Two global actions (defend, wait) are added, for **1322** nominal actions in total,
of which an average of **69** are legal.

**Network**: three 3×3 convolutional layers with 64 channels each, followed by a policy head
(a 1×1 convolution onto the action planes) and a value head. It has about 2.8 million parameters.
Action legality is enforced by a mask computed by the simulator, not learned.

## Selected results

- **371k steps/s** on a single accelerator, at batch size 2048
- about **600×** more than the reference engine vcmi-gym (612 steps/s on 8 processes)
- decision cost grows **superlinearly**, as `N^2.32` in the simulation budget
- the same simulator inside the search tree is **76× slower**, so the bottleneck
  moves from the environment to the search algorithm
- PUCT with the default constant **degenerates during training**: root coverage
  drops from 56 to fewer than 7 actions

## License and citation

MIT, see [LICENSE](LICENSE).

I left the file and directory names (`wyniki`, `przyklad_powtorki.json`, `--powtorka`, and so on) as they are, since they have to match the code. If you want English names too, I'd need to rename them in the repo as well.