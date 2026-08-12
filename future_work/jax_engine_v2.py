"""
Silnik bitwy HoMM3 w JAX/PGX - wersja 2.

Zmiany wzgledem v1:
  * POPRAWIONA PARZYSTOSC HEKSOW (uklad even-r, zgodny z VCMI)
  * jednostki dwuheksowe (heks tylny wyliczany, nie przechowywany)
  * przeszkody terenowe
  * latacze (ignoruja blokady po drodze)
  * kierunkowa przestrzen akcji: (heks, plaszczyzna) zamiast samego heksu
  * losowe armie z tablicy LUT zamiast zahardkodowanej bitwy
  * flagi no_retaliation / double_attack
  * obserwacja zgodna z kontraktem wspoldzielonym z vcmi-gym v15

Czego swiadomie NIE ma (patrz Future Work):
  czary, many, bohaterowie, machiny, obleznia, morale/szczescie,
  nienawisc miedzygatunkowa, szarza kawalerzysty, oddech smoka.
"""

import dataclasses
import time
from enum import IntEnum
from typing import List, Tuple

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
NUM_HEXES = BOARD_ROWS * BOARD_COLS  # 165 - dokladnie tyle, ile ma VCMI
MAX_UNITS = 14                       # 7 na strone
MAX_ROUNDS_STEPS = 200

# Kolejnosc kierunkow ustalona empirycznie z krawedzi ('Hex','Adjacent','Hex')
# w vcmi-gym v15: [TL, TR, R, BR, BL, L]
DIR_TL, DIR_TR, DIR_R, DIR_BR, DIR_BL, DIR_L = range(6)
N_DIRS = 6


def pos_to_idx(col: int, row: int) -> int:
    return row * BOARD_COLS + col


def hex_deltas(row: int) -> List[Tuple[int, int]]:
    """Przesuniecia (dcol, drow) w kolejnosci [TL, TR, R, BR, BL, L].

    Uklad even-r: rzedy PARZYSTE sa przesuniete w prawo.
    Zweryfikowane na danych z vcmi-gym: heks 0 (y=0,x=0) sasiaduje z
    heksem 1 kierunkiem R, z heksem 16 (y=1,x=1) kierunkiem BR
    oraz z heksem 15 (y=1,x=0) kierunkiem BL.
    """
    if row % 2 == 0:
        return [(0, -1), (1, -1), (1, 0), (1, 1), (0, 1), (-1, 0)]
    return [(-1, -1), (0, -1), (1, 0), (0, 1), (-1, 1), (-1, 0)]


def hex_neighbors(col: int, row: int) -> List[Tuple[int, int]]:
    out = []
    for dc, dr in hex_deltas(row):
        c, r = col + dc, row + dr
        if 0 <= c < BOARD_COLS and 0 <= r < BOARD_ROWS:
            out.append((c, r))
    return out


def _build_neighbor_idx() -> np.ndarray:
    """(NUM_HEXES, 6) int32; -1 gdy sasiad wypada poza plansze."""
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
    """Odleglosc heksowa BFS (bez uwzgledniania przeszkod) - dla lataczy."""
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
NEIGHBOR_IDX = jnp.array(_NB)                       # (165, 6)
NEIGHBOR_OK = jnp.array(_NB >= 0)                   # (165, 6) bool
NEIGHBOR_SAFE = jnp.array(np.clip(_NB, 0, NUM_HEXES - 1))
STATIC_ADJ = jnp.array(_build_adjacency())          # (165, 165)
STATIC_DIST = jnp.array(_build_distance())          # (165, 165)
HEX_IDS = jnp.arange(NUM_HEXES)

# ===========================================================================
# 2. PRZESTRZEN AKCJI
# ===========================================================================
# Akcja = (heks docelowy, plaszczyzna).
#   plaszczyzna 0      -> MOVE:  przejdz na ten heks
#   plaszczyzna 1..6   -> AMOVE: stan na tym heksie i uderz sasiada w kierunku d
#   plaszczyzna 7      -> SHOOT: strzel do jednostki stojacej na tym heksie
# Cel ataku wynika z pary (heks, kierunek) - dokladnie jak w VCMI.

PLANE_MOVE = 0
PLANE_AMOVE = 1          # PLANE_AMOVE + d, d in 0..5
PLANE_SHOOT = 7
N_PLANES = 8

N_BOARD_ACTIONS = NUM_HEXES * N_PLANES   # 1320
ACTION_WAIT = N_BOARD_ACTIONS            # 1320
ACTION_DEFEND = N_BOARD_ACTIONS + 1      # 1321
MAX_ACTIONS = N_BOARD_ACTIONS + 2        # 1322


def encode_action(hex_idx, plane):
    return hex_idx * N_PLANES + plane


def decode_action(a):
    return a // N_PLANES, a % N_PLANES


PLANE_SLOTS = {p: HEX_IDS * N_PLANES + p for p in range(N_PLANES)}

# ===========================================================================
# 3. KONTRAKT OBSERWACJI
# ===========================================================================
# Kanaly dobrane tak, by dalo sie je policzyc IDENTYCZNIE po obu stronach
# (tu i w encode_vcmi.py). Nie dodawaj kanalu, ktorego nie umiesz wyliczyc
# z obserwacji vcmi-gym v15.

CHANNELS = [
    "my_unit",      # 0  jednostka gracza aktywnego
    "enemy_unit",   # 1  jednostka przeciwnika
    "value_rel",    # 2  wartosc stacku / wartosc calego pola bitwy
    "is_shooter",   # 3  ma pozostale strzaly
    "is_active",    # 4  jednostka wykonujaca ruch
    "queue_pos",    # 5  pozycja w kolejce tury (0 = najblizej)
    "reachable",    # 6  heks osiagalny dla jednostki aktywnej
    "blocked",      # 7  przeszkoda / heks nieprzechodni
    "my_dmg_to",    # 8  ulamek stacku wroga, ktory zabije aktywna jednostka
    "dmg_to_me",    # 9  ulamek mojego stacku, ktory zabije ten wrog
    "is_rear",      # 10 tylny heks jednostki dwuheksowej
    "round",        # 11 postep bitwy
]
C = len(CHANNELS)
IDX = {name: i for i, name in enumerate(CHANNELS)}


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


# Pula awaryjna, gdy brak pliku LUT: (atk, def, min, max, hp, spd, val,
#                                     flyer, shooter, two_hex, no_ret, dbl)
_FALLBACK = np.array([
    [4, 5, 1, 3, 10, 4, 80, 0, 0, 0, 0, 0],      # Pikeman
    [6, 5, 2, 3, 10, 5, 115, 0, 0, 0, 0, 0],     # Halberdier
    [6, 3, 2, 3, 10, 4, 126, 0, 1, 0, 0, 0],     # Archer
    [6, 3, 2, 3, 10, 6, 184, 0, 1, 0, 0, 1],     # Marksman
    [8, 8, 3, 6, 25, 6, 351, 1, 0, 1, 0, 0],     # Griffin
    [9, 9, 3, 6, 25, 9, 448, 1, 0, 1, 0, 0],     # Royal Griffin
    [10, 12, 6, 9, 35, 5, 445, 0, 0, 0, 0, 0],   # Swordsman
], dtype=np.float32)


def load_pool(lut_path="homm3_static_lut.npy", vmin=60.0, vmax=700.0):
    """Zwraca (POOL, ) - tablice (N, 12) cech stworow dopuszczonych do symulacji.

    Filtr celowo odrzuca wszystko, czego silnik nie modeluje: czarujacych,
    oddech, odpornosc na magie. To jest ta sama pula, ktora nalezy wpisac
    do mapy .vmap uzywanej do ewaluacji na vcmi-gym.
    """
    try:
        lut = np.load(lut_path)
    except (FileNotFoundError, OSError):
        print(f"[uwaga] brak {lut_path}, uzywam puli awaryjnej (7 stworow)")
        return jnp.array(_FALLBACK)

    ok = (
        (lut[:, Stat.IS_SPELLCASTER] == 0)
        & (lut[:, Stat.BREATH_ATTACK] == 0)
        & (lut[:, Stat.SPELL_RESIST] == 0)
        & (lut[:, Stat.AI_VALUE] >= vmin)
        & (lut[:, Stat.AI_VALUE] <= vmax)
        & (lut[:, Stat.HP] > 0)
    )
    sel = lut[ok]
    cols = [Stat.ATTACK, Stat.DEFENSE, Stat.MIN_DMG, Stat.MAX_DMG, Stat.HP,
            Stat.SPEED, Stat.AI_VALUE, Stat.IS_FLYER, Stat.IS_SHOOTER,
            Stat.IS_TWO_HEX, Stat.NO_RETALIATION, Stat.DOUBLE_ATTACK]
    out = sel[:, cols].astype(np.float32)
    print(f"[pula] {out.shape[0]} stworow po filtracji")
    return jnp.array(out)


POOL = load_pool()
P_ATK, P_DEF, P_MIN, P_MAX, P_HP, P_SPD, P_VAL = range(7)
P_FLY, P_SHOOT, P_TWO, P_NORET, P_DBL = range(7, 12)


# ===========================================================================
# 5. STAN GRY
# ===========================================================================

def _z(dtype, n=MAX_UNITS):
    return dataclasses.field(default_factory=lambda: jnp.zeros(n, dtype=dtype))


@struct.dataclass
class BattleState(pgx.State):
    current_player: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.int32(0))
    observation: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros((BOARD_ROWS, BOARD_COLS, C),
                                          dtype=jnp.float32))
    rewards: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(2, dtype=jnp.float32))
    terminated: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.bool_(False))
    truncated: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.bool_(False))
    legal_action_mask: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(MAX_ACTIONS, dtype=jnp.bool_))
    _step_count: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.int32(0))

    active_unit_idx: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.int32(-1))

    # --- teren (stale w obrebie bitwy) ---
    blocked: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(NUM_HEXES, dtype=jnp.bool_))

    # --- jednostki ---
    alive: jnp.ndarray = _z(jnp.bool_)
    side: jnp.ndarray = _z(jnp.int32)
    pos_idx: jnp.ndarray = _z(jnp.int32)        # HEKS CZOLOWY

    count: jnp.ndarray = _z(jnp.int32)
    hp_left: jnp.ndarray = _z(jnp.int32)
    max_hp: jnp.ndarray = _z(jnp.int32)
    speed: jnp.ndarray = _z(jnp.int32)
    attack: jnp.ndarray = _z(jnp.int32)
    defense: jnp.ndarray = _z(jnp.int32)
    min_damage: jnp.ndarray = _z(jnp.int32)
    max_damage: jnp.ndarray = _z(jnp.int32)
    shots: jnp.ndarray = _z(jnp.int32)
    ai_value: jnp.ndarray = _z(jnp.float32)

    is_two_hex: jnp.ndarray = _z(jnp.bool_)
    is_flyer: jnp.ndarray = _z(jnp.bool_)
    no_retaliation: jnp.ndarray = _z(jnp.bool_)
    double_attack: jnp.ndarray = _z(jnp.bool_)

    acted_this_round: jnp.ndarray = _z(jnp.bool_)
    waited_this_round: jnp.ndarray = _z(jnp.bool_)
    is_defending: jnp.ndarray = _z(jnp.bool_)
    retaliated_this_round: jnp.ndarray = _z(jnp.bool_)

    @property
    def env_id(self) -> str:
        return "homm3_v2"


# ===========================================================================
# 6. GEOMETRIA JEDNOSTEK DWUHEKSOWYCH
# ===========================================================================
# Konwencja: strona 0 (atakujacy) stoi po lewej i patrzy w prawo, wiec jej
# heks tylny jest po LEWEJ (pos - 1). Strona 1 odwrotnie (pos + 1).
# Heks tylny NIE jest przechowywany w stanie - zawsze go wyliczamy, zeby
# nie miec dwoch zrodel prawdy.

def rear_offset(side):
    return jnp.where(side == 0, -1, 1)


def rear_valid(pos, side):
    col = pos % BOARD_COLS
    return jnp.where(side == 0, col >= 1, col <= BOARD_COLS - 2)


def rear_hex(pos, side, two):
    """Heks tylny; dla jednostek jednoheksowych zwraca pos (bezpieczne przy scatter)."""
    cand = jnp.clip(pos + rear_offset(side), 0, NUM_HEXES - 1)
    return jnp.where(two & rear_valid(pos, side), cand, pos)


def occupancy(state: BattleState) -> jnp.ndarray:
    """(NUM_HEXES,) bool - heks zajety przez jednostke lub przeszkode."""
    m = jnp.zeros(NUM_HEXES, dtype=jnp.bool_)
    m = m.at[state.pos_idx].max(state.alive)
    r = rear_hex(state.pos_idx, state.side, state.is_two_hex)
    m = m.at[r].max(state.alive & state.is_two_hex)
    return m | state.blocked


def unit_at_hex(state: BattleState) -> jnp.ndarray:
    """(NUM_HEXES,) int32 - id jednostki na heksie albo -1."""
    u = jnp.full(NUM_HEXES, -1, dtype=jnp.int32)
    ids = jnp.arange(MAX_UNITS, dtype=jnp.int32)
    u = u.at[state.pos_idx].max(jnp.where(state.alive, ids, -1))
    r = rear_hex(state.pos_idx, state.side, state.is_two_hex)
    u = u.at[r].max(jnp.where(state.alive & state.is_two_hex, ids, -1))
    return u


def rear_mask(state: BattleState) -> jnp.ndarray:
    """(NUM_HEXES,) bool - heks jest tylna czescia jednostki dwuheksowej."""
    m = jnp.zeros(NUM_HEXES, dtype=jnp.bool_)
    two = state.alive & state.is_two_hex & rear_valid(state.pos_idx, state.side)
    r = jnp.clip(state.pos_idx + rear_offset(state.side), 0, NUM_HEXES - 1)
    return m.at[r].max(two)


# ===========================================================================
# 7. ZASIEG RUCHU
# ===========================================================================

def standable_mask(state: BattleState, u_id) -> jnp.ndarray:
    """Heksy, na ktorych jednostka moze STANAC CZOLEM (dla 2-hex tez tyl wolny)."""
    side = state.side[u_id]
    two = state.is_two_hex[u_id]

    occ = occupancy(state)
    my_f = state.pos_idx[u_id]
    my_r = rear_hex(my_f, side, two)
    occ = occ.at[my_f].set(False).at[my_r].set(False)   # sam siebie nie blokuje
    free = ~occ

    r_all = jnp.clip(HEX_IDS + rear_offset(side), 0, NUM_HEXES - 1)
    r_ok = rear_valid(HEX_IDS, side)
    return free & (~two | (r_ok & free[r_all]))


def reachable_mask(state: BattleState, u_id) -> jnp.ndarray:
    stand = standable_mask(state, u_id)
    my_f = state.pos_idx[u_id]
    spd = state.speed[u_id]

    def fly():
        return (STATIC_DIST[my_f] <= spd) & stand

    def walk():
        init = jnp.zeros(NUM_HEXES, dtype=jnp.bool_).at[my_f].set(True)

        def wave(i, r):
            nxt = jnp.dot(STATIC_ADJ, r)
            return jax.lax.select(i < spd, r | (nxt & stand), r)

        return jax.lax.fori_loop(0, 20, wave, init)

    out = jax.lax.cond(state.is_flyer[u_id], fly, walk)
    return out.at[my_f].set(True)     # zostanie w miejscu jest zawsze dozwolone


def occupied_hexes_of(state, u_id):
    """Para (czolo, tyl) danej jednostki."""
    f = state.pos_idx[u_id]
    return f, rear_hex(f, state.side[u_id], state.is_two_hex[u_id])


def blocked_in_melee(state: BattleState, u_id) -> jnp.ndarray:
    """Czy strzelec jest zwiazany walka wrecz (nie moze strzelac)."""
    uah = unit_at_hex(state)
    enemy_hex = (uah >= 0) & (state.side[jnp.clip(uah, 0, MAX_UNITS - 1)]
                              != state.side[u_id]) & (uah >= 0)
    f, r = occupied_hexes_of(state, u_id)
    return jnp.any(STATIC_ADJ[f] & enemy_hex) | jnp.any(STATIC_ADJ[r] & enemy_hex)


# ===========================================================================
# 8. MASKA LEGALNYCH AKCJI
# ===========================================================================

def legal_action_mask(state: BattleState, u_id) -> jnp.ndarray:
    def none():
        return jnp.zeros(MAX_ACTIONS, dtype=jnp.bool_)

    def build():
        m = jnp.zeros(MAX_ACTIONS, dtype=jnp.bool_)
        reach = reachable_mask(state, u_id)

        uah = unit_at_hex(state)
        safe_u = jnp.clip(uah, 0, MAX_UNITS - 1)
        is_enemy_hex = (uah >= 0) & (state.side[safe_u] != state.side[u_id])

        # --- MOVE (bez ruchu w miejsce, w ktorym juz stoje) ---
        my_f = state.pos_idx[u_id]
        move_ok = reach & (HEX_IDS != my_f)
        m = m.at[PLANE_SLOTS[PLANE_MOVE]].set(move_ok)

        # --- AMOVE: stan na h, uderz sasiada w kierunku d ---
        for d in range(N_DIRS):
            nbr = NEIGHBOR_SAFE[:, d]
            ok = reach & NEIGHBOR_OK[:, d] & is_enemy_hex[nbr]
            m = m.at[PLANE_SLOTS[PLANE_AMOVE + d]].set(ok)

        # --- SHOOT ---
        can_shoot = (state.shots[u_id] > 0) & (~blocked_in_melee(state, u_id))
        m = m.at[PLANE_SLOTS[PLANE_SHOOT]].set(can_shoot & is_enemy_hex)

        m = m.at[ACTION_WAIT].set(~state.waited_this_round[u_id])
        m = m.at[ACTION_DEFEND].set(True)
        return m

    return jax.lax.cond(u_id < 0, none, build)


# ===========================================================================
# 9. KOLEJKA TURY
# ===========================================================================

def turn_priority(state: BattleState) -> jnp.ndarray:
    """Wyzsza wartosc = rusza sie wczesniej. Czekajacy ida po wszystkich innych."""
    pending = state.alive & (~state.acted_this_round)
    normal = pending & (~state.waited_this_round)
    waiting = pending & state.waited_this_round
    score = jnp.where(normal, 1000 + state.speed, -10_000)
    score = jnp.where(waiting, 100 - state.speed, score)
    return score


def get_next_active_unit(state: BattleState) -> jnp.ndarray:
    score = turn_priority(state)
    return jnp.where(jnp.max(score) > -10_000,
                     jnp.argmax(score).astype(jnp.int32),
                     jnp.int32(-1))


def queue_rank(state: BattleState) -> jnp.ndarray:
    """(MAX_UNITS,) - 0 dla jednostki na czele kolejki, rosnaco."""
    s = turn_priority(state)
    return jnp.sum(s[None, :] > s[:, None], axis=1).astype(jnp.float32)


# ===========================================================================
# 10. WALKA
# ===========================================================================

def total_hp(state, i):
    return (state.count[i] - 1) * state.max_hp[i] + state.hp_left[i]


def damage_modifier(state, atk, dfn):
    adef = jnp.where(state.is_defending[dfn],
                     (state.defense[dfn].astype(jnp.float32) * 1.2).astype(jnp.int32),
                     state.defense[dfn])
    diff = state.attack[atk] - adef
    return jnp.where(diff >= 0,
                     1.0 + 0.05 * jnp.minimum(diff, 60),
                     1.0 - 0.025 * jnp.minimum(-diff, 28))


def expected_damage(state, atk, dfn):
    """Sredni cios (bez losowosci) - uzywany w kanalach obserwacji."""
    avg = 0.5 * (state.min_damage[atk] + state.max_damage[atk])
    return state.count[atk] * avg * damage_modifier(state, atk, dfn)


def _strike(state: BattleState, atk, dfn, key):
    per_unit = jax.random.randint(key, (), state.min_damage[atk],
                                  state.max_damage[atk] + 1)
    raw = state.count[atk] * per_unit * damage_modifier(state, atk, dfn)
    dmg = jnp.round(raw).astype(jnp.int32)

    remaining = total_hp(state, dfn) - dmg
    survives = remaining > 0

    new_count = jnp.where(
        survives,
        jnp.ceil(remaining / jnp.maximum(state.max_hp[dfn], 1)).astype(jnp.int32),
        0)
    new_hp = jnp.where(survives,
                       remaining - (new_count - 1) * state.max_hp[dfn],
                       0)
    return state.replace(
        count=state.count.at[dfn].set(new_count),
        hp_left=state.hp_left.at[dfn].set(new_hp),
        alive=state.alive.at[dfn].set(survives),
    ), survives


def execute_melee(state: BattleState, atk, dfn, key):
    k1, k2, k3 = jax.random.split(key, 3)
    state, defender_alive = _strike(state, atk, dfn, k1)

    can_retaliate = (defender_alive
                     & (~state.retaliated_this_round[dfn])
                     & (~state.no_retaliation[atk]))

    def retaliate(st):
        st = st.replace(
            retaliated_this_round=st.retaliated_this_round.at[dfn].set(True))
        st, _ = _strike(st, dfn, atk, k2)
        return st

    state = jax.lax.cond(can_retaliate, retaliate, lambda s: s, state)

    second = state.double_attack[atk] & state.alive[dfn] & state.alive[atk]

    def strike_again(st):
        st, _ = _strike(st, atk, dfn, k3)
        return st

    return jax.lax.cond(second, strike_again, lambda s: s, state)


def execute_shot(state: BattleState, atk, dfn, key):
    k1, k2 = jax.random.split(key, 2)
    state = state.replace(
        shots=state.shots.at[atk].set(jnp.maximum(0, state.shots[atk] - 1)))
    state, _ = _strike(state, atk, dfn, k1)
    second = state.double_attack[atk] & state.alive[dfn]

    def again(st):
        st, _ = _strike(st, atk, dfn, k2)
        return st

    return jax.lax.cond(second, again, lambda s: s, state)


def army_value(state: BattleState, side) -> jnp.ndarray:
    live = state.alive & (state.side == side)
    return jnp.sum(jnp.where(live, state.count * state.ai_value, 0.0))


# ===========================================================================
# 11. OBSERWACJA
# ===========================================================================

def get_observation(state: BattleState) -> jnp.ndarray:
    me = state.current_player
    u = state.active_unit_idx
    safe_u = jnp.clip(u, 0, MAX_UNITS - 1)
    has_active = u >= 0

    obs = jnp.zeros((NUM_HEXES, C), dtype=jnp.float32)

    is_mine = state.alive & (state.side == me)
    is_foe = state.alive & (state.side != me)

    front = state.pos_idx
    rear = rear_hex(front, state.side, state.is_two_hex)
    two_ok = state.alive & state.is_two_hex & rear_valid(front, state.side)

    def paint(o, ch, vals):
        """Wpisuje wartosc na heks czolowy i tylny kazdej zywej jednostki."""
        o = o.at[front, ch].max(jnp.where(state.alive, vals, 0.0))
        return o.at[rear, ch].max(jnp.where(two_ok, vals, 0.0))

    obs = paint(obs, IDX["my_unit"], is_mine.astype(jnp.float32))
    obs = paint(obs, IDX["enemy_unit"], is_foe.astype(jnp.float32))

    # wartosc stacku w promilach calego pola bitwy - ta sama semantyka
    # co VALUE_REL w vcmi-gym v15
    stack_val = jnp.where(state.alive, state.count * state.ai_value, 0.0)
    total_val = jnp.maximum(jnp.sum(stack_val), 1.0)
    obs = paint(obs, IDX["value_rel"], stack_val / total_val)

    obs = paint(obs, IDX["is_shooter"],
                (state.shots > 0).astype(jnp.float32))
    obs = paint(obs, IDX["is_active"],
                (jnp.arange(MAX_UNITS) == u).astype(jnp.float32))
    obs = paint(obs, IDX["queue_pos"],
                jnp.clip(queue_rank(state) / MAX_UNITS, 0.0, 1.0))

    obs = obs.at[:, IDX["is_rear"]].set(rear_mask(state).astype(jnp.float32))
    obs = obs.at[:, IDX["blocked"]].set(state.blocked.astype(jnp.float32))

    reach = jnp.where(has_active,
                      reachable_mask(state, safe_u),
                      jnp.zeros(NUM_HEXES, dtype=jnp.bool_))
    obs = obs.at[:, IDX["reachable"]].set(reach.astype(jnp.float32))

    # przewidywana wymiana ciosow z jednostka aktywna, wyrazona jako ulamek
    # stacku, ktory zginie - odpowiednik tabeli "Sim" z renderu vcmi-gym
    def exchange(i):
        my_out = expected_damage(state, safe_u, i) / jnp.maximum(total_hp(state, i), 1)
        their_out = expected_damage(state, i, safe_u) / jnp.maximum(total_hp(state, safe_u), 1)
        valid = is_foe[i] & has_active
        return (jnp.where(valid, jnp.clip(my_out, 0, 1), 0.0),
                jnp.where(valid, jnp.clip(their_out, 0, 1), 0.0))

    mine_out, theirs_out = jax.vmap(exchange)(jnp.arange(MAX_UNITS))
    obs = paint(obs, IDX["my_dmg_to"], mine_out)
    obs = paint(obs, IDX["dmg_to_me"], theirs_out)

    obs = obs.at[:, IDX["round"]].set(state._step_count / MAX_ROUNDS_STEPS)
    return obs.reshape((BOARD_ROWS, BOARD_COLS, C))


# ===========================================================================
# 12. SRODOWISKO PGX
# ===========================================================================

# Kolumny startowe: jedna kolumna na skrzydle, po jednej jednostce na rzad.
# Gwarantuje, ze heksy tylne jednostek dwuheksowych nigdy nie koliduja.
START_COL_LEFT = 1     # tyl w kolumnie 0
START_COL_RIGHT = 13   # tyl w kolumnie 14
OBSTACLE_COLS = (3, 11)


class HoMM3EnvV2(pgx.Env):
    def __init__(self, max_obstacles: int = 8, min_stacks: int = 2,
                 max_stacks: int = 7):
        super().__init__()
        self.max_obstacles = max_obstacles
        self.min_stacks = min_stacks
        self.max_stacks = max_stacks

    @property
    def id(self) -> str:
        return "homm3_v2"

    @property
    def version(self) -> str:
        return "v2"

    @property
    def num_players(self) -> int:
        return 2

    def _observe(self, state: pgx.State, player_id: jax.Array) -> jnp.ndarray:
        return get_observation(state.replace(current_player=player_id))

    # -------------------------------------------------------------------
    def _init(self, key: jax.Array) -> pgx.State:
        k_pool, k_cnt, k_rows, k_obs, k_n = jax.random.split(key, 5)

        # ile stackow na strone (obie strony tyle samo - symetryczny start)
        n_stacks = jax.random.randint(k_n, (), self.min_stacks,
                                      self.max_stacks + 1)
        slot = jnp.arange(MAX_UNITS)
        side = (slot >= 7).astype(jnp.int32)
        alive = (slot % 7) < n_stacks

        # losowe stwory
        pick = jax.random.randint(k_pool, (MAX_UNITS,), 0, POOL.shape[0])
        row = POOL[pick]                                  # (MAX_UNITS, 12)

        # liczebnosc wyrownujaca wartosc armii
        budget = jax.random.uniform(k_cnt, (), minval=3000.0, maxval=40000.0)
        per_stack = budget / jnp.maximum(n_stacks, 1).astype(jnp.float32)
        cnt = jnp.maximum(1, (per_stack / jnp.maximum(row[:, P_VAL], 1.0))
                          .astype(jnp.int32))

        # pozycje: losowa permutacja rzedow, osobno dla kazdej strony
        k_l, k_r = jax.random.split(k_rows)
        rows_l = jax.random.permutation(k_l, jnp.arange(BOARD_ROWS))[:7]
        rows_r = jax.random.permutation(k_r, jnp.arange(BOARD_ROWS))[:7]
        pos_l = rows_l * BOARD_COLS + START_COL_LEFT
        pos_r = rows_r * BOARD_COLS + START_COL_RIGHT
        pos = jnp.concatenate([pos_l, pos_r]).astype(jnp.int32)

        # przeszkody w srodkowych kolumnach
        n_obs = jax.random.randint(k_obs, (), 0, self.max_obstacles + 1)
        obs_scores = jax.random.uniform(k_obs, (NUM_HEXES,))
        col = HEX_IDS % BOARD_COLS
        in_zone = (col >= OBSTACLE_COLS[0]) & (col <= OBSTACLE_COLS[1])
        obs_scores = jnp.where(in_zone, obs_scores, -1.0)
        thresh = jnp.sort(obs_scores)[NUM_HEXES - 1 - n_obs]
        blocked = (obs_scores > thresh) & in_zone

        st = BattleState(
            blocked=blocked,
            alive=alive,
            side=side,
            pos_idx=pos,
            count=cnt,
            max_hp=row[:, P_HP].astype(jnp.int32),
            hp_left=row[:, P_HP].astype(jnp.int32),
            speed=row[:, P_SPD].astype(jnp.int32),
            attack=row[:, P_ATK].astype(jnp.int32),
            defense=row[:, P_DEF].astype(jnp.int32),
            min_damage=row[:, P_MIN].astype(jnp.int32),
            max_damage=row[:, P_MAX].astype(jnp.int32),
            shots=jnp.where(row[:, P_SHOOT] > 0, 12, 0).astype(jnp.int32),
            ai_value=row[:, P_VAL],
            is_two_hex=row[:, P_TWO] > 0,
            is_flyer=row[:, P_FLY] > 0,
            no_retaliation=row[:, P_NORET] > 0,
            double_attack=row[:, P_DBL] > 0,
        )

        first = get_next_active_unit(st)
        st = st.replace(
            active_unit_idx=first,
            current_player=st.side[jnp.clip(first, 0, MAX_UNITS - 1)],
        )
        return st.replace(
            observation=get_observation(st),
            legal_action_mask=legal_action_mask(st, first),
        )

    # -------------------------------------------------------------------
    def _step(self, state: pgx.State, action: jnp.ndarray,
              key: jax.Array) -> pgx.State:
        u = state.active_unit_idx
        val0_before = army_value(state, 0)
        val1_before = army_value(state, 1)

        hex_idx, plane = decode_action(action)
        uah = unit_at_hex(state)

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
            tgt_hex = NEIGHBOR_SAFE[hex_idx, d]
            tgt = jnp.clip(uah[tgt_hex], 0, MAX_UNITS - 1)
            s = s.replace(pos_idx=s.pos_idx.at[u].set(hex_idx))
            s = execute_melee(s, u, tgt, key)
            return s.replace(acted_this_round=s.acted_this_round.at[u].set(True))

        def do_shoot(s):
            tgt = jnp.clip(uah[hex_idx], 0, MAX_UNITS - 1)
            s = execute_shot(s, u, tgt, key)
            return s.replace(acted_this_round=s.acted_this_round.at[u].set(True))

        def board_action(s):
            return jax.lax.cond(
                plane == PLANE_MOVE, do_move,
                lambda ss: jax.lax.cond(plane == PLANE_SHOOT, do_shoot,
                                        do_amove, ss),
                s)

        state = jax.lax.cond(
            action == ACTION_WAIT, do_wait,
            lambda s: jax.lax.cond(action == ACTION_DEFEND, do_defend,
                                   board_action, s),
            state)

        # --- kolejka / nowa runda ---
        nxt = get_next_active_unit(state)

        def new_round(s):
            return s.replace(
                acted_this_round=jnp.zeros(MAX_UNITS, dtype=jnp.bool_),
                waited_this_round=jnp.zeros(MAX_UNITS, dtype=jnp.bool_),
                retaliated_this_round=jnp.zeros(MAX_UNITS, dtype=jnp.bool_),
                is_defending=jnp.zeros(MAX_UNITS, dtype=jnp.bool_))

        state = jax.lax.cond(nxt < 0, new_round, lambda s: s, state)
        nxt = jnp.where(nxt < 0, get_next_active_unit(state), nxt)
        safe_nxt = jnp.clip(nxt, 0, MAX_UNITS - 1)

        state = state.replace(
            active_unit_idx=nxt,
            current_player=jnp.where(nxt >= 0, state.side[safe_nxt],
                                     state.current_player),
            # obrona wygasa, gdy jednostka znow dochodzi do glosu
            is_defending=state.is_defending.at[safe_nxt].set(False),
            _step_count=state._step_count + 1,
        )

        p0 = jnp.any(state.alive & (state.side == 0))
        p1 = jnp.any(state.alive & (state.side == 1))
        terminated = ~(p0 & p1) | (nxt < 0)

        # nagroda ksztaltujaca: zmiana WARTOSCI armii (nie HP) - zgodna
        # semantycznie z net_value raportowanym przez vcmi-gym
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
            observation=get_observation(state),
            legal_action_mask=legal_action_mask(state, nxt),
        )


# ===========================================================================
# 13. NIEZMIENNIKI (uzywaj w testach!)
# ===========================================================================

def check_invariants(state: BattleState) -> List[str]:
    """Zwraca liste naruszen. Pusta lista = stan poprawny."""
    errs = []
    occ = np.asarray(occupancy(state))
    alive = np.asarray(state.alive)
    two = np.asarray(state.is_two_hex)
    pos = np.asarray(state.pos_idx)
    side = np.asarray(state.side)
    blocked = np.asarray(state.blocked)

    expected = alive.sum() + (alive & two).sum() + blocked.sum()
    if occ.sum() != expected:
        errs.append(f"nakladanie sie jednostek: zajete={occ.sum()} "
                    f"oczekiwane={expected}")

    for i in np.where(alive & two)[0]:
        off = -1 if side[i] == 0 else 1
        r = pos[i] + off
        if not (0 <= r < NUM_HEXES) or r // BOARD_COLS != pos[i] // BOARD_COLS:
            errs.append(f"jednostka 2-hex {i} ma tyl poza rzedem")

    for i in np.where(alive)[0]:
        if blocked[pos[i]]:
            errs.append(f"jednostka {i} stoi na przeszkodzie")

    if not bool(state.terminated) and not np.asarray(state.legal_action_mask).any():
        errs.append("brak legalnych akcji w stanie nieterminalnym")

    cnt = np.asarray(state.count)
    if np.any(alive & (cnt <= 0)):
        errs.append("zywa jednostka z zerowa liczebnoscia")
    return errs


# ===========================================================================
# 14. SMOKE TEST
# ===========================================================================

if __name__ == "__main__":
    env = HoMM3EnvV2()
    init = jax.jit(env.init)
    step = jax.jit(env.step)

    print("Kompilacja...")
    key = jax.random.PRNGKey(0)
    t0 = time.time()
    s = init(key)
    s.active_unit_idx.block_until_ready()
    print(f"  init skompilowany w {time.time()-t0:.1f}s")

    print(f"  obserwacja: {s.observation.shape}  (oczekiwane "
          f"({BOARD_ROWS},{BOARD_COLS},{C}))")
    print(f"  akcje: {MAX_ACTIONS}, legalnych teraz: "
          f"{int(s.legal_action_mask.sum())}")
    print(f"  przeszkody: {int(s.blocked.sum())}, "
          f"jednostki 2-hex: {int((s.alive & s.is_two_hex).sum())}")

    # --- weryfikacja parzystosci wzgledem VCMI ---
    print("\nWeryfikacja geometrii (dane z vcmi-gym):")
    for a, b, name in [(0, 1, "R"), (0, 16, "BR"), (0, 15, "BL")]:
        ok = bool(STATIC_ADJ[a, b])
        print(f"  hex {a} -- {b} ({name}): {'OK' if ok else 'BLAD'}")

    # --- losowe partie + niezmienniki ---
    print("\nLosowe partie z kontrola niezmiennikow...")
    n_games, n_bad, lengths = 200, 0, []
    for g in range(n_games):
        key, k = jax.random.split(key)
        s = init(k)
        for t in range(MAX_ROUNDS_STEPS):
            errs = check_invariants(s)
            if errs:
                n_bad += 1
                print(f"  [gra {g} krok {t}] {errs[0]}")
                break
            if bool(s.terminated):
                break
            legal = jnp.where(s.legal_action_mask)[0]
            key, k1, k2 = jax.random.split(key, 3)
            a = legal[jax.random.randint(k1, (), 0, legal.shape[0])]
            s = step(s, a, k2)
        lengths.append(t)
    print(f"  gier: {n_games}, z naruszeniami: {n_bad}, "
          f"srednia dlugosc: {np.mean(lengths):.1f}")

    # --- przepustowosc ---
    print("\nPomiar przepustowosci (vmap)...")
    BATCH = 512
    vinit = jax.jit(jax.vmap(env.init))
    vstep = jax.jit(jax.vmap(env.step))
    key, k = jax.random.split(key)
    states = vinit(jax.random.split(k, BATCH))

    def rand_actions(st, k):
        logits = jnp.where(st.legal_action_mask, 0.0, -1e9)
        return jax.random.categorical(k, logits, axis=-1)

    key, k = jax.random.split(key)
    a = rand_actions(states, k)
    states = vstep(states, a, jax.random.split(k, BATCH))
    states.active_unit_idx.block_until_ready()

    N = 100
    t0 = time.time()
    for _ in range(N):
        key, k1, k2 = jax.random.split(key, 3)
        a = rand_actions(states, k1)
        states = vstep(states, a, jax.random.split(k2, BATCH))
    states.active_unit_idx.block_until_ready()
    dt = time.time() - t0
    print(f"  {N*BATCH/dt:,.0f} krokow/s  (batch={BATCH})")
    print(f"  dla porownania: VcmiEnv ~113 krokow/s")