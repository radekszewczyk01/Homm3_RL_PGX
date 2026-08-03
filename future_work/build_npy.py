from enum import IntEnum
import numpy as np
import pandas as pd


class Stat(IntEnum):
    ATTACK = 0
    DEFENSE = 1
    MIN_DMG = 2
    MAX_DMG = 3
    HP = 4
    SPEED = 5
    AI_VALUE = 6  # Zamiast GROWTH
    RESERVED = 7  # Miejsce np. na IS_UNDEAD lub inną cechę
    # Flagi binarne (na razie wyzerowane, do uzupełnienia)
    IS_FLYER = 8
    IS_SHOOTER = 9
    IS_TWO_HEX = 10
    NO_RETALIATION = 11
    # Razem 12 kolumn (0-11)


def build_jax_static_lut():
    # 1. Wczytujemy wyczyszczony plik CSV
    df = pd.read_csv("homm3_creatures_clean.csv")

    # 2. Tworzymy macierz o wymiarach (191, 12) wypełnioną zerami
    # Indeks 0 zostawiamy całkowicie pusty dla "EMPTY / brak jednostki"
    num_units = df["unit_id"].max()
    lut = np.zeros((num_units + 1, len(Stat)), dtype=np.float32)

    # 3. Wektoryzowane wpisanie danych z DataFrame do macierzy NumPy
    # Wykorzystujemy unit_id jako bezpośredni indeks wiersza
    ids = df["unit_id"].values

    lut[ids, Stat.ATTACK] = df["attack"].values
    lut[ids, Stat.DEFENSE] = df["defense"].values
    lut[ids, Stat.MIN_DMG] = df["min_dmg"].values
    lut[ids, Stat.MAX_DMG] = df["max_dmg"].values
    lut[ids, Stat.HP] = df["hp"].values
    lut[ids, Stat.SPEED] = df["speed"].values
    lut[ids, Stat.AI_VALUE] = df["ai_value"].values

    # Kolumny od 7 do 11 (flagi binarne) na razie pozostają zerami (0.0)

    # 4. Zapisujemy jako plik binarny NumPy (.npy)
    np.save("homm3_static_lut.npy", lut)
    print("Zapisano macierz do pliku: homm3_static_lut.npy")
    print(f"Kształt macierzy: {lut.shape} (wiersze, kolumny)")

    # Szybki test poprawności dla Pikeman (unit_id = 1)
    print("\nTest - Statystyki Pikiniera (indeks 1):")
    print(f"  Atak:     {lut[1, Stat.ATTACK]}")
    print(f"  Obrona:   {lut[1, Stat.DEFENSE]}")
    print(f"  HP:       {lut[1, Stat.HP]}")
    print(f"  AI Value: {lut[1, Stat.AI_VALUE]}")


if __name__ == "__main__":
    build_jax_static_lut()