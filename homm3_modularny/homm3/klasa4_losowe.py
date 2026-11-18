"""
KLASA IV - mechaniki wprowadzajace losowosc do przejscia.

Morale i szczescie. W obu przypadkach wynik akcji zalezy od rzutu, ktorego
agent nie kontroluje:

  morale dodatnie   - po ruchu innym niz czekanie i obrona jednostka moze
                      dostac dodatkowa akcje (raz na runde),
  morale ujemne     - przed ruchem jednostka moze ture stracic,
  szczescie dodatnie- cios moze zadac podwojne obrazenia,
  szczescie ujemne  - cios moze zadac polowe obrazen.

Prawdopodobienstwo to |wartosc| / 24 na kazdy rzut, jak w grze.

DWA ROZNE KOSZTY, KTORE TRZEBA ROZDZIELIC
-----------------------------------------
1. Koszt w symulatorze jest maly i dobrze okreslony: jedno dodatkowe
   losowanie na cios albo na ture. W JAX-ie generator jest licznikowy
   (threefry), wiec losowanie to realna praca arytmetyczna, a nie odczyt
   stanu globalnego - i dlatego w ogole widac go w licznikach.

2. Koszt w przeszukiwaniu jest nieporownanie wiekszy i nie jest to koszt
   czasu. Przejscie przestaje byc funkcja stanu i akcji, a staje sie
   rozkladem. Poprawne drzewo wymaga wezlow losowych, a gesta
   implementacja mctx ich nie ma - kazda krawedz prowadzi do dokladnie
   jednego dziecka. Ta sama akcja rozegrana dwa razy daje dwa rozne stany,
   ktore drzewo utozsamia.

Dlatego morale i szczescie sa w artykule interesujace nie przez swoj koszt
w nanosekundach, ale przez to, ze lamia zalozenie algorytmu planowania.
Mozna je zmierzyc w symulatorze i nie mozna ich poprawnie zaplanowac -
i to jest wynik.

UWAGA O WPLYWIE NA ROZGRYWKE
----------------------------
Utrata tury przez morale ujemne oznacza, ze akcja wybrana przez agenta
zostaje odrzucona. Dla symulatora to jedna linia; dla uczenia to zmiana
semantyki, bo nagroda przestaje odpowiadac wybranej akcji.
"""

import jax
import jax.numpy as jnp

from .rdzen import MAX_UNITS, N_BOARD_ACTIONS


SZANSA_NA_PUNKT = 24.0      # jak w grze: jeden punkt to 1/24 szansy


def _na_kanal(tablica, zakres):
    """Wartosc ze znakiem na przedzial [0.1, 1.0] - patrz klasa2_bufy."""
    znorm = jnp.clip(tablica.astype(jnp.float32) / max(zakres, 1), -1.0, 1.0)
    return 0.55 + 0.45 * znorm


# ===========================================================================
# zasianie morale i szczescia
# ===========================================================================

def zrob_init(kfg):
    ma_morale = kfg.morale
    ma_szczescie = kfg.szczescie
    zm = int(kfg.zakres_morale)
    zs = int(kfg.zakres_szczescia)

    def init(state, row, key, kfg):
        zmiany = {}
        k1, k2 = jax.random.split(key)
        if ma_morale:
            zmiany["morale"] = jax.random.randint(
                k1, (MAX_UNITS,), -zm, zm + 1).astype(jnp.int8)
            zmiany["morale_uzyte"] = jnp.zeros(MAX_UNITS, dtype=jnp.bool_)
        if ma_szczescie:
            zmiany["szczescie"] = jax.random.randint(
                k2, (MAX_UNITS,), -zs, zs + 1).astype(jnp.int8)
        return state.replace(ext=state.ext.replace(**zmiany))

    return init


# ===========================================================================
# morale ujemne: utrata tury
# ===========================================================================

def przed_tura_morale(state, u, key, kfg):
    """Zwraca True, jesli jednostka traci ture."""
    m = state.ext.morale[u]
    prog = jnp.maximum(-m, 0).astype(jnp.float32) / SZANSA_NA_PUNKT
    return jax.random.uniform(key) < prog


# ===========================================================================
# morale dodatnie: dodatkowa akcja
# ===========================================================================

def po_turze_morale(state, u, action, key, kfg):
    """Cofa znacznik 'zagral', wiec jednostka zostaje aktywna raz jeszcze.

    Kwalifikuja sie tylko akcje planszowe: ruch, atak, strzal. Czekanie
    (1320), obrona (1321) i czary (>= 1322) nie, zgodnie z zasadami gry.
    Ogranicznik `morale_uzyte` gwarantuje najwyzej jedna dodatkowa akcje
    na runde, co zamyka mozliwosc petli nieskonczonej.
    """
    m = state.ext.morale[u]
    prog = jnp.maximum(m, 0).astype(jnp.float32) / SZANSA_NA_PUNKT
    kwalifikuje = action < N_BOARD_ACTIONS
    trafia = ((jax.random.uniform(key) < prog) & kwalifikuje
              & (~state.ext.morale_uzyte[u]) & state.alive[u])

    return state.replace(
        acted_this_round=state.acted_this_round.at[u].set(
            jnp.where(trafia, False, state.acted_this_round[u])),
        ext=state.ext.replace(
            morale_uzyte=state.ext.morale_uzyte.at[u].set(
                state.ext.morale_uzyte[u] | trafia)))


def nowa_runda_morale(state, kfg):
    return state.replace(ext=state.ext.replace(
        morale_uzyte=jnp.zeros(MAX_UNITS, dtype=jnp.bool_)))


# ===========================================================================
# szczescie: mnoznik obrazen
# ===========================================================================

def mnoznik_szczescia(state, atk, dfn, key, is_melee, kfg):
    s = state.ext.szczescie[atk]
    prog = jnp.abs(s).astype(jnp.float32) / SZANSA_NA_PUNKT
    trafia = jax.random.uniform(key) < prog
    return jnp.where(trafia & (s > 0), 2.0,
                     jnp.where(trafia & (s < 0), 0.5, 1.0))


# ===========================================================================
# kanaly obserwacji
# ===========================================================================

def zrob_obserwacje(kfg):
    ma_morale = kfg.morale
    ma_szczescie = kfg.szczescie
    zm = int(kfg.zakres_morale)
    zs = int(kfg.zakres_szczescia)
    idx = kfg.indeksy

    def obserwacja(state, obs, paint, kfg):
        if ma_morale:
            obs = paint(obs, idx["morale"], _na_kanal(state.ext.morale, zm))
        if ma_szczescie:
            obs = paint(obs, idx["szczescie"],
                        _na_kanal(state.ext.szczescie, zs))
        return obs

    return obserwacja


# ===========================================================================
# skladanie hakow
# ===========================================================================

def haki_klasy_IV(kfg) -> dict:
    if not (kfg.morale or kfg.szczescie):
        return {}

    przed, po, runda, mnoznik = [], [], [], []
    if kfg.morale:
        przed.append(przed_tura_morale)
        po.append(po_turze_morale)
        runda.append(nowa_runda_morale)
    if kfg.szczescie:
        mnoznik.append(mnoznik_szczescia)

    return dict(init=(zrob_init(kfg),),
                przed_tura=tuple(przed),
                po_turze=tuple(po),
                nowa_runda=tuple(runda),
                mnoznik=tuple(mnoznik),
                obserwacja=(zrob_obserwacje(kfg),))
