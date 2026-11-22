"""
Niezmienny rdzen silnika bitwy HoMM3 w JAX/PGX.

CO JEST W RDZENIU, A CZEGO W NIM NIE MA
---------------------------------------
W rdzeniu jest to, bez czego bitwa nie jest bitwa:
  geometria planszy szesciokatnej, zajetosc heksow, jednostki dwuheksowe,
  zasieg ruchu, kolejka tury z inicjatywy, pojedynczy cios z kontratakiem,
  warunek konca, nagroda, obserwacja w dwunastu kanalach rdzeniowych.

W rdzeniu NIE MA zadnej konkretnej mechaniki stworow. Oddech smoka, atak
trojglowy, wysysanie zycia, blogoslawienstwo, morale, czary - wszystko to
siedzi w osobnych plikach klasa1..klasa4 i wchodzi do programu przez punkty
zaczepienia zebrane w obiekcie `Haki`.

Dodanie nowej mechaniki NIE WYMAGA zmiany tego pliku. Wymaga napisania funkcji
w pliku swojej klasy i dopisania jej w homm3/silnik.py, ktory jest jedynym
miejscem znajacym wszystkie klasy naraz.

DLACZEGO PUNKTY ZACZEPIENIA SA ZWYKLYMI KROTKAMI FUNKCJI
--------------------------------------------------------
`Haki` jest zwykla krotka funkcji Pythona, a petla po niej wykonuje sie
w czasie sledzenia, nie w czasie wykonania. Pusta krotka to pusta petla:
wylaczona mechanika nie zostawia w grafie ani jednej operacji. Dzieki temu
roznica miedzy dwiema konfiguracjami jest czysta - mierzymy dwa rozne
programy, a nie dwie sciezki w jednym.
"""

import dataclasses
import functools
import os
import sys
from enum import IntEnum
from typing import Callable, List, Tuple

import jax
import jax.numpy as jnp
import numpy as np
import pgx
from flax import struct


# ===========================================================================
# 1. GEOMETRIA PLANSZY
# ===========================================================================

BOARD_COLS = 15
BOARD_ROWS = 11
NUM_HEXES = BOARD_ROWS * BOARD_COLS      # 165
MAX_UNITS = 14
MAX_ROUNDS_STEPS = 200

DIR_TL, DIR_TR, DIR_R, DIR_BR, DIR_BL, DIR_L = range(6)
N_DIRS = 6


def pos_to_idx(col: int, row: int) -> int:
    return row * BOARD_COLS + col


def hex_deltas(row: int) -> List[Tuple[int, int]]:
    """Przesuniecia (dcol, drow) w kolejnosci [TL, TR, R, BR, BL, L].

    Uklad even-r: rzedy PARZYSTE przesuniete w prawo. Zweryfikowane na
    krawedziach ('Hex','Adjacent','Hex') z vcmi-gym v15.
    """
    if row % 2 == 0:
        return [(0, -1), (1, -1), (1, 0), (1, 1), (0, 1), (-1, 0)]
    return [(-1, -1), (0, -1), (1, 0), (0, 1), (-1, 1), (-1, 0)]


def _build_neighbor_idx() -> np.ndarray:
    out = np.full((NUM_HEXES, N_DIRS), -1, dtype=np.int32)
    for r in range(BOARD_ROWS):
        for c in range(BOARD_COLS):
            i = pos_to_idx(c, r)
            for d, (dc, dr) in enumerate(hex_deltas(r)):
                nc, nr = c + dc, r + dr
                if 0 <= nc < BOARD_COLS and 0 <= nr < BOARD_ROWS:
                    out[i, d] = pos_to_idx(nc, nr)
    return out


def _build_adjacency() -> np.ndarray:
    adj = np.zeros((NUM_HEXES, NUM_HEXES), dtype=bool)
    nb = _build_neighbor_idx()
    for i in range(NUM_HEXES):
        for d in range(N_DIRS):
            if nb[i, d] >= 0:
                adj[i, nb[i, d]] = True
    return adj


def _build_distance() -> np.ndarray:
    from collections import deque
    nb = _build_neighbor_idx()
    D = np.full((NUM_HEXES, NUM_HEXES), 99, dtype=np.int32)
    for s in range(NUM_HEXES):
        D[s, s] = 0
        q = deque([s])
        while q:
            u = q.popleft()
            for d in range(N_DIRS):
                v = nb[u, d]
                if v >= 0 and D[s, v] == 99:
                    D[s, v] = D[s, u] + 1
                    q.append(v)
    return D


_NB = _build_neighbor_idx()
NEIGHBOR_IDX = jnp.array(_NB)
NEIGHBOR_OK = jnp.array(_NB >= 0)
NEIGHBOR_SAFE = jnp.array(np.clip(_NB, 0, NUM_HEXES - 1))
STATIC_ADJ = jnp.array(_build_adjacency())
STATIC_DIST = jnp.array(_build_distance())
HEX_IDS = jnp.arange(NUM_HEXES)


# ===========================================================================
# 2. PRZESTRZEN AKCJI RDZENIA
# ===========================================================================
# Akcje rdzenia zachowuja swoje indeksy niezaleznie od konfiguracji. Czary
# klasy I ida na koniec, od indeksu MAX_AKCJI_RDZENIA. Dzieki temu kodowanie
# akcji jest porownywalne miedzy konfiguracjami.

PLANE_MOVE = 0
PLANE_AMOVE = 1
PLANE_SHOOT = 7
N_PLANES = 8

N_BOARD_ACTIONS = NUM_HEXES * N_PLANES   # 1320
ACTION_WAIT = N_BOARD_ACTIONS            # 1320
ACTION_DEFEND = N_BOARD_ACTIONS + 1      # 1321
MAX_AKCJI_RDZENIA = N_BOARD_ACTIONS + 2  # 1322


def encode_action(hex_idx, plane):
    return hex_idx * N_PLANES + plane


def decode_action(a):
    return a // N_PLANES, a % N_PLANES


PLANE_SLOTS = {p: HEX_IDS * N_PLANES + p for p in range(N_PLANES)}


# ===========================================================================
# 3. KANALY OBSERWACJI RDZENIA
# ===========================================================================

KANALY_RDZENIA = (
    "my_unit", "enemy_unit", "value_rel", "is_shooter", "is_active",
    "queue_pos", "reachable", "blocked", "my_dmg_to", "dmg_to_me",
    "is_rear", "round",
)
IDX = {n: i for i, n in enumerate(KANALY_RDZENIA)}

MELEE_PENALTY = 0.5      # polowienie obrazen strzelca w zwarciu


# ===========================================================================
# 4. TABLICA STWOROW
# ===========================================================================

class Stat(IntEnum):
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
    SHOTS = 17
    THREE_HEADED = 18
    ALL_AROUND = 19
    LIFE_DRAIN = 20
    RETURN_AFTER_STRIKE = 21
    NO_MELEE_PENALTY = 22
    RETALIATIONS = 23
    HAS_UNKNOWN = 24


(P_ATK, P_DEF, P_MIN, P_MAX, P_HP, P_SPD, P_VAL,
 P_FLY, P_SHOOT, P_TWO, P_NORET, P_DBL,
 P_SHOTS, P_BREATH, P_3HEAD, P_ALLAROUND, P_DRAIN,
 P_RETURN, P_NOMELEE, P_RETAL) = range(20)

POOL_COLS = [
    Stat.ATTACK, Stat.DEFENSE, Stat.MIN_DMG, Stat.MAX_DMG, Stat.HP,
    Stat.SPEED, Stat.AI_VALUE, Stat.IS_FLYER, Stat.IS_SHOOTER,
    Stat.IS_TWO_HEX, Stat.NO_RETALIATION, Stat.DOUBLE_ATTACK,
    Stat.SHOTS, Stat.BREATH_ATTACK, Stat.THREE_HEADED, Stat.ALL_AROUND,
    Stat.LIFE_DRAIN, Stat.RETURN_AFTER_STRIKE, Stat.NO_MELEE_PENALTY,
    Stat.RETALIATIONS,
]

# Pula awaryjna, zeby kod dzialal tez bez pliku LUT. Ostatnie trzy wiersze sa
# sztuczne i dodane po to, zeby mechaniki wielocelowe mialy na czym sie odpalic
# (w prawdziwej puli jednostek z atakiem dookolnym bylo ZERO, wiec kod liczyl
# sie bezwarunkowo i nigdy nie dzialal - to byla pulapka, nie ciekawostka).
_FALLBACK = np.array([
    # atk def min max  hp spd  val fly sht 2hx nrt dbl  sh brt 3hd all drn ret nmp rtl
    [4,  5,  1,  3,  10,  4,  80,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1],
    [6,  5,  2,  3,  10,  5, 115,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1],
    [6,  3,  2,  3,  10,  4, 126,  0,  1,  0,  0,  0, 12,  0,  0,  0,  0,  0,  0,  1],
    [6,  3,  2,  3,  10,  6, 184,  0,  1,  0,  0,  1, 24,  0,  0,  0,  0,  0,  0,  1],
    [8,  8,  3,  6,  25,  6, 351,  1,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  2],
    [9,  9,  3,  6,  25,  9, 448,  1,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0, 20],
    [10, 12, 6,  9,  35,  5, 445,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1],
    [6,  6,  1,  4,  14,  9, 154,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  1],
    [10, 9,  5,  8,  40,  6, 660,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  1],
    [12, 12, 5,  9,  45,  7, 680,  1,  0,  1,  0,  0,  0,  1,  0,  0,  0,  0,  0,  1],
    [8,  8,  2,  5,  15,  8, 500,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  1],
    [16, 12, 6,  8,  80,  5, 700,  0,  0,  1,  1,  0,  0,  0,  0,  1,  0,  0,  0,  1],
    [12, 10, 10, 12, 30,  7, 690,  0,  1,  0,  0,  0, 24,  0,  0,  0,  0,  0,  1,  1],
], dtype=np.float32)


# Gdzie szukamy tablicy stworow. Kilka miejsc, bo katalog roboczy zalezy od
# tego, co zamontowano do kontenera - raz jest to homm3_modularny, raz korzen
# repozytorium. Niewidoczny powrot do puli awaryjnej raz juz kosztowal nas
# przebieg pomiarow policzony na dwunastu stworach zamiast stu jednym.
SCIEZKI_LUT = (
    os.environ.get("HOMM3_LUT", ""),
    "data/homm3_static_lut.npy",
    "../data/homm3_static_lut.npy",
    os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                 "data", "homm3_static_lut.npy"),
    os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__)))), "data", "homm3_static_lut.npy"),
)

POOL_ZRODLO = "nie wczytano"       # skad przyszla pula; wchodzi do wynikow
POOL_AWARYJNA = True               # czy to pula zastepcza
POOL_POPRAWKI = []                 # niemozliwe wiersze, ktore trzeba bylo poprawic


def load_pool(lut_path=None, vmin=60.0, vmax=700.0,
              drop_unknown=False, cicho=False):
    """Zwraca tablice (N, 20) cech stworow dopuszczonych do symulacji.

    Szuka tablicy w kilku miejscach (SCIEZKI_LUT), bo katalog roboczy zalezy
    od montazu kontenera. Jesli nie znajdzie, uzywa puli awaryjnej i MOWI
    O TYM GLOSNO, na standardowe wyjscie bledow - zawsze, nawet przy
    cicho=True. Pula awaryjna ma dwanascie stworow wobec stu jednego
    w prawdziwej tablicy, inne szybkosci i inny rozklad zdolnosci, wiec
    kazda liczba zalezna od zawartosci puli bedzie z nia inna.

    Co od puli NIE zalezy: rozmiar stanu, przestrzen akcji, liczba operacji
    i bajtow w skompilowanym programie, slad pamieciowy jadra. To sa wlasnosci
    KSZTALTOW, a kształty sa takie same. Zalezy od niej natomiast dlugosc
    epizodu, rozklad liczby akcji dopuszczalnych i pokrycie mechanik.
    """
    global POOL_ZRODLO, POOL_AWARYJNA

    kandydaci = ([lut_path] if lut_path else
                 [s for s in SCIEZKI_LUT if s])
    lut = None
    for sciezka in kandydaci:
        try:
            lut = np.load(sciezka)
            POOL_ZRODLO = os.path.abspath(sciezka)
            break
        except (FileNotFoundError, OSError):
            continue

    if lut is None:
        POOL_ZRODLO = f"pula awaryjna ({_FALLBACK.shape[0]} stworow)"
        POOL_AWARYJNA = True
        # To ostrzezenie jest wazniejsze od czystosci wydruku, wiec idzie
        # na stderr ZAWSZE - stdout zostaje czysty dla JSON-a.
        print("=" * 70, file=sys.stderr)
        print("[UWAGA] NIE ZNALAZLEM TABLICY STWOROW - uzywam puli awaryjnej",
              file=sys.stderr)
        print(f"        {_FALLBACK.shape[0]} stworow zamiast ~101.",
              file=sys.stderr)
        print("        Szukalem w:", file=sys.stderr)
        for s in kandydaci:
            print(f"          {os.path.abspath(s)}", file=sys.stderr)
        print("        Liczby zalezne od zawartosci puli (dlugosc epizodu,",
              file=sys.stderr)
        print("        akcje dopuszczalne, pokrycie mechanik) BEDA INNE.",
              file=sys.stderr)
        print("        Napraw: skopiuj plik do data/ albo ustaw HOMM3_LUT.",
              file=sys.stderr)
        print("=" * 70, file=sys.stderr)
        return jnp.array(_FALLBACK)

    POOL_AWARYJNA = False

    if lut.shape[1] < len(Stat):
        raise ValueError(
            f"LUT ma {lut.shape[1]} kolumn, potrzeba {len(Stat)}. "
            f"Przegeneruj tablice nowym main.py. Plik: {POOL_ZRODLO}")

    ok = ((lut[:, Stat.HP] > 0)
          & (lut[:, Stat.AI_VALUE] >= vmin)
          & (lut[:, Stat.AI_VALUE] <= vmax))
    if drop_unknown:
        ok &= lut[:, Stat.HAS_UNKNOWN] == 0

    out = lut[ok][:, POOL_COLS].astype(np.float32)
    out[:, P_SHOTS] = np.where((out[:, P_SHOOT] > 0) & (out[:, P_SHOTS] <= 0),
                               12.0, out[:, P_SHOTS])
    out[:, P_RETAL] = np.maximum(out[:, P_RETAL], 1.0)

    # ------------------------------------------------------------------
    # Kontrola sensownosci wierszy.
    #
    # Silnik jest bezgalezowy i nie sprawdza niczego w czasie gry - a to
    # znaczy, ze niemozliwa wartosc w tablicy nie wywoluje bledu, tylko
    # cicho rozchodzi sie przez arytmetyke. Najgorszy przypadek jest
    # konkretny: ujemne obrazenia minimalne daja ujemny cios, ujemny cios
    # w `zadaj_obrazenia` zwieksza `remaining`, a zwiekszone `remaining`
    # ODTWARZA polegly stos. Niezmiennik zglasza wtedy "wysysanie zycia
    # przekroczylo pulap", choc wysysanie nie ma z tym nic wspolnego.
    #
    # Dlatego poprawiamy tutaj, raz, przy wczytywaniu - i mowimy o kazdej
    # poprawce, zamiast ja ukrywac. Poprawki trafiaja tez do plikow
    # wynikow przez `otoczenie()`.
    global POOL_POPRAWKI
    POOL_POPRAWKI = []
    for opis, maska, napraw in (
        ("obrazenia minimalne ponizej zera", out[:, P_MIN] < 0,
         lambda t: np.maximum(t[:, P_MIN], 0.0)),
        ("obrazenia maksymalne ponizej minimalnych", out[:, P_MAX] < out[:, P_MIN],
         lambda t: np.maximum(t[:, P_MAX], t[:, P_MIN])),
        ("obrazenia maksymalne zerowe", out[:, P_MAX] <= 0,
         lambda t: np.maximum(t[:, P_MAX], 1.0)),
        ("szybkosc ponizej jednego", out[:, P_SPD] < 1,
         lambda t: np.maximum(t[:, P_SPD], 1.0)),
        ("atak ponizej zera", out[:, P_ATK] < 0,
         lambda t: np.maximum(t[:, P_ATK], 0.0)),
        ("obrona ponizej zera", out[:, P_DEF] < 0,
         lambda t: np.maximum(t[:, P_DEF], 0.0)),
    ):
        n = int(maska.sum())
        if not n:
            continue
        kolumna = {"obrazenia minimalne ponizej zera": P_MIN,
                   "obrazenia maksymalne ponizej minimalnych": P_MAX,
                   "obrazenia maksymalne zerowe": P_MAX,
                   "szybkosc ponizej jednego": P_SPD,
                   "atak ponizej zera": P_ATK,
                   "obrona ponizej zera": P_DEF}[opis]
        out[:, kolumna] = napraw(out)
        POOL_POPRAWKI.append(f"{opis}: {n} wierszy poprawionych")
        print(f"[pula] POPRAWKA  {opis}: {n} wierszy. Zrodlo: {POOL_ZRODLO}",
              file=sys.stderr)

    if not cicho:
        print(f"[pula] {out.shape[0]} stworow z {POOL_ZRODLO}  "
              f"(2hex {int(out[:, P_TWO].sum())}, "
              f"strzelcy {int(out[:, P_SHOOT].sum())}, "
              f"latacze {int(out[:, P_FLY].sum())}, "
              f"oddech {int(out[:, P_BREATH].sum())}, "
              f"dookolny {int(out[:, P_ALLAROUND].sum())})")
    return jnp.array(out)


POOL = load_pool(cicho=True)


# ===========================================================================
# 5. STAN GRY
# ===========================================================================

def _z(dtype, n=MAX_UNITS):
    return dataclasses.field(default_factory=lambda: jnp.zeros(n, dtype=dtype))


@struct.dataclass
class Rozszerzenie:
    """Pola stanu wnoszone przez mechaniki klas II i IV.

    DEKLARACJA jest tutaj, bo XLA wymaga, zeby uklad stanu byl znany przed
    kompilacja - inaczej nie da sie zbudowac jednej tablicy dla calego wsadu.
    LOGIKA jest w plikach klas i rdzen jej nie zna.

    Mechanika wylaczona dostaje tablice o dlugosci zero. Taka tablica nie
    zajmuje pamieci i nie generuje zadnej operacji, wiec koszt wylaczonej
    mechaniki jest dokladnie zerowy, a nie "maly".

    Znak kodowany razem z czasem trwania. `blogoslawienstwo = +3` znaczy
    blogoslawienstwo na trzy rundy, `-2` to klatwa na dwie rundy, `0` to brak.
    Wzajemne znoszenie sie bufow jest wtedy zwyklym przypisaniem, a nie
    sprawdzaniem warunku: nalozenie klatwy na pole o wartosci +3 daje -3,
    bo po prostu wpisujemy -3. Jedna tablica zamiast dwoch i zero galezi.
    """
    blogoslawienstwo: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(0, dtype=jnp.int8))
    przyspieszenie: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(0, dtype=jnp.int8))
    morale: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(0, dtype=jnp.int8))
    szczescie: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(0, dtype=jnp.int8))
    morale_uzyte: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(0, dtype=jnp.bool_))
    mana: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(0, dtype=jnp.int32))
    moc_czarow: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(0, dtype=jnp.int32))
    czar_w_rundzie: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(0, dtype=jnp.bool_))


@struct.dataclass
class BattleState(pgx.State):
    current_player: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.int32(0))
    observation: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros((BOARD_ROWS, BOARD_COLS,
                                           len(KANALY_RDZENIA)),
                                          dtype=jnp.float32))
    rewards: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(2, dtype=jnp.float32))
    terminated: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.bool_(False))
    truncated: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.bool_(False))
    legal_action_mask: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(MAX_AKCJI_RDZENIA, dtype=jnp.bool_))
    _step_count: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.int32(0))

    active_unit_idx: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.int32(-1))
    blocked: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(NUM_HEXES, dtype=jnp.bool_))

    # --- jednostki: stan zmienny ---
    alive: jnp.ndarray = _z(jnp.bool_)
    side: jnp.ndarray = _z(jnp.int32)
    pos_idx: jnp.ndarray = _z(jnp.int32)
    count: jnp.ndarray = _z(jnp.int32)
    count_start: jnp.ndarray = _z(jnp.int32)
    hp_left: jnp.ndarray = _z(jnp.int32)
    shots: jnp.ndarray = _z(jnp.int32)

    # --- jednostki: statystyki stale ---
    max_hp: jnp.ndarray = _z(jnp.int32)
    speed: jnp.ndarray = _z(jnp.int32)
    attack: jnp.ndarray = _z(jnp.int32)
    defense: jnp.ndarray = _z(jnp.int32)
    min_damage: jnp.ndarray = _z(jnp.int32)
    max_damage: jnp.ndarray = _z(jnp.int32)
    ai_value: jnp.ndarray = _z(jnp.float32)
    retaliations_max: jnp.ndarray = _z(jnp.int32)

    # --- jednostki: flagi zdolnosci (dane z puli; o tym, czy sa czytane,
    #     decyduje konfiguracja) ---
    is_two_hex: jnp.ndarray = _z(jnp.bool_)
    is_flyer: jnp.ndarray = _z(jnp.bool_)
    is_shooter: jnp.ndarray = _z(jnp.bool_)
    no_retaliation: jnp.ndarray = _z(jnp.bool_)
    double_attack: jnp.ndarray = _z(jnp.bool_)
    breath_attack: jnp.ndarray = _z(jnp.bool_)
    three_headed: jnp.ndarray = _z(jnp.bool_)
    all_around: jnp.ndarray = _z(jnp.bool_)
    life_drain: jnp.ndarray = _z(jnp.bool_)
    return_after_strike: jnp.ndarray = _z(jnp.bool_)
    no_melee_penalty: jnp.ndarray = _z(jnp.bool_)

    # --- znaczniki rundy ---
    acted_this_round: jnp.ndarray = _z(jnp.bool_)
    waited_this_round: jnp.ndarray = _z(jnp.bool_)
    is_defending: jnp.ndarray = _z(jnp.bool_)
    retaliations_left: jnp.ndarray = _z(jnp.int32)

    # --- stan wnoszony przez rozszerzenia ---
    ext: Rozszerzenie = dataclasses.field(default_factory=Rozszerzenie)

    @property
    def env_id(self) -> str:
        return "homm3_v4"


# ===========================================================================
# 6. PUNKTY ZACZEPIENIA
# ===========================================================================

@dataclasses.dataclass(frozen=True)
class Haki:
    """Krotki funkcji wstrzykiwanych przez rozszerzenia.

    Kazde pole to krotka. Pusta krotka to brak kodu w grafie.
    Sygnatury sa opisane przy kazdym polu; wszystkie dostaja konfiguracje
    jako ostatni argument, zeby rozszerzenie mialo dostep do swoich parametrow.
    """
    # f(state, row, key, kfg) -> state      -- zasianie stanu na starcie bitwy
    init: Tuple[Callable, ...] = ()
    # f(state, obs, malarz, kfg) -> obs     -- dopisanie kanalow obserwacji
    obserwacja: Tuple[Callable, ...] = ()
    # f(state, u, maska, kfg) -> maska      -- poszerzenie maski legalnych akcji
    maska: Tuple[Callable, ...] = ()
    # f(state, u, action, key, kfg) -> state  -- obsluga akcji poza rdzeniem
    akcja_rozszerzona: Tuple[Callable, ...] = ()
    # f(state, spd, kfg) -> spd             -- szybkosc efektywna
    szybkosc: Tuple[Callable, ...] = ()
    # f(state, atk, lo, hi, kfg) -> (lo, hi)  -- granice losowania obrazen;
    #   haki sie skladaja, kazdy dostaje wynik poprzedniego
    kostka: Tuple[Callable, ...] = ()
    # f(state, atk, dfn, key, is_melee, kfg) -> mnoznik
    mnoznik: Tuple[Callable, ...] = ()
    # f(state, u, atk_hex, d, tgt_hex, key, kfg) -> (state, dmg)
    cele_dodatkowe: Tuple[Callable, ...] = ()
    # f(state, u, tgt, key, is_melee, kfg) -> (state, dmg)
    dodatkowe_ciosy: Tuple[Callable, ...] = ()
    # f(state, u, tgt, dmg, start_hex, key, kfg) -> state
    po_ataku: Tuple[Callable, ...] = ()
    # f(state, u, key, kfg) -> bool         -- czy jednostka traci ture
    przed_tura: Tuple[Callable, ...] = ()
    # f(state, u, action, key, kfg) -> state  -- po wykonaniu akcji jednostki
    po_turze: Tuple[Callable, ...] = ()
    # f(state, kfg) -> state                -- na poczatku nowej rundy
    nowa_runda: Tuple[Callable, ...] = ()

    def ile(self) -> int:
        return sum(len(getattr(self, f.name))
                   for f in dataclasses.fields(self))


HAKI_PUSTE = Haki()


# ===========================================================================
# 7. GEOMETRIA JEDNOSTEK DWUHEKSOWYCH
# ===========================================================================

def rear_offset(side):
    return jnp.where(side == 0, -1, 1)


def rear_valid(pos, side):
    col = pos % BOARD_COLS
    return jnp.where(side == 0, col >= 1, col <= BOARD_COLS - 2)


def rear_hex(pos, side, two):
    cand = jnp.clip(pos + rear_offset(side), 0, NUM_HEXES - 1)
    return jnp.where(two & rear_valid(pos, side), cand, pos)


def occupancy(state: BattleState) -> jnp.ndarray:
    m = jnp.zeros(NUM_HEXES, dtype=jnp.bool_)
    m = m.at[state.pos_idx].max(state.alive)
    r = rear_hex(state.pos_idx, state.side, state.is_two_hex)
    m = m.at[r].max(state.alive & state.is_two_hex)
    return m | state.blocked


def unit_at_hex(state: BattleState) -> jnp.ndarray:
    u = jnp.full(NUM_HEXES, -1, dtype=jnp.int32)
    ids = jnp.arange(MAX_UNITS, dtype=jnp.int32)
    u = u.at[state.pos_idx].max(jnp.where(state.alive, ids, -1))
    r = rear_hex(state.pos_idx, state.side, state.is_two_hex)
    u = u.at[r].max(jnp.where(state.alive & state.is_two_hex, ids, -1))
    return u


def rear_mask(state: BattleState) -> jnp.ndarray:
    m = jnp.zeros(NUM_HEXES, dtype=jnp.bool_)
    two = state.alive & state.is_two_hex & rear_valid(state.pos_idx, state.side)
    r = jnp.clip(state.pos_idx + rear_offset(state.side), 0, NUM_HEXES - 1)
    return m.at[r].max(two)


def enemy_hex_mask(state: BattleState, u_id) -> jnp.ndarray:
    uah = unit_at_hex(state)
    safe = jnp.clip(uah, 0, MAX_UNITS - 1)
    return (uah >= 0) & (state.side[safe] != state.side[u_id]) & state.alive[safe]


def wrogie_jednostki(state: BattleState, u_id) -> jnp.ndarray:
    """(MAX_UNITS,) bool - zywi przeciwnicy jednostki u_id."""
    return state.alive & (state.side != state.side[u_id])


# ===========================================================================
# 8. SZYBKOSC EFEKTYWNA I ZASIEG RUCHU
# ===========================================================================

def szybkosc(state: BattleState, kfg, haki: Haki) -> jnp.ndarray:
    """Szybkosc po uwzglednieniu modyfikatorow. Bez hakow zwraca state.speed."""
    s = state.speed
    for h in haki.szybkosc:
        s = h(state, s, kfg)
    return s


def standable_mask(state: BattleState, u_id) -> jnp.ndarray:
    side = state.side[u_id]
    two = state.is_two_hex[u_id]
    occ = occupancy(state)
    my_f = state.pos_idx[u_id]
    my_r = rear_hex(my_f, side, two)
    occ = occ.at[my_f].set(False).at[my_r].set(False)
    free = ~occ
    r_all = jnp.clip(HEX_IDS + rear_offset(side), 0, NUM_HEXES - 1)
    r_ok = rear_valid(HEX_IDS, side)
    return free & (~two | (r_ok & free[r_all]))


def reachable_mask(state: BattleState, u_id, kfg, haki: Haki) -> jnp.ndarray:
    stand = standable_mask(state, u_id)
    my_f = state.pos_idx[u_id]
    spd = szybkosc(state, kfg, haki)[u_id]

    def fly():
        return (STATIC_DIST[my_f] <= spd) & stand

    def walk():
        init = jnp.zeros(NUM_HEXES, dtype=jnp.bool_).at[my_f].set(True)

        # DWIE IMPLEMENTACJE TEJ SAMEJ FALI
        # ---------------------------------
        # Wersja macierzowa: nxt = STATIC_ADJ @ r, czyli iloczyn 165 x 165
        # razy wektor. To 27 225 mnozen na iteracje, a kazda iteracja
        # materializuje poredni wektor 165 elementow.
        #
        # Wersja z odczytem sasiadow: heks jest osiagalny, jesli osiagalny
        # jest ktorykolwiek z jego szesciu sasiadow. To szesc odczytow po
        # tablicy sasiedztwa, czyli 990 operacji zamiast 27 225. Semantyka
        # identyczna, bo STATIC_ADJ jest symetryczna i powstala dokladnie
        # z NEIGHBOR_SAFE/NEIGHBOR_OK (test_mechanik.py to sprawdza).
        #
        # Po co dwie: ta petla jest podejrzana o wyznaczanie progu rezydencji
        # w L2 (zmierzony slad jadra to 29 kB na srodowisko, a dwadziescia
        # iteracji liczone dwa razy na krok daje 26,4 kB). Jesli podejrzenie
        # jest sluszne, przejscie na odczyt sasiadow przesunie prog w gore
        # i podniesie przepustowosc. Jesli nie - nie zmieni ani jednego,
        # ani drugiego, i trzeba szukac dalej.
        if kfg.zasieg_gatherem:
            def wave(i, r):
                nxt = jnp.any(r[NEIGHBOR_SAFE] & NEIGHBOR_OK, axis=1)
                return jax.lax.select(i < spd, r | (nxt & stand), r)
        else:
            def wave(i, r):
                nxt = jnp.dot(STATIC_ADJ, r)
                return jax.lax.select(i < spd, r | (nxt & stand), r)

        return jax.lax.fori_loop(0, kfg.iteracje_zasiegu, wave, init)

    out = jax.lax.cond(state.is_flyer[u_id], fly, walk)
    return out.at[my_f].set(True)


def occupied_hexes_of(state, u_id):
    f = state.pos_idx[u_id]
    return f, rear_hex(f, state.side[u_id], state.is_two_hex[u_id])


def blocked_in_melee(state: BattleState, u_id) -> jnp.ndarray:
    foe = enemy_hex_mask(state, u_id)
    f, r = occupied_hexes_of(state, u_id)
    return jnp.any(STATIC_ADJ[f] & foe) | jnp.any(STATIC_ADJ[r] & foe)


# ===========================================================================
# 9. MASKA LEGALNYCH AKCJI
# ===========================================================================

def legal_action_mask(state: BattleState, u_id, kfg, haki: Haki) -> jnp.ndarray:
    n = kfg.liczba_akcji

    def none():
        return jnp.zeros(n, dtype=jnp.bool_)

    def build():
        m = jnp.zeros(n, dtype=jnp.bool_)
        reach = reachable_mask(state, u_id, kfg, haki)
        foe = enemy_hex_mask(state, u_id)

        my_f = state.pos_idx[u_id]
        m = m.at[PLANE_SLOTS[PLANE_MOVE]].set(reach & (HEX_IDS != my_f))

        for d in range(N_DIRS):
            nbr = NEIGHBOR_SAFE[:, d]
            m = m.at[PLANE_SLOTS[PLANE_AMOVE + d]].set(
                reach & NEIGHBOR_OK[:, d] & foe[nbr])

        can_shoot = (state.shots[u_id] > 0) & (~blocked_in_melee(state, u_id))
        m = m.at[PLANE_SLOTS[PLANE_SHOOT]].set(can_shoot & foe)

        m = m.at[ACTION_WAIT].set(~state.waited_this_round[u_id])
        m = m.at[ACTION_DEFEND].set(True)

        for h in haki.maska:
            m = h(state, u_id, m, kfg)
        return m

    return jax.lax.cond(u_id < 0, none, build)


# ===========================================================================
# 10. KOLEJKA TURY
# ===========================================================================

def turn_priority(state: BattleState, kfg, haki: Haki) -> jnp.ndarray:
    spd = szybkosc(state, kfg, haki)
    pending = state.alive & (~state.acted_this_round)
    normal = pending & (~state.waited_this_round)
    waiting = pending & state.waited_this_round
    score = jnp.where(normal, 1000 + spd, -10_000)
    score = jnp.where(waiting, 100 - spd, score)
    return score


def get_next_active_unit(state: BattleState, kfg, haki: Haki) -> jnp.ndarray:
    score = turn_priority(state, kfg, haki)
    return jnp.where(jnp.max(score) > -10_000,
                     jnp.argmax(score).astype(jnp.int32),
                     jnp.int32(-1))


def queue_rank(state: BattleState, kfg, haki: Haki) -> jnp.ndarray:
    s = turn_priority(state, kfg, haki)
    return jnp.sum(s[None, :] > s[:, None], axis=1).astype(jnp.float32)


# ===========================================================================
# 11. WALKA
# ===========================================================================

def total_hp(state, i):
    return (state.count[i] - 1) * state.max_hp[i] + state.hp_left[i]


def damage_modifier(state, atk, dfn):
    adef = jnp.where(state.is_defending[dfn],
                     (state.defense[dfn].astype(jnp.float32) * 1.2)
                     .astype(jnp.int32),
                     state.defense[dfn])
    diff = state.attack[atk] - adef
    return jnp.where(diff >= 0,
                     1.0 + 0.05 * jnp.minimum(diff, 60),
                     1.0 - 0.025 * jnp.minimum(-diff, 28))


def expected_damage(state, atk, dfn):
    """Sredni cios bez losowosci - tylko do kanalow obserwacji."""
    avg = 0.5 * (state.min_damage[atk] + state.max_damage[atk])
    return state.count[atk] * avg * damage_modifier(state, atk, dfn)


def zadaj_obrazenia(state: BattleState, dfn, dmg):
    """Wspolna sciezka odejmowania zycia. Uzywaja jej cios i czar.

    Zwraca (stan, czy_przezyl, faktycznie_zadane).
    """
    hp_before = total_hp(state, dfn)
    dealt = jnp.minimum(dmg, jnp.maximum(hp_before, 0))
    remaining = hp_before - dmg
    survives = (remaining > 0) & state.alive[dfn]
    trafiony = (dmg > 0) & state.alive[dfn]

    # Sufit CALKOWITY, nie przez float. Zapis `ceil(a / b)` wyglada niewinnie,
    # ale XLA na karcie nie dzieli - mnozy przez przyblizona odwrotnosc. Dla
    # a = 90, b = 30 daje to 3.0000002, a sufit z tego jest 4. Liczebnosc
    # stosu rosla wiec o jeden przy KAZDYM przeliczeniu stosu o pelnym
    # zyciu - i niezmiennik zglaszal "wysysanie zycia przekroczylo pulap",
    # choc wysysania nie bylo w puli ani razu.
    #
    # Trafialo to 6,3 procent par (liczebnosc, zdrowie) w typowym zakresie,
    # ale tylko wtedy, gdy zycie bylo dokladna wielokrotnoscia zdrowia
    # jednostki - czyli przede wszystkim stosy nietkniete. Dlatego ujawnilo
    # sie wylacznie przy czarach atakujacych: czar przechodzi przez WSZYSTKIE
    # stosy, zadajac nietrafionym zero obrazen, i kazdy taki stos przechodzi
    # przez to przeliczenie. Na procesorze XLA dzieli dokladnie i bledu nie ma,
    # co jest osobna nauczka: ten pomiar musial pojsc na karte, zeby peknac.
    mh = jnp.maximum(state.max_hp[dfn], 1)
    new_count = jnp.where(
        survives,
        (remaining + mh - 1) // mh,
        jnp.where(trafiony, 0, state.count[dfn]))
    new_hp = jnp.where(survives,
                       remaining - (new_count - 1) * state.max_hp[dfn],
                       jnp.where(trafiony, 0, state.hp_left[dfn]))
    new_alive = jnp.where(trafiony, survives, state.alive[dfn])

    return state.replace(
        count=state.count.at[dfn].set(new_count),
        hp_left=state.hp_left.at[dfn].set(new_hp),
        alive=state.alive.at[dfn].set(new_alive),
    ), survives, dealt


def _strike(state: BattleState, atk, dfn, key, kfg, haki: Haki,
            is_melee=True):
    """Pojedyncze uderzenie. Zwraca (stan, czy_obronca_zyje, obrazenia)."""
    valid = state.alive[dfn] & state.alive[atk] & (state.count[atk] > 0)

    lo, hi = state.min_damage[atk], state.max_damage[atk]
    for h in haki.kostka:
        lo, hi = h(state, atk, lo, hi, kfg)

    k_kostka, k_mnoznik = jax.random.split(key)
    per_unit = jax.random.randint(k_kostka, (), lo,
                                  jnp.maximum(hi + 1, lo + 1))

    raw = (state.count[atk] * per_unit * damage_modifier(state, atk, dfn))
    for i, h in enumerate(haki.mnoznik):
        raw = raw * h(state, atk, dfn,
                      jax.random.fold_in(k_mnoznik, i), is_melee, kfg)

    dmg = jnp.where(valid, jnp.round(raw).astype(jnp.int32), 0)
    return zadaj_obrazenia(state, dfn, dmg)


def execute_melee(state: BattleState, u, tgt, atk_hex, d, start_hex, key,
                  kfg, haki: Haki):
    """Pelna sekwencja ataku wrecz: cios glowny, cele dodatkowe, kontratak."""
    k1, k2, k3, k4 = jax.random.split(key, 4)
    tgt_hex = NEIGHBOR_SAFE[atk_hex, d]

    # 1. cios glowny
    state, tgt_alive, dmg = _strike(state, u, tgt, k1, kfg, haki,
                                    is_melee=True)

    # 2. cele dodatkowe (oddech, trojglowy, dookolny) - klasa III
    for i, h in enumerate(haki.cele_dodatkowe):
        state, extra = h(state, u, atk_hex, d, tgt_hex,
                         jax.random.fold_in(k2, i), kfg, haki)
        dmg = dmg + extra

    # 3. kontratak - wylacznie cel glowny
    can_retaliate = (tgt_alive
                     & (state.retaliations_left[tgt] > 0)
                     & (~state.no_retaliation[u]))

    def retaliate(s):
        s = s.replace(retaliations_left=s.retaliations_left.at[tgt].add(-1))
        s, _, _ = _strike(s, tgt, u, k3, kfg, haki, is_melee=True)
        return s

    state = jax.lax.cond(can_retaliate, retaliate, lambda s: s, state)

    # 4. dodatkowe ciosy (podwojny atak) - klasa III
    for i, h in enumerate(haki.dodatkowe_ciosy):
        state, d2 = h(state, u, tgt, jax.random.fold_in(k4, i), True,
                      kfg, haki)
        dmg = dmg + d2

    # 5. po ataku (wysysanie zycia, powrot na heks startowy) - klasa III
    for i, h in enumerate(haki.po_ataku):
        state = h(state, u, tgt, dmg, start_hex,
                  jax.random.fold_in(k4, 100 + i), kfg, haki)
    return state


def execute_shot(state: BattleState, u, tgt, key, kfg, haki: Haki):
    k1, k2, k3 = jax.random.split(key, 3)
    state = state.replace(
        shots=state.shots.at[u].set(jnp.maximum(0, state.shots[u] - 1)))
    state, _, dmg = _strike(state, u, tgt, k1, kfg, haki, is_melee=False)

    for i, h in enumerate(haki.dodatkowe_ciosy):
        state, d2 = h(state, u, tgt, jax.random.fold_in(k2, i), False,
                      kfg, haki)
        dmg = dmg + d2

    for i, h in enumerate(haki.po_ataku):
        state = h(state, u, tgt, dmg, state.pos_idx[u],
                  jax.random.fold_in(k3, i), kfg, haki)
    return state


def army_value(state: BattleState, side) -> jnp.ndarray:
    live = state.alive & (state.side == side)
    return jnp.sum(jnp.where(live, state.count * state.ai_value, 0.0))


# ===========================================================================
# 12. OBSERWACJA
# ===========================================================================

def zrob_malarz(state: BattleState):
    """Zwraca funkcje malujaca wartosci per jednostka na zajmowane heksy.

    Rozszerzenia dostaja ja w haku obserwacji, zeby nie powtarzac geometrii
    jednostek dwuheksowych.
    """
    front = state.pos_idx
    rear = rear_hex(front, state.side, state.is_two_hex)
    two_ok = state.alive & state.is_two_hex & rear_valid(front, state.side)

    def paint(o, ch, vals):
        o = o.at[front, ch].max(jnp.where(state.alive, vals, 0.0))
        return o.at[rear, ch].max(jnp.where(two_ok, vals, 0.0))

    return paint


def get_observation(state: BattleState, kfg, haki: Haki) -> jnp.ndarray:
    me = state.current_player
    u = state.active_unit_idx
    safe_u = jnp.clip(u, 0, MAX_UNITS - 1)
    has_active = u >= 0
    C = kfg.liczba_kanalow

    obs = jnp.zeros((NUM_HEXES, C), dtype=jnp.float32)
    is_mine = state.alive & (state.side == me)
    is_foe = state.alive & (state.side != me)
    paint = zrob_malarz(state)

    obs = paint(obs, IDX["my_unit"], is_mine.astype(jnp.float32))
    obs = paint(obs, IDX["enemy_unit"], is_foe.astype(jnp.float32))

    stack_val = jnp.where(state.alive, state.count * state.ai_value, 0.0)
    obs = paint(obs, IDX["value_rel"],
                stack_val / jnp.maximum(jnp.sum(stack_val), 1.0))
    obs = paint(obs, IDX["is_shooter"], (state.shots > 0).astype(jnp.float32))
    obs = paint(obs, IDX["is_active"],
                (jnp.arange(MAX_UNITS) == u).astype(jnp.float32))
    obs = paint(obs, IDX["queue_pos"],
                jnp.clip(queue_rank(state, kfg, haki) / MAX_UNITS, 0.0, 1.0))

    obs = obs.at[:, IDX["is_rear"]].set(rear_mask(state).astype(jnp.float32))
    obs = obs.at[:, IDX["blocked"]].set(state.blocked.astype(jnp.float32))

    reach = jnp.where(has_active, reachable_mask(state, safe_u, kfg, haki),
                      jnp.zeros(NUM_HEXES, dtype=jnp.bool_))
    obs = obs.at[:, IDX["reachable"]].set(reach.astype(jnp.float32))

    def exchange(i):
        mine = expected_damage(state, safe_u, i) / jnp.maximum(total_hp(state, i), 1)
        theirs = expected_damage(state, i, safe_u) / jnp.maximum(total_hp(state, safe_u), 1)
        valid = is_foe[i] & has_active
        return (jnp.where(valid, jnp.clip(mine, 0, 1), 0.0),
                jnp.where(valid, jnp.clip(theirs, 0, 1), 0.0))

    mine_out, theirs_out = jax.vmap(exchange)(jnp.arange(MAX_UNITS))
    obs = paint(obs, IDX["my_dmg_to"], mine_out)
    obs = paint(obs, IDX["dmg_to_me"], theirs_out)
    obs = obs.at[:, IDX["round"]].set(state._step_count / MAX_ROUNDS_STEPS)

    # kanaly wnoszone przez rozszerzenia
    for h in haki.obserwacja:
        obs = h(state, obs, paint, kfg)

    # kanaly syntetyczne: powiekszaja D w goracej sciezce, do skanu rezydencji.
    # Kazdy ma inna wartosc, zeby kompilator nie zwinal ich do jednego.
    if kfg.kanaly_wypelniajace:
        baza = state._step_count.astype(jnp.float32) / MAX_ROUNDS_STEPS
        for i in range(kfg.kanaly_wypelniajace):
            ch = kfg.indeksy[f"wypelnienie_{i}"]
            obs = obs.at[:, ch].set(baza * (i + 1) + jnp.float32(i) * 1e-3)

    return obs.reshape((BOARD_ROWS, BOARD_COLS, C))


# ===========================================================================
# 13. SRODOWISKO PGX
# ===========================================================================

START_COL_LEFT = 1
START_COL_RIGHT = 13
OBSTACLE_COLS = (3, 11)


class HoMM3Env(pgx.Env):
    """Srodowisko sparametryzowane konfiguracja.

    Konfiguracja i haki sa polami Pythona, nie tablicami - sa wiec stale
    w czasie sledzenia i nie trafiaja do grafu obliczen.
    """

    def __init__(self, kfg, haki: Haki = HAKI_PUSTE,
                 max_obstacles: int = 8, min_stacks: int = 2,
                 max_stacks: int = 7):
        super().__init__()
        self.kfg = kfg
        self.haki = haki
        self.max_obstacles = max_obstacles
        self.min_stacks = min_stacks
        self.max_stacks = max_stacks

    @property
    def id(self) -> str:
        return "homm3_v4"

    @property
    def version(self) -> str:
        return "v4"

    @property
    def num_players(self) -> int:
        return 2

    @property
    def num_actions(self) -> int:
        return self.kfg.liczba_akcji

    @property
    def observation_shape(self):
        return (BOARD_ROWS, BOARD_COLS, self.kfg.liczba_kanalow)

    def _observe(self, state: pgx.State, player_id: jax.Array) -> jnp.ndarray:
        return get_observation(state.replace(current_player=player_id),
                               self.kfg, self.haki)

    # -------------------------------------------------------------------
    def _init(self, key: jax.Array) -> pgx.State:
        kfg, haki = self.kfg, self.haki
        k_pool, k_cnt, k_rows, k_nobs, k_obs, k_n, k_ext = jax.random.split(key, 7)

        n_stacks = jax.random.randint(k_n, (), self.min_stacks,
                                      self.max_stacks + 1)
        slot = jnp.arange(MAX_UNITS)
        side = (slot >= 7).astype(jnp.int32)
        alive = (slot % 7) < n_stacks

        pick = jax.random.randint(k_pool, (MAX_UNITS,), 0, POOL.shape[0])
        row = POOL[pick]

        budget = jax.random.uniform(k_cnt, (), minval=3000.0, maxval=40000.0)
        per_stack = budget / jnp.maximum(n_stacks, 1).astype(jnp.float32)
        cnt = jnp.maximum(1, (per_stack / jnp.maximum(row[:, P_VAL], 1.0))
                          .astype(jnp.int32))

        k_l, k_r = jax.random.split(k_rows)
        rows_l = jax.random.permutation(k_l, jnp.arange(BOARD_ROWS))[:7]
        rows_r = jax.random.permutation(k_r, jnp.arange(BOARD_ROWS))[:7]
        pos = jnp.concatenate([rows_l * BOARD_COLS + START_COL_LEFT,
                               rows_r * BOARD_COLS + START_COL_RIGHT]
                              ).astype(jnp.int32)

        n_obs = jax.random.randint(k_nobs, (), 0, self.max_obstacles + 1)
        scores = jax.random.uniform(k_obs, (NUM_HEXES,))
        col = HEX_IDS % BOARD_COLS
        in_zone = (col >= OBSTACLE_COLS[0]) & (col <= OBSTACLE_COLS[1])
        scores = jnp.where(in_zone, scores, -1.0)
        thresh = jnp.sort(scores)[NUM_HEXES - 1 - n_obs]
        blocked = (scores > thresh) & in_zone

        # licznik kontratakow: rdzen daje kazdemu jeden. Mechanika
        # wielokrotnego kontrataku (klasa III) nadpisuje to w haku init.
        retal = jnp.ones(MAX_UNITS, dtype=jnp.int32)

        st = BattleState(
            observation=jnp.zeros((BOARD_ROWS, BOARD_COLS,
                                   kfg.liczba_kanalow), dtype=jnp.float32),
            legal_action_mask=jnp.zeros(kfg.liczba_akcji, dtype=jnp.bool_),
            blocked=blocked,
            alive=alive,
            side=side,
            pos_idx=pos,
            count=cnt,
            count_start=cnt,
            max_hp=row[:, P_HP].astype(jnp.int32),
            hp_left=row[:, P_HP].astype(jnp.int32),
            speed=row[:, P_SPD].astype(jnp.int32),
            attack=row[:, P_ATK].astype(jnp.int32),
            defense=row[:, P_DEF].astype(jnp.int32),
            min_damage=row[:, P_MIN].astype(jnp.int32),
            max_damage=row[:, P_MAX].astype(jnp.int32),
            shots=row[:, P_SHOTS].astype(jnp.int32),
            ai_value=row[:, P_VAL],
            retaliations_max=retal,
            retaliations_left=retal,
            is_two_hex=row[:, P_TWO] > 0,
            is_flyer=row[:, P_FLY] > 0,
            is_shooter=row[:, P_SHOOT] > 0,
            no_retaliation=row[:, P_NORET] > 0,
            double_attack=row[:, P_DBL] > 0,
            breath_attack=row[:, P_BREATH] > 0,
            three_headed=row[:, P_3HEAD] > 0,
            all_around=row[:, P_ALLAROUND] > 0,
            life_drain=row[:, P_DRAIN] > 0,
            return_after_strike=row[:, P_RETURN] > 0,
            no_melee_penalty=row[:, P_NOMELEE] > 0,
        )

        for i, h in enumerate(haki.init):
            st = h(st, row, jax.random.fold_in(k_ext, i), kfg)

        first = get_next_active_unit(st, kfg, haki)
        st = st.replace(
            active_unit_idx=first,
            current_player=st.side[jnp.clip(first, 0, MAX_UNITS - 1)])
        return st.replace(
            observation=get_observation(st, kfg, haki),
            legal_action_mask=legal_action_mask(st, first, kfg, haki))

    # -------------------------------------------------------------------
    def _step(self, state: pgx.State, action: jnp.ndarray,
              key: jax.Array) -> pgx.State:
        kfg, haki = self.kfg, self.haki
        if key is None:
            raise ValueError(
                "HoMM3 losuje obrazenia w chwili ataku, wiec env.step wymaga "
                "klucza losowego: env.step(state, action, key).")
        u = state.active_unit_idx
        val0_before = army_value(state, 0)
        val1_before = army_value(state, 1)
        start_hex = state.pos_idx[u]

        k_akcja, k_morale, k_po = jax.random.split(key, 3)
        hex_idx, plane = decode_action(action)
        uah = unit_at_hex(state)

        # --- akcje rdzenia ------------------------------------------------
        def do_wait(s):
            return s.replace(
                waited_this_round=s.waited_this_round.at[u].set(True))

        def do_defend(s):
            return s.replace(
                acted_this_round=s.acted_this_round.at[u].set(True),
                is_defending=s.is_defending.at[u].set(True))

        def do_move(s):
            s = s.replace(pos_idx=s.pos_idx.at[u].set(hex_idx))
            return s.replace(acted_this_round=s.acted_this_round.at[u].set(True))

        def do_amove(s):
            d = plane - PLANE_AMOVE
            tgt = jnp.clip(uah[NEIGHBOR_SAFE[hex_idx, d]], 0, MAX_UNITS - 1)
            s = s.replace(pos_idx=s.pos_idx.at[u].set(hex_idx))
            s = execute_melee(s, u, tgt, hex_idx, d, start_hex, k_akcja,
                              kfg, haki)
            return s.replace(acted_this_round=s.acted_this_round.at[u].set(True))

        def do_shoot(s):
            tgt = jnp.clip(uah[hex_idx], 0, MAX_UNITS - 1)
            s = execute_shot(s, u, tgt, k_akcja, kfg, haki)
            return s.replace(acted_this_round=s.acted_this_round.at[u].set(True))

        def board_action(s):
            return jax.lax.cond(
                plane == PLANE_MOVE, do_move,
                lambda ss: jax.lax.cond(plane == PLANE_SHOOT, do_shoot,
                                        do_amove, ss), s)

        def akcja_jednostki(s):
            return jax.lax.cond(
                action == ACTION_WAIT, do_wait,
                lambda ss: jax.lax.cond(action == ACTION_DEFEND, do_defend,
                                        board_action, ss), s)

        # --- morale ujemne: jednostka traci ture (klasa IV) --------------
        if haki.przed_tura:
            def z_morale(s):
                traci = jnp.bool_(False)
                for i, h in enumerate(haki.przed_tura):
                    traci = traci | h(s, u, jax.random.fold_in(k_morale, i), kfg)

                def stracona(ss):
                    return ss.replace(
                        acted_this_round=ss.acted_this_round.at[u].set(True))

                return jax.lax.cond(traci, stracona, akcja_jednostki, s)
            sciezka_rdzenia = z_morale
        else:
            sciezka_rdzenia = akcja_jednostki

        # --- akcje rozszerzone (czary klasy I) --------------------------
        if haki.akcja_rozszerzona:
            def sciezka_rozszerzona(s):
                for i, h in enumerate(haki.akcja_rozszerzona):
                    s = h(s, u, action, jax.random.fold_in(k_akcja, 500 + i),
                          kfg, haki)
                return s

            state = jax.lax.cond(action >= MAX_AKCJI_RDZENIA,
                                 sciezka_rozszerzona, sciezka_rdzenia, state)
        else:
            state = sciezka_rdzenia(state)

        # --- morale dodatnie: dodatkowa akcja (klasa IV) -----------------
        for i, h in enumerate(haki.po_turze):
            state = h(state, u, action, jax.random.fold_in(k_po, i), kfg)

        # --- kolejka / nowa runda ---------------------------------------
        nxt = get_next_active_unit(state, kfg, haki)

        def new_round(s):
            s = s.replace(
                acted_this_round=jnp.zeros(MAX_UNITS, dtype=jnp.bool_),
                waited_this_round=jnp.zeros(MAX_UNITS, dtype=jnp.bool_),
                is_defending=jnp.zeros(MAX_UNITS, dtype=jnp.bool_),
                retaliations_left=s.retaliations_max)
            for h in haki.nowa_runda:
                s = h(s, kfg)
            return s

        state = jax.lax.cond(nxt < 0, new_round, lambda s: s, state)
        nxt = jnp.where(nxt < 0, get_next_active_unit(state, kfg, haki), nxt)
        safe_nxt = jnp.clip(nxt, 0, MAX_UNITS - 1)

        state = state.replace(
            active_unit_idx=nxt,
            current_player=jnp.where(nxt >= 0, state.side[safe_nxt],
                                     state.current_player),
            is_defending=state.is_defending.at[safe_nxt].set(
                jnp.where(nxt >= 0, False, state.is_defending[safe_nxt])),
            _step_count=state._step_count + 1)

        p0 = jnp.any(state.alive & (state.side == 0))
        p1 = jnp.any(state.alive & (state.side == 1))
        terminated = ~(p0 & p1) | (nxt < 0)

        d0 = jnp.maximum(0.0, val0_before - army_value(state, 0))
        d1 = jnp.maximum(0.0, val1_before - army_value(state, 1))
        scale = 1.0 / jnp.maximum(val0_before + val1_before, 1.0)
        shaped = jnp.array([(d1 - d0) * scale, (d0 - d1) * scale],
                           dtype=jnp.float32)

        rewards = jnp.where(
            terminated,
            jnp.where(p0 & ~p1, jnp.array([1.0, -1.0]),
                      jnp.where(p1 & ~p0, jnp.array([-1.0, 1.0]),
                                jnp.array([0.0, 0.0]))),
            shaped)

        return state.replace(
            terminated=terminated,
            rewards=rewards,
            observation=get_observation(state, kfg, haki),
            legal_action_mask=legal_action_mask(state, nxt, kfg, haki))


# ===========================================================================
# 14. NIEZMIENNIKI
# ===========================================================================

def check_invariants(state: BattleState, kfg=None) -> List[str]:
    errs = []
    occ = np.asarray(occupancy(state))
    alive = np.asarray(state.alive)
    two = np.asarray(state.is_two_hex)
    pos = np.asarray(state.pos_idx)
    side = np.asarray(state.side)
    blocked = np.asarray(state.blocked)

    expected = alive.sum() + (alive & two).sum() + blocked.sum()
    if occ.sum() != expected:
        errs.append(f"nakladanie sie jednostek: {occ.sum()} != {expected}")

    for i in np.where(alive & two)[0]:
        r = pos[i] + (-1 if side[i] == 0 else 1)
        if not (0 <= r < NUM_HEXES) or r // BOARD_COLS != pos[i] // BOARD_COLS:
            errs.append(f"jednostka 2-hex {i} ma tyl poza rzedem")

    for i in np.where(alive)[0]:
        if blocked[pos[i]]:
            errs.append(f"jednostka {i} stoi na przeszkodzie")

    cnt = np.asarray(state.count)
    start = np.asarray(state.count_start)
    if np.any(alive & (cnt <= 0)):
        errs.append("zywa jednostka z zerowa liczebnoscia")
    if np.any(cnt > start):
        bad = np.where(cnt > start)[0]
        errs.append(f"wysysanie zycia przekroczylo pulap: jednostki {bad}")

    rl = np.asarray(state.retaliations_left)
    if np.any(rl < 0):
        errs.append("ujemny licznik kontratakow")
    if np.any(rl > np.asarray(state.retaliations_max)):
        errs.append("licznik kontratakow ponad maksimum")

    # niezmienniki rozszerzen
    ext = state.ext
    for nazwa in ("blogoslawienstwo", "przyspieszenie"):
        tab = np.asarray(getattr(ext, nazwa))
        if tab.size and np.any(np.abs(tab) > 64):
            errs.append(f"nieprawdopodobna wartosc bufa w {nazwa}")
    mana = np.asarray(ext.mana)
    if mana.size and np.any(mana < 0):
        errs.append("ujemna mana")

    if not bool(state.terminated) and not np.asarray(state.legal_action_mask).any():
        errs.append("brak legalnych akcji w stanie nieterminalnym")
    return errs


def bajtow_stanu(state: BattleState) -> int:
    """Rozmiar jednego stanu w bajtach (D). Liczy liscie drzewa pytree."""
    return int(sum(np.asarray(l).nbytes for l in jax.tree.leaves(state)))
