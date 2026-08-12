"""
Pobiera dane o stworach HoMM3 z wiki i buduje tablice LUT dla silnika JAX.

Poprawki wzgledem poprzedniej wersji:
  * naprawione literowki w KNOWN_TWO_HEX_UNITS (Griffon->Griffin itd.)
  * dodane brakujace przecinki (sklejaly po dwie nazwy w jedna)
  * odporne parsowanie liczb (naprawia sklejone Fight value + AI value)
  * automatyczna walidacja: zglasza nazwy z listy, ktorych nie ma w danych
  * asercje na wyjsciu - zepsuty LUT nie przejdzie po cichu

UWAGA: ten skrypt jest jedynym zrodlem homm3_static_lut.npy.
Stare get_data.py / build_npy.py generuja 12-kolumnowa tablice z wyzerowanymi
flagami i musza byc usuniete albo przeniesione do legacy/.
"""

import re
import urllib.request
from enum import IntEnum

import numpy as np
import pandas as pd

WIKI_URL = "https://heroes.thelazy.net/index.php/List_of_creatures"


# ===========================================================================
# UKLAD TABLICY LUT
# ===========================================================================

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
    SPELL_ID = 13

    # --- SPECJALNE ATAKI / PASYWKI (14-16) ---
    BREATH_ATTACK = 14
    DOUBLE_ATTACK = 15
    SPELL_RESIST = 16


# ===========================================================================
# JEDNOSTKI DWUHEKSOWE
# ===========================================================================
# Wiki nie oznacza tego konsekwentnie w kolumnie 'special', wiec lista recznie.
# Pisownia MUSI dokladnie odpowiadac kolumnie 'name' po oczyszczeniu -
# skrypt sam zglosi kazda nazwe, ktorej nie znajdzie (patrz validate_names).
#
# Docelowo lepszym zrodlem jest sam VCMI: liczba krawedzi
# ('Unit','Occupies','Hex') mowi wprost, ile heksow zajmuje stack.

KNOWN_TWO_HEX_UNITS = {
    # Castle
    "Griffin",
    "Royal Griffin",
    "Cavalier",
    "Champion",
    "Archangel",
    # Rampart
    "Centaur",
    "Centaur Captain",
    "Pegasus",
    "Silver Pegasus",
    "Unicorn",
    "War Unicorn",
    "Green Dragon",
    "Gold Dragon",
    # Tower
    "Naga",
    "Naga Queen",
    # Inferno
    "Hell Hound",
    "Cerberus",
    # Necropolis
    "Black Knight",
    "Death Knight",
    "Bone Dragon",
    "Ghost Dragon",
    # Dungeon
    "Medusa",
    "Medusa Queen",
    "Manticore",
    "Scorpicore",
    "Red Dragon",
    "Black Dragon",
    # Stronghold
    "Wolf Rider",
    "Wolf Raider",
    "Roc",
    "Thunderbird",
    "Behemoth",
    "Ancient Behemoth",
    # Fortress
    "Basilisk",
    "Greater Basilisk",
    "Gorgon",
    "Mighty Gorgon",
    "Wyvern",
    "Wyvern Monarch",
    "Hydra",
    "Chaos Hydra",
    # Conflux
    "Water Elemental",
    "Ice Elemental",
    "Firebird",
    "Phoenix",
    # Cove
    "Stormbird",
    "Ayssid",
    "Sea Serpent",
    "Haspid",
    # Factory
    "Armadillo",
    "Bellweather Armadillo",
    "Automaton",
    "Sentinel Automaton",
    "Sandworm",
    "Olgoi-Khorkoi",
    "Couatl",
    "Crimson Couatl",
    "Dreadnought",
    "Juggernaut",
    # Bulwark
    "Mountain Ram",
    "Argali",
    "Yeti",
    "Yeti Runemaster",
    "Mammoth",
    "War Mammoth",
    "Jotunn",
    "Jotunn Warlord",
    # Neutral
    "Boar",
    "Nomad",
    "Faerie Dragon",
    "Rust Dragon",
    "Crystal Dragon",
    "Azure Dragon",
}

# Odpornosc na magie - jedyne wartosci, ktorych wiki nie podaje w tabeli
SPELL_RESIST_MAP = {
    "Steel Golem": 0.80,
    "Gold Golem": 0.85,
    "Diamond Golem": 0.95,
}


# ===========================================================================
# PARSOWANIE
# ===========================================================================

def parse_number(cell) -> float:
    """Wyciaga liczbe z komorki wiki, odporny na sklejone kolumny.

    Wiki trzyma obok siebie 'Fight value' i 'AI value'. Dla czesci wierszy
    pandas wciaga obie do jednej komorki ("582 485" -> po usunieciu spacji
    powstaloby 582485). Poprawna jest zawsze DRUGA liczba, wiec bierzemy
    ostatni token.

    Przecinek traktujemy jako separator tysiecy ("26,433" -> 26433),
    spacje i twarde spacje jako granice miedzy kolumnami.
    """
    s = str(cell).replace("\xa0", " ").replace(",", "")
    tokens = re.findall(r"\d+(?:\.\d+)?", s)
    return float(tokens[-1]) if tokens else np.nan


def parse_damage_range(cell):
    """'2-3' -> (2.0, 3.0); '5' -> (5.0, 5.0). Obsluguje polpauze z wiki."""
    s = str(cell).replace("\xa0", " ").replace(",", "").replace("\u2013", "-")
    nums = re.findall(r"\d+(?:\.\d+)?", s)
    if not nums:
        return np.nan, np.nan
    if len(nums) == 1:
        return float(nums[0]), float(nums[0])
    return float(nums[0]), float(nums[-1])


def validate_names(df: pd.DataFrame) -> None:
    """Zglasza nazwy z KNOWN_TWO_HEX_UNITS, ktorych nie ma w pobranych danych.

    To jest zabezpieczenie przed literowkami i brakujacymi przecinkami -
    dokladnie tymi bledami, ktore wczesniej po cichu zerowaly flage 2-hex.
    """
    present = set(df["name"])
    missing = sorted(KNOWN_TWO_HEX_UNITS - present)
    if missing:
        print(f"\n[UWAGA] {len(missing)} nazw z listy 2-hex nie wystepuje "
              f"w danych z wiki:")
        for name in missing:
            close = [p for p in present
                     if p.lower().replace(" ", "")[:6]
                     == name.lower().replace(" ", "")[:6]]
            hint = f"  -> moze chodzi o: {close}" if close else ""
            print(f"    '{name}'{hint}")
        print("  Sprawdz pisownie albo brakujacy przecinek w liscie.\n")
    else:
        print("[ok] wszystkie nazwy z listy 2-hex odnalezione w danych")


# ===========================================================================
# GLOWNA FUNKCJA
# ===========================================================================

def build_homm3_dataset(url: str = WIKI_URL):
    req = urllib.request.Request(
        url, headers={"User-Agent": "Mozilla/5.0 (X11; Linux x86_64)"})
    with urllib.request.urlopen(req) as response:
        tables = pd.read_html(response, match="Att")

    df = tables[0]
    df = df.dropna(subset=[df.columns[0]]).reset_index(drop=True)

    # --- normalizacja nazw kolumn ---
    df.columns = (
        df.columns.str.lower()
        .str.replace(" ", "_", regex=False)
        .str.replace("(", "", regex=False)
        .str.replace(")", "", regex=False)
    )
    df = df.rename(columns={
        "att": "attack",
        "def": "defense",
        "dmg-": "min_dmg",
        "dmg+": "max_dmg",
        "spd": "speed",
        "ai_val": "ai_value",
    })

    # --- naprawa podwojonych nazw ("Pikeman Pikeman" -> "Pikeman") ---
    df["name"] = df["name"].apply(
        lambda x: " ".join(dict.fromkeys(str(x).split())))

    # --- obrazenia ---
    if "dmg" in df.columns and "min_dmg" not in df.columns:
        parsed = df["dmg"].apply(parse_damage_range)
        df["min_dmg"] = [p[0] for p in parsed]
        df["max_dmg"] = [p[1] for p in parsed]

    # --- kolumny liczbowe (odporne parsowanie) ---
    for col in ["attack", "defense", "min_dmg", "max_dmg", "hp", "speed",
                "ai_value"]:
        if col in df.columns:
            df[col] = df[col].apply(parse_number)

    # --- zdolnosci z kolumny 'special' ---
    special = df["special"].astype(str)

    df["is_flyer"] = special.str.contains(
        "Flying", case=False, na=False).astype(float)
    df["is_shooter"] = special.str.contains(
        "Ranged|shots|shooter", case=False, na=False).astype(float)
    df["no_retaliation"] = special.str.contains(
        "No enemy retaliation", case=False, na=False).astype(float)
    df["is_undead"] = special.str.contains(
        "Undead|Unliving", case=False, na=False).astype(float)
    df["is_spellcaster"] = special.str.contains(
        "Spellcaster", case=False, na=False).astype(float)
    df["breath_attack"] = special.str.contains(
        "Breath attack", case=False, na=False).astype(float)
    df["double_attack"] = special.str.contains(
        "Double attack|Strike twice|Strikes twice",
        case=False, na=False).astype(float)

    validate_names(df)

    df["is_two_hex"] = (
        special.str.contains("Two-hex|2-hex", case=False, na=False)
        | df["name"].isin(KNOWN_TWO_HEX_UNITS)
    ).astype(float)

    df["spell_id"] = 0.0
    df["spell_resist"] = 0.0
    for unit_name, resist in SPELL_RESIST_MAP.items():
        df.loc[df["name"] == unit_name, "spell_resist"] = resist

    # --- sprzatanie ---
    df = df.drop(
        columns=[c for c in ["town", "lvl", "grw", "cost", "special",
                             "unnamed:_12", "unnamed:_13", "dmg",
                             "fight_value"] if c in df.columns],
        errors="ignore")

    df.insert(0, "unit_id", range(1, len(df) + 1))

    # --- kontrola jakosci przed zapisem ---
    problems = []
    for col in ["attack", "defense", "min_dmg", "max_dmg", "hp", "speed",
                "ai_value"]:
        n_nan = int(df[col].isna().sum())
        if n_nan:
            problems.append(f"{col}: {n_nan} brakow")
    suspicious = df[df["ai_value"] > 100_000]
    if not suspicious.empty:
        problems.append(
            f"podejrzane ai_value: {suspicious['name'].tolist()}")
    bad_dmg = df[df["min_dmg"] > df["max_dmg"]]
    if not bad_dmg.empty:
        problems.append(f"min_dmg > max_dmg: {bad_dmg['name'].tolist()}")

    if problems:
        print("\n[PROBLEMY W DANYCH]")
        for p in problems:
            print("   ", p)
    else:
        print("[ok] kontrola jakosci danych bez zastrzezen")

    # --- budowa LUT ---
    n = int(df["unit_id"].max())
    lut = np.zeros((n + 1, len(Stat)), dtype=np.float32)
    ids = df["unit_id"].values

    mapping = {
        Stat.ATTACK: "attack",
        Stat.DEFENSE: "defense",
        Stat.MIN_DMG: "min_dmg",
        Stat.MAX_DMG: "max_dmg",
        Stat.HP: "hp",
        Stat.SPEED: "speed",
        Stat.AI_VALUE: "ai_value",
        Stat.IS_FLYER: "is_flyer",
        Stat.IS_SHOOTER: "is_shooter",
        Stat.IS_TWO_HEX: "is_two_hex",
        Stat.NO_RETALIATION: "no_retaliation",
        Stat.IS_UNDEAD: "is_undead",
        Stat.IS_SPELLCASTER: "is_spellcaster",
        Stat.SPELL_ID: "spell_id",
        Stat.BREATH_ATTACK: "breath_attack",
        Stat.DOUBLE_ATTACK: "double_attack",
        Stat.SPELL_RESIST: "spell_resist",
    }
    for stat, col in mapping.items():
        lut[ids, stat] = np.nan_to_num(df[col].values.astype(np.float32))

    # --- asercje: zepsuty LUT nie moze przejsc dalej ---
    assert lut.shape[1] == 17, f"LUT ma {lut.shape[1]} kolumn zamiast 17"
    assert lut[:, Stat.IS_TWO_HEX].sum() >= 50, (
        f"tylko {int(lut[:, Stat.IS_TWO_HEX].sum())} jednostek 2-hex - "
        f"sprawdz literowki w KNOWN_TWO_HEX_UNITS")
    assert lut[:, Stat.IS_SHOOTER].sum() > 0, "brak strzelcow w LUT"
    assert lut[:, Stat.IS_FLYER].sum() > 0, "brak lataczy w LUT"
    assert (lut[1:, Stat.HP] > 0).all(), "jednostka z zerowym HP"

    df.to_csv("homm3_creatures_clean.csv", index=False)
    np.save("homm3_static_lut.npy", lut)

    print(f"\nSukces! Przetworzono {len(df)} jednostek.")
    print(f"  -> homm3_creatures_clean.csv")
    print(f"  -> homm3_static_lut.npy  {lut.shape}")

    print("\n--- ROZKLAD FLAG ---")
    for stat in [Stat.IS_FLYER, Stat.IS_SHOOTER, Stat.IS_TWO_HEX,
                 Stat.NO_RETALIATION, Stat.IS_SPELLCASTER,
                 Stat.BREATH_ATTACK, Stat.DOUBLE_ATTACK]:
        print(f"  {stat.name:<18} {int(lut[:, stat].sum()):>4}")

    tier = df[(df["ai_value"] >= 60) & (df["ai_value"] <= 700)]
    print(f"\n--- TIER 60-700 (pula treningowa) ---")
    print(f"  jednostek:   {len(tier)}")
    print(f"  w tym 2-hex: {int(tier['is_two_hex'].sum())}")
    print(f"  strzelcy:    {int(tier['is_shooter'].sum())}")
    print(f"  latacze:     {int(tier['is_flyer'].sum())}")

    print("\n--- TEST WYBRANYCH JEDNOSTEK ---")
    for unit_name in ["Pikeman", "Griffin", "Royal Griffin", "Monk",
                      "Cerberus", "Archer", "Faerie Dragon", "Firebird",
                      "Efreet Sultan", "Azure Dragon"]:
        row = df[df["name"] == unit_name]
        if row.empty:
            print(f"  [brak] {unit_name}")
            continue
        uid = int(row["unit_id"].values[0])
        print(f"[{uid}] {unit_name}: atk={lut[uid, Stat.ATTACK]:.0f} "
              f"hp={lut[uid, Stat.HP]:.0f} spd={lut[uid, Stat.SPEED]:.0f} "
              f"val={lut[uid, Stat.AI_VALUE]:.0f} | "
              f"fly={int(lut[uid, Stat.IS_FLYER])} "
              f"shoot={int(lut[uid, Stat.IS_SHOOTER])} "
              f"2hex={int(lut[uid, Stat.IS_TWO_HEX])} "
              f"noret={int(lut[uid, Stat.NO_RETALIATION])}")

    return df, lut


if __name__ == "__main__":
    build_homm3_dataset()