import jax
import jax.numpy as jnp
import flax.linen as nn
import mctx
import optax
import time
from flax import serialization
import pickle
import os
from datetime import datetime

# Importujemy nasz silnik
from jax_engine import HoMM3Env, BOARD_ROWS, BOARD_COLS, MAX_ACTIONS

# ===========================================================================
# 1. SIEĆ NEURONOWA (Flax) 
# ===========================================================================
class AlphaZeroNet(nn.Module):
    """Architektura typu Actor-Critic (Policy & Value)."""
    
    @nn.compact
    def __call__(self, x):
        x = nn.Conv(features=32, kernel_size=(3, 3), padding='SAME')(x)
        x = nn.relu(x)
        x = nn.Conv(features=64, kernel_size=(3, 3), padding='SAME')(x)
        x = nn.relu(x)
        
        x = x.reshape((x.shape[0], -1)) 
        x = nn.Dense(256)(x)
        x = nn.relu(x)

        policy_logits = nn.Dense(MAX_ACTIONS)(x)
        value = nn.Dense(1)(x)
        value = nn.tanh(value)

        return policy_logits, value.squeeze(axis=-1)

# ===========================================================================
# 2. FUNKCJE TRENINGOWE (Optax & JAX Grad)
# ===========================================================================
def az_loss_fn(params, observations, target_policies, target_values):
    """Oblicza błąd sieci neuronowej względem danych z MCTS i końca gry."""
    logits, values = AlphaZeroNet().apply({'params': params}, observations)
    
    # 1. Błąd Polityki (Cross-Entropy) - Uczymy sieć naśladować MCTS
    log_probs = jax.nn.log_softmax(logits)
    policy_loss = -jnp.sum(target_policies * log_probs, axis=-1)
    
    # 2. Błąd Wartości (Mean Squared Error) - Uczymy sieć przewidywać kto wygra
    value_loss = jnp.square(values - target_values)
    
    # Całkowita strata (średnia z całego batcha)
    return jnp.mean(policy_loss + value_loss)

@jax.jit
def train_step(params, opt_state, observations, target_policies, target_values):
    """Pojedynczy krok wstecznej propagacji błędu (Backpropagation)."""
    # Obliczamy stratę i jej gradienty (pochodne) względem wag sieci
    loss, grads = jax.value_and_grad(az_loss_fn)(params, observations, target_policies, target_values)
    
    # Optax aktualizuje wagi na podstawie gradientów
    updates, new_opt_state = optimizer.update(grads, opt_state, params)
    new_params = optax.apply_updates(params, updates)
    
    return new_params, new_opt_state, loss

# Inicjalizacja optymalizatora (Adam)
optimizer = optax.adam(learning_rate=0.001)

# ===========================================================================
# 3. WEKTORYZACJA ŚRODOWISKA I MCTS
# ===========================================================================
env = HoMM3Env()
vmap_init = jax.jit(jax.vmap(env.init))
vmap_step = jax.jit(jax.vmap(env.step))

def get_recurrent_fn(network_apply, env_step):
    def recurrent_fn(params, rng_key, action, embedding):
        state = embedding
        step_keys = jax.random.split(rng_key, action.shape[0])
        next_state = env_step(state, action, step_keys)

        logits, value = network_apply({'params': params}, next_state.observation)
        masked_logits = jnp.where(next_state.legal_action_mask, logits, -1e9)
        reward = next_state.rewards[jnp.arange(action.shape[0]), state.current_player]

        discount = jnp.where(
            next_state.terminated, 
            0.0, 
            jnp.where(next_state.current_player == state.current_player, 1.0, -1.0)
        )

        recurrent_output = mctx.RecurrentFnOutput(
            reward=reward, discount=discount, prior_logits=masked_logits, value=value
        )
        return recurrent_output, next_state
    return recurrent_fn

@jax.jit
def play_step_with_mcts(state, params, key):
    logits, value = AlphaZeroNet().apply({'params': params}, state.observation)
    masked_logits = jnp.where(state.legal_action_mask, logits, -1e9)

    root = mctx.RootFnOutput(prior_logits=masked_logits, value=value, embedding=state)
    rec_fn = get_recurrent_fn(AlphaZeroNet().apply, vmap_step)
    key, subkey = jax.random.split(key)
    
    policy_output = mctx.muzero_policy(
        params=params, rng_key=subkey, root=root, recurrent_fn=rec_fn,
        num_simulations=25, invalid_actions=~state.legal_action_mask,
        dirichlet_fraction=0.25, dirichlet_alpha=0.3
    )

    actions = policy_output.action
    key, subkey = jax.random.split(key)
    step_keys = jax.random.split(subkey, actions.shape[0])
    next_state = vmap_step(state, actions, step_keys)
    
    return next_state, policy_output.action_weights, value, key

# ===========================================================================
# 4. GŁÓWNA PĘTLA TRENINGOWA (META-LOOP)
# ===========================================================================
def train_alphazero():
    BATCH_SIZE = 150  # Gier naraz
    STEPS_PER_GEN = 250 # Długość pojedynczej gry
    GENERATIONS = 30   # Ilość cykli (Self-play -> Trening)

    # --- NOWOŚĆ: TWORZENIE FOLDERU NA POWTÓRKI ---
    # Pobieramy obecny czas i formatujemy go np. "2026-07-08_19-50-30"
    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    replay_dir = f"replays_{timestamp}"
    
    # Tworzymy folder (exist_ok=True zapobiega błędom, jeśli folder już istnieje)
    os.makedirs(replay_dir, exist_ok=True)
    print(f"📁 Utworzono folder na powtórki: {replay_dir}")
    
    rng = jax.random.PRNGKey(42)
    rng, net_key = jax.random.split(rng)

    print("Inicjalizacja Sieci Neuronowej i Optymalizatora...")
    dummy_obs = jnp.zeros((1, BOARD_ROWS, BOARD_COLS, 4))
    net_params = AlphaZeroNet().init(net_key, dummy_obs)['params']
    opt_state = optimizer.init(net_params)

    # Funkcja pomocnicza do mapowania nagród
    @jax.jit
    def assign_values(player_history, final_rewards):
        # player_history ma kształt (STEPS, BATCH)
        # final_rewards ma kształt (BATCH, 2)
        # Zwracamy wektor (STEPS, BATCH) z nagrodą z perspektywy gracza z danej tury
        def get_target(players):
            return final_rewards[jnp.arange(BATCH_SIZE), players]
        return jax.vmap(get_target)(player_history)

    print("\n🚀 Rozpoczynam trening AlphaZero!\n")

    for gen in range(1, GENERATIONS + 1):
        t0 = time.time()
        
        # --- FAZA 1: SELF-PLAY (Zbieranie danych do bufora) ---
        buffer_obs, buffer_policies, buffer_players = [], [], []
        replay_frames = [] # NOWOŚĆ: Lista na zrzuty klatek z pierwszej gry
        
        rng, init_key = jax.random.split(rng)
        init_keys = jax.random.split(init_key, BATCH_SIZE)
        state = vmap_init(init_keys)

        replay_frames.append({
            "pos_idx": state.pos_idx[0], "alive": state.alive[0],
            "count": state.count[0], "side": state.side[0],
            "active_unit_idx": state.active_unit_idx[0],
            "terminated": state.terminated[0], "rewards": state.rewards[0]
        })

        for step in range(STEPS_PER_GEN):
            buffer_players.append(state.current_player)
            buffer_obs.append(state.observation)
            
            state, policy_targets, _, rng = play_step_with_mcts(state, net_params, rng)
            buffer_policies.append(policy_targets)
            
            # Zapisz wskaźniki JAX (GPU) PO ruchu (BEZ jax.device_get!)
            replay_frames.append({
                "pos_idx": state.pos_idx[0], "alive": state.alive[0],
                "count": state.count[0], "side": state.side[0],
                "active_unit_idx": state.active_unit_idx[0],
                "terminated": state.terminated[0], "rewards": state.rewards[0]
            })
            
        # --- ZAPIS POWTÓRKI NA DYSK ---
        # Po zakończeniu pętli for step (czyli gra się skończyła), zapisujemy plik .pkl
        replay_frames_cpu = jax.device_get(replay_frames)
        
        filepath = os.path.join(replay_dir, f"replay_gen_{gen:02d}.pkl")
        with open(filepath, "wb") as f:
            pickle.dump(replay_frames_cpu, f)

        # --- FAZA 2: ZAMKNIĘCIE GIER I PRZYPISANIE WARTOŚCI ---
        # Konwertujemy listy na tensory JAX
        obs_stack = jnp.stack(buffer_obs)           # (40, 128, 11, 15, 4)
        pi_stack = jnp.stack(buffer_policies)       # (40, 128, 167)
        player_stack = jnp.stack(buffer_players)    # (40, 128)
        
        # Pobieramy FAKTYCZNE nagrody z końca bitew
        base_rewards = state.rewards               # (128, 2)
        
        # --- NOWOŚĆ: BRUTALNA KARA ZA REMIS ---
        # Jeśli gra dobiła do limitu kroków (jest remis), dowalamy obu graczom -0.95.
        # Jest to prawie tak bolesne jak przegrana (-1.0). 
        is_draw = ~state.terminated
        penalty = jnp.where(is_draw, -0.95, 0.0)
        draw_penalties = jnp.stack([penalty, penalty], axis=-1)
        
        final_rewards = base_rewards + draw_penalties
        
        # Przypisujemy kto wygrał do każdej tury wstecz
        v_stack = assign_values(player_stack, final_rewards) # (40, 128)

        # Spłaszczamy dane (40 * 128 = 5120 unikalnych kadrów do treningu)
        obs_flat = obs_stack.reshape(-1, *obs_stack.shape[2:])
        pi_flat = pi_stack.reshape(-1, pi_stack.shape[-1])
        v_flat = v_stack.reshape(-1)

        # --- FAZA 3: TRENING SIECI (Backpropagation) ---
        # W prawdziwym AZ tutaj miesza się dane i dzieli na minibatches.
        # Dla uproszczenia wrzucamy cały spłaszczony bufor naraz (Full-Batch)
        net_params, opt_state, loss = train_step(
            net_params, opt_state, obs_flat, pi_flat, v_flat
        )
        
        # Czekamy na synchronizację XLA
        # Czekamy na synchronizację XLA
        loss.block_until_ready()
        t1 = time.time()

        # --- STATYSTYKI ZWYCIĘSTW ---
        # final_rewards to macierz (BATCH_SIZE, 2). Szukamy nagród dodatnich.
        blue_wins = jnp.sum(final_rewards[:, 0] > 0)
        red_wins = jnp.sum(final_rewards[:, 1] > 0)
        
        # Remisy (albo gra nie zdążyła się skończyć w STEPS_PER_GEN, albo padł rzadki podwójny KO)
        draws = BATCH_SIZE - (blue_wins + red_wins)
        
        blue_pct = (blue_wins / BATCH_SIZE) * 100
        red_pct = (red_wins / BATCH_SIZE) * 100
        draw_pct = (draws / BATCH_SIZE) * 100

        print(f"Gen {gen:02d}/{GENERATIONS} | Czas: {t1-t0:.2f}s | Loss: {loss:.4f} | Niebieski: {blue_pct:02.0f}% | Czerwony: {red_pct:02.0f}% | Remis: {draw_pct:02.0f}%")

    print("\n✅ Trening zakończony!")
    print("\n💾 Zapisuję wytrenowany mózg na dysk...")
    
    # Konwertujemy wagi (params) na ciąg bajtów
    bytes_output = serialization.to_bytes(net_params)
    
    # Zapisujemy do pliku
    with open("homm3_alphazero_weights.msgpack", "wb") as f:
        f.write(bytes_output)
        
    print("✅ Zapisano pomyślnie jako 'homm3_alphazero_weights.msgpack'!")

if __name__ == "__main__":
    train_alphazero()