#!/usr/bin/env python3
"""
Trening agenta AlphaZero w srodowisku HoMM3 (rozdzial 8).

Obsluguje dwie polityki przeszukiwania oraz oba warianty funkcji nagrody,
zapisujac punkty kontrolne wraz z licznikiem czasu ORAZ liczba decyzji ---
dzieki czemu jeden przebieg pozwala pozniej wykreslic krzywe uczenia
wzgledem obu tych osi.

POPRAWKI WZGLEDEM WERSJI PODSTAWOWEJ
------------------------------------
  * DYSKONTO: znak odwracany tylko przy faktycznej zmianie strony. Gra nie
        jest naprzemienna - pomiar daje 48,6% przejsc bez zmiany gracza.
  * ZNAK NAGRODY: indeksowanie po graczu, ktory WYKONAL ruch, nie po
        nastepnym.
  * BOOTSTRAP: odcinek trajektorii nie konczacy sie stanem terminalnym
        domykany jest oszacowaniem wartosci z sieci, nie zerem.

UZYCIE
    python3 train8.py --tag pilot --seed 0 --minutes 25
    python3 train8.py --tag gumbel-m16 --seed 0 --minutes 180
    python3 train8.py --tag puct-strojony --seed 1 --minutes 180 --no-shaping

Kazdy przebieg tworzy katalog runs/<tag>_s<seed>/ zawierajacy:
    STATUS          jedna linia: RUNNING / DONE / FAILED
    historia.json   punkty kontrolne (czas, decyzje, wynik ewaluacji)
    ckpt_*.msgpack  wagi sieci
"""

import argparse
import json
import os
import sys
import time
import traceback
from functools import partial

import numpy as np

import jax
import jax.numpy as jnp
import optax
import mctx
import flax.linen as nn
from flax.serialization import to_bytes

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))

import jax_engine_v3 as eng
from jax_engine_v3 import HoMM3EnvV3, MAX_ACTIONS, N_PLANES, N_BOARD_ACTIONS


# ===========================================================================
# KONFIGURACJE Z PROJEKTU EKSPERYMENTU
# ===========================================================================

KONFIGURACJE = {
    #  etykieta         polityka   c_puct    m      opis
    "pilot":          ("gumbel",   1.25,     16,  "przebieg probny"),
    "puct-domyslny":  ("muzero",   1.25,   None,  "PUCT, stala domyslna"),
    "puct-strojony":  ("muzero",  20.00,   None,  "PUCT, stala dobrana"),
    "gumbel-m16":     ("gumbel",   1.25,     16,  "Gumbel, m=16"),
    "gumbel-m64":     ("gumbel",   1.25,     64,  "Gumbel, m=64"),
}


# ===========================================================================
# SIEC
# ===========================================================================

class Siec(nn.Module):
    """Wspolna dla wszystkich konfiguracji - inaczej wynik nie bylby
    przypisywalny do polityki przeszukiwania."""
    kanaly: int = 64
    glowa: int = 256

    @nn.compact
    def __call__(self, x):
        for _ in range(3):
            x = nn.relu(nn.Conv(self.kanaly, (3, 3), padding="SAME")(x))
        plansza = nn.Conv(N_PLANES, (1, 1))(x).reshape((x.shape[0], -1))
        plaski = x.reshape((x.shape[0], -1))
        h = nn.relu(nn.Dense(self.glowa)(plaski))
        globalne = nn.Dense(MAX_ACTIONS - N_BOARD_ACTIONS)(h)
        logity = jnp.concatenate([plansza, globalne], axis=-1)
        wartosc = nn.tanh(nn.Dense(1)(h)).squeeze(-1)
        return logity, wartosc


# ===========================================================================
# PRZESZUKIWANIE
# ===========================================================================

def zbuduj_decyzje(env, siec, batch, n_sims, polityka, c_puct, m):
    """Zwraca funkcje (params, states, key) -> (akcje, wagi, akcje_w_korzeniu).

    Trzecia wartosc sluzy do sledzenia degeneracji eksploracji w trakcie
    treningu: liczba roznych akcji odwiedzonych w wezle glownym.
    """

    def recurrent_fn(params, rng, action, st):
        # st to stan RODZICA - gracz uprawniony do ruchu przed akcja
        prev_player = st.current_player
        st = jax.vmap(env.step)(st, action, jax.random.split(rng, batch))

        logity, wartosc = siec.apply(params, st.observation)
        logity = jnp.where(st.legal_action_mask, logity, -1e9)

        # nagroda z perspektywy gracza, ktory wykonal ruch
        nagroda = st.rewards[jnp.arange(batch), prev_player]

        # znak odwracany wylacznie przy zmianie strony
        ta_sama = st.current_player == prev_player
        dyskonto = jnp.where(st.terminated, 0.0,
                             jnp.where(ta_sama, 1.0, -1.0))

        return mctx.RecurrentFnOutput(
            reward=nagroda.astype(jnp.float32),
            discount=dyskonto.astype(jnp.float32),
            prior_logits=logity.astype(jnp.float32),
            value=wartosc.astype(jnp.float32)), st

    def decyduj(params, states, key):
        logity, wartosc = siec.apply(params, states.observation)
        root = mctx.RootFnOutput(
            prior_logits=jnp.where(states.legal_action_mask,
                                   logity, -1e9).astype(jnp.float32),
            value=wartosc.astype(jnp.float32),
            embedding=states)

        if polityka == "gumbel":
            out = mctx.gumbel_muzero_policy(
                params, key, root, recurrent_fn,
                num_simulations=n_sims,
                max_num_considered_actions=m,
                invalid_actions=~states.legal_action_mask)
        else:
            out = mctx.muzero_policy(
                params, key, root, recurrent_fn,
                num_simulations=n_sims,
                pb_c_init=c_puct,
                invalid_actions=~states.legal_action_mask,
                dirichlet_fraction=0.25)

        odwiedziny = out.search_tree.children_visits[:, 0, :]
        w_korzeniu = (odwiedziny > 0).sum(axis=-1)
        return out.action, out.action_weights, w_korzeniu

    return decyduj


# ===========================================================================
# SAMOGRA
# ===========================================================================

def zbuduj_samogre(env, siec, decyduj, batch, dlugosc, ksztaltowanie):
    """Zwraca funkcje zbierajaca odcinek trajektorii o zadanej dlugosci."""

    def krok(carry, _):
        states, key = carry
        key, k_mcts, k_step, k_reset = jax.random.split(key, 4)

        obs = states.observation
        maska = states.legal_action_mask
        prev_player = states.current_player

        akcje, wagi, w_korzeniu = decyduj(PARAMS_HOLDER[0], states, k_mcts)

        states = jax.vmap(env.step)(
            states, akcje, jax.random.split(k_step, batch))

        nagrody = states.rewards
        if not ksztaltowanie:
            # bez ksztaltowania: liczy sie wylacznie sygnal terminalny
            nagrody = jnp.where(states.terminated[:, None], nagrody, 0.0)

        gotowe = states.terminated | states.truncated
        next_player = states.current_player

        swiezy = jax.vmap(env.init)(jax.random.split(k_reset, batch))
        states = jax.tree_util.tree_map(
            lambda a, b: jnp.where(
                gotowe.reshape((-1,) + (1,) * (a.ndim - 1)), b, a),
            states, swiezy)

        zapis = (obs, maska, wagi, nagrody, prev_player, next_player,
                 gotowe, w_korzeniu)
        return (states, key), zapis

    return krok


def zwroty(nagrody, prev_player, next_player, gotowe, wartosc_koncowa,
           gamma=1.0):
    """Zwrot z perspektywy gracza, ktory wykonal ruch w danym kroku.

    Odcinek niezakonczony stanem terminalnym domykany jest oszacowaniem
    wartosci z sieci (bootstrap), nie zerem - inaczej wartosci byly
    systematycznie zanizane przy krotkim oknie zbierania danych.
    """
    T, B = prev_player.shape
    wlasna = jnp.take_along_axis(
        nagrody, prev_player[..., None].astype(jnp.int32), axis=-1)[..., 0]
    znak = jnp.where(next_player == prev_player, 1.0, -1.0)
    kontynuacja = (1.0 - gotowe.astype(jnp.float32)) * gamma * znak

    def body(G_next, x):
        r, c = x
        G = r + c * G_next
        return G, G

    _, G = jax.lax.scan(body, wartosc_koncowa, (wlasna, kontynuacja),
                        reverse=True)
    return G


# ===========================================================================
# UCZENIE
# ===========================================================================

def strata(params, siec, obs, maska, cel_polityki, cel_wartosci, waga_l2):
    logity, wartosc = siec.apply(params, obs)
    logity = jnp.where(maska, logity, -1e9)
    log_p = jax.nn.log_softmax(logity, axis=-1)

    strata_p = -jnp.sum(cel_polityki * log_p, axis=-1).mean()
    strata_v = jnp.mean((cel_wartosci - wartosc) ** 2)
    l2 = waga_l2 * sum(jnp.sum(x ** 2)
                       for x in jax.tree_util.tree_leaves(params))
    return strata_p + strata_v + l2, (strata_p, strata_v)


# ===========================================================================
# EWALUACJA
# ===========================================================================

def polityka_zachlanna(states, key, mod):
    """Odpowiednik modulu StupidAI: atakuj, gdy to mozliwe."""
    plaszczyzna = jnp.arange(MAX_ACTIONS) % N_PLANES
    na_planszy = jnp.arange(MAX_ACTIONS) < N_BOARD_ACTIONS
    atak = na_planszy & (plaszczyzna != 0)
    premia = jnp.where(atak, 8.0, 0.0)
    return jax.random.categorical(
        key, jnp.where(states.legal_action_mask, premia, -1e9), axis=-1)


def zbuduj_ewaluacje(env, siec, n_par, max_krokow=400):
    """Pary lustrzane przeciwko polityce zachlannej.

    Kazda bitwa rozgrywana dwukrotnie na tym samym stanie poczatkowym, ze
    stronami zamienionymi. Neutralizuje wplyw losowania skladu armii, ktory
    w tym srodowisku dominuje nad roznica polityk.
    """
    B = 2 * n_par
    strona_agenta = jnp.concatenate(
        [jnp.zeros(n_par, jnp.int32), jnp.ones(n_par, jnp.int32)])

    def krok(carry, _):
        states, key, wynik, zywe = carry
        key, k_a, k_b, k_step = jax.random.split(key, 4)

        logity, _ = siec.apply(PARAMS_HOLDER[0], states.observation)
        logity = jnp.where(states.legal_action_mask, logity, -1e9)
        akcja_agenta = jnp.argmax(logity, axis=-1)
        akcja_bazowa = polityka_zachlanna(states, k_b, eng)

        tura_agenta = states.current_player == strona_agenta
        akcje = jnp.where(tura_agenta, akcja_agenta, akcja_bazowa)

        states = jax.vmap(env.step)(
            states, akcje, jax.random.split(k_step, B))

        koniec = states.terminated & zywe
        # nagroda terminalna z perspektywy agenta
        r = states.rewards[jnp.arange(B), strona_agenta]
        wynik = jnp.where(koniec, r, wynik)
        zywe = zywe & (~states.terminated)
        return (states, key, wynik, zywe), None

    def ewaluuj(params, key):
        k_init, k_gra = jax.random.split(key)
        klucze = jax.random.split(k_init, n_par)
        klucze = jnp.concatenate([klucze, klucze], axis=0)
        states = jax.vmap(env.init)(klucze)
        carry = (states, k_gra, jnp.zeros(B), jnp.ones(B, jnp.bool_))
        (states, _, wynik, zywe), _ = jax.lax.scan(
            krok, carry, None, length=max_krokow)
        return wynik, zywe

    return ewaluuj


def podsumuj_ewaluacje(wynik, zywe, n_par):
    """Wskaznik zwyciestw agenta oraz odsetek par rozstrzygnietych."""
    w = np.asarray(wynik)
    nieskonczone = int(np.asarray(zywe).sum())
    wygrane = float((w > 0).sum())
    remisy = float((w == 0).sum()) - nieskonczone
    rozegrane = len(w) - nieskonczone
    wsk = (wygrane + 0.5 * max(remisy, 0)) / max(rozegrane, 1)

    a, b = w[:n_par], w[n_par:]
    rozstrzygniete = int(((a > 0) & (b > 0)).sum() + ((a < 0) & (b < 0)).sum())
    return {
        "wskaznik_zwyciestw": round(wsk, 4),
        "partii_rozegranych": rozegrane,
        "partii_nieskonczonych": nieskonczone,
        "par_rozstrzygnietych": round(rozstrzygniete / max(n_par, 1), 4),
    }


# ===========================================================================
# GLOWNA PETLA
# ===========================================================================

PARAMS_HOLDER = [None]   # obejscie: params przekazywane do funkcji w scan


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--tag", required=True, choices=list(KONFIGURACJE))
    ap.add_argument("--seed", type=int, default=0)
    ap.add_argument("--minutes", type=float, default=180.0)
    ap.add_argument("--batch", type=int, default=256)
    ap.add_argument("--sims", type=int, default=100)
    ap.add_argument("--odcinek", type=int, default=32,
                    help="liczba krokow samogry na iteracje")
    ap.add_argument("--lr", type=float, default=2e-4)
    ap.add_argument("--l2", type=float, default=1e-4)
    ap.add_argument("--minibatch", type=int, default=1024)
    ap.add_argument("--krokow-uczenia", type=int, default=8,
                    help="krokow gradientu na iteracje samogry")
    ap.add_argument("--bufor", type=int, default=100_000)
    ap.add_argument("--no-shaping", dest="ksztaltowanie",
                    action="store_false")
    ap.add_argument("--ckpt-co", type=float, default=300.0,
                    help="odstep miedzy punktami kontrolnymi [s]")
    ap.add_argument("--par-ewaluacji", type=int, default=256)
    ap.add_argument("--katalog", default="runs")
    args = ap.parse_args()

    polityka, c_puct, m, opis = KONFIGURACJE[args.tag]
    nazwa = f"{args.tag}_s{args.seed}"
    kat = os.path.join(args.katalog, nazwa)
    os.makedirs(kat, exist_ok=True)

    def status(s, extra=""):
        with open(os.path.join(kat, "STATUS"), "w") as f:
            f.write(f"{s} {time.strftime('%Y-%m-%d %H:%M:%S')} {extra}\n")

    def log(*a):
        print(f"[{time.strftime('%H:%M:%S')}]", *a, flush=True)

    status("RUNNING")
    log(f"=== {nazwa} ===  {opis}")
    log(f"polityka={polityka} c_puct={c_puct} m={m} "
        f"ksztaltowanie={args.ksztaltowanie}")
    log(f"B={args.batch} N={args.sims} odcinek={args.odcinek} "
        f"budzet={args.minutes:.0f} min")
    log(f"urzadzenia: {jax.devices()}")

    env = HoMM3EnvV3()
    siec = Siec()
    key = jax.random.PRNGKey(args.seed)
    key, k_init, k_siec = jax.random.split(key, 3)

    params = siec.init(k_siec, jnp.zeros((1, eng.BOARD_ROWS,
                                          eng.BOARD_COLS, eng.C)))
    n_par = int(sum(x.size for x in jax.tree_util.tree_leaves(params)))
    log(f"parametrow sieci: {n_par:,}")

    opt = optax.adam(args.lr)
    stan_opt = opt.init(params)
    PARAMS_HOLDER[0] = params

    decyduj = zbuduj_decyzje(env, siec, args.batch, args.sims,
                             polityka, c_puct, m)
    krok_samogry = zbuduj_samogre(env, siec, decyduj, args.batch,
                                  args.odcinek, args.ksztaltowanie)
    ewaluuj = jax.jit(zbuduj_ewaluacje(env, siec, args.par_ewaluacji))

    @jax.jit
    def zbierz(states, key):
        (states, key), zapis = jax.lax.scan(
            krok_samogry, (states, key), None, length=args.odcinek)
        obs, maska, wagi, nagrody, prev_p, next_p, gotowe, w_korzeniu = zapis
        _, v_koncowa = siec.apply(PARAMS_HOLDER[0], states.observation)
        G = zwroty(nagrody, prev_p, next_p, gotowe, v_koncowa)
        return states, key, obs, maska, wagi, G, gotowe, w_korzeniu

    @jax.jit
    def ucz(params, stan_opt, obs, maska, cel_p, cel_v):
        (l, (lp, lv)), grad = jax.value_and_grad(strata, has_aux=True)(
            params, siec, obs, maska, cel_p, cel_v, args.l2)
        akt, stan_opt = opt.update(grad, stan_opt, params)
        return optax.apply_updates(params, akt), stan_opt, l, lp, lv

    # --- bufor powtorek w pamieci hosta ---
    bufor = {"obs": [], "maska": [], "cel_p": [], "cel_v": []}
    rozmiar_bufora = 0

    def dodaj(obs, maska, wagi, G):
        nonlocal rozmiar_bufora
        n = obs.shape[0] * obs.shape[1]
        bufor["obs"].append(np.asarray(obs).reshape(n, *obs.shape[2:]))
        bufor["maska"].append(np.asarray(maska).reshape(n, -1))
        bufor["cel_p"].append(np.asarray(wagi).reshape(n, -1))
        bufor["cel_v"].append(np.asarray(G).reshape(n))
        rozmiar_bufora += n
        while rozmiar_bufora > args.bufor:
            rozmiar_bufora -= bufor["obs"][0].shape[0]
            for k in bufor:
                bufor[k].pop(0)

    states = jax.jit(jax.vmap(env.init))(
        jax.random.split(k_init, args.batch))

    historia = []
    t_start = time.perf_counter()
    t_ckpt = t_start
    decyzje = 0
    partie = 0
    iteracja = 0
    budzet = args.minutes * 60.0

    log("kompilacja i pierwsza iteracja...")

    try:
        while time.perf_counter() - t_start < budzet:
            key, k_zb = jax.random.split(key)
            states, _, obs, maska, wagi, G, gotowe, w_korzeniu = zbierz(
                states, k_zb)
            jax.block_until_ready(G)

            decyzje += args.odcinek * args.batch
            partie += int(np.asarray(gotowe).sum())
            sr_korzen = float(np.asarray(w_korzeniu).mean())

            dodaj(obs, maska, wagi, G)

            obs_all = np.concatenate(bufor["obs"])
            maska_all = np.concatenate(bufor["maska"])
            cp_all = np.concatenate(bufor["cel_p"])
            cv_all = np.concatenate(bufor["cel_v"])

            straty = []
            for _ in range(args.krokow_uczenia):
                idx = np.random.randint(0, obs_all.shape[0],
                                        size=args.minibatch)
                params, stan_opt, l, lp, lv = ucz(
                    params, stan_opt,
                    jnp.asarray(obs_all[idx]), jnp.asarray(maska_all[idx]),
                    jnp.asarray(cp_all[idx]), jnp.asarray(cv_all[idx]))
                straty.append((float(l), float(lp), float(lv)))
            PARAMS_HOLDER[0] = params

            iteracja += 1
            uplyw = time.perf_counter() - t_start

            if iteracja == 1:
                log(f"pierwsza iteracja gotowa w {uplyw:.0f}s "
                    f"(w tym kompilacja)")

            # --- punkt kontrolny ---
            if time.perf_counter() - t_ckpt >= args.ckpt_co or \
                    uplyw >= budzet:
                t_ckpt = time.perf_counter()
                key, k_ew = jax.random.split(key)
                wynik, zywe = ewaluuj(params, k_ew)
                ocena = podsumuj_ewaluacje(wynik, zywe, args.par_ewaluacji)

                l_sr = float(np.mean([s[0] for s in straty]))
                punkt = {
                    "iteracja": iteracja,
                    "czas_s": round(uplyw, 1),
                    "decyzje": decyzje,
                    "partie": partie,
                    "strata": round(l_sr, 4),
                    "strata_polityki": round(
                        float(np.mean([s[1] for s in straty])), 4),
                    "strata_wartosci": round(
                        float(np.mean([s[2] for s in straty])), 4),
                    "akcje_w_korzeniu": round(sr_korzen, 2),
                    "dec_na_s": round(decyzje / uplyw, 1),
                    **ocena,
                }
                historia.append(punkt)

                sciezka = os.path.join(kat, f"ckpt_{iteracja:05d}.msgpack")
                with open(sciezka, "wb") as f:
                    f.write(to_bytes(params))
                with open(os.path.join(kat, "historia.json"), "w") as f:
                    json.dump({"konfiguracja": vars(args),
                               "polityka": polityka, "c_puct": c_puct,
                               "m": m, "parametrow": n_par,
                               "punkty": historia}, f, indent=2)

                log(f"it {iteracja:>4}  {uplyw/60:>5.1f} min  "
                    f"dec {decyzje:>9,}  "
                    f"wsk.zwyc {ocena['wskaznik_zwyciestw']:.3f}  "
                    f"korzen {sr_korzen:>5.1f}  "
                    f"strata {l_sr:.4f}  "
                    f"{decyzje/uplyw:>6.1f} dec/s")
                status("RUNNING", f"it={iteracja} "
                       f"wsk={ocena['wskaznik_zwyciestw']:.3f}")

        log(f"zakonczono: {iteracja} iteracji, {decyzje:,} decyzji, "
            f"{partie:,} partii")
        if historia:
            log(f"koncowy wskaznik zwyciestw: "
                f"{historia[-1]['wskaznik_zwyciestw']:.3f}")
        status("DONE", f"it={iteracja} dec={decyzje}")

    except Exception as exc:
        log(f"BLAD: {type(exc).__name__}: {exc}")
        traceback.print_exc()
        with open(os.path.join(kat, "blad.txt"), "w") as f:
            f.write(traceback.format_exc())
        status("FAILED", type(exc).__name__)
        sys.exit(1)


if __name__ == "__main__":
    main()