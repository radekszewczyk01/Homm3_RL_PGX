# HoMM3 RL PGX

Projekt zawiera środowisko bitewne Heroes of Might and Magic III zbudowane na bazie `pgx`, trening AlphaZero oraz prosty odtwarzacz powtórek.

## Struktura repozytorium

- `jax_engine.py` - silnik walki i implementacja środowiska PGX/JAX.
- `train.py` - pętla treningowa AlphaZero, MCTS i zapis wag modelu.
- `gui_reply.py` - przeglądarka powtórek w `pygame`.
- `homm3_alphazero_weights.msgpack` - wytrenowane wagi modelu.
- `future_work/` - materiały pomocnicze i eksperymenty poboczne.

## `future_work/`

Ten katalog zbiera rzeczy pomocnicze, które nie są częścią głównej ścieżki treningu:

- `main.py` - alternatywny lub eksperymentalny punkt wejścia.
- `get_data.py` - pobieranie albo przygotowanie danych.
- `build_npy.py` - budowanie statycznej tablicy LUT.
- `homm3_creatures_clean.csv` - wejściowe dane o stworach.
- `homm3_static_lut.npy` - wygenerowana tablica lookup.

## Uwagi

- Wygenerowane replaye są ignorowane przez Git.
- Jeśli chcesz odtwarzać trening od zera, najpierw sprawdź zależności w `Dockerfile`.