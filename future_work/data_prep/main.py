"""
Pobiera dane o stworach HoMM3 z wiki i buduje tablice LUT dla silnika JAX.

ZMIANA METODY PARSOWANIA
------------------------
Poprzednia wersja szukala slow kluczowych w calej komorce 'special' przez
str.contains. To jest zawodne: wzorzec "Flying" trafia takze w "No flying
penalty", a brak trafienia jest nieodrozninalny od braku zdolnosci.

Obecna wersja dzieli komorke na tokeny po przecinku i dopasowuje KAZDY token
osobno do listy znanych wzorcow. Tokeny nierozpoznane sa zliczane i wypisywane
na koncu. Dzieki temu:
  * kazda zdolnosc jest albo swiadomie zamodelowana, albo swiadomie zignorowana,
  * dodanie nowej zdolnosci w wiki objawia sie w raporcie, a nie po cichu.

POLITYKA WOBEC NIEZNANYCH ZDOLNOSCI
-----------------------------------
Jednostka z nierozpoznana zdolnoscia NIE jest usuwana z puli - po prostu tej
zdolnosci nie dostaje. Silnik traktuje ja wtedy jak "figure szachowa":
statystyki bazowe plus zdolnosci rozpoznane. Jest to spojne, poniewaz
symulator nie ma zewnetrznego silnika referencyjnego.
"""

import re
import urllib.request
from collections import Counter
from enum import IntEnum

import numpy as np
import pandas as pd

WIKI_URL = "https://heroes.thelazy.net/index.php/List_of_creatures"


# ===========================================================================
# UKLAD TABLICY LUT
# ===========================================================================

class Stat(IntEnum):
    # --- kolumny 0-16: zgodnosc wsteczna, nie zmieniac kolejnosci ---
    ATTACK = 0
    DEFENSE = 1
    MIN_DMG = 2
    MAX_DMG = 3
    HP = 4
    SPEED = 5
    AI_VALUE = 6
    IS_FLYER = 7
    IS_SHOOTER = 8
    IS_TWO_HEX = 9
    NO_RETALIATION = 10
    IS_UNDEAD = 11
    IS_SPELLCASTER = 12
    SPELL_ID = 13
    BREATH_ATTACK = 14
    DOUBLE_ATTACK = 15
    SPELL_RESIST = 16

    # --- nowe kolumny ---
    SHOTS = 17                # rzeczywista liczba strzalow z "Ranged (N shots)"
    THREE_HEADED = 18         # atak trojglowy (cel + 2 sasiadow celu)
    ALL_AROUND = 19           # atak dookolny (wszyscy sasiedzi atakujacego)
    LIFE_DRAIN = 20           # leczenie rowne zadanym obrazeniom
    RETURN_AFTER_STRIKE = 21  # powrot na heks startowy po ataku
    NO_MELEE_PENALTY = 22     # strzelec bez kary w zwarciu
    RETALIATIONS = 23         # ile razy na runde jednostka kontratakuje
    HAS_UNKNOWN = 24          # 1 = mial token nierozpoznany przez parser


DEFAULT_RETALIATIONS = 1.0
UNLIMITED_RETALIATIONS = 20.0    # praktyczna nieskonczonosc (Krolewski Gryf)


# ===========================================================================
# JEDNOSTKI DWUHEKSOWE
# ===========================================================================
# Wiki nie podaje tego w zadnej kolumnie, wiec lista recznie.
# validate_names() zglosi kazda nazwe, ktorej nie ma w pobranych danych.

KNOWN_TWO_HEX_UNITS = {
    "Griffin", "Royal Griffin", "Cavalier", "Champion", "Archangel",
    "Centaur", "Centaur Captain", "Pegasus", "Silver Pegasus",
    "Unicorn", "War Unicorn", "Green Dragon", "Gold Dragon",
    "Naga", "Naga Queen",
    "Hell Hound", "Cerberus",
    "Black Knight", "Death Knight", "Bone Dragon", "Ghost Dragon",
    "Medusa", "Medusa Queen", "Manticore", "Scorpicore",
    "Red Dragon", "Black Dragon",
    "Wolf Rider", "Wolf Raider", "Roc", "Thunderbird",
    "Behemoth", "Ancient Behemoth",
    "Basilisk", "Greater Basilisk", "Gorgon", "Mighty Gorgon",
    "Wyvern", "Wyvern Monarch", "Hydra", "Chaos Hydra",
    "Water Elemental", "Ice Elemental", "Firebird", "Phoenix",
    "Stormbird", "Ayssid", "Sea Serpent", "Haspid",
    "Armadillo", "Bellweather Armadillo", "Automaton",
    "Sentinel Automaton", "Sandworm", "Olgoi-Khorkoi",
    "Couatl", "Crimson Couatl", "Dreadnought", "Juggernaut",
    "Mountain Ram", "Argali", "Yeti", "Yeti Runemaster",
    "Mammoth", "War Mammoth", "Jotunn", "Jotunn Warlord",
    "Boar", "Nomad",
    "Faerie Dragon", "Rust Dragon", "Crystal Dragon", "Azure Dragon",
}


# ===========================================================================
# ROZPOZNAWANIE ZDOLNOSCI
# ===========================================================================
# Kazdy wpis: (wzorzec regex, funkcja aktualizujaca slownik cech).
# Dopasowanie jest do POJEDYNCZEGO tokenu, nie do calej komorki.

def _set(field, value=1.0):
    def apply(feat, match):
        feat[field] = value
    return apply


def _shots(feat, match):
    feat["is_shooter"] = 1.0
    feat["shots"] = float(match.group(1)) if match.group(1) else 0.0


MODELLED_PATTERNS = [
    # --- ruch ---
    # Teleportacja daje w naszym modelu ten sam efekt co lot: ruch
    # ignorujacy zajete i zablokowane heksy po drodze.
    (r"^flying$",                           _set("is_flyer")),
    (r"^teleport(ing|ation)?$",             _set("is_flyer")),

    # --- strzelanie ---
    (r"^ranged(?:\s*\((\d+)\s*shots?\))?$", _shots),
    (r"^no\s+melee\s+penalty$",             _set("no_melee_penalty")),

    # --- kontratak ---
    (r"^no\s+enemy\s+retaliation$",         _set("no_retaliation")),
    (r"^attacks?\s+without\s+retaliation$", _set("no_retaliation")),
    (r"^unlimited\s+retaliations?",
     _set("retaliations", UNLIMITED_RETALIATIONS)),
    (r"^(?:two|2)\s+retaliations?",         _set("retaliations", 2.0)),
    (r"^retaliates?\s+twice$",              _set("retaliations", 2.0)),

    # --- ataki specjalne ---
    (r"^breath\s+attack$",                  _set("breath_attack")),
    (r"^double\s+attack$",                  _set("double_attack")),
    (r"^strikes?\s+twice$",                 _set("double_attack")),
    (r"^attacks?\s+all\s+adjacent",         _set("all_around")),
    (r"^attacks?\s+(?:three|3)\s+adjacent", _set("three_headed")),
    (r"^three[-\s]?headed\s+attack$",       _set("three_headed")),
    (r"^life\s+drain$",                     _set("life_drain")),
    (r"^returns?\s+after\s+(?:attack|strike)", _set("return_after_strike")),

    # --- klasyfikacja pomocnicza (nie wplywa na mechanike) ---
    (r"^undead$",                           _set("is_undead")),
    (r"^unliving$",                         _set("is_undead")),
]

# Tokeny rozpoznane, ale SWIADOMIE nieimplementowane. Wypisujemy je zbiorczo,
# zeby bylo widac, czego model nie obejmuje, i zeby nie zasmiecaly raportu
# tokenow nieznanych.
IGNORED_PATTERNS = [
    r"^hates?\b",                        # nienawisc miedzygatunkowa
    r"^(?:\+|-)?\s*\d*\s*(?:luck|morale)",
    r"^(?:luck|morale)\s*[+-]?\s*\d*$",
    r"^jousting$",                       # szarza kawalerzysty
    r"^charge\s+immunity$",
    r".*immun.*",                        # odpornosci (brak zaklec)
    r".*resistan.*",
    r"^spell",
    r"^casts?\b",
    r"^caster",
    r"^(?:fear|fearless)$",
    r"^(?:poison|disease|ageing|aging|curse|blind|petrif|weakness)\b",
    r"^death\s+(?:stare|cloud|blow)",
    r"^acid\s+breath$",
    r"^rebirth$",
    r"^heal",
    r"^resurrect",
    r"^summons?\b",
    r"^transmutation$",
    r"^magic\s+mirror$",
    r"^(?:catapult|siege)\b",
    r"^no\s+(?:wall|distance|obstacle)\s+penalty$",
    r"^binds?\b",
    r"^dispel",
    r"^regenerat",
    r"^mind\s+spell",
    r"^king\b",
    r"^double\s+damage\s+chance$",
    r"^\d+%",
]

IGNORED_RE = [re.compile(p, re.I) for p in IGNORED_PATTERNS]
MODELLED_RE = [(re.compile(p, re.I), fn) for p, fn in MODELLED_PATTERNS]


def tokenize_special(cell) -> list:
    """Dzieli komorke 'special' na tokeny.

    Wiki zapisuje zdolnosci jako liste rozdzielona przecinkami, np.
    'Teleporting, No enemy retaliation, Luck -1, Hates Angels'.
    Nawiasy zostawiamy, bo niosa liczbe strzalow.
    """
    s = str(cell)
    if s.strip().lower() in ("nan", "none", "-", ""):
        return []
    s = s.replace("\xa0", " ")
    parts = re.split(r"[,;]", s)
    return [re.sub(r"\s+", " ", p).strip(" .") for p in parts if p.strip(" .")]


def parse_abilities(cell, unknown_counter: Counter):
    """Zwraca slownik cech dla jednej jednostki."""
    feat = {
        "is_flyer": 0.0, "is_shooter": 0.0, "shots": 0.0,
        "no_melee_penalty": 0.0, "no_retaliation": 0.0,
        "retaliations": DEFAULT_RETALIATIONS,
        "breath_attack": 0.0, "double_attack": 0.0,
        "all_around": 0.0, "three_headed": 0.0,
        "life_drain": 0.0, "return_after_strike": 0.0,
        "is_undead": 0.0, "has_unknown": 0.0,
    }
    for token in tokenize_special(cell):
        hit = False
        for rx, fn in MODELLED_RE:
            m = rx.match(token)
            if m:
                fn(feat, m)
                hit = True
                break
        if hit:
            continue
        if any(rx.match(token) for rx in IGNORED_RE):
            continue
        unknown_counter[token] += 1
        feat["has_unknown"] = 1.0
    return feat


# ===========================================================================
# PARSOWANIE LICZB
# ===========================================================================

def parse_number(cell) -> float:
    """Odporny na sklejone kolumny 'Fight value' + 'AI value'.

    Dla czterech jednostek pandas wciaga obie wartosci do jednej komorki
    ('582 485' zamiast '485'). Poprawna jest zawsze druga, wiec bierzemy
    ostatni token. Przecinek to separator tysiecy, spacja - granica kolumn.
    """
    s = str(cell).replace("\xa0", " ").replace(",", "")
    tokens = re.findall(r"\d+(?:\.\d+)?", s)
    return float(tokens[-1]) if tokens else np.nan


def parse_damage_range(cell):
    s = str(cell).replace("\xa0", " ").replace(",", "").replace("\u2013", "-")
    nums = re.findall(r"\d+(?:\.\d+)?", s)
    if not nums:
        return np.nan, np.nan
    if len(nums) == 1:
        return float(nums[0]), float(nums[0])
    return float(nums[0]), float(nums[-1])


def validate_names(df):
    present = set(df["name"])
    missing = sorted(KNOWN_TWO_HEX_UNITS - present)
    if missing:
        print(f"\n[UWAGA] {len(missing)} nazw z listy 2-hex nie ma w danych:")
        for name in missing:
            close = [p for p in present
                     if p.lower().replace(" ", "")[:6]
                     == name.lower().replace(" ", "")[:6]]
            print(f"    '{name}'" + (f"  -> moze: {close}" if close else ""))
    else:
        print("[ok] wszystkie nazwy z listy 2-hex odnalezione")


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

    df.columns = (df.columns.str.lower()
                  .str.replace(" ", "_", regex=False)
                  .str.replace("(", "", regex=False)
                  .str.replace(")", "", regex=False))
    df = df.rename(columns={"att": "attack", "def": "defense",
                            "dmg-": "min_dmg", "dmg+": "max_dmg",
                            "spd": "speed", "ai_val": "ai_value"})

    df["name"] = df["name"].apply(
        lambda x: " ".join(dict.fromkeys(str(x).split())))

    if "dmg" in df.columns and "min_dmg" not in df.columns:
        parsed = df["dmg"].apply(parse_damage_range)
        df["min_dmg"] = [p[0] for p in parsed]
        df["max_dmg"] = [p[1] for p in parsed]

    for col in ["attack", "defense", "min_dmg", "max_dmg", "hp", "speed",
                "ai_value"]:
        if col in df.columns:
            df[col] = df[col].apply(parse_number)

    # --- zdolnosci: tokenizacja + dopasowanie ---
    unknown = Counter()
    feats = df["special"].apply(lambda c: parse_abilities(c, unknown))
    for key in list(feats.iloc[0].keys()):
        df[key] = [f[key] for f in feats]

    validate_names(df)
    df["is_two_hex"] = df["name"].isin(KNOWN_TWO_HEX_UNITS).astype(float)
    df["is_spellcaster"] = 0.0     # zdolnosci magiczne swiadomie pominiete
    df["spell_id"] = 0.0
    df["spell_resist"] = 0.0

    # strzelec bez podanej liczby strzalow dostaje wartosc domyslna
    fallback = (df.is_shooter > 0) & (df.shots <= 0)
    if fallback.any():
        print(f"[uwaga] {int(fallback.sum())} strzelcow bez liczby strzalow "
              f"w wiki, przyjmuje 12: {df.loc[fallback, 'name'].tolist()[:8]}")
        df.loc[fallback, "shots"] = 12.0

    df = df.drop(columns=[c for c in ["town", "lvl", "grw", "cost", "special",
                                      "unnamed:_12", "unnamed:_13", "dmg"]
                          if c in df.columns], errors="ignore")
    df.insert(0, "unit_id", range(1, len(df) + 1))

    # --- kontrola jakosci ---
    problems = []
    for col in ["attack", "defense", "min_dmg", "max_dmg", "hp", "speed",
                "ai_value"]:
        n = int(df[col].isna().sum())
        if n:
            problems.append(f"{col}: {n} brakow")
    bad = df[df.ai_value > 100_000]
    if not bad.empty:
        problems.append(f"podejrzane ai_value: {bad['name'].tolist()}")
    if problems:
        print("\n[PROBLEMY]")
        for p in problems:
            print("   ", p)
    else:
        print("[ok] kontrola jakosci bez zastrzezen")

    # --- budowa LUT ---
    n = int(df["unit_id"].max())
    lut = np.zeros((n + 1, len(Stat)), dtype=np.float32)
    ids = df["unit_id"].values
    mapping = {
        Stat.ATTACK: "attack", Stat.DEFENSE: "defense",
        Stat.MIN_DMG: "min_dmg", Stat.MAX_DMG: "max_dmg",
        Stat.HP: "hp", Stat.SPEED: "speed", Stat.AI_VALUE: "ai_value",
        Stat.IS_FLYER: "is_flyer", Stat.IS_SHOOTER: "is_shooter",
        Stat.IS_TWO_HEX: "is_two_hex", Stat.NO_RETALIATION: "no_retaliation",
        Stat.IS_UNDEAD: "is_undead", Stat.IS_SPELLCASTER: "is_spellcaster",
        Stat.SPELL_ID: "spell_id", Stat.BREATH_ATTACK: "breath_attack",
        Stat.DOUBLE_ATTACK: "double_attack", Stat.SPELL_RESIST: "spell_resist",
        Stat.SHOTS: "shots", Stat.THREE_HEADED: "three_headed",
        Stat.ALL_AROUND: "all_around", Stat.LIFE_DRAIN: "life_drain",
        Stat.RETURN_AFTER_STRIKE: "return_after_strike",
        Stat.NO_MELEE_PENALTY: "no_melee_penalty",
        Stat.RETALIATIONS: "retaliations", Stat.HAS_UNKNOWN: "has_unknown",
    }
    for stat, col in mapping.items():
        lut[ids, stat] = np.nan_to_num(df[col].values.astype(np.float32))

    # --- asercje ---
    assert lut.shape[1] == len(Stat)
    assert lut[:, Stat.IS_TWO_HEX].sum() >= 50, "za malo jednostek 2-hex"
    assert lut[:, Stat.IS_SHOOTER].sum() >= 10, "za malo strzelcow"
    assert lut[:, Stat.IS_FLYER].sum() >= 10, "za malo lataczy"
    assert (lut[1:, Stat.HP] > 0).all(), "jednostka z zerowym HP"
    assert (lut[1:, Stat.MIN_DMG] <= lut[1:, Stat.MAX_DMG]).all()
    assert (lut[1:, Stat.RETALIATIONS] >= 1).all(), "zerowa liczba kontratakow"
    sh = lut[:, Stat.IS_SHOOTER] > 0
    assert (lut[sh, Stat.SHOTS] > 0).all(), "strzelec bez strzalow"

    df.to_csv("homm3_creatures_clean.csv", index=False)
    np.save("homm3_static_lut.npy", lut)

    # =======================================================================
    # RAPORT
    # =======================================================================
    print(f"\nPrzetworzono {len(df)} jednostek -> LUT {lut.shape}")

    print("\n--- ROZKLAD ZDOLNOSCI ---")
    for stat in [Stat.IS_FLYER, Stat.IS_SHOOTER, Stat.IS_TWO_HEX,
                 Stat.NO_RETALIATION, Stat.BREATH_ATTACK, Stat.DOUBLE_ATTACK,
                 Stat.THREE_HEADED, Stat.ALL_AROUND, Stat.LIFE_DRAIN,
                 Stat.RETURN_AFTER_STRIKE, Stat.NO_MELEE_PENALTY]:
        print(f"  {stat.name:<22} {int(lut[:, stat].sum()):>4}")

    multi = df[df.retaliations > 1][["name", "retaliations"]]
    print(f"\n--- WIELOKROTNE KONTRATAKI ({len(multi)}) ---")
    for _, r in multi.iterrows():
        print(f"  {r['name']:<22} {int(r['retaliations'])}")
    if multi.empty:
        print("  brak - sprawdz, jak wiki opisuje gryfy "
              "(oczekiwane 'Unlimited retaliations' / 'Two retaliations')")

    shooters = df[df.is_shooter > 0].nlargest(8, "shots")
    print("\n--- STRZELCY O NAJWIEKSZEJ LICZBIE STRZALOW ---")
    for _, r in shooters.iterrows():
        extra = "   (bez kary w zwarciu)" if r["no_melee_penalty"] else ""
        print(f"  {r['name']:<22} {int(r['shots']):>3} strzalow{extra}")

    print(f"\n--- TOKENY NIEROZPOZNANE ({len(unknown)} roznych) ---")
    if unknown:
        for tok, cnt in unknown.most_common(30):
            print(f"  {cnt:>3}x  {tok}")
        print("\n  Dopisz do MODELLED_PATTERNS (jesli chcesz modelowac)")
        print("  albo do IGNORED_PATTERNS (jesli swiadomie pomijasz).")
        print(f"  Dotyczy {int(df.has_unknown.sum())} jednostek - "
              f"traktowane jak bez tej zdolnosci.")
    else:
        print("  brak - wszystkie tokeny rozpoznane")

    print("\n--- KONTROLA WYBRANYCH JEDNOSTEK ---")
    for name in ["Pikeman", "Archer", "Marksman", "Griffin", "Royal Griffin",
                 "Cerberus", "Hydra", "Vampire Lord", "Harpy", "Devil",
                 "Titan", "Green Dragon", "Monk"]:
        r = df[df.name == name]
        if r.empty:
            print(f"  [brak] {name}")
            continue
        r = r.iloc[0]
        tags = []
        for col, tag in [("is_flyer", "lot"), ("is_shooter", "strzal"),
                         ("is_two_hex", "2hex"),
                         ("no_retaliation", "bez-kontr"),
                         ("breath_attack", "oddech"), ("double_attack", "x2"),
                         ("three_headed", "3-glowy"),
                         ("all_around", "dookola"),
                         ("life_drain", "wysysanie"),
                         ("return_after_strike", "powrot"),
                         ("no_melee_penalty", "bez-kary")]:
            if r[col]:
                tags.append(tag)
        if r["retaliations"] > 1:
            tags.append(f"kontr={int(r['retaliations'])}")
        if r["shots"]:
            tags.append(f"strzaly={int(r['shots'])}")
        print(f"  {name:<16} hp={r.hp:>4.0f} spd={r.speed:>2.0f} "
              f"val={r.ai_value:>6.0f} | {', '.join(tags) or 'brak zdolnosci'}")

    return df, lut


if __name__ == "__main__":
    build_homm3_dataset()