Ten przebieg zawiera dwa wyniki, z których jeden zmienia priorytety projektu.

## Próg przy 2048 jest realny

```
        ten przebieg      poprzedni
 512      262 143          261 768
1024      337 409          337 253
2048      370 710          369 856   <- szczyt
4096      209 248          209 206   <- spadek
```

Powtarzalność do **0,2%** przy zupełnie innym stanie kart. To nie jest cudzy proces, tylko realna własność sprzętu. Przy $B = 2048$ zbiór roboczy to 22 MB, przy 4096 — 45 MB; próg pamięci podręcznej L2 pasuje. Sprawdź w JSON-ie pole `mem_temp_bytes` — jeśli bufory tymczasowe są kilkukrotnie większe od samych stanów, potwierdzi to hipotezę i masz gotowy wykres do pracy.

Płaskowyż powyżej 4096 jest idealnie liniowy w czasie (1,958 → 3,880 → 7,769 → 15,655 → 31,893), więc powyżej progu silnik jest w pełni nasycony.

## Właściwa wiadomość: to nie silnik jest wąskim gardłem

```
surowa symulacja:  370 710 kroków/s
wewnątrz MCTS:       1 582 kroków/s
```

**234× wolniej.** Dalsze optymalizowanie silnika nie ma sensu — kosztuje coś innego.

Skalowanie z liczbą symulacji jest nadliniowe, wykładnik około 2,6:

| $N$ | czas całego wsadu | krotność |
|---|---|---|
| 25 | 0,996 s | — |
| 50 | 6,05 s | 6,1× |
| 100 | 35,8 s | 5,9× |
| 200 | OOM (8,6 GiB) | — |

Gdyby koszt był liniowy, każdy krok dawałby 2×.

## Diagnoza: winna jest przestrzeń akcji, nie stan

`mctx` alokuje dla każdego węzła drzewa komplet tablic o kształcie $[B, N{+}1, |\mathcal{A}|]$ — indeksy dzieci, priory, liczniki odwiedzin, nagrody, dyskonta, wartości. To sześć tablic po 4 bajty, czyli **24 bajty na akcję na węzeł**:

$$M = B \cdot (N{+}1) \cdot \bigl(\underbrace{D}_{10\,877} + \underbrace{24\,|\mathcal{A}|}_{31\,728}\bigr) = B \cdot (N{+}1) \cdot 42\,605\ \text{B}$$

Sprawdźmy na Twoim OOM-ie: $1024 \times 201 \times 42\,605 = 8{,}77$ GB $= 8{,}17$ GiB. Komunikat mówił o próbie alokacji **8,60 GiB**. Zgodność co do kilku procent — formuła jest potwierdzona empirycznie.

Wniosek jest zaskakujący: **osadzenie stanu to tylko 26% pamięci drzewa**. Resztę zjadają tablice indeksowane przestrzenią akcji. Przy $|\mathcal{A}| = 1322$ każdy węzeł kosztuje 42,6 kB, z czego 31,7 kB to sama przestrzeń akcji.

## To wymaga korekty rozdziału

W tabeli 1.1 policzyłem maskę legalnych akcji jako 1322 bajty. To poprawne dla samego stanu, ale **w drzewie MCTS przestrzeń akcji kosztuje 24 bajty na akcję, nie jeden bit**. Argument o kosztach rozszerzenia przestrzeni akcji staje się przez to znacznie mocniejszy, niż go napisałem — i teraz masz go potwierdzonego pomiarem, a nie tylko oszacowanego.

Przy zaklęciach ($|\mathcal{A}| = 2642$) węzeł urósłby do 74,6 kB, czyli 1,75× — i to zanim uwzględnisz konieczność zwiększenia $N$.

## Co z tym zrobić

**Opcja A: wróć do zwartej przestrzeni akcji (167).** Węzeł spada z 42,6 do 14,9 kB, czyli 2,9× mniej pamięci, a koszt PUCT ośmiokrotnie. Cena: adapter do VCMI musi znów dobierać kierunek ataku heurystyką. To jest dokładnie ten kompromis, który świadomie odrzuciliśmy — ale teraz znasz jego cenę liczbowo.

**Opcja B: `gumbel_muzero_policy` zamiast `muzero_policy`.** Rozważa tylko `max_num_considered_actions` (domyślnie 16) w korzeniu, co drastycznie tnie koszt selekcji i pozwala grać sensownie przy $N$ rzędu 32–64 zamiast 150. Jedna linijka zmiany:

```python
mctx.gumbel_muzero_policy(
    params, key, root, recurrent_fn,
    num_simulations=n_sims,
    max_num_considered_actions=16,
    invalid_actions=~states.legal_action_mask)
```

Zmierz obie i porównaj — to jest samo w sobie dobry wynik do pracy.

**Opcja C: przestrzeń pośrednia.** $165 \times 3 + 2 = 497$ (ruch / atak / strzał, bez kierunku). Węzeł: 22,8 kB, czyli 1,9× mniej niż teraz, a nadal rozróżniasz strzał od zwarcia.

## Następne kroki

```bash
# gęstsza siatka wokół progu, karty czyste
CUDA_VISIBLE_DEVICES=0 ./dock-run.sh python3 future_work/benchark.py \
  --tag prog --engine v3 --no-mcts --repeats 7 \
  --batches 1024 1536 2048 2560 3072 3584 4096 6144

# MCTS w realistycznym zakresie (bez OOM) + moc
CUDA_VISIBLE_DEVICES=0 ./dock-run.sh python3 future_work/benchark.py \
  --tag 1gpu-mcts --engine v3 --power \
  --max-mcts-batch 512 --sims 100 --sims-list 25 50 100 150
```

W poprzednim uruchomieniu zabrakło `--power`, stąd zera w kolumnach mocy.

Zanim ruszysz na 2 i 3 GPU — najpierw rozstrzygnij, którą przestrzeń akcji wybierasz. Skalowanie po kartach zmierzone dla konfiguracji, którą i tak porzucisz, to zmarnowany czas. A biorąc pod uwagę, że MCTS jest 234× wolniejszy od silnika, to jest teraz najważniejsza decyzja projektowa w całym projekcie.