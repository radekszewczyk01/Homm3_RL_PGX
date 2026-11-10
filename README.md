# Homm3_RL_PGX

Wektoryzowane środowisko taktycznego modułu bitewnego Heroes of Might and Magic III,
zaimplementowane jako czysta funkcja tensorowa w JAX i kompilowane przez XLA.
Środowisko, przeszukiwanie drzewa i sieć neuronowa wykonują się w całości na
akceleratorze, w jednym skompilowanym programie.

Kod powstał na potrzeby pracy magisterskiej *„Wektoryzacja środowisk turowych gier
taktycznych na akceleratorach sprzętowych dla algorytmów uczenia ze wzmocnieniem”*
(Politechnika Warszawska).

## Co tu jest

| Katalog | Zawartość |
|---|---|
| `src/` | kod: silnik symulacji, pętla treningowa, ewaluacja, nagrywanie, pomiary |
| `data/` | tablice statyczne jednostek i dane wejściowe silnika |
| `wyniki/` | surowe wyniki pomiarów przepustowości i kosztu przeszukiwania |
| `demo/` | nagrania rozegranych partii i przykładowa powtórka |
| `scripts/` | skrypt uruchomieniowy |

### Najważniejsze pliki

- `src/jax_engine_v3.py` — symulator: reguły gry jako czysta funkcja tensorowa
- `src/train8.py` — pętla AlphaZero (PUCT oraz Gumbel MuZero, przez `mctx`)
- `src/ewal8.py` — ewaluacja i turnieje między modelami
- `src/nagraj8.py` — zapis przebiegu partii do pliku powtórki
- `src/podglad8.py` — odtwarzanie powtórki

## Szybki start

```bash
pip install -r requirements.txt     # albo: docker build -t homm3rl .

# obejrzenie przykładowej partii
python src/podglad8.py --powtorka demo/przyklad_powtorki.json

# trening
python src/train8.py --help
```

## Reprezentacja

**Obserwacja** — siatka `11 × 15 × 12`: plansza heksagonalna, dwanaście kanałów na pole.

**Przestrzeń akcji** — `a = 8h + p`, gdzie `h` to indeks heksa, a `p` to płaszczyzna
operacji: `0` ruch, `1–6` atak w zwarciu w sześciu kierunkach heksagonalnych,
`7` atak dystansowy. Plus dwie akcje globalne (obrona, czekanie), razem **1322**
akcji nominalnych, z czego dopuszczalnych jest średnio **69**.

**Sieć** — trzy warstwy splotowe 3×3 po 64 kanały, następnie głowa polityki
(splot 1×1 na płaszczyzny akcji) i głowa wartości. Około 2,8 mln parametrów.
Dopuszczalność akcji wymusza maska wyliczana przez symulator, nie uczenie.

## Wybrane wyniki

- **371 tys. kroków/s** na jednym akceleratorze, przy wsadzie 2048
- około **600×** więcej niż silnik referencyjny vcmi-gym (612 kroków/s na 8 procesach)
- koszt decyzji rośnie **ponadliniowo**, jak `N^2.32` względem budżetu symulacji
- ten sam symulator wewnątrz drzewa przeszukiwań jest **76× wolniejszy** —
  wąskie gardło przenosi się ze środowiska do algorytmu przeszukiwania
- reguła PUCT z domyślną stałą **degeneruje się w trakcie treningu**: pokrycie
  korzenia spada z 56 do niespełna 7 akcji

## Licencja i cytowanie

MIT — [LICENSE](LICENSE).
