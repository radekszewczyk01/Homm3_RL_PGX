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
    logits, values = AlphaZeroNet().apply({'params': params}, observations)
    
    # 1. Błąd Polityki (Cross-Entropy) - Uczymy sieć naśladować MCTS
    log_probs = jax.nn.log_softmax(logits)
    policy_loss = -jnp.sum(target_policies * log_probs, axis=-1)
    
    # 2. Błąd Wartości (Mean Squared Error) - Uczymy sieć przewidywać wynik
    value_loss = jnp.square(values - target_values)
    
    return jnp.mean(policy_loss + value_loss)

@jax.jit
def train_step(params, opt_state, observations, target_policies, target_values):
    loss, grads = jax.value_and_grad(az_loss_fn)(params, observations, target_policies, target_values)
    updates, new_opt_state = optimizer.update(grads, opt_state, params)
    new_params = optax.apply_updates(params, updates)
    return new_params, new_opt_state, loss

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
        
        # Czysta nagroda ze środowiska (zawiera teraz + za obrażenia i - za obrywanie)
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
    BATCH_SIZE = 90      # Gier równolegle
    STEPS_PER_GEN = 150  # Długość pojedynczej gry
    GENERATIONS = 30     # Liczba generacji

    # Kara za remis/timeout - musi być gorsza niż cokolwiek poza pewną porażką,
    # inaczej sieć uczy się "przeczekiwać" grę zamiast atakować.
    DRAW_PENALTY = -0.8

    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    replay_dir = f"replays_{timestamp}"
    os.makedirs(replay_dir, exist_ok=True)
    print(f"📁 Utworzono folder na powtórki: {replay_dir}")
    
    rng = jax.random.PRNGKey(42)
    rng, net_key = jax.random.split(rng)

    print("Inicjalizacja Sieci Neuronowej i Optymalizatora...")
    # --- POPRAWKA 4: 5 kanałów obserwacji w inicjalizacji sieci ---
    dummy_obs = jnp.zeros((1, BOARD_ROWS, BOARD_COLS, 5))
    net_params = AlphaZeroNet().init(net_key, dummy_obs)['params']
    opt_state = optimizer.init(net_params)

    @jax.jit
    def assign_values(player_history, final_rewards):
        def get_target(players):
            return final_rewards[jnp.arange(BATCH_SIZE), players]
        return jax.vmap(get_target)(player_history)

    print("\n🚀 Rozpoczynam trening AlphaZero!\n")

    for gen in range(1, GENERATIONS + 1):
        t0 = time.time()
        
        buffer_obs, buffer_policies, buffer_players = [], [], []
        replay_frames = []
        
        total_blue_wins = 0
        total_red_wins = 0
        total_games_played = 0
        
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
            
            replay_frames.append({
                "pos_idx": state.pos_idx[0], "alive": state.alive[0],
                "count": state.count[0], "side": state.side[0],
                "active_unit_idx": state.active_unit_idx[0],
                "terminated": state.terminated[0], "rewards": state.rewards[0]
            })
            total_blue_wins += int(jnp.sum(state.terminated & (state.rewards[:, 0] > 0)))
            total_red_wins += int(jnp.sum(state.terminated & (state.rewards[:, 1] > 0)))
            total_games_played += int(jnp.sum(state.terminated))
            
        replay_frames_cpu = jax.device_get(replay_frames)
        filepath = os.path.join(replay_dir, f"replay_gen_{gen:02d}.pkl")
        with open(filepath, "wb") as f:
            pickle.dump(replay_frames_cpu, f)

        obs_stack = jnp.stack(buffer_obs)
        pi_stack = jnp.stack(buffer_policies)
        player_stack = jnp.stack(buffer_players)
        
        # --- FIX: gry, które NIE zakończyły się w limicie kroków (timeout), ---
        # dostawały wcześniej losowy "shaping reward" z ostatniej wymiany ciosów
        # zamiast realnej kary za remis. To uczyło sieć, że "przeczekanie" gry
        # jest bezpieczniejsze niż atakowanie (bo atak = ryzyko kontrataku = kara
        # w danym kroku, a timeout = ~0). Teraz każda strona dostaje jawną,
        # symetryczną karę za remis - gorszą niż zwycięstwo, ale niewiele lepszą
        # niż pewna porażka, żeby wciąż była presja na wygraną, a nie tylko
        # "unikaj przegranej za wszelką cenę".
        draw_rewards = jnp.full((BATCH_SIZE, 2), DRAW_PENALTY, dtype=jnp.float32)
        final_rewards = jnp.where(
            state.terminated[:, None],
            state.rewards,
            draw_rewards
        )
        
        v_stack = assign_values(player_stack, final_rewards)

        obs_flat = obs_stack.reshape(-1, *obs_stack.shape[2:])
        pi_flat = pi_stack.reshape(-1, pi_stack.shape[-1])
        v_flat = v_stack.reshape(-1)

        net_params, opt_state, loss = train_step(
            net_params, opt_state, obs_flat, pi_flat, v_flat
        )
        
        loss.block_until_ready()
        t1 = time.time()

        timeouts = int(jnp.sum(~state.terminated))
        internal_draws = total_games_played - (total_blue_wins + total_red_wins)
        
        print(f"Gen {gen:02d}/{GENERATIONS} | "
              f"Wygrane (Niebieski): {total_blue_wins:<4} | Wygrane (Czerwony): {total_red_wins:<4} | "
              f"Przerwane (koniec czasu): {timeouts}")

    print("\n✅ Trening zakończony!")
    print("\n💾 Zapisuję wytrenowany mózg na dysk...")
    
    bytes_output = serialization.to_bytes(net_params)
    with open("homm3_alphazero_weights.msgpack", "wb") as f:
        f.write(bytes_output)
        
    print("✅ Zapisano pomyślnie jako 'homm3_alphazero_weights.msgpack'!")

if __name__ == "__main__":
    train_alphazero()