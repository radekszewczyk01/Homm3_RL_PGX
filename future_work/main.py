from enum import IntEnum
import urllib.request
import numpy as np
import pandas as pd


# 1. Definicja struktury tablicy w JAX (18 kolumn)
class Stat(IntEnum):
    # --- BAZA (0-6) ---
    ATTACK = 0
    DEFENSE = 1
    MIN_DMG = 2
    MAX_DMG = 3
    HP = 4
    SPEED = 5
    AI_VALUE = 6

    # --- RUCH I ATAK (7-11) ---
    IS_FLYER = 7
    IS_SHOOTER = 8
    IS_TWO_HEX = 9
    NO_RETALIATION = 10
    IS_UNDEAD = 11

    # --- AKTYWNE CZARY (12-13) ---
    IS_SPELLCASTER = 12
    SPELL_ID = 13  # 0 = brak, rezerwa pod kod zaklęcia

    # --- SPECJALNE ATAKI / PASYWKI (14-17) ---
    BREATH_ATTACK = 14  # Atak w linii 2 pól (Smoki)
    DOUBLE_ATTACK = 15  # Podwójny atak (np. Marksman, Crusader)
    SPELL_RESIST = 16  # Odporność na magię (0.0 - 1.0)


# Żelazna lista jednostek 2-polowych na wypadek braku wpisu w wiki
KNOWN_TWO_HEX_UNITS = {
    "Griffon",          # Castle
    "Royal Griffon",
    "Cavalier",
    "Champion",
    "Archangel",
    "Centaur",          # Rampart
    "Centraur Captain",
    "Pegasus",
    "Silver Pegasus",
    "Unicorn",
    "War Unicorn",
    "Green Dragon",
    "Gold Dragon",
    "Naga",             # Tower
    "Naga Queen",
    "Hell Hound",       # Inferno
    "Cerberus",
    "Black Knight",     # Necropolis
    "Death Knight",
    "Bone Dragon",
    "Ghost Dragon",
    "Medusa",           # Dungeon
    "Medusa Queen",
    "Manticore",
    "Scorpicore",
    "Red Dragon",
    "Black Dragon",
    "Wolf Rider",       # Stronghold
    "Wolf Raider",
    "Roc",
    "Thunderbird"
    "Behemoth",
    "Ancient Behemoth",
    "Basilisk",         # Fortress
    "Greater Basilisk",
    "Gorgon",
    "Mighty Gorgon",
    "Wyvern",
    "Wyvern Monarch",
    "Hydra",
    "Chaos Hydra",
    "Water Elemental"   # Conflux
    "Ice Elemental",
    "Firebird",
    "Phoenix",
    "Stormbird",        # Cove
    "Ayssid",
    "Sea Serpent",
    "Haspid",
    "Armadillo",        # Factory
    "Bellweather Armadillo",
    "Automaton",
    "Sentinel Automaton",
    "Sandworm",
    "Olgoi-Khorkoi",
    "Couatl",
    "Crimson Couatl",
    "Dreadnought",
    "Juggernaut",
    "Mountain Ram",     # Bulwark
    "Argali",
    "Yeti",
    "Yeti Runemaster",
    "Mammoth",
    "War Mammoth",
    "Jotunn",            
    "Jotunn Warlord",
    "Boar",             # Neutral
    "Nomad",
    "Faerie Dragon",
    "Rust Dragon",
    "Crystal Dragon",
    "Azure Dragon",
}


def build_homm3_dataset():
    url = "https://heroes.thelazy.net/index.php/List_of_creatures"
    req = urllib.request.Request(
        url, headers={"User-Agent": "Mozilla/5.0 (X11; Linux x86_64)"}
    )

    with urllib.request.urlopen(req) as response:
        tables = pd.read_html(response, match="Att")

    df = tables[0]

    # 1. Usuwamy puste wiersze (np. pierwszy wiersz NaN z MediaWiki)
    df = df.dropna(subset=[df.columns[0]]).reset_index(drop=True)

    # 2. Standaryzacja nazw kolumn
    df.columns = (
        df.columns.str.lower()
        .str.replace(" ", "_")
        .str.replace("(", "")
        .str.replace(")", "")
    )

    # --- NOWA LINIA: NAPRAWA PODWOJONYCH NAZW JEDNOSTEK ---
    df["name"] = df["name"].apply(
        lambda x: " ".join(dict.fromkeys(str(x).split()))
    )

    # 3. Zmiana nazw skrótów z wiki na nasze standardowe
    rename_map = {
        "att": "attack",
        "def": "defense",
        "dmg-": "min_dmg",
        "dmg+": "max_dmg",
        "spd": "speed",
        "ai_val": "ai_value",
    }
    df = df.rename(columns=rename_map)

    # Jeśli z jakiegoś powodu obrażenia to jedna kolumna tekstowa "2-3", rozbijamy:
    if "dmg" in df.columns and "min_dmg" not in df.columns:
        df["min_dmg"] = (
            df["dmg"].astype(str).str.split("-").str[0].astype(int)
        )
        df["max_dmg"] = (
            df["dmg"].astype(str).str.split("-").str[-1].astype(int)
        )

    # 4. PARSOWANIE ZDOLNOŚCI Z KOLUMNY 'SPECIAL'
    special = df["special"].astype(str)

    df["is_flyer"] = (
        special.str.contains("Flying|Fly", case=False, na=False).astype(float)
    )
    df["is_shooter"] = (
        special.str.contains("Ranged|shots|shooter", case=False, na=False)
        .astype(float)
    )
    df["no_retaliation"] = (
        special.str.contains("No enemy retaliation", case=False, na=False)
        .astype(float)
    )
    df["is_undead"] = (
        special.str.contains("Undead|Unliving", case=False, na=False)
        .astype(float)
    )
    df["is_spellcaster"] = (
        special.str.contains("Spellcaster", case=False, na=False)
        .astype(float)
    )
    df["breath_attack"] = (
        special.str.contains("Breath attack", case=False, na=False)
        .astype(float)
    )
    df["double_attack"] = (
        special.str.contains(
            "Double attack|Strike twice|Strikes twice", case=False, na=False
        ).astype(float)
    )

    # Bezpieczne sprawdzanie jednostek 2-polowych (tekst + lista)
    df["is_two_hex"] = (
        special.str.contains("Two-hex|2-hex", case=False, na=False)
        | df["name"].isin(KNOWN_TWO_HEX_UNITS)
    ).astype(float)

    df["spell_id"] = 0.0  # Na razie rezerwa pod przyszłe czary

    df["spell_resist"] = 0.0
    df.loc[df["name"].str.contains("Steel Golem"), "spell_resist"] = 0.80
    df.loc[df["name"].str.contains("Gold Golem"), "spell_resist"] = 0.85
    df.loc[df["name"].str.contains("Diamond Golem"), "spell_resist"] = 0.95

    # 5. Usuwamy nieprzydatne kolumny po wyciągnięciu cech
    columns_to_drop = [
        "town",
        "lvl",
        "grw",
        "cost",
        "special",
        "unnamed:_12",
        "unnamed: 12",
        "dmg",
    ]
    df = df.drop(
        columns=[col for col in columns_to_drop if col in df.columns],
        errors="ignore",
    )

    # 6. Dodajemy stałe unit_id od 1 w górę (0 to EMPTY w JAX)
    df.insert(0, "unit_id", range(1, len(df) + 1))

    numeric_columns = [
        "attack",
        "defense",
        "min_dmg",
        "max_dmg",
        "hp",
        "speed",
        "ai_value",
    ]
    for col in numeric_columns:
        if col in df.columns:
            df[col] = (
                df[col]
                .astype(str)
                .str.replace(r"\xa0", "", regex=True)  # Usuwa twarde spacje HTML
                .str.replace(" ", "")  # Usuwa zwykłe spacje
                .str.replace(",", "")  # Usuwa przecinki (angielski separator tysięcy)
                .astype(float)
            )

    # 7. BUDUJEMY MACIERZ JAX (N+1 wierszy x 18 kolumn)
    num_units = df["unit_id"].max()
    lut = np.zeros((num_units + 1, len(Stat)), dtype=np.float32)

    ids = df["unit_id"].values
    lut[ids, Stat.ATTACK] = df["attack"].values
    lut[ids, Stat.DEFENSE] = df["defense"].values
    lut[ids, Stat.MIN_DMG] = df["min_dmg"].values
    lut[ids, Stat.MAX_DMG] = df["max_dmg"].values
    lut[ids, Stat.HP] = df["hp"].values
    lut[ids, Stat.SPEED] = df["speed"].values
    lut[ids, Stat.AI_VALUE] = df["ai_value"].values

    lut[ids, Stat.IS_FLYER] = df["is_flyer"].values
    lut[ids, Stat.IS_SHOOTER] = df["is_shooter"].values
    lut[ids, Stat.IS_TWO_HEX] = df["is_two_hex"].values
    lut[ids, Stat.NO_RETALIATION] = df["no_retaliation"].values
    lut[ids, Stat.IS_UNDEAD] = df["is_undead"].values
    lut[ids, Stat.IS_SPELLCASTER] = df["is_spellcaster"].values
    lut[ids, Stat.SPELL_ID] = df["spell_id"].values
    lut[ids, Stat.BREATH_ATTACK] = df["breath_attack"].values
    lut[ids, Stat.DOUBLE_ATTACK] = df["double_attack"].values
    lut[ids, Stat.SPELL_RESIST] = df["spell_resist"].values

    # 8. ZAPIS DO PLIKÓW
    df.to_csv("homm3_creatures_clean.csv", index=False)
    np.save("homm3_static_lut.npy", lut)

    print(
        f"Sukces! Przetworzono {len(df)} jednostek."
    )
    print("  -> Zapisano tablicę CSV: homm3_creatures_clean.csv")
    print(
        f"  -> Zapisano macierz JAX: homm3_static_lut.npy (Kształt: {lut.shape})"
    )

    # Krótkie sprawdzenie w konsoli
    print("\n--- TEST WYBRANYCH JEDNOSTEK ---")
    for unit_name in [
        "Pikeman",
        "Cerberus",
        "Archer",
        "Azure Dragon",
        "Enchanter",
        "Black Dragon",
        "Devil",
        "Engineer",
        "Jotunn"
    ]:
        row = df[df["name"] == unit_name]
        if not row.empty:
            uid = row["unit_id"].values[0]
            print(f"[{uid}] {unit_name}:")
            print(
                f"    Atak: {lut[uid, Stat.ATTACK]} | HP: {lut[uid, Stat.HP]} | Speed: {lut[uid, Stat.SPEED]}"
            )
            print(
                f"    Flyer: {int(lut[uid, Stat.IS_FLYER])} | Shooter: {int(lut[uid, Stat.IS_SHOOTER])} | 2-Hex: {int(lut[uid, Stat.IS_TWO_HEX])}"
            )
            print(
                f"    NoRetal: {int(lut[uid, Stat.NO_RETALIATION])} | Breath: {int(lut[uid, Stat.BREATH_ATTACK])}"
            )


if __name__ == "__main__":
    build_homm3_dataset()