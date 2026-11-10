Tak, i to już jest w kodzie — `bench.py` shar­duje wsad przez `NamedSharding`, a `jax.jit` sam partycjonuje obliczenia. `pmap` to starsze API; przy `jit` + sharding nie musisz przepisywać funkcji, a wsad dzieli się automatycznie. Jedyny warunek to podzielność przez liczbę kart. Ostatnia próba padła przez `/dev/shm`, nie przez brak wsparcia.

Policzmy jednak, co to daje.

## Trzy karty to 3×, a problem jest 234×

MCTS na 3 GPU: pamięć rośnie z 32 do 96 GB, więc przy $B = 1536$ i $N = 200$ drzewo zajmie 13,2 GB (4,4 GB na kartę) — zmieści się bez trudu. Przepustowość wzrośnie z ~10,5 do ~31 decyzji/s.

Ale 31 decyzji/s to nadal 2,7 miliona na dobę, przy silniku zdolnym wykonać 32 miliardy kroków. **Zrównoleglenie sprzętowe podnosi sufit, nie zmienia kształtu problemu.** A do tego kupujesz sobie NCCL, `abort()` zamiast wyjątku i całą warstwę awarii, którą właśnie poznałeś.

## Prawdziwy podejrzany: kwadratowa złożoność w głębokości

Twoje pomiary skalowania są tu kluczowe:

| $N$ | czas/decyzję | krotność | oczekiwane liniowo |
|---|---|---|---|
| 25 | 0,97 ms | — | — |
| 50 | 5,91 ms | 6,1× | 2× |
| 100 | 34,9 ms | 5,9× | 2× |

Wykładnik około 2,6. Gdyby wąskim gardłem był silnik albo sieć, byłoby liniowo.

Wyjaśnienie: `mctx` wykonuje selekcję i propagację wsteczną jako `while_loop` po głębokości drzewa, a domyślnie `max_depth = num_simulations`. Przy $N = 150$ każda symulacja może schodzić do 150 poziomów, więc łącznie $O(N^2)$ iteracji. Każda iteracja to gather i scatter po **całym pytree** `BattleState`, który w v3 ma około czterdziestu liści. To daje rzędu $150 \times 150 \times 40 \approx 900\,000$ osobnych uruchomień kerneli — przy 5–50 µs narzutu każde wychodzi 4–45 s. Twoje 48,5 s mieści się w tym przedziale.

Jeśli ta diagnoza jest trafna, wąskim gardłem jest **narzut uruchamiania kerneli**, a nie obliczenia. Wtedy trzy karty nie pomogą wcale — każda będzie tak samo czekać.

## Cztery dźwignie, uszeregowane

| Dźwignia | Nakład | Oczekiwany zysk |
|---|---|---|
| `max_depth=30` | jedna linijka | 3–5× |
| `gumbel_muzero_policy` | jedna linijka | 3–10× (mniejsze $N$ wystarcza) |
| Spakowanie statyk w jedną tablicę | ~godzina | 2× (mniej liści) |
| Trzy karty | już gotowe | 3× |

Pierwsze dwie kosztują minutę i mogą dać więcej niż całe zrównoleglenie. Warto je zmierzyć **przed** decyzją o wielu kartach.

## Łatka do `bench.py`

W `build_mcts` podmień wywołanie polityki:

```python
def build_mcts(env, mod, batch, n_sims, policy="muzero", max_depth=None):
    ...
    def decide(params, states, key):
        logits, value = net.apply(params, states.observation)
        root = mctx.RootFnOutput(
            prior_logits=jnp.where(
                states.legal_action_mask, logits, -1e9).astype(jnp.float32),
            value=value.astype(jnp.float32),
            embedding=states)
        common = dict(num_simulations=n_sims, max_depth=max_depth,
                      invalid_actions=~states.legal_action_mask)
        if policy == "gumbel":
            return mctx.gumbel_muzero_policy(
                params, key, root, recurrent_fn,
                max_num_considered_actions=16, **common).action
        return mctx.muzero_policy(
            params, key, root, recurrent_fn,
            dirichlet_fraction=0.25, **common).action
```

Przepchnij `policy` i `max_depth` przez `bench_mcts` i dodaj przełączniki:

```python
ap.add_argument("--mcts-policy", default="muzero",
                choices=["muzero", "gumbel"])
ap.add_argument("--max-depth", type=int, default=None)
```

## Eksperyment rozstrzygający

Cztery przebiegi na jednej karcie, każdy po kilka minut:

```bash
B=512; ARGS="--engine v3 --no-sims-sweep --max-mcts-batch 512 --sims 150 --repeats 3"

CUDA_VISIBLE_DEVICES=0 ./dock-run.sh python3 future_work/benchark.py \
  --tag mcts-base $ARGS --batches 512

CUDA_VISIBLE_DEVICES=0 ./dock-run.sh python3 future_work/benchark.py \
  --tag mcts-depth30 $ARGS --batches 512 --max-depth 30

CUDA_VISIBLE_DEVICES=0 ./dock-run.sh python3 future_work/benchark.py \
  --tag mcts-gumbel $ARGS --batches 512 --mcts-policy gumbel

CUDA_VISIBLE_DEVICES=0 ./dock-run.sh python3 future_work/benchark.py \
  --tag mcts-gumbel-d30 $ARGS --batches 512 --mcts-policy gumbel --max-depth 30
```

Jeśli `max_depth=30` da kilkukrotne przyspieszenie, hipoteza o $O(N^2)$ jest potwierdzona i masz to jako wynik do pracy. Jeśli nie da nic — mechanizm jest inny i wtedy warto sięgnąć po profiler:

```python
with jax.profiler.trace("/work/trace"):
    a = compiled(params, states, key); jax.block_until_ready(a)
```

TensorBoard pokaże podział czasu na operacje HLO i od razu widać, czy dominują kernele drzewa, sieć, czy `env.step`.

## Uwaga o poprawności, nie tylko wydajności

`max_depth=30` to nie jest czysta optymalizacja — ogranicza głębokość przeszukiwania, więc zmienia zachowanie agenta. Przy $N = 150$ drzewo i tak rzadko schodzi głębiej niż kilkanaście poziomów, więc strata powinna być znikoma, ale w pracy trzeba to nazwać parametrem, a nie przemilczeć.

`gumbel_muzero_policy` idzie dalej: rozważa tylko 16 najlepszych akcji w korzeniu. Przy Twojej przestrzeni 1322 to bardzo agresywne przycięcie, ale właśnie dlatego Gumbel MuZero został wymyślony — dla dużych przestrzeni akcji i małych budżetów symulacji. Jest też lepiej ugruntowany teoretycznie przy małym $N$ niż klasyczny PUCT.

Do wielu kart wróć, gdy będziesz wiedział, ile kosztuje pojedyncza decyzja po tych poprawkach. Wtedy trzykrotność będzie mnożyć sensowną liczbę bazową, a nie maskować problem strukturalny.