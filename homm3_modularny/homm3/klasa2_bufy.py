"""
KLASA II - mechaniki dokladajace trwaly stan jednostek.

Blogoslawienstwo i klatwa, przyspieszenie i spowolnienie. Ich koszt nie siedzi
w arytmetyce - ta jest banalna - tylko w tym, ze powiekszaja wektor stanu D.

DLACZEGO TO JEST DROGIE I DLACZEGO WLASCIWIE WAZNE
--------------------------------------------------
Zbior roboczy jednego kroku to 2BD: stan wejsciowy czytany i stan wyjsciowy
pisany. Program dziala z pelna predkoscia dopoki ten zbior miesci sie w pamieci
podrecznej ostatniego poziomu, a gdy przestaje - przepustowosc zalamuje sie
skokowo. Zmierzylismy to: trafienia w L2 spadaja ze stu procent do 23 procent
przy zmianie wsadu o cwierc.

Z tego wynika regula projektowa B_opt = C_eff / (2D). Kazda mechanika klasy II
powieksza D, a wiec ZMNIEJSZA wsad, przy ktorym program jeszcze jest szybki.
Mechanika, ktorej arytmetyka kosztuje trzy instrukcje, moze zabrac dwadziescia
procent przepustowosci, bo zepchnela program z pamieci podrecznej.

Co wazne, bufy nie dokladaja bajtow gdziekolwiek - dokladaja je do OBSERWACJI,
ktora stanowi 7920 z 10479 bajtow stanu i jest przebudowywana w kazdym kroku.
To znaczy, ze trafiaja dokladnie w goraca sciezke i regula projektowa dostaje
uczciwy test przewidywania, a nie test na polu doklejonym obok.

KODOWANIE: ZNAK ZAMIAST DWOCH TABLIC I ZERO GALEZI
--------------------------------------------------
Blogoslawienstwo i klatwa znosza sie wzajemnie: nalozenie klatwy na jednostke
pod blogoslawienstwem usuwa blogoslawienstwo i wstawia klatwe. Zamiast dwoch
tablic i sprawdzania warunku trzymamy jedna liczbe ze znakiem:

    +3  blogoslawienstwo na trzy rundy
     0  brak
    -2  klatwa na dwie rundy

Wzajemne znoszenie jest wtedy zwyklym przypisaniem, nie warunkiem. Wygaszanie
to odjecie znaku. Polowa pamieci i zero rozgalezien - a semantyka gry zostaje
oddana doslownie. Ten sam chwyt dziala dla przyspieszenia i spowolnienia.
"""

import jax
import jax.numpy as jnp

from .rdzen import MAX_UNITS


# ===========================================================================
# wspolne narzedzia - uzywa ich tez klasa1_czary (czary bufujace)
# ===========================================================================

def naloz_buf(tablica, i, znak, czas):
    """Naklada buf o zadanym znaku, nadpisujac to, co bylo.

    Nadpisanie JEST semantyka gry: klatwa zdejmuje blogoslawienstwo.
    Dlatego to przypisanie, a nie dodawanie.
    """
    return tablica.at[i].set((jnp.int8(znak) * jnp.int8(czas)).astype(jnp.int8))


def wygas(tablica):
    """Jedna runda mniej. Odjecie znaku dziala w obie strony i nie przekracza
    zera: sign(+1) daje 0, sign(-1) daje 0."""
    return (tablica - jnp.sign(tablica).astype(jnp.int8)).astype(jnp.int8)


def _na_kanal(tablica, czas_bufa):
    """Odwzorowanie wartosci ze znakiem na przedzial [0.1, 1.0].

    Nie na [-1, 1], bo malarz obserwacji sklada wartosci operatorem maksimum
    i wartosc ujemna zostalaby zatarta przez puste tlo. Neutralne 0.55,
    pelne blogoslawienstwo 1.0, pelna klatwa 0.1.
    """
    znorm = jnp.clip(tablica.astype(jnp.float32) / max(czas_bufa, 1), -1.0, 1.0)
    return 0.55 + 0.45 * znorm


# ===========================================================================
# zasianie na starcie bitwy
# ===========================================================================

def zrob_init(kfg):
    """Tworzy tablice bufow i opcjonalnie zasiewa je losowo.

    Zasiewanie na starcie sluzy do tego, zeby mechanika dala sie zmierzyc
    BEZ wlaczania klasy I. Jesli wlaczysz czary bufujace, bufy beda tez
    nakladane w trakcie bitwy i wtedy logika wzajemnego znoszenia faktycznie
    sie odpali - inaczej byla by kodem, ktory liczy sie zawsze i nie dziala
    nigdy, czyli dokladnie ta pulapka, ktora opisujemy w artykule.
    """
    ma_obrazen = kfg.bufy_obrazen
    ma_szybkosci = kfg.bufy_szybkosci
    szansa = float(kfg.szansa_bufa_start)
    czas = int(kfg.czas_bufa)

    def init(state, row, key, kfg):
        zmiany = {}
        k1, k2 = jax.random.split(key)

        def zasiej(k):
            if szansa <= 0.0:
                return jnp.zeros(MAX_UNITS, dtype=jnp.int8)
            ka, kb = jax.random.split(k)
            jest = jax.random.uniform(ka, (MAX_UNITS,)) < szansa
            znak = jnp.where(jax.random.bernoulli(kb, 0.5, (MAX_UNITS,)),
                             1, -1).astype(jnp.int8)
            return jnp.where(jest & state.alive,
                             znak * jnp.int8(czas),
                             jnp.int8(0)).astype(jnp.int8)

        if ma_obrazen:
            zmiany["blogoslawienstwo"] = zasiej(k1)
        if ma_szybkosci:
            zmiany["przyspieszenie"] = zasiej(k2)
        return state.replace(ext=state.ext.replace(**zmiany))

    return init


# ===========================================================================
# blogoslawienstwo i klatwa: granice losowania obrazen
# ===========================================================================

def kostka_bufow(state, atk, lo, hi, kfg):
    """Blogoslawienstwo daje zawsze maksimum, klatwa zawsze minimum.

    Bez rozgalezienia: dwa wybory na wartosciach, ktore juz mamy.
        b > 0 -> lo = hi = max
        b < 0 -> lo = hi = min
        b = 0 -> bez zmiany
    """
    b = state.ext.blogoslawienstwo[atk]
    return (jnp.where(b > 0, hi, lo),
            jnp.where(b < 0, lo, hi))


# ===========================================================================
# przyspieszenie i spowolnienie: szybkosc efektywna
# ===========================================================================

BONUS_PRZYSPIESZENIA = 3        # jak w grze, poziom podstawowy
ULAMEK_SPOWOLNIENIA = 4         # spowolnienie o 1/4, nie mniej niz 1


def szybkosc_z_bufami(state, spd, kfg):
    p = state.ext.przyspieszenie
    przyspieszony = spd + BONUS_PRZYSPIESZENIA
    spowolniony = jnp.maximum(1, spd - spd // ULAMEK_SPOWOLNIENIA)
    return jnp.where(p > 0, przyspieszony,
                     jnp.where(p < 0, spowolniony, spd))


# ===========================================================================
# wygaszanie na poczatku rundy
# ===========================================================================

def zrob_nowa_runda(kfg):
    ma_obrazen = kfg.bufy_obrazen
    ma_szybkosci = kfg.bufy_szybkosci

    def nowa_runda(state, kfg):
        zmiany = {}
        if ma_obrazen:
            zmiany["blogoslawienstwo"] = wygas(state.ext.blogoslawienstwo)
        if ma_szybkosci:
            zmiany["przyspieszenie"] = wygas(state.ext.przyspieszenie)
        return state.replace(ext=state.ext.replace(**zmiany))

    return nowa_runda


# ===========================================================================
# kanaly obserwacji
# ===========================================================================

def zrob_obserwacje(kfg):
    ma_obrazen = kfg.bufy_obrazen
    ma_szybkosci = kfg.bufy_szybkosci
    czas = int(kfg.czas_bufa)
    idx = kfg.indeksy

    def obserwacja(state, obs, paint, kfg):
        if ma_obrazen:
            obs = paint(obs, idx["buf_obrazen"],
                        _na_kanal(state.ext.blogoslawienstwo, czas))
        if ma_szybkosci:
            obs = paint(obs, idx["buf_szybkosci"],
                        _na_kanal(state.ext.przyspieszenie, czas))
        return obs

    return obserwacja


# ===========================================================================
# skladanie hakow
# ===========================================================================

def haki_klasy_II(kfg) -> dict:
    if not (kfg.bufy_obrazen or kfg.bufy_szybkosci):
        return {}

    kostka = (kostka_bufow,) if kfg.bufy_obrazen else ()
    szybkosc = (szybkosc_z_bufami,) if kfg.bufy_szybkosci else ()

    return dict(init=(zrob_init(kfg),),
                kostka=kostka,
                szybkosc=szybkosc,
                nowa_runda=(zrob_nowa_runda(kfg),),
                obserwacja=(zrob_obserwacje(kfg),))
