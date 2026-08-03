import urllib.request
import pandas as pd


def scrape_clean_homm3_csv():
    url = "https://heroes.thelazy.net/index.php/List_of_creatures"

    req = urllib.request.Request(
        url, headers={"User-Agent": "Mozilla/5.0 (X11; Linux x86_64)"}
    )

    with urllib.request.urlopen(req) as response:
        tables = pd.read_html(response, match="Att")

    df = tables[0]

    # 1. USUNIĘCIE PIERWSZEGO WIERSZA Z NaN (i każdego innego pustego)
    # Usuwa wiersz, jeśli brakuje w nim nazwy jednostki ('name')
    df = df.dropna(subset=[df.columns[0]]).reset_index(drop=True)

    # 2. Usuwamy wszystkie nieprzydatne w walce kolumny
    columns_to_drop = [
        "town",
        "lvl",
        "grw",
        "cost",
        "special",
        "unnamed:_12",
        "unnamed: 12",
    ]
    # Czyszczenie nazw kolumn na małe litery przed usuwaniem
    df.columns = df.columns.str.lower().str.replace(" ", "_")
    df = df.drop(
        columns=[col for col in columns_to_drop if col in df.columns],
        errors="ignore",
    )

    # 3. Zmieniamy nazwy kolumn na czyste i czytelne w Pythonie/JAX
    rename_map = {
        "att": "attack",
        "def": "defense",
        "dmg-": "min_dmg",
        "dmg+": "max_dmg",
        "spd": "speed",
        "ai_val": "ai_value",
    }
    df = df.rename(columns=rename_map)

    # 4. Dodajemy czyste, numeryczne unit_id od 1 w górę
    # (Pamiętaj: w JAX 0 zostawimy dla EMPTY / braku jednostki)
    df.insert(0, "unit_id", range(1, len(df) + 1))

    # 5. Zapisujemy gotowe dane
    df.to_csv("homm3_creatures_clean.csv", index=False)
    print(
        f"Gotowe! Wyciągnięto {len(df)} jednostek. Zapisano do homm3_creatures_clean.csv"
    )
    print("\nPrzykładowe pierwsze 3 wiersze:")
    print(df.head(3))


if __name__ == "__main__":
    scrape_clean_homm3_csv()