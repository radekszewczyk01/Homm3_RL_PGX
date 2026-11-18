"""
KLASA I - mechaniki powiekszajace przestrzen akcji.

Czary rzucane przez bohatera na wybrany heks. Kazdy czar to 165 nowych akcji,
po jednej na heks planszy.

DLACZEGO TO JEST NAJDROZSZA KLASA
---------------------------------
Nie z powodu arytmetyki - obrazenia czaru to jedno mnozenie. Koszt siedzi
w drzewie przeszukiwania. Gesta reprezentacja mctx trzyma szesc tablic
krawedziowych o rozmiarze [B, N+1, |A|]:

    indeksy dzieci, logity apriori, liczniki odwiedzin,
    nagrody, wspolczynniki dyskonta, wartosci

Zmierzylismy, ze jedna krawedz kosztuje 34 bajty, z czego 26,1 to same
statystyki, a 7,93 to stan rozlozony na krawedzie. Rozmiar tych tablic jest
WPROST PROPORCJONALNY do |A|, wiec:

    |A| = 1322 (rdzen)              -> wsad graniczny B_max
    |A| = 1982 (cztery czary)       -> B_max mniejszy o jedna trzecia
    |A| = 2642 (osiem czarow)       -> B_max mniejszy o polowe

I to przy przestrzeni akcji, ktorej srednio okolo 69 pozycji jest
dopuszczalnych. Czyli 94 procent bufora krawedziowego stoi puste, a czary
powiekszaja wlasnie te puste 94 procent. Stad bierze sie teza, ze dla
nieregularnych gier o duzej strukturyzowanej przestrzeni akcji waskim gardlem
nie jest symulator, tylko reprezentacja drzewa.

UKLAD AKCJI
-----------
    [0, 1320)                  165 heksow x 8 plaszczyzn (rdzen)
    1320                       czekaj
    1321                       obrona
    1322 + s*165 + h           czar numer s rzucony na heks h

Akcje rdzenia zachowuja swoje indeksy, wiec konfiguracje sa porownywalne.

MODEL BOHATERA
--------------
Rzucenie czaru NIE zuzywa tury aktywnej jednostki - jak w grze, czaruje
bohater, a jednostka nadal ma swoj ruch. Ogranicznikiem jest jeden czar na
strone na runde oraz zapas many. Dzieki temu rzucenie czaru jest osobnym
wezlem decyzyjnym, co jest wierne zasadom i nie wymaga zadnej sztuczki
w kolejce tury.
"""

import jax
import jax.numpy as jnp

from .konfiguracja import KATALOG_CZAROW, RODZAJ_BUF
from .rdzen import (MAX_AKCJI_RDZENIA, MAX_UNITS, NUM_HEXES, N_DIRS,
                    NEIGHBOR_OK, NEIGHBOR_SAFE, unit_at_hex, zadaj_obrazenia)


# ===========================================================================
# zasianie many i mocy czarow
# ===========================================================================

def zrob_init(kfg):
    mana = int(kfg.mana_start)
    moc = int(kfg.moc_czarow)

    def init(state, row, key, kfg):
        return state.replace(ext=state.ext.replace(
            mana=jnp.full(2, mana, dtype=jnp.int32),
            moc_czarow=jnp.full(2, moc, dtype=jnp.int32),
            czar_w_rundzie=jnp.zeros(2, dtype=jnp.bool_)))

    return init


# ===========================================================================
# maska legalnych czarow
# ===========================================================================

def zrob_maska(kfg):
    opisy = [KATALOG_CZAROW[c] for c in kfg.czary]

    def maska(state, u, m, kfg):
        strona = jnp.clip(state.side[u], 0, 1)
        mana = state.ext.mana[strona]
        juz_rzucal = state.ext.czar_w_rundzie[strona]

        uah = unit_at_hex(state)
        safe = jnp.clip(uah, 0, MAX_UNITS - 1)
        zajety = (uah >= 0) & state.alive[safe]
        wrog = zajety & (state.side[safe] != strona)
        swoj = zajety & (state.side[safe] == strona)

        for s, opis in enumerate(opisy):
            # czary obrazeniowe i oslabiajace celuja we wroga,
            # wzmacniajace we wlasne jednostki
            cel = swoj if opis["znak"] > 0 else wrog
            mozna = (mana >= opis["mana"]) & (~juz_rzucal)
            od = MAX_AKCJI_RDZENIA + s * NUM_HEXES
            m = m.at[od:od + NUM_HEXES].set(cel & mozna)
        return m

    return maska


# ===========================================================================
# galezie: jeden czar, jedna galaz
# ===========================================================================

def _maska_obszaru(h, obszar: bool):
    m = jnp.zeros(NUM_HEXES, dtype=jnp.bool_).at[h].set(True)
    if obszar:
        for k in range(N_DIRS):
            m = m.at[NEIGHBOR_SAFE[h, k]].max(NEIGHBOR_OK[h, k])
    return m


def _galaz_obrazen(opis):
    baza, skala, obszar = opis["baza"], opis["skala"], opis["obszar"]

    def galaz(state, h, strona, key):
        moc = state.ext.moc_czarow[strona]
        dmg = jnp.int32(baza) + jnp.int32(skala) * moc

        uah = unit_at_hex(state)
        safe = jnp.clip(uah, 0, MAX_UNITS - 1)
        heksy = _maska_obszaru(h, obszar)
        trafiony_heks = heksy & (uah >= 0) & (state.side[safe] != strona)
        cel = (jnp.zeros(MAX_UNITS, dtype=jnp.bool_)
               .at[safe].max(trafiony_heks)) & state.alive

        # Czary ignoruja obrone, wiec nie przechodza przez _strike. Zero
        # obrazen dla jednostek nietrafionych zostaje odfiltrowane w
        # zadaj_obrazenia, wiec nie potrzeba tu rozgalezienia.
        def cialo(i, st):
            st2, _, _ = zadaj_obrazenia(st, i, jnp.where(cel[i], dmg, 0))
            return st2

        return jax.lax.fori_loop(0, MAX_UNITS, cialo, state)

    return galaz


def _galaz_bufa(opis, czas_bufa: int):
    pole = ("blogoslawienstwo" if opis["pole"] == "obrazen"
            else "przyspieszenie")
    znak = int(opis["znak"])

    def galaz(state, h, strona, key):
        uah = unit_at_hex(state)
        i = jnp.clip(uah[h], 0, MAX_UNITS - 1)
        ok = (uah[h] >= 0) & state.alive[i]

        tab = getattr(state.ext, pole)
        wartosc = jnp.where(ok, jnp.int8(znak * czas_bufa), tab[i])
        tab = tab.at[i].set(wartosc.astype(jnp.int8))
        return state.replace(ext=state.ext.replace(**{pole: tab}))

    return galaz


# ===========================================================================
# wykonanie czaru
# ===========================================================================

def zrob_akcje(kfg):
    nazwy = tuple(kfg.czary)
    opisy = [KATALOG_CZAROW[c] for c in nazwy]
    czas = int(kfg.czas_bufa)

    galezie = tuple(
        _galaz_bufa(o, czas) if o["rodzaj"] == RODZAJ_BUF
        else _galaz_obrazen(o)
        for o in opisy)
    KOSZTY = jnp.array([o["mana"] for o in opisy], dtype=jnp.int32)
    n = len(nazwy)

    def akcja(state, u, action, key, kfg, haki):
        idx = action - MAX_AKCJI_RDZENIA
        s_idx = jnp.clip(idx // NUM_HEXES, 0, n - 1)
        h = jnp.clip(idx % NUM_HEXES, 0, NUM_HEXES - 1)
        strona = jnp.clip(state.side[u], 0, 1)

        koszt = KOSZTY[s_idx]
        wolno = ((state.ext.mana[strona] >= koszt)
                 & (~state.ext.czar_w_rundzie[strona]))

        def rzuc(s):
            # lax.switch kompiluje WSZYSTKIE galezie. Pod vmap zamienia sie
            # w wybor z policzonych wynikow, czyli kazdy wlaczony czar liczy
            # sie w kazdym kroku - dokladnie to, co model kosztu przewiduje.
            s = jax.lax.switch(s_idx, galezie, s, h, strona, key)
            return s.replace(ext=s.ext.replace(
                mana=s.ext.mana.at[strona].add(-koszt),
                czar_w_rundzie=s.ext.czar_w_rundzie.at[strona].set(True)))

        return jax.lax.cond(wolno, rzuc, lambda s: s, state)

    return akcja


# ===========================================================================
# nowa runda i obserwacja
# ===========================================================================

def nowa_runda_czary(state, kfg):
    return state.replace(ext=state.ext.replace(
        czar_w_rundzie=jnp.zeros(2, dtype=jnp.bool_)))


def zrob_obserwacje(kfg):
    idx = kfg.indeksy["mana"]
    skala = float(max(kfg.mana_start, 1))

    def obserwacja(state, obs, paint, kfg):
        # mana jest cecha strony, nie heksu - kanal jest stalym tlem
        strona = jnp.clip(state.current_player, 0, 1)
        wartosc = (state.ext.mana[strona].astype(jnp.float32) / skala
                   * jnp.where(state.ext.czar_w_rundzie[strona], 0.5, 1.0))
        return obs.at[:, idx].set(wartosc)

    return obserwacja


# ===========================================================================
# skladanie hakow
# ===========================================================================

def haki_klasy_I(kfg) -> dict:
    if not kfg.czary:
        return {}
    return dict(init=(zrob_init(kfg),),
                maska=(zrob_maska(kfg),),
                akcja_rozszerzona=(zrob_akcje(kfg),),
                nowa_runda=(nowa_runda_czary,),
                obserwacja=(zrob_obserwacje(kfg),))
