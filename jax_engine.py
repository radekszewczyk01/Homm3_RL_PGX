import jax
import jax.numpy as jnp
from typing import Tuple, List
import pgx
from flax import struct
import time
import dataclasses

# ===========================================================================
# 1. KONFIGURACJA I MATEMATYKA HEKSÓW
# ===========================================================================
BOARD_COLS = 15
BOARD_ROWS = 11
NUM_HEXES = 165
MAX_UNITS = 14 # 7 na gracza

ACTION_WAIT = 165
ACTION_DEFEND = 166
MAX_ACTIONS = 167

Coord = Tuple[int, int]

def offset_to_cube(col: int, row: int) -> Tuple[int, int, int]:
    x = col - (row - (row & 1)) // 2
    z = row
    y = -x - z
    return x, y, z

def pos_to_idx(col: int, row: int) -> int:
    return row * BOARD_COLS + col

def hex_neighbors(col: int, row: int) -> List[Tuple[int, int]]:
    if row % 2 == 0:
        deltas = [(1, 0), (0, -1), (-1, -1), (-1, 0), (-1, 1), (0, 1)]
    else:
        deltas = [(1, 0), (1, -1), (0, -1), (-1, 0), (0, 1), (1, 1)]
    out = []
    for dc, dr in deltas:
        c, r = col + dc, row + dr
        if 0 <= c < BOARD_COLS and 0 <= r < BOARD_ROWS:
            out.append((c, r))
    return out

def build_adjacency_matrix() -> jnp.ndarray:
    import numpy as np
    adj = np.zeros((NUM_HEXES, NUM_HEXES), dtype=bool)
    for r in range(BOARD_ROWS):
        for c in range(BOARD_COLS):
            u_idx = pos_to_idx(c, r)
            for nc, nr in hex_neighbors(c, r):
                v_idx = pos_to_idx(nc, nr)
                adj[u_idx, v_idx] = True
    return jnp.array(adj)

STATIC_ADJ_MATRIX = build_adjacency_matrix()

# ===========================================================================
# 2. STAN GRY (FLAX DATACLASS)
# ===========================================================================
@struct.dataclass
class BattleState(pgx.State):
    # Pola dziedziczone z pgx.State, ale musimy je tu przedefiniować z default_factory
    current_player: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.int32(0))
    observation: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros((BOARD_ROWS, BOARD_COLS, 4), dtype=jnp.float32))
    rewards: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(2, dtype=jnp.float32))
    terminated: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.bool_(False))
    truncated: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.bool_(False))
    legal_action_mask: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.ones(MAX_ACTIONS, dtype=jnp.bool_))
    _step_count: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.int32(0))

    phase: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.int32(0))
    active_unit_idx: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.int32(-1))

    # --- Stan Jednostek ---
    alive: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.bool_))
    side: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.int32))
    pos_idx: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.int32))
    
    count: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.int32))
    hp_left: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.int32))
    max_hp: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.int32))
    speed: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.int32))
    attack: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.int32))
    defense: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.int32))
    min_damage: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.int32))
    max_damage: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.int32))
    shots: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.int32))
    
    acted_this_round: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.bool_))
    waited_this_round: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.bool_))
    is_defending: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.bool_))
    retaliated_this_round: jnp.ndarray = dataclasses.field(default_factory=lambda: jnp.zeros(MAX_UNITS, dtype=jnp.bool_))

    @property
    def env_id(self) -> str:
        # pgx wymaga tego w nowych wersjach, aby powiązać stan ze środowiskiem
        return "homm3"

# ===========================================================================
# 3. MECHANIKI SILNIKA
# ===========================================================================
def get_next_active_unit(state: BattleState) -> jnp.ndarray:
    can_act_normal = state.alive & (~state.acted_this_round) & (~state.waited_this_round)
    can_act_waiting = state.alive & state.waited_this_round & (~state.acted_this_round)

    normal_speeds = jnp.where(can_act_normal, state.speed, -1)
    max_normal_speed = jnp.max(normal_speeds)
    
    wait_speeds = jnp.where(can_act_waiting, 100 - state.speed, -1)
    max_wait_val = jnp.max(wait_speeds)

    def normal_phase_unit(): return jnp.argmax(normal_speeds)
    def wait_phase_unit(): return jnp.argmax(wait_speeds)
    def end_round(): return jnp.int32(-1)

    return jax.lax.cond(
        max_normal_speed >= 0,
        normal_phase_unit,
        lambda: jax.lax.cond(max_wait_val >= 0, wait_phase_unit, end_round)
    )

def get_observation(state: BattleState) -> jnp.ndarray:
    is_mine = state.side == state.current_player
    is_enemy = state.side != state.current_player
    obs = jnp.zeros((NUM_HEXES, 4), dtype=jnp.float32)

    valid_mine = state.alive & is_mine
    valid_enemy = state.alive & is_enemy

    my_hp = jnp.where(valid_mine, state.count * state.max_hp + state.hp_left, 0.0)
    obs = obs.at[state.pos_idx, 0].add(my_hp)

    enemy_hp = jnp.where(valid_enemy, state.count * state.max_hp + state.hp_left, 0.0)
    obs = obs.at[state.pos_idx, 1].add(enemy_hp)

    obs = obs.at[state.pos_idx, 2].add(jnp.where(valid_mine, state.speed, 0.0))
    obs = obs.at[state.pos_idx, 3].add(jnp.where(valid_enemy & ~state.retaliated_this_round, 1.0, 0.0))

    return obs.reshape((BOARD_ROWS, BOARD_COLS, 4))

def get_reachable_mask_jax(start_idx: jnp.ndarray, speed: jnp.ndarray, occupied_mask: jnp.ndarray) -> jnp.ndarray:
    init_reachable = jnp.zeros(NUM_HEXES, dtype=jnp.bool_).at[start_idx].set(True)
    free_mask = ~occupied_mask | (jnp.arange(NUM_HEXES) == start_idx)

    def wave_step(i, reachable):
        new_wave = jnp.dot(STATIC_ADJ_MATRIX, reachable)
        return jax.lax.select(i < speed, reachable | (new_wave & free_mask), reachable)

    return jax.lax.fori_loop(0, 20, wave_step, init_reachable)

def _resolve_single_strike(state: BattleState, atk_idx: jnp.ndarray, def_idx: jnp.ndarray, key: jax.Array) -> Tuple[BattleState, jnp.ndarray]:
    """Właściwa logika obliczania obrażeń dla pojedynczego uderzenia."""
    key, subkey = jax.random.split(key)
    base_dmg_per_unit = jax.random.randint(
        subkey, shape=(), 
        minval=state.min_damage[atk_idx], 
        maxval=state.max_damage[atk_idx] + 1
    )
    base_total = state.count[atk_idx] * base_dmg_per_unit

    active_defense = jax.lax.select(
        state.is_defending[def_idx], 
        jnp.int32(state.defense[def_idx] * 1.2), 
        state.defense[def_idx]
    )
    diff = state.attack[atk_idx] - active_defense
    
    modifier = jax.lax.select(
        diff >= 0, 
        1.0 + 0.05 * jnp.minimum(diff, 60), 
        1.0 - 0.025 * jnp.minimum(-diff, 28)
    )
    final_dmg = jnp.int32(jnp.round(base_total * modifier))

    total_hp_def = (state.count[def_idx] - 1) * state.max_hp[def_idx] + state.hp_left[def_idx]
    remaining_hp = total_hp_def - final_dmg

    def unit_survives():
        new_count = jnp.ceil(remaining_hp / state.max_hp[def_idx]).astype(jnp.int32)
        new_hp_left = remaining_hp - (new_count - 1) * state.max_hp[def_idx]
        return state.count.at[def_idx].set(new_count), state.hp_left.at[def_idx].set(new_hp_left), jnp.bool_(True)

    def unit_dies():
        return state.count.at[def_idx].set(0), state.hp_left.at[def_idx].set(0), jnp.bool_(False)

    new_count_arr, new_hp_left_arr, def_is_alive = jax.lax.cond(remaining_hp > 0, unit_survives, unit_dies)
    
    new_state = state.replace(
        count=new_count_arr, 
        hp_left=new_hp_left_arr, 
        alive=state.alive.at[def_idx].set(def_is_alive)
    )
    return new_state, def_is_alive


def execute_attack(state: BattleState, atk_idx: jnp.ndarray, def_idx: jnp.ndarray, key: jax.Array, is_retaliation: bool = False) -> BattleState:
    # 0. Rozdzielamy klucz na rzuty
    key, key_atk, key_ret = jax.random.split(key, 3)

    # 1. Główny atak
    state, def_is_alive = _resolve_single_strike(state, atk_idx, def_idx, key_atk)

    # --- NOWOŚĆ: SPRAWDZANIE DYSTANSU ---
    # Atak jest w zwarciu (melee), jeśli pozycje atakującego i obrońcy sąsiadują ze sobą w macierzy
    is_melee = STATIC_ADJ_MATRIX[state.pos_idx[atk_idx], state.pos_idx[def_idx]]

    # 2. Kontratak następuje tylko w zwarciu
    can_retaliate = (not is_retaliation) & def_is_alive & (~state.retaliated_this_round[def_idx]) & is_melee
    
    def apply_retaliation(st):
        st = st.replace(retaliated_this_round=st.retaliated_this_round.at[def_idx].set(True))
        st, _ = _resolve_single_strike(st, def_idx, atk_idx, key_ret)
        return st

    return jax.lax.cond(can_retaliate, apply_retaliation, lambda st: st, state)

def get_legal_action_mask_jax(state: BattleState, u_id: jnp.ndarray) -> jnp.ndarray:
    mask = jnp.zeros(MAX_ACTIONS, dtype=jnp.bool_)
    def no_actions(): return mask

    def build_mask():
        m = jnp.zeros(MAX_ACTIONS, dtype=jnp.bool_)
        m = m.at[ACTION_WAIT].set(~state.waited_this_round[u_id])
        m = m.at[ACTION_DEFEND].set(True)

        my_idx = state.pos_idx[u_id]
        
        occupied_mask = jnp.zeros(NUM_HEXES, dtype=jnp.bool_).at[state.pos_idx].set(state.alive).at[my_idx].set(False)
        reachable = get_reachable_mask_jax(my_idx, state.speed[u_id], occupied_mask)
        m = m.at[:NUM_HEXES].set(reachable & (~occupied_mask))

        is_enemy = state.alive & (state.side != state.side[u_id])
        
        def set_attack_mask(i, current_mask):
            enemy_idx = state.pos_idx[i]
            can_reach_melee = jnp.any(reachable & STATIC_ADJ_MATRIX[enemy_idx])
            valid_attack = is_enemy[i] & ((state.shots[u_id] > 0) | can_reach_melee)
            return jax.lax.select(valid_attack, current_mask.at[enemy_idx].set(True), current_mask)

        return jax.lax.fori_loop(0, MAX_UNITS, set_attack_mask, m)

    return jax.lax.cond(u_id == -1, no_actions, build_mask)

# ===========================================================================
# 4. GŁÓWNE ŚRODOWISKO PGX
# ===========================================================================
class HoMM3Env(pgx.Env):
    def __init__(self):
        super().__init__()

    @property
    def id(self) -> str:
        return "homm3"  # type: ignore

    @property
    def version(self) -> str:
        return "v0"

    @property
    def num_players(self) -> int:
        return 2

    def _observe(self, state: pgx.State, player_id: jax.Array) -> jnp.ndarray:
        # pgx odpytuje o obserwację dla konkretnego gracza.
        # Podmieniamy na chwilę current_player, aby nasza funkcja wygenerowała 
        # poprawny widok z perspektywy pytającego gracza (właściwe strony my/enemy).
        temp_state = state.replace(current_player=player_id)
        return get_observation(temp_state)
    # --------------------------

    def _init(self, key: jax.Array) -> pgx.State:
        st = BattleState()
        
        # Dodany argument count_val do sterowania wielkością oddziału
        def add_unit(s, u_id, side, col, row, count_val, hp, spd, atk, dfn, mn_dmg, mx_dmg, shts):
            return s.replace(
                alive=s.alive.at[u_id].set(True),
                side=s.side.at[u_id].set(side),
                pos_idx=s.pos_idx.at[u_id].set(pos_to_idx(col, row)),
                count=s.count.at[u_id].set(count_val), # <-- Używamy nowej zmiennej
                max_hp=s.max_hp.at[u_id].set(hp), hp_left=s.hp_left.at[u_id].set(hp),
                speed=s.speed.at[u_id].set(spd), attack=s.attack.at[u_id].set(atk), defense=s.defense.at[u_id].set(dfn),
                min_damage=s.min_damage.at[u_id].set(mn_dmg), max_damage=s.max_damage.at[u_id].set(mx_dmg),
                shots=s.shots.at[u_id].set(shts)
            )

        # --- Gracz 0 (Niebieski - lewa strona) ---
        st = add_unit(st, 0, 0, 1, 2, 50, 10, 4, 4, 5, 1, 3, 0)  # Pikeman
        st = add_unit(st, 1, 0, 1, 4, 40, 10, 4, 6, 3, 2, 3, 12) # Archer
        st = add_unit(st, 2, 0, 1, 6, 20, 25, 6, 8, 8, 3, 6, 0)  # Griffin
        st = add_unit(st, 3, 0, 1, 8, 10, 35, 5, 7, 7, 4, 6, 0)  # Swordsman

        # --- Gracz 1 (Czerwony - prawa strona) ---
        st = add_unit(st, 7, 1, 13, 2, 50, 10, 4, 4, 5, 1, 3, 0)  # Pikeman
        st = add_unit(st, 8, 1, 13, 4, 40, 10, 4, 6, 3, 2, 3, 12) # Archer
        st = add_unit(st, 9, 1, 13, 6, 20, 25, 6, 8, 8, 3, 6, 0)  # Griffin
        st = add_unit(st, 10, 1, 13, 8, 10, 35, 5, 7, 7, 4, 6, 0) # Swordsman

        st = st.replace(phase=jnp.int32(2))
        first_unit = get_next_active_unit(st)
        
        st = st.replace(
            active_unit_idx=first_unit,
            current_player=st.side[first_unit],
            observation=get_observation(st),
            legal_action_mask=get_legal_action_mask_jax(st, first_unit)
        )
        return st

    def _step(self, state: pgx.State, action: jnp.ndarray, key: jax.Array) -> pgx.State:
        state = state  # typing
        return jax.lax.switch(
            state.phase,
            [self._step_setup_p0, self._step_setup_p1, self._step_battle],
            state, action, key
        )

    def _step_setup_p0(self, state: BattleState, action: jnp.ndarray, key: jax.Array) -> BattleState:
        return state.replace(phase=jnp.int32(1)) # Zaślepka

    def _step_setup_p1(self, state: BattleState, action: jnp.ndarray, key: jax.Array) -> BattleState:
        first_unit = get_next_active_unit(state)
        return state.replace(phase=jnp.int32(2), active_unit_idx=first_unit, legal_action_mask=get_legal_action_mask_jax(state, first_unit)) # Zaślepka

    def _step_battle(self, state: BattleState, action: jnp.ndarray, key: jax.Array) -> BattleState:
        u_id = state.active_unit_idx
        
        def do_wait(): return state.replace(waited_this_round=state.waited_this_round.at[u_id].set(True))
        def do_defend(): return state.replace(acted_this_round=state.acted_this_round.at[u_id].set(True), is_defending=state.is_defending.at[u_id].set(True))
            
        def do_move_or_attack():
            target_idx = action
            is_target_occupied = jnp.any(state.alive & (state.pos_idx == target_idx))
            target_unit_id = jnp.argmax(state.alive & (state.pos_idx == target_idx))

            def execute_atk(st):
                # Nowość: Logika "podejścia" przed ciosem dla walczących wręcz
                is_shooter = st.shots[u_id] > 0
                flat_occupied = jnp.zeros(NUM_HEXES, dtype=jnp.bool_).at[st.pos_idx].set(st.alive).at[st.pos_idx[u_id]].set(False)
                reachable = get_reachable_mask_jax(st.pos_idx[u_id], st.speed[u_id], flat_occupied)
                
                # Wolne, osiągalne pola graniczące z wrogiem
                valid_landings = STATIC_ADJ_MATRIX[target_idx] & reachable & (~flat_occupied)
                best_landing = jnp.argmax(valid_landings) 
                already_adjacent = STATIC_ADJ_MATRIX[target_idx][st.pos_idx[u_id]]
                
                needs_to_move = (~is_shooter) & (~already_adjacent)
                new_pos = jax.lax.select(needs_to_move, best_landing, st.pos_idx[u_id])
                
                # Przesuwamy jednostkę i uderzamy
                st_moved = st.replace(pos_idx=st.pos_idx.at[u_id].set(new_pos))
                return execute_attack(st_moved, u_id, target_unit_id, key, is_retaliation=False)

            def execute_move(st):
                return st.replace(pos_idx=st.pos_idx.at[u_id].set(target_idx))

            new_state = jax.lax.cond(is_target_occupied, execute_atk, execute_move, state)
            return new_state.replace(acted_this_round=new_state.acted_this_round.at[u_id].set(True))

        state_after_action = jax.lax.cond(
            action == ACTION_WAIT, do_wait,
            lambda: jax.lax.cond(action == ACTION_DEFEND, do_defend, do_move_or_attack)
        )

        next_unit = get_next_active_unit(state_after_action)
        
        def reset_round():
            return state_after_action.replace(
                acted_this_round=jnp.zeros(MAX_UNITS, dtype=jnp.bool_),
                waited_this_round=jnp.zeros(MAX_UNITS, dtype=jnp.bool_),
                retaliated_this_round=jnp.zeros(MAX_UNITS, dtype=jnp.bool_)
            )
            
        final_state = jax.lax.cond(next_unit == -1, reset_round, lambda: state_after_action)
        final_next_unit = jax.lax.select(next_unit == -1, get_next_active_unit(final_state), next_unit)
        
        final_state = final_state.replace(
            active_unit_idx=final_next_unit,
            current_player=jax.lax.select(final_next_unit != -1, final_state.side[final_next_unit], final_state.current_player),
            is_defending=final_state.is_defending.at[final_next_unit].set(False) 
        )

        side_0_alive = jnp.any(final_state.alive & (final_state.side == 0))
        side_1_alive = jnp.any(final_state.alive & (final_state.side == 1))
        
        terminated = ~(side_0_alive & side_1_alive)
        rewards = jax.lax.select(
            terminated,
            jax.lax.select(side_0_alive, jnp.array([1.0, -1.0]), jnp.array([-1.0, 1.0])),
            jnp.array([0.0, 0.0])
        )

        return final_state.replace(
            terminated=terminated,
            rewards=rewards,
            observation=get_observation(final_state),
            legal_action_mask=get_legal_action_mask_jax(final_state, final_next_unit),
            _step_count=final_state._step_count + 1
        )

# ===========================================================================
# 5. TEST KOMPILACJI XLA
# ===========================================================================
if __name__ == "__main__":
    env = HoMM3Env()
    
    # 1. Kompilacja JIT
    print("Rozpoczynam kompilację funkcji init()...")
    jit_init = jax.jit(env.init)
    
    print("Rozpoczynam kompilację funkcji step()...")
    jit_step = jax.jit(env.step)
    
    key = jax.random.PRNGKey(42)
    key, subkey = jax.random.split(key)
    
    # 2. Inicjalizacja stanu
    print("\nGeneruję stan gry...")
    state = jit_init(subkey)
    print(f"Obecny gracz: {state.current_player}, Aktywna jednostka: {state.active_unit_idx}")
    print(f"Kształt maski obserwacji: {state.observation.shape}")
    
    # 3. Wykonanie pierwszego ruchu (Test)
    valid_actions = jnp.where(state.legal_action_mask)[0]
    action_to_take = valid_actions[0] # Bierzemy pierwszą legalną akcję dla testu
    
    print(f"\nWykonuję skompilowany ruch (akcja: {action_to_take})...")
    t0 = time.time()
    key, subkey = jax.random.split(key)
    next_state = jit_step(state, action_to_take, subkey)
    # Wywołanie .block_until_ready() upewnia się, że JAX skończył liczyć na GPU/CPU
    next_state.active_unit_idx.block_until_ready() 
    t1 = time.time()
    
    print(f"Ruch zakończony sukcesem! Czas wykonania (w tym narzut kompilacji 1. wywołania): {t1-t0:.4f}s")
    
    # 4. Drugi ruch (prawdziwa prędkość JAXa)
    valid_actions2 = jnp.where(next_state.legal_action_mask)[0]
    action_to_take2 = valid_actions2[0]
    
    t0 = time.time()
    key, subkey = jax.random.split(key)
    next_state2 = jit_step(next_state, action_to_take2, subkey)
    next_state2.active_unit_idx.block_until_ready()
    t1 = time.time()
    
    print(f"Drugi ruch (odpytanie z pamięci cache JIT): {t1-t0:.6f}s")
    print("Wszystko działa idealnie. Silnik RL jest gotowy.")