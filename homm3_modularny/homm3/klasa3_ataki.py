"""
KLASA III - mechaniki bedace czysta arytmetyka na istniejacym stanie.

Nie powiekszaja ani przestrzeni akcji, ani wektora stanu. Ich koszt to
wylacznie operacje i bajty w goracej petli - i wlasnie ten koszt chcemy
zmierzyc osobno dla kazdej z nich.

TO JEST WLASCIWE MIEJSCE NA GLOWNA TEZE ARTYKULU
------------------------------------------------
W silniku galeziowym kazda z tych zdolnosci kosztuje tylko wtedy, gdy
jednostka ja posiada. Instrukcja warunkowa przeskakuje caly blok i procesor
nie wykonuje go wcale.

W sformulowaniu tensorowym nie ma skoku. Maska mnozy wynik przez zero, ale
wynik trzeba wpierw policzyc. Placimy wiec za KAZDA zaimplementowana
mechanike, w kazdym kroku, dla kazdego elementu wsadu - niezaleznie od tego,
czy ktokolwiek na planszy ma te zdolnosc.

Zywy przyklad z naszego wlasnego kodu: w puli stworow dopuszczonej do
symulacji bylo ZERO jednostek z atakiem dookolnym. Kod tej mechaniki liczyl
sie w kazdym kroku kazdej bitwy i nie zmienil wyniku ani razu. To nie jest
blad implementacji - to jest cena wektoryzacji, i trzeba ja podac liczba.

UWAGA O JEDNYM WSPOLNYM KOSZCIE
-------------------------------
Oddech, atak trojglowy i atak dookolny roznia sie tylko tym, KTORE heksy
wyznaczaja jako dodatkowe cele. Samo uderzenie w te heksy to jedna petla po
MAX_UNITS, wspolna dla wszystkich trzech. Dlatego pierwsza wlaczona mechanika
wielocelowa jest droga (wnosi petle), a kazda nastepna tania (wnosi tylko
kilka odczytow tablicy sasiedztwa). Pomiar musi to pokazac i nie wolno tego
mylic z "mechanika X jest tania".
"""

import jax
import jax.numpy as jnp

from .rdzen import (MAX_UNITS, NUM_HEXES, N_DIRS, NEIGHBOR_OK, NEIGHBOR_SAFE,
                    MELEE_PENALTY, P_RETAL, _strike, rear_hex, total_hp,
                    unit_at_hex)


# ===========================================================================
# wielokrotny kontratak - mechanika DANYCH, nie kodu
# ===========================================================================
# Rdzen daje kazdej jednostce jeden kontratak. Ta mechanika jedynie wczytuje
# prawdziwa liczbe z puli. Kod sciezki kontrataku jest identyczny w obu
# przypadkach, wiec oczekiwany koszt obliczeniowy to ZERO - i to tez jest
# wynik warty podania, bo pokazuje, ze nie kazde rozszerzenie zasad kosztuje.

def init_wielokrotny_kontratak(state, row, key, kfg):
    retal = jnp.maximum(row[:, P_RETAL].astype(jnp.int32), 1)
    return state.replace(retaliations_max=retal, retaliations_left=retal)


# ===========================================================================
# kara za zwarcie i zdolnosc ja znoszaca
# ===========================================================================

def mnoznik_kary_zwarcia(state, atk, dfn, key, is_melee, kfg):
    """Strzelec atakujacy wrecz zadaje polowe obrazen."""
    return jnp.where(is_melee & state.is_shooter[atk], MELEE_PENALTY, 1.0)


def mnoznik_kary_zwarcia_ze_zdolnoscia(state, atk, dfn, key, is_melee, kfg):
    """Jak wyzej, ale zdolnosc no_melee_penalty kare znosi.

    Rozni sie od wersji powyzej jednym odczytem tablicy i jedna negacja.
    To najmniejsza mozliwa mechanika klasy III i dobry punkt odniesienia
    dla czulosci pomiaru.
    """
    karany = (is_melee & state.is_shooter[atk]
              & (~state.no_melee_penalty[atk]))
    return jnp.where(karany, MELEE_PENALTY, 1.0)


# ===========================================================================
# podwojny atak
# ===========================================================================

def dodatkowy_cios(state, u, tgt, key, is_melee, kfg, haki):
    """Drugi cios jednostek o zdolnosci podwojnego ataku."""
    drugi = state.double_attack[u] & state.alive[tgt] & state.alive[u]

    def znowu(s):
        s, _, d2 = _strike(s, u, tgt, key, kfg, haki, is_melee=is_melee)
        return s, d2

    return jax.lax.cond(drugi, znowu, lambda s: (s, jnp.int32(0)), state)


# ===========================================================================
# cele dodatkowe: oddech, atak trojglowy, atak dookolny
# ===========================================================================

def _uderz_cele_dodatkowe(state, u, maska_heksow, key, kfg, haki):
    """Uderza wszystkie wrogie jednostki na wskazanych heksach.

    Cele dodatkowe NIE kontratakuja - kontratak przysluguje tylko celowi
    glownemu. Petla po MAX_UNITS jest wspolnym kosztem wszystkich mechanik
    wielocelowych.
    """
    uah = unit_at_hex(state)
    safe = jnp.clip(uah, 0, MAX_UNITS - 1)
    trafiony_heks = (maska_heksow & (uah >= 0)
                     & (state.side[safe] != state.side[u]))
    trafiony = jnp.zeros(MAX_UNITS, dtype=jnp.bool_).at[safe].max(trafiony_heks)
    trafiony = trafiony & state.alive & (jnp.arange(MAX_UNITS) != u)

    def cialo(i, carry):
        st, k, suma = carry
        k, pod = jax.random.split(k)

        def zrob(s):
            s2, _, dmg = _strike(s, u, i, pod, kfg, haki, is_melee=True)
            return s2, dmg

        st2, dmg = jax.lax.cond(trafiony[i], zrob,
                                lambda s: (s, jnp.int32(0)), st)
        return st2, k, suma + dmg

    state, _, suma = jax.lax.fori_loop(
        0, MAX_UNITS, cialo, (state, key, jnp.int32(0)))
    return state, suma


def zrob_hak_celow_dodatkowych(kfg):
    """Sklada jeden hak z wlaczonych mechanik wielocelowych.

    Zwraca None, jesli zadna nie jest wlaczona - wtedy do grafu nie trafia
    ani wyznaczanie heksow, ani petla uderzen.
    """
    oddech = kfg.oddech
    trojglowy = kfg.trojglowy
    dookolny = kfg.dookolny
    if not (oddech or trojglowy or dookolny):
        return None

    def hak(state, u, atk_hex, d, tgt_hex, key, kfg, haki):
        m = jnp.zeros(NUM_HEXES, dtype=jnp.bool_)

        if oddech:
            # heks za celem, ten sam kierunek
            za = NEIGHBOR_SAFE[tgt_hex, d]
            m = m.at[za].max(NEIGHBOR_OK[tgt_hex, d] & state.breath_attack[u])

        if trojglowy:
            # dwaj sasiedzi ATAKUJACEGO przylegli do celu (kierunki d-1, d+1)
            for delta in (-1, 1):
                dd = (d + delta) % N_DIRS
                h = NEIGHBOR_SAFE[atk_hex, dd]
                m = m.at[h].max(NEIGHBOR_OK[atk_hex, dd]
                                & state.three_headed[u])

        if dookolny:
            # wszyscy sasiedzi atakujacego...
            for k in range(N_DIRS):
                h = NEIGHBOR_SAFE[atk_hex, k]
                m = m.at[h].max(NEIGHBOR_OK[atk_hex, k] & state.all_around[u])
            # ...a dla jednostek dwuheksowych takze sasiedzi heksu tylnego
            two = state.is_two_hex[u]
            back = rear_hex(atk_hex, state.side[u], two)
            for k in range(N_DIRS):
                h = NEIGHBOR_SAFE[back, k]
                m = m.at[h].max(NEIGHBOR_OK[back, k]
                                & state.all_around[u] & two)
            m = m.at[back].set(False)

        m = m.at[atk_hex].set(False)
        m = m.at[tgt_hex].set(False)
        return _uderz_cele_dodatkowe(state, u, m, key, kfg, haki)

    return hak


# ===========================================================================
# wysysanie zycia
# ===========================================================================

def _ulecz(state, i, ile):
    """Leczenie z pulapem na poczatkowej liczebnosci stosu."""
    pulap = state.count_start[i] * state.max_hp[i]
    nowe = jnp.minimum(total_hp(state, i) + ile, pulap)
    nowe = jnp.maximum(nowe, 1)
    nowy_count = jnp.ceil(nowe / jnp.maximum(state.max_hp[i], 1)).astype(jnp.int32)
    nowe_hp = nowe - (nowy_count - 1) * state.max_hp[i]
    ok = state.alive[i] & (ile > 0)
    return state.replace(
        count=state.count.at[i].set(jnp.where(ok, nowy_count, state.count[i])),
        hp_left=state.hp_left.at[i].set(jnp.where(ok, nowe_hp,
                                                  state.hp_left[i])),
    )


def po_ataku_wyssanie(state, u, tgt, dmg, start_hex, key, kfg, haki):
    return jax.lax.cond(state.life_drain[u] & state.alive[u],
                        lambda s: _ulecz(s, u, dmg), lambda s: s, state)


# ===========================================================================
# powrot na heks startowy
# ===========================================================================

def po_ataku_powrot(state, u, tgt, dmg, start_hex, key, kfg, haki):
    from .rdzen import standable_mask

    def wroc(s):
        mozna = standable_mask(s, u)[start_hex] | (start_hex == s.pos_idx[u])
        return s.replace(
            pos_idx=s.pos_idx.at[u].set(
                jnp.where(mozna, start_hex, s.pos_idx[u])))

    return jax.lax.cond(state.return_after_strike[u] & state.alive[u],
                        wroc, lambda s: s, state)


# ===========================================================================
# skladanie hakow
# ===========================================================================

def haki_klasy_III(kfg) -> dict:
    """Zwraca slownik {nazwa_pola_hakow: krotka funkcji}."""
    init, mnoznik, cele, ciosy, po_ataku = [], [], [], [], []

    if kfg.wielokrotny_kontratak:
        init.append(init_wielokrotny_kontratak)

    if kfg.kara_zwarcia:
        mnoznik.append(mnoznik_kary_zwarcia_ze_zdolnoscia
                       if kfg.bez_kary_zwarcia else mnoznik_kary_zwarcia)

    hak_celow = zrob_hak_celow_dodatkowych(kfg)
    if hak_celow is not None:
        cele.append(hak_celow)

    if kfg.podwojny_atak:
        ciosy.append(dodatkowy_cios)

    if kfg.wyssanie:
        po_ataku.append(po_ataku_wyssanie)
    if kfg.powrot:
        po_ataku.append(po_ataku_powrot)

    return dict(init=tuple(init), mnoznik=tuple(mnoznik),
                cele_dodatkowe=tuple(cele), dodatkowe_ciosy=tuple(ciosy),
                po_ataku=tuple(po_ataku))
