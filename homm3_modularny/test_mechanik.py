#!/usr/bin/env python3
"""
Testy semantyki mechanik.

Kontrola niezmiennikow (eksperymenty.py zgodnosc) mowi tylko, ze silnik sie
nie psuje. Tutaj sprawdzamy, czy mechaniki robia TO, CO MAJA ROBIC - bo
mechanika zaimplementowana blednie ma dokladnie taki sam koszt jak poprawna,
a wynik pomiaru wyglada identycznie. Bez tych testow ablacja mierzy koszt
kodu, o ktorym nie wiemy, czy cokolwiek liczy.

Mechaniki losowe sprawdzamy statystycznie: czesc rzutow musi wypasc w zadanym
przedziale. Przedzialy sa szerokie, zeby test nie migotal.

Uruchomienie:
    python3 test_mechanik.py
    JAX_PLATFORMS=cpu python3 test_mechanik.py --bez-kosztu
"""

import argparse
import dataclasses
import sys

import jax
import jax.numpy as jnp
import numpy as np

from homm3 import Konfiguracja, preset, zbuduj, zbuduj_haki
from homm3.klasa2_bufy import naloz_buf, szybkosc_z_bufami, wygas
from homm3.klasa4_losowe import (mnoznik_szczescia, po_turze_morale,
                                 przed_tura_morale)
from homm3.rdzen import (MAX_AKCJI_RDZENIA, MAX_UNITS, NUM_HEXES,
                         NEIGHBOR_SAFE, _strike, szybkosc)

ZDANE, OBLANE = [], []


def sprawdz(warunek, opis, szczegol=""):
    (ZDANE if warunek else OBLANE).append(opis)
    print(f"  {'OK  ' if warunek else 'BLAD'} {opis}"
          + (f"   [{szczegol}]" if szczegol else ""))
    return bool(warunek)


# ===========================================================================
# stan testowy: dwie jednostki obok siebie, obrazenia bez losowosci modyfikatora
# ===========================================================================

def stan_testowy(env, atak=10, obrona=10, min_dmg=2, max_dmg=10,
                 hp=100000, liczebnosc=1, ziarno=0):
    """Dwie zywe jednostki: numer 0 po stronie 0 i numer 7 po stronie 1.

    Atak rowny obronie, wiec modyfikator obrazen wynosi dokladnie 1,0 i cios
    jest rowny wylosowanej wartosci na jednostke. Punkty zycia ogromne, zeby
    nikt nie ginal i dalo sie powtarzac pomiar na tym samym stanie.
    """
    st = jax.jit(env.init)(jax.random.PRNGKey(ziarno))
    n = MAX_UNITS
    zywi = np.zeros(n, bool)
    zywi[0] = zywi[7] = True

    pos = np.asarray(st.pos_idx).copy()
    pos[0] = 5 * 15 + 5
    pos[7] = int(NEIGHBOR_SAFE[pos[0], 2])      # kierunek R, na pewno sasiad

    def pelna(wartosc, dtype):
        return jnp.full(n, wartosc, dtype=dtype)

    return st.replace(
        alive=jnp.array(zywi),
        side=jnp.array([0] * 7 + [1] * 7, dtype=jnp.int32),
        pos_idx=jnp.array(pos, dtype=jnp.int32),
        blocked=jnp.zeros(NUM_HEXES, dtype=jnp.bool_),
        is_two_hex=jnp.zeros(n, dtype=jnp.bool_),
        is_flyer=jnp.zeros(n, dtype=jnp.bool_),
        is_shooter=jnp.zeros(n, dtype=jnp.bool_),
        no_retaliation=jnp.ones(n, dtype=jnp.bool_),   # bez kontrataku
        double_attack=jnp.zeros(n, dtype=jnp.bool_),
        breath_attack=jnp.zeros(n, dtype=jnp.bool_),
        three_headed=jnp.zeros(n, dtype=jnp.bool_),
        all_around=jnp.zeros(n, dtype=jnp.bool_),
        life_drain=jnp.zeros(n, dtype=jnp.bool_),
        return_after_strike=jnp.zeros(n, dtype=jnp.bool_),
        no_melee_penalty=jnp.zeros(n, dtype=jnp.bool_),
        is_defending=jnp.zeros(n, dtype=jnp.bool_),
        attack=pelna(atak, jnp.int32),
        defense=pelna(obrona, jnp.int32),
        min_damage=pelna(min_dmg, jnp.int32),
        max_damage=pelna(max_dmg, jnp.int32),
        max_hp=pelna(hp, jnp.int32),
        hp_left=pelna(hp, jnp.int32),
        count=pelna(liczebnosc, jnp.int32),
        count_start=pelna(liczebnosc, jnp.int32),
        speed=pelna(8, jnp.int32),
        shots=jnp.zeros(n, dtype=jnp.int32),
        retaliations_max=jnp.ones(n, dtype=jnp.int32),
        retaliations_left=jnp.ones(n, dtype=jnp.int32),
    )


def rozklad_ciosow(env, st, prob=400):
    """Rozklad obrazen z ciosu jednostki 0 w jednostke 7."""
    kfg, haki = env.kfg, env.haki

    @jax.jit
    def jeden(k):
        _, _, dealt = _strike(st, 0, 7, k, kfg, haki, is_melee=True)
        return dealt

    return np.array([int(jeden(jax.random.PRNGKey(i))) for i in range(prob)])


# ===========================================================================
# KLASA II
# ===========================================================================

def test_klasa2():
    print("\n--- klasa II: blogoslawienstwo, klatwa, przyspieszenie ---")
    kfg = Konfiguracja(bufy_obrazen=True, bufy_szybkosci=True,
                       czas_bufa=3, nazwa="test_II",
                       **{m: False for m in
                          ("oddech", "trojglowy", "dookolny", "wyssanie",
                           "powrot", "podwojny_atak", "kara_zwarcia",
                           "bez_kary_zwarcia", "wielokrotny_kontratak")})
    env = zbuduj(kfg)
    st = stan_testowy(env, min_dmg=2, max_dmg=10)

    neutralny = rozklad_ciosow(env, st)
    sprawdz(neutralny.min() >= 2 and neutralny.max() <= 10,
            "bez bufa obrazenia miesci sie w [min, max]",
            f"{neutralny.min()}..{neutralny.max()}")
    sprawdz(len(set(neutralny)) > 3, "bez bufa obrazenia sa losowe",
            f"{len(set(neutralny))} roznych wartosci")

    blogo = st.replace(ext=st.ext.replace(
        blogoslawienstwo=naloz_buf(st.ext.blogoslawienstwo, 0, +1, 3)))
    d = rozklad_ciosow(env, blogo)
    sprawdz(set(d.tolist()) == {10},
            "blogoslawienstwo daje zawsze maksimum", f"wartosci {set(d.tolist())}")

    klatwa = st.replace(ext=st.ext.replace(
        blogoslawienstwo=naloz_buf(st.ext.blogoslawienstwo, 0, -1, 3)))
    d = rozklad_ciosow(env, klatwa)
    sprawdz(set(d.tolist()) == {2},
            "klatwa daje zawsze minimum", f"wartosci {set(d.tolist())}")

    # wzajemne znoszenie
    tab = naloz_buf(st.ext.blogoslawienstwo, 0, +1, 3)
    sprawdz(int(tab[0]) == 3, "blogoslawienstwo zapisane jako +czas",
            f"{int(tab[0])}")
    tab = naloz_buf(tab, 0, -1, 3)
    sprawdz(int(tab[0]) == -3,
            "klatwa ZNOSI blogoslawienstwo i wchodzi na jego miejsce",
            f"{int(tab[0])}")
    tab = naloz_buf(tab, 0, +1, 3)
    sprawdz(int(tab[0]) == 3, "i odwrotnie", f"{int(tab[0])}")

    # wygaszanie
    t = jnp.array([3, -3, 1, -1, 0], dtype=jnp.int8)
    po = np.asarray(wygas(t))
    sprawdz(list(po) == [2, -2, 0, 0, 0],
            "wygaszanie schodzi do zera i nie przekracza go", f"{list(po)}")

    # szybkosc
    spd = jnp.full(MAX_UNITS, 8, dtype=jnp.int32)
    przysp = st.replace(ext=st.ext.replace(
        przyspieszenie=naloz_buf(st.ext.przyspieszenie, 0, +1, 3)))
    spowol = st.replace(ext=st.ext.replace(
        przyspieszenie=naloz_buf(st.ext.przyspieszenie, 0, -1, 3)))
    sprawdz(int(szybkosc_z_bufami(przysp, spd, kfg)[0]) == 11,
            "przyspieszenie dodaje 3 do szybkosci",
            f"{int(szybkosc_z_bufami(przysp, spd, kfg)[0])}")
    sprawdz(int(szybkosc_z_bufami(spowol, spd, kfg)[0]) == 6,
            "spowolnienie zabiera czwarta czesc szybkosci",
            f"{int(szybkosc_z_bufami(spowol, spd, kfg)[0])}")
    sprawdz(int(szybkosc_z_bufami(st, spd, kfg)[0]) == 8,
            "bez bufa szybkosc bez zmian")


# ===========================================================================
# KLASA IV
# ===========================================================================

def test_klasa4(prob=4000):
    print("\n--- klasa IV: morale i szczescie ---")
    kfg = Konfiguracja(morale=True, szczescie=True, nazwa="test_IV",
                       **{m: False for m in
                          ("oddech", "trojglowy", "dookolny", "wyssanie",
                           "powrot", "podwojny_atak", "kara_zwarcia",
                           "bez_kary_zwarcia", "wielokrotny_kontratak")})
    env = zbuduj(kfg)
    st = stan_testowy(env)

    def z_morale(m):
        tab = st.ext.morale.at[0].set(jnp.int8(m))
        return st.replace(ext=st.ext.replace(morale=tab))

    def z_szczesciem(s):
        tab = st.ext.szczescie.at[0].set(jnp.int8(s))
        return st.replace(ext=st.ext.replace(szczescie=tab))

    # utrata tury przy morale ujemnym
    for m, oczekiwana in ((-3, 3 / 24), (-1, 1 / 24), (0, 0.0), (3, 0.0)):
        s = z_morale(m)
        f = jax.jit(lambda k: przed_tura_morale(s, 0, k, kfg))
        traf = np.mean([bool(f(jax.random.PRNGKey(i))) for i in range(prob)])
        if oczekiwana == 0:
            ok = traf == 0.0
        else:
            ok = abs(traf - oczekiwana) < 0.25 * oczekiwana + 0.01
        sprawdz(ok, f"morale {m:+d}: utrata tury z czestoscia ~{oczekiwana:.3f}",
                f"zmierzono {traf:.3f}")

    # dodatkowa akcja przy morale dodatnim
    for m, oczekiwana in ((3, 3 / 24), (-3, 0.0)):
        s = z_morale(m).replace(
            acted_this_round=jnp.ones(MAX_UNITS, dtype=jnp.bool_))
        f = jax.jit(lambda k: po_turze_morale(s, 0, jnp.int32(0), k, kfg))
        traf = np.mean([not bool(f(jax.random.PRNGKey(i)).acted_this_round[0])
                        for i in range(prob)])
        ok = (traf == 0.0 if oczekiwana == 0
              else abs(traf - oczekiwana) < 0.25 * oczekiwana + 0.01)
        sprawdz(ok, f"morale {m:+d}: dodatkowa akcja z czestoscia "
                    f"~{oczekiwana:.3f}", f"zmierzono {traf:.3f}")

    # czekanie i obrona nie daja dodatkowej akcji
    s = z_morale(3).replace(
        acted_this_round=jnp.ones(MAX_UNITS, dtype=jnp.bool_))
    for akcja, nazwa in ((1320, "czekanie"), (1321, "obrona"),
                         (MAX_AKCJI_RDZENIA, "czar")):
        f = jax.jit(lambda k: po_turze_morale(s, 0, jnp.int32(akcja), k, kfg))
        traf = np.mean([not bool(f(jax.random.PRNGKey(i)).acted_this_round[0])
                        for i in range(500)])
        sprawdz(traf == 0.0, f"{nazwa} nie uprawnia do dodatkowej akcji",
                f"zmierzono {traf:.3f}")

    # najwyzej jedna dodatkowa akcja na runde
    s = z_morale(24).replace(
        acted_this_round=jnp.ones(MAX_UNITS, dtype=jnp.bool_),
        ext=z_morale(24).ext.replace(
            morale_uzyte=jnp.ones(MAX_UNITS, dtype=jnp.bool_)))
    f = jax.jit(lambda k: po_turze_morale(s, 0, jnp.int32(0), k, kfg))
    traf = np.mean([not bool(f(jax.random.PRNGKey(i)).acted_this_round[0])
                    for i in range(500)])
    sprawdz(traf == 0.0,
            "znacznik morale_uzyte blokuje druga dodatkowa akcje w rundzie",
            f"zmierzono {traf:.3f}")

    # szczescie
    for s_val, mnoznik, oczekiwana in ((3, 2.0, 3 / 24), (-3, 0.5, 3 / 24),
                                       (0, 1.0, 1.0)):
        s = z_szczesciem(s_val)
        f = jax.jit(lambda k: mnoznik_szczescia(s, 0, 7, k, True, kfg))
        wyniki = np.array([float(f(jax.random.PRNGKey(i)))
                           for i in range(prob)])
        traf = float(np.mean(np.isclose(wyniki, mnoznik)))
        ok = (abs(traf - 1.0) < 1e-9 if oczekiwana == 1.0
              else abs(traf - oczekiwana) < 0.25 * oczekiwana + 0.01)
        sprawdz(ok, f"szczescie {s_val:+d}: mnoznik {mnoznik} z czestoscia "
                    f"~{oczekiwana:.3f}", f"zmierzono {traf:.3f}")
        sprawdz(set(np.unique(wyniki).tolist()) <= {0.5, 1.0, 2.0},
                f"szczescie {s_val:+d}: mnoznik tylko z dozwolonego zbioru",
                f"{sorted(set(np.unique(wyniki).tolist()))}")


# ===========================================================================
# KLASA I
# ===========================================================================

def test_klasa1():
    print("\n--- klasa I: czary ---")
    from homm3.konfiguracja import KATALOG_CZAROW
    czary = ("strzala", "lod", "meteor", "implozja")
    kfg = Konfiguracja(czary=czary, moc_czarow=3, mana_start=100,
                       nazwa="test_I",
                       **{m: False for m in
                          ("oddech", "trojglowy", "dookolny", "wyssanie",
                           "powrot", "podwojny_atak", "kara_zwarcia",
                           "bez_kary_zwarcia", "wielokrotny_kontratak")})
    env = zbuduj(kfg)

    sprawdz(kfg.liczba_akcji == MAX_AKCJI_RDZENIA + 4 * NUM_HEXES,
            "cztery czary dodaja 4 x 165 akcji", f"|A| = {kfg.liczba_akcji}")

    st = stan_testowy(env, obrona=60, hp=100000)
    st = st.replace(active_unit_idx=jnp.int32(0),
                    current_player=jnp.int32(0))
    hex_wroga = int(st.pos_idx[7])
    hp_przed = int(st.hp_left[7]) + (int(st.count[7]) - 1) * int(st.max_hp[7])

    hak = env.haki.akcja_rozszerzona[0]
    for s_idx, nazwa in enumerate(czary):
        opis = KATALOG_CZAROW[nazwa]
        akcja = MAX_AKCJI_RDZENIA + s_idx * NUM_HEXES + hex_wroga
        nowy = jax.jit(lambda a, k: hak(st, jnp.int32(0), a, k, kfg, env.haki)
                       )(jnp.int32(akcja), jax.random.PRNGKey(0))
        hp_po = int(nowy.hp_left[7]) + (int(nowy.count[7]) - 1) * int(nowy.max_hp[7])
        zadane = hp_przed - hp_po
        oczekiwane = opis["baza"] + opis["skala"] * kfg.moc_czarow
        sprawdz(zadane == oczekiwane,
                f"{nazwa}: obrazenia {oczekiwane} niezaleznie od obrony",
                f"zadane {zadane}")
        sprawdz(int(nowy.ext.mana[0]) == kfg.mana_start - opis["mana"],
                f"{nazwa}: zuzyta mana {opis['mana']}",
                f"zostalo {int(nowy.ext.mana[0])}")
        sprawdz(bool(nowy.ext.czar_w_rundzie[0]),
                f"{nazwa}: znacznik 'rzucal w tej rundzie' ustawiony")

        # drugi rzut w tej samej rundzie nie moze dzialac
        drugi = jax.jit(lambda a, k: hak(nowy, jnp.int32(0), a, k, kfg,
                                         env.haki)
                        )(jnp.int32(akcja), jax.random.PRNGKey(1))
        hp_drugi = int(drugi.hp_left[7]) + (int(drugi.count[7]) - 1) * int(drugi.max_hp[7])
        sprawdz(hp_drugi == hp_po,
                f"{nazwa}: drugi czar w tej samej rundzie nie dziala")

    # brak many
    bez_many = st.replace(ext=st.ext.replace(mana=jnp.zeros(2, jnp.int32)))
    akcja = MAX_AKCJI_RDZENIA + 3 * NUM_HEXES + hex_wroga      # implozja
    nowy = jax.jit(lambda a, k: hak(bez_many, jnp.int32(0), a, k, kfg,
                                    env.haki)
                   )(jnp.int32(akcja), jax.random.PRNGKey(0))
    hp_po = int(nowy.hp_left[7]) + (int(nowy.count[7]) - 1) * int(nowy.max_hp[7])
    sprawdz(hp_po == hp_przed, "bez many czar nie dziala")

    # maska: czar celuje tylko w heks zajety przez wroga
    hak_maski = env.haki.maska[0]
    m = jax.jit(lambda: hak_maski(st, jnp.int32(0),
                                  jnp.zeros(kfg.liczba_akcji, jnp.bool_),
                                  kfg))()
    m = np.asarray(m)
    od = MAX_AKCJI_RDZENIA
    for s_idx, nazwa in enumerate(czary):
        plaszczyzna = m[od + s_idx * NUM_HEXES: od + (s_idx + 1) * NUM_HEXES]
        sprawdz(plaszczyzna.sum() == 1 and plaszczyzna[hex_wroga],
                f"{nazwa}: legalny dokladnie jeden heks, ten z wrogiem",
                f"legalnych {int(plaszczyzna.sum())}")

    # czar wzmacniajacy celuje we wlasne jednostki
    kfg_b = Konfiguracja(czary=("blogoslawienstwo",), bufy_obrazen=True,
                         nazwa="test_I_buf")
    env_b = zbuduj(kfg_b)
    st_b = stan_testowy(env_b).replace(active_unit_idx=jnp.int32(0),
                                       current_player=jnp.int32(0))
    m = np.asarray(jax.jit(lambda: env_b.haki.maska[0](
        st_b, jnp.int32(0), jnp.zeros(kfg_b.liczba_akcji, jnp.bool_), kfg_b))())
    plaszczyzna = m[MAX_AKCJI_RDZENIA:MAX_AKCJI_RDZENIA + NUM_HEXES]
    sprawdz(bool(plaszczyzna[int(st_b.pos_idx[0])])
            and not bool(plaszczyzna[int(st_b.pos_idx[7])]),
            "blogoslawienstwo celuje we wlasna jednostke, nie we wroga")

    nowy = jax.jit(lambda a, k: env_b.haki.akcja_rozszerzona[0](
        st_b, jnp.int32(0), a, k, kfg_b, env_b.haki)
    )(jnp.int32(MAX_AKCJI_RDZENIA + int(st_b.pos_idx[0])),
      jax.random.PRNGKey(0))
    sprawdz(int(nowy.ext.blogoslawienstwo[0]) == kfg_b.czas_bufa,
            "rzucone blogoslawienstwo zapisuje sie w stanie jednostki",
            f"{int(nowy.ext.blogoslawienstwo[0])}")


# ===========================================================================
# KLASA III
# ===========================================================================

def test_klasa3():
    print("\n--- klasa III: mechaniki ataku ---")
    kfg = preset("odniesienie")
    env = zbuduj(kfg)

    # kara za zwarcie
    st = stan_testowy(env, min_dmg=10, max_dmg=10, liczebnosc=1)
    st = st.replace(no_retaliation=jnp.ones(MAX_UNITS, dtype=jnp.bool_))
    zwykly = rozklad_ciosow(env, st, prob=40)
    sprawdz(set(zwykly.tolist()) == {10},
            "cios bez losowosci daje dokladnie 10")

    strzelec = st.replace(is_shooter=jnp.ones(MAX_UNITS, dtype=jnp.bool_))
    d = rozklad_ciosow(env, strzelec, prob=40)
    sprawdz(set(d.tolist()) == {5},
            "strzelec w zwarciu zadaje polowe", f"{set(d.tolist())}")

    znoszacy = strzelec.replace(
        no_melee_penalty=jnp.ones(MAX_UNITS, dtype=jnp.bool_))
    d = rozklad_ciosow(env, znoszacy, prob=40)
    sprawdz(set(d.tolist()) == {10},
            "zdolnosc znoszaca kare przywraca pelne obrazenia",
            f"{set(d.tolist())}")

    # ta sama konfiguracja bez mechaniki znoszacej musi karac mimo zdolnosci
    kfg_bez = dataclasses.replace(kfg, bez_kary_zwarcia=False,
                                  nazwa="bez_znoszacej")
    env_bez = zbuduj(kfg_bez)
    d = rozklad_ciosow(env_bez, znoszacy, prob=40)
    sprawdz(set(d.tolist()) == {5},
            "przy wylaczonej mechanice zdolnosc nie dziala wcale",
            f"{set(d.tolist())}")

    # wylaczona kara calkiem
    kfg_nic = dataclasses.replace(kfg, kara_zwarcia=False,
                                  bez_kary_zwarcia=False, nazwa="bez_kary")
    d = rozklad_ciosow(zbuduj(kfg_nic), strzelec, prob=40)
    sprawdz(set(d.tolist()) == {10},
            "bez mechaniki kary strzelec w zwarciu bije na pelna sile",
            f"{set(d.tolist())}")

    # wysysanie zycia
    ranny = st.replace(
        count=jnp.full(MAX_UNITS, 10, jnp.int32),
        count_start=jnp.full(MAX_UNITS, 10, jnp.int32),
        max_hp=jnp.full(MAX_UNITS, 100, jnp.int32),
        hp_left=jnp.full(MAX_UNITS, 50, jnp.int32),
        life_drain=jnp.ones(MAX_UNITS, dtype=jnp.bool_),
        min_damage=jnp.full(MAX_UNITS, 30, jnp.int32),
        max_damage=jnp.full(MAX_UNITS, 30, jnp.int32))
    from homm3.rdzen import execute_melee, total_hp
    przed = int(total_hp(ranny, 0))
    po_st = jax.jit(lambda k: execute_melee(
        ranny, jnp.int32(0), jnp.int32(7), ranny.pos_idx[0], jnp.int32(2),
        ranny.pos_idx[0], k, kfg, env.haki))(jax.random.PRNGKey(0))
    po = int(total_hp(po_st, 0))
    sprawdz(po > przed, "wysysanie zycia leczy atakujacego",
            f"{przed} -> {po}")
    sprawdz(po <= int(ranny.count_start[0]) * int(ranny.max_hp[0]),
            "wysysanie nie przekracza poczatkowej liczebnosci stosu")

    # pulap: zdrowy stos nie moze sie wyleczyc ponad start
    zdrowy = ranny.replace(hp_left=jnp.full(MAX_UNITS, 100, jnp.int32))
    przed = int(total_hp(zdrowy, 0))
    po_st = jax.jit(lambda k: execute_melee(
        zdrowy, jnp.int32(0), jnp.int32(7), zdrowy.pos_idx[0], jnp.int32(2),
        zdrowy.pos_idx[0], k, kfg, env.haki))(jax.random.PRNGKey(0))
    sprawdz(int(total_hp(po_st, 0)) == przed,
            "pelny stos nie leczy sie ponad pulap")


# ===========================================================================
# DWIE IMPLEMENTACJE FALI ZASIEGU DAJA TEN SAM WYNIK
# ===========================================================================

def test_zasieg(gier=30):
    """Fala macierzowa i fala z odczytem sasiadow musza byc rownowazne.

    To nie jest test porzadkowy. Na roznicy tych dwoch implementacji opiera
    sie wniosek o tym, co wyznacza prog rezydencji w L2 - a wniosek z dwoch
    wariantow, ktore licza COS INNEGO, byl by bez wartosci. Porownujemy
    maski heks po heksie, dla kazdej zywej jednostki, na losowych stanach.
    """
    print("\n--- fala zasiegu: macierz wobec odczytu sasiadow ---")
    from homm3.rdzen import reachable_mask

    kfg_m = preset("odniesienie")
    kfg_g = dataclasses.replace(kfg_m, zasieg_gatherem=True, nazwa="gather")
    env_m, env_g = zbuduj(kfg_m), zbuduj(kfg_g)

    # jedna kompilacja na wariant: wektoryzujemy po jednostkach
    jednostki = jnp.arange(MAX_UNITS)

    @jax.jit
    def maski_macierz(st):
        return jax.vmap(lambda u: reachable_mask(st, u, kfg_m, env_m.haki))(
            jednostki)

    @jax.jit
    def maski_gather(st):
        return jax.vmap(lambda u: reachable_mask(st, u, kfg_g, env_g.haki))(
            jednostki)

    init = jax.jit(env_m.init)
    rozne, porownanych, heksow = 0, 0, 0
    for z in range(gier):
        st = init(jax.random.PRNGKey(1000 + z))
        a = np.asarray(maski_macierz(st))
        b = np.asarray(maski_gather(st))
        zywe = np.asarray(st.alive)
        for u in np.where(zywe)[0]:
            porownanych += 1
            heksow += int(a[u].sum())
            if not np.array_equal(a[u], b[u]):
                rozne += 1
                if rozne <= 3:
                    print(f"       ROZNICA ziarno {z} jednostka {u}: "
                          f"macierz {a[u].sum()} heksow, "
                          f"odczyt {b[u].sum()}")

    sprawdz(rozne == 0,
            "obie implementacje daja identyczne maski zasiegu",
            f"{porownanych} masek, srednio {heksow / max(porownanych, 1):.1f} "
            f"heksow, roznic {rozne}")
    sprawdz(heksow > 0, "maski nie sa puste (test cos faktycznie sprawdza)",
            f"{heksow} heksow razem")


# ===========================================================================
# WYLACZONA MECHANIKA NIE KOSZTUJE NIC
# ===========================================================================

def test_koszt_zerowy(B=8):
    print("\n--- wylaczona mechanika a koszt programu ---")
    from homm3.pomiar import analiza_kosztu

    sprawdz(zbuduj_haki(preset("rdzen")).ile() == 0,
            "goly rdzen nie ma ani jednego haka")

    koszty = {}
    for nazwa, kfg in (("rdzen", preset("rdzen")),
                       ("odniesienie", preset("odniesienie")),
                       ("bez dookolnego", dataclasses.replace(
                           preset("odniesienie"), dookolny=False,
                           nazwa="bez_dookolnego")),
                       ("bez wielokrotnego kontrataku", dataclasses.replace(
                           preset("odniesienie"), wielokrotny_kontratak=False,
                           nazwa="bez_kontr"))):
        koszty[nazwa] = analiza_kosztu(zbuduj(kfg), B)
        print(f"       {nazwa:<30} flopy/krok "
              f"{koszty[nazwa]['flopy_na_krok']:>12,.0f}   bajty/krok "
              f"{koszty[nazwa]['bajty_na_krok']:>12,.0f}")

    sprawdz(koszty["odniesienie"]["flopy_na_krok"]
            > koszty["rdzen"]["flopy_na_krok"],
            "klasa III kosztuje operacje")
    sprawdz(koszty["odniesienie"]["flopy_na_krok"]
            > koszty["bez dookolnego"]["flopy_na_krok"],
            "atak dookolny kosztuje, mimo ze w tej puli prawie nikt go nie ma "
            "- to jest teza o braku rozgalezien")
    r = (koszty["bez wielokrotnego kontrataku"]["flopy_na_krok"]
         / koszty["odniesienie"]["flopy_na_krok"])
    sprawdz(abs(r - 1.0) < 0.001,
            "wielokrotny kontratak jest mechanika DANYCH: koszt zerowy",
            f"stosunek {r:.6f}")


# ===========================================================================

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--bez-kosztu", action="store_true", dest="bez_kosztu",
                   help="pomin testy wymagajace kompilacji (szybciej)")
    p.add_argument("--prob", type=int, default=4000,
                   help="liczba rzutow w testach statystycznych")
    args = p.parse_args()

    print(f"zaplecze: {jax.default_backend()}")
    test_klasa2()
    test_klasa3()
    test_klasa1()
    test_klasa4(args.prob)
    test_zasieg()
    if not args.bez_kosztu:
        test_koszt_zerowy()

    print(f"\n{'=' * 78}")
    print(f"zdane: {len(ZDANE)}, oblane: {len(OBLANE)}")
    for o in OBLANE:
        print(f"  BLAD: {o}")
    return 1 if OBLANE else 0


if __name__ == "__main__":
    sys.exit(main())
