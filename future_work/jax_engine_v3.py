"""
Silnik bitwy HoMM3 w JAX/PGX - wersja 3.

ZMIANY WZGLEDEM v2
------------------
  * retaliated_this_round (bool)  ->  retaliations_left (int)
        1 dla wszystkich, 2 dla Gryfa, 20 dla Krolewskiego Gryfa.
  * ataki wielocelowe: oddech smoka, atak trojglowy, atak dookolny.
        Cele dodatkowe NIE kontratakuja - kontratakuje wylacznie cel glowny.
  * wysysanie zycia z pulapem count_start (nie mozna przekroczyc
        poczatkowej liczebnosci stosu).
  * powrot na heks startowy po ataku (Harpia).
  * kara za zwarcie dla strzelcow (polowa obrazen), znoszona przez
        no_melee_penalty.
  * liczba strzalow czytana z LUT zamiast stalej 12.
  * pula stworow bez filtrowania po zdolnosciach - jednostka z nieznana
        zdolnoscia po prostu jej nie dostaje.

KONTRAKT Z vcmi-gym POZOSTAJE NIENARUSZONY
------------------------------------------
Zadna z powyzszych mechanik nie dodaje graczowi decyzji - silnik wykonuje
je automatycznie przy okazji ataku. Przestrzen akcji (1322) i kanaly
obserwacji (12) sa identyczne jak w v2.
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
NUM_HEXES = BOARD_ROWS * BOARD_COLS
MAX_UNITS = 14
MAX_ROUNDS_STEPS = 200

DIR_TL, DIR_TR, DIR_R, DIR_BR, DIR_BL, DIR_L = range(6)
N_DIRS = 6

MELEE_PENALTY = 0.5      # strzelec atakujacy w zwarciu


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


def hex_neighbors(col: int, row: int) -> List[Tuple[int, int]]:
    out = []
    for dc, dr in hex_deltas(row):
        c, r = col + dc, row + dr
        if 0 <= c < BOARD_COLS and 0 <= r < BOARD_ROWS:
            out.append((c, r))
    return out


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
# 2. PRZESTRZEN AKCJI  (bez zmian wzgledem v2)
# ===========================================================================

PLANE_MOVE = 0
PLANE_AMOVE = 1
PLANE_SHOOT = 7
N_PLANES = 8

N_BOARD_ACTIONS = NUM_HEXES * N_PLANES
ACTION_WAIT = N_BOARD_ACTIONS
ACTION_DEFEND = N_BOARD_ACTIONS + 1
MAX_ACTIONS = N_BOARD_ACTIONS + 2


def encode_action(hex_idx, plane):
    return hex_idx * N_PLANES + plane


def decode_action(a):
    return a // N_PLANES, a % N_PLANES


PLANE_SLOTS = {p: HEX_IDS * N_PLANES + p for p in range(N_PLANES)}

# ===========================================================================
# 3. KONTRAKT OBSERWACJI  (bez zmian wzgledem v2)
# ===========================================================================

CHANNELS = [
    "my_unit", "enemy_unit", "value_rel", "is_shooter", "is_active",
    "queue_pos", "reachable", "blocked", "my_dmg_to", "dmg_to_me",
    "is_rear", "round",
]
C = len(CHANNELS)
IDX = {name: i for i, name in enumerate(CHANNELS)}


# ===========================================================================
# 4. TABLICA STWOROW
# ===========================================================================

class Stat(IntEnum):
    # 0-16: zgodnosc wsteczna
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
    # nowe
    SHOTS = 17
    THREE_HEADED = 18
    ALL_AROUND = 19
    LIFE_DRAIN = 20
    RETURN_AFTER_STRIKE = 21
    NO_MELEE_PENALTY = 22
    RETALIATIONS = 23
    HAS_UNKNOWN = 24


# Kolejnosc kolumn w POOL (tablicy podawanej do _init)
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

# Pula awaryjna: kolumny jak wyzej
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
], dtype=np.float32)


def load_pool(lut_path="homm3_static_lut.npy", vmin=60.0, vmax=700.0,
              drop_unknown=False):
    """Zwraca tablice (N, 20) cech stworow dopuszczonych do symulacji.

    W odroznieniu od v2 NIE odrzucamy jednostek po zdolnosciach. Jednostka
    z niezamodelowana zdolnoscia dostaje tylko statystyki bazowe - jest wtedy
    "figura szachowa". Filtr po zdolnosciach nalezy do mapy ewaluacyjnej,
    nie do silnika treningowego.

    drop_unknown=True odsiewa jednostki, ktorych parser wiki nie rozpoznal
    w calosci (kolumna HAS_UNKNOWN) - przydatne przy budowie mapy .vmap.
    """
    try:
        lut = np.load(lut_path)
    except (FileNotFoundError, OSError):
        print(f"[uwaga] brak {lut_path}, uzywam puli awaryjnej "
              f"({_FALLBACK.shape[0]} stworow)")
        return jnp.array(_FALLBACK)

    if lut.shape[1] < len(Stat):
        raise ValueError(
            f"LUT ma {lut.shape[1]} kolumn, potrzeba {len(Stat)}. "
            f"Przegeneruj tablice nowym main.py.")

    ok = ((lut[:, Stat.HP] > 0)
          & (lut[:, Stat.AI_VALUE] >= vmin)
          & (lut[:, Stat.AI_VALUE] <= vmax))
    if drop_unknown:
        ok &= lut[:, Stat.HAS_UNKNOWN] == 0

    out = lut[ok][:, POOL_COLS].astype(np.float32)
    # strzelec musi miec strzaly, kazdy musi miec co najmniej 1 kontratak
    out[:, P_SHOTS] = np.where((out[:, P_SHOOT] > 0) & (out[:, P_SHOTS] <= 0),
                               12.0, out[:, P_SHOTS])
    out[:, P_RETAL] = np.maximum(out[:, P_RETAL], 1.0)

    print(f"[pula] {out.shape[0]} stworow  "
          f"(2hex {int(out[:, P_TWO].sum())}, "
          f"strzelcy {int(out[:, P_SHOOT].sum())}, "
          f"latacze {int(out[:, P_FLY].sum())}, "
          f"oddech {int(out[:, P_BREATH].sum())}, "
          f"dookolny {int(out[:, P_ALLAROUND].sum())})")
    return jnp.array(out)


POOL = load_pool()


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

    blocked: jnp.ndarray = dataclasses.field(
        default_factory=lambda: jnp.zeros(NUM_HEXES, dtype=jnp.bool_))

    # --- jednostki: stan zmienny ---
    alive: jnp.ndarray = _z(jnp.bool_)
    side: jnp.ndarray = _z(jnp.int32)
    pos_idx: jnp.ndarray = _z(jnp.int32)
    count: jnp.ndarray = _z(jnp.int32)
    count_start: jnp.ndarray = _z(jnp.int32)     # NOWE: pulap wysysania zycia
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
    retaliations_max: jnp.ndarray = _z(jnp.int32)   # NOWE

    # --- jednostki: flagi zdolnosci ---
    is_two_hex: jnp.ndarray = _z(jnp.bool_)
    is_flyer: jnp.ndarray = _z(jnp.bool_)
    is_shooter: jnp.ndarray = _z(jnp.bool_)         # NOWE (odrebne od shots>0)
    no_retaliation: jnp.ndarray = _z(jnp.bool_)
    double_attack: jnp.ndarray = _z(jnp.bool_)
    breath_attack: jnp.ndarray = _z(jnp.bool_)      # NOWE
    three_headed: jnp.ndarray = _z(jnp.bool_)       # NOWE
    all_around: jnp.ndarray = _z(jnp.bool_)         # NOWE
    life_drain: jnp.ndarray = _z(jnp.bool_)         # NOWE
    return_after_strike: jnp.ndarray = _z(jnp.bool_)  # NOWE
    no_melee_penalty: jnp.ndarray = _z(jnp.bool_)   # NOWE

    # --- znaczniki rundy ---
    acted_this_round: jnp.ndarray = _z(jnp.bool_)
    waited_this_round: jnp.ndarray = _z(jnp.bool_)
    is_defending: jnp.ndarray = _z(jnp.bool_)
    retaliations_left: jnp.ndarray = _z(jnp.int32)  # NOWE (bylo bool)

    @property
    def env_id(self) -> str:
        return "homm3_v3"


# ===========================================================================
# 6. GEOMETRIA JEDNOSTEK DWUHEKSOWYCH  (bez zmian)
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
    """(NUM_HEXES,) bool - heks zajety przez wroga jednostki u_id."""
    uah = unit_at_hex(state)
    safe = jnp.clip(uah, 0, MAX_UNITS - 1)
    return (uah >= 0) & (state.side[safe] != state.side[u_id]) & state.alive[safe]


# ===========================================================================
# 7. ZASIEG RUCHU  (bez zmian)
# ===========================================================================

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
    return out.at[my_f].set(True)


def occupied_hexes_of(state, u_id):
    f = state.pos_idx[u_id]
    return f, rear_hex(f, state.side[u_id], state.is_two_hex[u_id])


def blocked_in_melee(state: BattleState, u_id) -> jnp.ndarray:
    foe = enemy_hex_mask(state, u_id)
    f, r = occupied_hexes_of(state, u_id)
    return jnp.any(STATIC_ADJ[f] & foe) | jnp.any(STATIC_ADJ[r] & foe)


# ===========================================================================
# 8. MASKA LEGALNYCH AKCJI  (bez zmian)
# ===========================================================================

def legal_action_mask(state: BattleState, u_id) -> jnp.ndarray:
    def none():
        return jnp.zeros(MAX_ACTIONS, dtype=jnp.bool_)

    def build():
        m = jnp.zeros(MAX_ACTIONS, dtype=jnp.bool_)
        reach = reachable_mask(state, u_id)
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
        return m

    return jax.lax.cond(u_id < 0, none, build)


# ===========================================================================
# 9. KOLEJKA TURY  (bez zmian)
# ===========================================================================

def turn_priority(state: BattleState) -> jnp.ndarray:
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
    s = turn_priority(state)
    return jnp.sum(s[None, :] > s[:, None], axis=1).astype(jnp.float32)


# ===========================================================================
# 10. WALKA
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


def melee_factor(state, atk, is_melee):
    """Strzelec w zwarciu zadaje polowe obrazen, chyba ze ma no_melee_penalty."""
    penalised = is_melee & state.is_shooter[atk] & (~state.no_melee_penalty[atk])
    return jnp.where(penalised, MELEE_PENALTY, 1.0)


def expected_damage(state, atk, dfn):
    """Sredni cios bez losowosci - tylko do kanalow obserwacji."""
    avg = 0.5 * (state.min_damage[atk] + state.max_damage[atk])
    return state.count[atk] * avg * damage_modifier(state, atk, dfn)


def _strike(state: BattleState, atk, dfn, key, is_melee=True):
    """Pojedyncze uderzenie. Zwraca (stan, czy_obronca_zyje, zadane_obrazenia)."""
    hp_before = total_hp(state, dfn)
    valid = state.alive[dfn] & state.alive[atk] & (state.count[atk] > 0)

    per_unit = jax.random.randint(key, (), state.min_damage[atk],
                                  jnp.maximum(state.max_damage[atk] + 1,
                                              state.min_damage[atk] + 1))
    raw = (state.count[atk] * per_unit
           * damage_modifier(state, atk, dfn)
           * melee_factor(state, atk, is_melee))
    dmg = jnp.where(valid, jnp.round(raw).astype(jnp.int32), 0)
    dealt = jnp.minimum(dmg, jnp.maximum(hp_before, 0))

    remaining = hp_before - dmg
    survives = (remaining > 0) & state.alive[dfn]

    new_count = jnp.where(
        survives,
        jnp.ceil(remaining / jnp.maximum(state.max_hp[dfn], 1)).astype(jnp.int32),
        jnp.where(valid, 0, state.count[dfn]))
    new_hp = jnp.where(survives,
                       remaining - (new_count - 1) * state.max_hp[dfn],
                       jnp.where(valid, 0, state.hp_left[dfn]))
    new_alive = jnp.where(valid, survives, state.alive[dfn])

    return state.replace(
        count=state.count.at[dfn].set(new_count),
        hp_left=state.hp_left.at[dfn].set(new_hp),
        alive=state.alive.at[dfn].set(new_alive),
    ), survives, dealt


def _heal(state: BattleState, i, amount):
    """Wysysanie zycia. Pulap: poczatkowa liczebnosc stosu."""
    cap = state.count_start[i] * state.max_hp[i]
    new_total = jnp.minimum(total_hp(state, i) + amount, cap)
    new_total = jnp.maximum(new_total, 1)
    new_count = jnp.ceil(new_total / jnp.maximum(state.max_hp[i], 1)).astype(jnp.int32)
    new_hp = new_total - (new_count - 1) * state.max_hp[i]
    ok = state.alive[i] & (amount > 0)
    return state.replace(
        count=state.count.at[i].set(jnp.where(ok, new_count, state.count[i])),
        hp_left=state.hp_left.at[i].set(jnp.where(ok, new_hp, state.hp_left[i])),
    )


def extra_target_hexes(state: BattleState, u, atk_hex, d, tgt_hex):
    """Heksy trafiane dodatkowo, poza celem glownym.

    oddech    -> heks za celem, ten sam kierunek
    trojglowy -> dwaj sasiedzi ATAKUJACEGO przylegli do celu (kierunki d-1, d+1)
    dookolny  -> wszyscy sasiedzi atakujacego
    """
    m = jnp.zeros(NUM_HEXES, dtype=jnp.bool_)

    beyond = NEIGHBOR_SAFE[tgt_hex, d]
    m = m.at[beyond].max(NEIGHBOR_OK[tgt_hex, d] & state.breath_attack[u])

    for delta in (-1, 1):
        dd = (d + delta) % N_DIRS
        h = NEIGHBOR_SAFE[atk_hex, dd]
        m = m.at[h].max(NEIGHBOR_OK[atk_hex, dd] & state.three_headed[u])

    for k in range(N_DIRS):
        h = NEIGHBOR_SAFE[atk_hex, k]
        m = m.at[h].max(NEIGHBOR_OK[atk_hex, k] & state.all_around[u])

    return m.at[tgt_hex].set(False)


def _strike_extras(state: BattleState, u, hex_mask, key):
    """Uderza wszystkie wrogie jednostki na wskazanych heksach.

    Cele dodatkowe NIE kontratakuja - kontratak przysluguje wylacznie
    celowi glownemu.
    """
    uah = unit_at_hex(state)
    safe = jnp.clip(uah, 0, MAX_UNITS - 1)
    hit_hex = hex_mask & (uah >= 0) & (state.side[safe] != state.side[u])
    hit = jnp.zeros(MAX_UNITS, dtype=jnp.bool_).at[safe].max(hit_hex)
    hit = hit & state.alive & (jnp.arange(MAX_UNITS) != u)

    def body(i, carry):
        st, k, acc = carry
        k, sub = jax.random.split(k)

        def do(s):
            s2, _, dmg = _strike(s, u, i, sub, is_melee=True)
            return s2, dmg

        st2, dmg = jax.lax.cond(hit[i], do, lambda s: (s, jnp.int32(0)), st)
        return st2, k, acc + dmg

    state, _, total = jax.lax.fori_loop(
        0, MAX_UNITS, body, (state, key, jnp.int32(0)))
    return state, total


def execute_melee(state: BattleState, u, tgt, atk_hex, d, start_hex, key):
    """Pelna sekwencja ataku wrecz z celami dodatkowymi i kontratakiem."""
    k1, k2, k3, k4 = jax.random.split(key, 4)
    tgt_hex = NEIGHBOR_SAFE[atk_hex, d]

    # cele dodatkowe wyznaczamy PRZED ciosami (pozycje sie nie zmieniaja)
    extras = extra_target_hexes(state, u, atk_hex, d, tgt_hex)

    # 1. cios glowny
    state, tgt_alive, dmg = _strike(state, u, tgt, k1, is_melee=True)

    # 2. cele dodatkowe
    state, dmg_extra = _strike_extras(state, u, extras, k2)
    dmg = dmg + dmg_extra

    # 3. kontratak - wylacznie cel glowny, jesli ma jeszcze kontrataki
    can_retaliate = (tgt_alive
                     & (state.retaliations_left[tgt] > 0)
                     & (~state.no_retaliation[u]))

    def retaliate(s):
        s = s.replace(retaliations_left=s.retaliations_left.at[tgt]
                      .add(-1))
        s, _, _ = _strike(s, tgt, u, k3, is_melee=True)
        return s

    state = jax.lax.cond(can_retaliate, retaliate, lambda s: s, state)

    # 4. drugi cios (Marksman, Krzyzowiec)
    second = state.double_attack[u] & state.alive[tgt] & state.alive[u]

    def again(s):
        s, _, d2 = _strike(s, u, tgt, k4, is_melee=True)
        return s, d2

    state, dmg2 = jax.lax.cond(second, again,
                               lambda s: (s, jnp.int32(0)), state)
    dmg = dmg + dmg2

    # 5. wysysanie zycia
    state = jax.lax.cond(state.life_drain[u] & state.alive[u],
                         lambda s: _heal(s, u, dmg), lambda s: s, state)

    # 6. powrot na heks startowy (Harpia)
    def go_back(s):
        can = standable_mask(s, u)[start_hex] | (start_hex == s.pos_idx[u])
        return s.replace(
            pos_idx=s.pos_idx.at[u].set(
                jnp.where(can, start_hex, s.pos_idx[u])))

    return jax.lax.cond(state.return_after_strike[u] & state.alive[u],
                        go_back, lambda s: s, state)


def execute_shot(state: BattleState, u, tgt, key):
    k1, k2 = jax.random.split(key, 2)
    state = state.replace(
        shots=state.shots.at[u].set(jnp.maximum(0, state.shots[u] - 1)))
    state, _, dmg = _strike(state, u, tgt, k1, is_melee=False)

    second = state.double_attack[u] & state.alive[tgt]

    def again(s):
        s, _, d2 = _strike(s, u, tgt, k2, is_melee=False)
        return s, d2

    state, dmg2 = jax.lax.cond(second, again,
                               lambda s: (s, jnp.int32(0)), state)

    return jax.lax.cond(state.life_drain[u] & state.alive[u],
                        lambda s: _heal(s, u, dmg + dmg2), lambda s: s, state)


def army_value(state: BattleState, side) -> jnp.ndarray:
    live = state.alive & (state.side == side)
    return jnp.sum(jnp.where(live, state.count * state.ai_value, 0.0))


# ===========================================================================
# 11. OBSERWACJA  (bez zmian poza is_shooter)
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
        o = o.at[front, ch].max(jnp.where(state.alive, vals, 0.0))
        return o.at[rear, ch].max(jnp.where(two_ok, vals, 0.0))

    obs = paint(obs, IDX["my_unit"], is_mine.astype(jnp.float32))
    obs = paint(obs, IDX["enemy_unit"], is_foe.astype(jnp.float32))

    stack_val = jnp.where(state.alive, state.count * state.ai_value, 0.0)
    obs = paint(obs, IDX["value_rel"],
                stack_val / jnp.maximum(jnp.sum(stack_val), 1.0))
    obs = paint(obs, IDX["is_shooter"], (state.shots > 0).astype(jnp.float32))
    obs = paint(obs, IDX["is_active"],
                (jnp.arange(MAX_UNITS) == u).astype(jnp.float32))
    obs = paint(obs, IDX["queue_pos"],
                jnp.clip(queue_rank(state) / MAX_UNITS, 0.0, 1.0))

    obs = obs.at[:, IDX["is_rear"]].set(rear_mask(state).astype(jnp.float32))
    obs = obs.at[:, IDX["blocked"]].set(state.blocked.astype(jnp.float32))

    reach = jnp.where(has_active, reachable_mask(state, safe_u),
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
    return obs.reshape((BOARD_ROWS, BOARD_COLS, C))


# ===========================================================================
# 12. SRODOWISKO PGX
# ===========================================================================

START_COL_LEFT = 1
START_COL_RIGHT = 13
OBSTACLE_COLS = (3, 11)


class HoMM3EnvV3(pgx.Env):
    def __init__(self, max_obstacles: int = 8, min_stacks: int = 2,
                 max_stacks: int = 7):
        super().__init__()
        self.max_obstacles = max_obstacles
        self.min_stacks = min_stacks
        self.max_stacks = max_stacks

    @property
    def id(self) -> str:
        return "homm3_v3"

    @property
    def version(self) -> str:
        return "v3"

    @property
    def num_players(self) -> int:
        return 2

    def _observe(self, state: pgx.State, player_id: jax.Array) -> jnp.ndarray:
        return get_observation(state.replace(current_player=player_id))

    # -------------------------------------------------------------------
    def _init(self, key: jax.Array) -> pgx.State:
        k_pool, k_cnt, k_rows, k_nobs, k_obs, k_n = jax.random.split(key, 6)

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

        retal = jnp.maximum(row[:, P_RETAL].astype(jnp.int32), 1)

        st = BattleState(
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

        first = get_next_active_unit(st)
        st = st.replace(
            active_unit_idx=first,
            current_player=st.side[jnp.clip(first, 0, MAX_UNITS - 1)])
        return st.replace(
            observation=get_observation(st),
            legal_action_mask=legal_action_mask(st, first))

    # -------------------------------------------------------------------
    def _step(self, state: pgx.State, action: jnp.ndarray,
              key: jax.Array) -> pgx.State:
        u = state.active_unit_idx
        val0_before = army_value(state, 0)
        val1_before = army_value(state, 1)
        start_hex = state.pos_idx[u]

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
            tgt = jnp.clip(uah[NEIGHBOR_SAFE[hex_idx, d]], 0, MAX_UNITS - 1)
            s = s.replace(pos_idx=s.pos_idx.at[u].set(hex_idx))
            s = execute_melee(s, u, tgt, hex_idx, d, start_hex, key)
            return s.replace(acted_this_round=s.acted_this_round.at[u].set(True))

        def do_shoot(s):
            tgt = jnp.clip(uah[hex_idx], 0, MAX_UNITS - 1)
            s = execute_shot(s, u, tgt, key)
            return s.replace(acted_this_round=s.acted_this_round.at[u].set(True))

        def board_action(s):
            return jax.lax.cond(
                plane == PLANE_MOVE, do_move,
                lambda ss: jax.lax.cond(plane == PLANE_SHOOT, do_shoot,
                                        do_amove, ss), s)

        state = jax.lax.cond(
            action == ACTION_WAIT, do_wait,
            lambda s: jax.lax.cond(action == ACTION_DEFEND, do_defend,
                                   board_action, s), state)

        # --- kolejka / nowa runda ---
        nxt = get_next_active_unit(state)

        def new_round(s):
            return s.replace(
                acted_this_round=jnp.zeros(MAX_UNITS, dtype=jnp.bool_),
                waited_this_round=jnp.zeros(MAX_UNITS, dtype=jnp.bool_),
                is_defending=jnp.zeros(MAX_UNITS, dtype=jnp.bool_),
                retaliations_left=s.retaliations_max)   # ZMIANA: reset licznika

        state = jax.lax.cond(nxt < 0, new_round, lambda s: s, state)
        nxt = jnp.where(nxt < 0, get_next_active_unit(state), nxt)
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
            observation=get_observation(state),
            legal_action_mask=legal_action_mask(state, nxt))


# ===========================================================================
# 13. NIEZMIENNIKI
# ===========================================================================

def check_invariants(state: BattleState) -> List[str]:
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

    if not bool(state.terminated) and not np.asarray(state.legal_action_mask).any():
        errs.append("brak legalnych akcji w stanie nieterminalnym")
    return errs


# ===========================================================================
# 14. SMOKE TEST
# ===========================================================================

if __name__ == "__main__":
    env = HoMM3EnvV3()
    init = jax.jit(env.init)
    step = jax.jit(env.step)

    print("Kompilacja...")
    key = jax.random.PRNGKey(0)
    t0 = time.time()
    s = init(key)
    s.active_unit_idx.block_until_ready()
    print(f"  init skompilowany w {time.time()-t0:.1f}s")
    print(f"  obserwacja: {s.observation.shape}, akcje: {MAX_ACTIONS}")
    print(f"  urzadzenia: {jax.devices()}")

    print("\nWeryfikacja geometrii (dane z vcmi-gym):")
    for a, b, name in [(0, 1, "R"), (0, 16, "BR"), (0, 15, "BL")]:
        print(f"  hex {a} -- {b} ({name}): "
              f"{'OK' if bool(STATIC_ADJ[a, b]) else 'BLAD'}")

    print("\nLosowe partie z kontrola niezmiennikow...")
    n_games, n_bad, lengths = 200, 0, []
    seen = dict(two_hex=0, flyer=0, shooter=0, breath=0, three=0,
                around=0, drain=0, ret2=0)
    for g in range(n_games):
        key, k = jax.random.split(key)
        s = init(k)
        live = np.asarray(s.alive)
        seen["two_hex"] += int((live & np.asarray(s.is_two_hex)).sum())
        seen["flyer"] += int((live & np.asarray(s.is_flyer)).sum())
        seen["shooter"] += int((live & np.asarray(s.is_shooter)).sum())
        seen["breath"] += int((live & np.asarray(s.breath_attack)).sum())
        seen["three"] += int((live & np.asarray(s.three_headed)).sum())
        seen["around"] += int((live & np.asarray(s.all_around)).sum())
        seen["drain"] += int((live & np.asarray(s.life_drain)).sum())
        seen["ret2"] += int((live & (np.asarray(s.retaliations_max) > 1)).sum())
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
    print("\n  pokrycie mechanik (liczba wystawionych stosow):")
    for k_, v in seen.items():
        flag = "" if v >= 30 else "   <- za malo, mechanika nieprzetestowana"
        print(f"    {k_:<10} {v:>5}{flag}")

    print("\nPomiar przepustowosci (vmap)...")
    BATCH = 1024
    vinit = jax.jit(jax.vmap(env.init))
    vstep = jax.jit(jax.vmap(env.step))
    key, k = jax.random.split(key)
    states = vinit(jax.random.split(k, BATCH))

    def rand_actions(st, k):
        return jax.random.categorical(
            k, jnp.where(st.legal_action_mask, 0.0, -1e9), axis=-1)

    key, k = jax.random.split(key)
    states = vstep(states, rand_actions(states, k), jax.random.split(k, BATCH))
    states.active_unit_idx.block_until_ready()

    N = 100
    t0 = time.time()
    for _ in range(N):
        key, k1, k2 = jax.random.split(key, 3)
        states = vstep(states, rand_actions(states, k1),
                       jax.random.split(k2, BATCH))
    states.active_unit_idx.block_until_ready()
    dt = time.time() - t0
    print(f"  {N*BATCH/dt:,.0f} krokow/s  (batch={BATCH})")
    print(f"  dla porownania: VcmiEnv ~113 krokow/s")