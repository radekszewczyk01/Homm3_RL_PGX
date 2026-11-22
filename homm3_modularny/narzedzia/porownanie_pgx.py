#!/usr/bin/env python3
"""Nasze srodowisko wobec srodowisk PGX: ten sam sprzet, ten sam harness.

PO CO TO JEST - DWA POWODY, OBA DLA ARTYKULU
--------------------------------------------

1. ROZBRAJA ZARZUT "porownanie GPU z CPU jest nieuczciwe".
   Teraz w artykule stoi 371 tys. krokow na sekunde wobec 612 na procesorze,
   czyli okolo 600 razy. Pierwsze, co napisze recenzent, to ze porownuje sie
   dwa rozne urzadzenia, a nie dwa rozne sformulowania. Odpowiedz, ktora tego
   zarzutu nie zostawia, to pomiar innych srodowisk NATYWNYCH DLA
   AKCELERATORA na tej samej karcie i tym samym harnessem. PGX jest juz
   zaleznoscia tego projektu, wiec nie trzeba nic instalowac.

2. WALIDUJE REGULE PROGU L2 - a sekcja o L2 sama pisze, ze tego nie ma.
   Stoi tam, ze najmocniejsza postac argumentu wymagalaby zmiany pojemnosci
   pamieci podrecznej, czego nie dalo sie zrobic, bo wszystkie karty sa tego
   samego modelu. Ale regula

       B_opt ~ C_eff / (2 D)

   ma DWIE zmienne, i druga da sie zmieniac swobodnie. Srodowiska PGX maja
   rozne rozmiary stanu na tej samej karcie: kolko i krzyzyk kilkadziesiat
   bajtow, Go 19x19 kilka kilobajtow. Jesli optimum kazdego z nich lezy tam,
   gdzie regula przewiduje, argument jest sprawdzony na NIEZALEZNYCH
   implementacjach, nie tylko na naszej z dosztukowanymi kanalami.

   To jest mocniejsze niz sztuczne powiekszanie stanu, bo tam zmienialismy
   jedna rzecz w jednym programie, a tu zmienia sie wszystko poza karta.

METODA - musi byc identyczna jak w pomiarach wlasnych, inaczej liczby nie sa
porownywalne:
  - lax.scan po krokach, caly przebieg w jednym skompilowanym programie,
  - bezwarunkowy reset zakonczonych epizodow w kazdym kroku,
  - losowa akcja z maski dopuszczalnych,
  - czas NAJLEPSZY z powtorzen, nie sredni,
  - blokada az wyniki beda gotowe (block_until_ready).

Uruchomienie (na serwerze przez dockera):
    ./uruchom/w_dockerze.sh python3 narzedzia/porownanie_pgx.py
    ./uruchom/w_dockerze.sh python3 narzedzia/porownanie_pgx.py \
        --srodowiska chess go_19x19 backgammon --wsady 512 1024 2048 4096
"""
import argparse
import json
import os
import sys
import time

import jax
import jax.numpy as jnp
import numpy as np

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# Domyslny zestaw to srodowiska, ktorych PRZEWIDYWANE optimum lezy w zakresie
# wsadow, jaki da sie zmierzyc. Rozmiary stanu na tej samej karcie:
#
#   szachy       D = 46 266 B   B_opt z reguly    465
#   go 19x19     D = 25 318 B   B_opt z reguly    850
#   shogi        D = 14 463 B   B_opt z reguly  1 488
#   NASZE        D = 10 479 B   B_opt z reguly  2 053   (zmierzone 2048)
#   go 9x9       D =  5 718 B   B_opt z reguly  3 763
#
# Daje to ponad czterokrotny zakres D wokol naszego punktu i przewidywania
# rozlozone od 465 do 3763, czyli caly skan miesci sie w rozsadnym wsadzie.
#
# Srodowiska o malym stanie (othello 472 B, backgammon 454 B, kolko i krzyzyk
# 89 B) maja przewidywane optimum przy wsadzie kilkudziesieciu tysiecy. Tam
# krok jest tak tani, ze ogranicza raczej narzut uruchamiania jadra niz pasmo
# pamieci, i reguly o rezydencji nie sprawdzaja - mozna je dolaczyc osobno,
# ale nie traktowalbym ich jako kontrprzykladu.
DOMYSLNE = ("chess", "go_19x19", "shogi", "go_9x9")


# ---------------------------------------------------------------------------
# rozmiar stanu: suma bajtow wszystkich lisci drzewa stanu dla JEDNEGO wsadu
# ---------------------------------------------------------------------------

def rozmiar_stanu(stan, B):
    """Bajty na jedno srodowisko.

    Dzielimy przez B, bo liscie sa juz zwektoryzowane. Pola skalarne na
    srodowisko (numer gracza, flaga konca) licza sie tak samo jak tablice -
    i tak ma byc, bo kazde z nich jest czytane i zapisywane w kroku.
    """
    liscie = jax.tree_util.tree_leaves(stan)
    return sum(int(l.nbytes) for l in liscie) / B


# ---------------------------------------------------------------------------
# przebieg: dokladnie ten sam uklad, co w pomiarach wlasnych
# ---------------------------------------------------------------------------

def zbuduj_przebieg(env, auto_reset, B, krokow):
    init = jax.vmap(env.init)
    step = jax.vmap(auto_reset(env.step, env.init))

    def przebieg(key):
        k0, k1 = jax.random.split(key)
        stan = init(jax.random.split(k0, B))

        def krok(s, k):
            k_akcja, k_step = jax.random.split(k)
            # losowa akcja z maski dopuszczalnych; logity -inf tam, gdzie
            # akcja jest niedopuszczalna, wiec categorical nigdy jej nie wybierze
            logity = jnp.where(s.legal_action_mask, 0.0, -1e9)
            a = jax.random.categorical(k_akcja, logity, axis=-1)
            s = step(s, a, jax.random.split(k_step, B))
            return s, None

        stan, _ = jax.lax.scan(krok, stan, jax.random.split(k1, krokow))
        return stan

    return jax.jit(przebieg)


def przepustowosc(env, auto_reset, B, krokow, powt):
    przebieg = zbuduj_przebieg(env, auto_reset, B, krokow)
    key = jax.random.PRNGKey(0)

    # rozgrzewka: kompilacja nie wchodzi do pomiaru
    stan = przebieg(key)
    jax.block_until_ready(stan)
    D = rozmiar_stanu(stan, B)

    czasy = []
    for i in range(powt):
        t0 = time.perf_counter()
        jax.block_until_ready(przebieg(jax.random.PRNGKey(i)))
        czasy.append(time.perf_counter() - t0)

    najlepszy = min(czasy)
    return {
        "wsad": B,
        "krokow": krokow,
        "czas_najlepszy_s": najlepszy,
        "krokow_na_s": B * krokow / najlepszy,
        "D_bajtow": D,
        "zbior_roboczy_MiB": 2 * B * D / 2**20,
    }


# ---------------------------------------------------------------------------
# nasze srodowisko tym samym harnessem
# ---------------------------------------------------------------------------

def nasze(preset, wsady, krokow, powt):
    from homm3 import pomiar
    from homm3.konfiguracja import PRESETY
    from homm3.silnik import zbuduj

    kfg = PRESETY[preset]
    env = zbuduj(kfg)
    D = float(pomiar.rozmiar_stanu(env))
    wiersze = []
    for B in wsady:
        w = pomiar.przepustowosc(env, B, kroki=krokow, powtorzenia=powt,
                                 metoda="benchark")
        # pomiar.przepustowosc nazywa to 'krokow_na_sekunde'; w tym skrypcie
        # wszedzie jest 'krokow_na_s', wiec mapujemy raz tutaj
        kps = w.get("krokow_na_sekunde", w.get("krokow_na_s"))
        wiersze.append({
            "srodowisko": f"nasze ({preset})",
            "wsad": B,
            "krokow_na_s": kps,
            "D_bajtow": D,
            "zbior_roboczy_MiB": 2 * B * D / 2**20,
            "akcji": int(kfg.liczba_akcji),
        })
        print(f"    wsad {B:<6} {kps:>14,.0f} krokow/s"
              f"   D = {D:>9,.1f} B"
              f"   zbior roboczy {2 * B * D / 2**20:>8.1f} MiB")
    return wiersze


# ---------------------------------------------------------------------------

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--srodowiska", nargs="+", default=list(DOMYSLNE))
    p.add_argument("--wsady", nargs="+", type=int,
                   default=[128, 256, 512, 768, 1024, 1536, 2048, 3072,
                            4096, 6144])
    p.add_argument("--kroki", type=int, default=100)
    p.add_argument("--powt", type=int, default=5)
    p.add_argument("--preset", default="odniesienie")
    p.add_argument("--bez-naszego", action="store_true")
    p.add_argument("--tabela-d", action="store_true",
                   help="wypisz tylko rozmiary stanu i przewidywane optima, "
                        "bez mierzenia - do zaplanowania skanu")
    p.add_argument("--wyniki", default=os.environ.get("WYNIKI", "wyniki"))
    a = p.parse_args()

    import pgx
    from pgx.experimental import auto_reset

    print(f"zaplecze: {jax.default_backend()}, "
          f"urzadzenia: {jax.devices()}", file=sys.stderr)
    print("=" * 78)
    print("NASZE SRODOWISKO WOBEC SRODOWISK PGX - ten sam sprzet, ten sam harness")
    print("=" * 78)
    print(f"  metoda: lax.scan, bezwarunkowy reset, czas najlepszy z {a.powt} "
          f"powtorzen, {a.kroki} krokow")

    if a.tabela_d:
        print(f"\n  {'srodowisko':<22} {'akcji':>8} {'D [B]':>10} "
              f"{'B_opt z reguly':>15}")
        print("  " + "-" * 60)
        for nazwa in pgx.available_envs():
            try:
                e = pgx.make(nazwa)
                s0 = jax.jit(e.init)(jax.random.PRNGKey(0))
                D = sum(int(l.nbytes) for l in jax.tree_util.tree_leaves(s0))
                print(f"  {nazwa:<22} {e.num_actions:>8,} {D:>10,} "
                      f"{0.57 * 72 * 2**20 / (2 * D):>15,.0f}")
            except Exception as e:                   # noqa: BLE001
                print(f"  {nazwa:<22} blad: {type(e).__name__}")
        return

    wszystko = []

    if not a.bez_naszego:
        print(f"\n--- nasze srodowisko, preset {a.preset} ---")
        wszystko += nasze(a.preset, a.wsady, a.kroki, a.powt)

    for nazwa in a.srodowiska:
        print(f"\n--- {nazwa} ---")
        try:
            env = pgx.make(nazwa)
        except Exception as e:                       # noqa: BLE001
            print(f"    nie udalo sie utworzyc: {e}")
            continue
        for B in a.wsady:
            try:
                w = przepustowosc(env, auto_reset, B, a.kroki, a.powt)
            except Exception as e:                   # noqa: BLE001
                print(f"    wsad {B:<6} nie udalo sie: "
                      f"{type(e).__name__}: {str(e)[:70]}")
                continue
            w["srodowisko"] = nazwa
            w["akcji"] = int(env.num_actions)
            wszystko.append(w)
            print(f"    wsad {B:<6} {w['krokow_na_s']:>14,.0f} krokow/s"
                  f"   D = {w['D_bajtow']:>9,.1f} B"
                  f"   zbior roboczy {w['zbior_roboczy_MiB']:>8.1f} MiB")

    # -----------------------------------------------------------------
    # klasyfikacja rezimow, a POTEM regula
    #
    # PIERWSZA WERSJA TEGO KODU BYLA ZLA i warto wiedziec dlaczego, bo blad
    # jest pouczajacy. Brala max() z kazdej krzywej i wstawiala go do reguly
    # progu. Tymczasem regula opisuje krzywa, ktora ma SZCZYT i ZALAMANIE,
    # a z pieciu zmierzonych srodowisk takich bylo dwa. Pozostale trzy albo
    # rosna do konca skanu, albo saturuja bez zalamania, albo tona w szumie -
    # i dla nich max() jest po prostu najwyzszym punktem szumu. Wrzucone do
    # jednej sredniej daly odchylenie 0,43 i werdykt "regula sie nie
    # przenosi", ktory byl artefaktem statystyki, nie wynikiem.
    #
    # Dlatego teraz najpierw ustalamy, czy krzywa w ogole ma zalamanie:
    #   ZALAMANIE  szczyt / plateau >= 1,25 i krzywa po spadku NIE WRACA
    #   SZUM       po spadku wraca powyzej 1,15 minimum - czyli to nie spadek
    #   SATURACJA  plaska gora bez zalamania w mierzonym zakresie
    #   ROSNIE     maksimum na brzegu skanu, optimum lezy dalej
    # i srednia liczymy TYLKO po tych z zalamaniem.
    # -----------------------------------------------------------------
    print("\n" + "=" * 78)
    print("REZIMY I REGULA  B_opt ~ C_eff / (2 D)")
    print("=" * 78)
    C_L2 = int(os.environ.get("L2_BAJTOW", 72 * 2**20))
    print(f"  pojemnosc L2 nominalna: {C_L2 / 2**20:.0f} MiB"
          f"   (zmien zmienna L2_BAJTOW dla innej karty)")

    def klasyfikuj(gr):
        gr = sorted(gr, key=lambda w: w["wsad"])
        B = [w["wsad"] for w in gr]
        y = [kps(w) or 0.0 for w in gr]
        p = max(range(len(y)), key=lambda i: y[i])
        ogon = sorted(y[-3:])
        plateau = ogon[len(ogon) // 2] or 1.0
        stosunek = y[p] / plateau
        # pierwszy duzy spadek i czy krzywa po nim wraca
        spadek = next((i for i in range(len(y) - 1)
                       if y[i + 1] < 0.85 * y[i]), None)
        B_ostatni = B[spadek] if spadek is not None else None
        po = y[p + 1:]
        wraca = bool(po) and max(po) > 1.15 * min(po)
        if p == len(y) - 1:
            return "ROSNIE", B[p], B_ostatni, stosunek, False
        if wraca and stosunek < 1.5:
            return "SZUM", B[p], B_ostatni, stosunek, False
        if stosunek >= 1.25:
            return "ZALAMANIE", B[p], B_ostatni, stosunek, True
        return "SATURACJA", B[p], B_ostatni, stosunek, False

    print(f"\n  {'srodowisko':<22} {'D [B]':>9} {'B szczyt':>9} "
          f"{'z reguly':>9} {'iloraz':>7} {'C/C_L2':>8} {'szczyt/plateau':>15}  rezim")
    print("  " + "-" * 104)

    z_zalamaniem = []
    for n in dict.fromkeys(w["srodowisko"] for w in wszystko):
        gr = [w for w in wszystko if w["srodowisko"] == n]
        rez, B_szczyt, B_ostatni, stosunek, licz = klasyfikuj(gr)
        D = next(w.get("D_bajtow", 0) for w in gr)
        if not D:
            continue
        z_reguly = 0.57 * C_L2 / (2 * D)
        udzial = 2 * B_szczyt * D / C_L2
        dopisek = ""
        if rez == "ROSNIE":
            dopisek = "  optimum za brzegiem skanu"
        elif rez == "SZUM":
            dopisek = "  zwieksz --powt, krzywa tonie w szumie"
        elif rez == "SATURACJA":
            dopisek = "  brak zalamania w zakresie"
        elif B_ostatni and B_ostatni != B_szczyt:
            dopisek = (f"  zalamanie az przy {B_ostatni}, "
                       f"czyli C/C_L2 = {2 * B_ostatni * D / C_L2:.3f}")
        print(f"  {n:<22} {D:>9,.0f} {B_szczyt:>9,} {z_reguly:>9,.0f} "
              f"{B_szczyt / z_reguly:>7.2f} {udzial:>8.3f} {stosunek:>15.2f}"
              f"  {rez}{dopisek}")
        if licz:
            z_zalamaniem.append((n, B_szczyt / z_reguly, udzial, stosunek))

    print()
    if len(z_zalamaniem) >= 2:
        ilorazy = [i for _, i, _, _ in z_zalamaniem]
        udzialy = [u for _, _, u, _ in z_zalamaniem]
        stos = [s for _, _, _, s in z_zalamaniem]
        print(f"  Srodowisk z ZALAMANIEM: {len(z_zalamaniem)} "
              f"({', '.join(n for n, _, _, _ in z_zalamaniem)})")
        print(f"    szczyt / przewidywanie: "
              f"{min(ilorazy):.2f}..{max(ilorazy):.2f}")
        print(f"    C_eff/C_L2 w szczycie:  "
              f"{min(udzialy):.3f}..{max(udzialy):.3f}")
        print(f"    glebokosc zalamania:    "
              f"x{min(stos):.2f}..x{max(stos):.2f}")
        if max(ilorazy) / max(min(ilorazy), 1e-9) < 1.5:
            print("    Szczyty zgodne z przewidywaniem w granicach polowy"
                  " rzedu - regula LOKALIZUJE szczyt")
            print("    na niezaleznych implementacjach. Nie przesadzaj:"
                  " to zgodnosc szczytu,")
            print("    nie miejsca zalamania, ktore wypada dalej.")
        else:
            print("    Szczyty NIE sa zgodne - regula nie przenosi sie"
                  " miedzy implementacjami")
            print("    i wspolczynnika nie wolno podawac jako ogolnego.")
    else:
        print("  Mniej niz dwa srodowiska z zalamaniem - nie ma czego")
        print("  porownywac. Zeby regula dala sie sprawdzic, trzeba srodowisk")
        print("  OGRANICZONYCH PASMEM; te o tanim kroku rosna do konca skanu")
        print("  i sa w innym rezimie, tym samym co praca o Generals.io.")

    # ---------------------------------------------------------------
    # rozrzut przepustowosci - osobny wynik, niezalezny od reguly
    # ---------------------------------------------------------------
    print("\n" + "=" * 78)
    print("ROZRZUT PRZEPUSTOWOSCI NA JEDNEJ KARCIE")
    print("=" * 78)
    print("  To jest odpowiedz na zarzut 'porownujecie GPU z CPU'. Srodowiska")
    print("  natywne dla akceleratora roznia sie miedzy soba o dwa rzedy")
    print("  wielkosci NA TYM SAMYM SPRZECIE, bo roznia sie praca na krok.")
    naj = {}
    for n in dict.fromkeys(w["srodowisko"] for w in wszystko):
        gr = [w for w in wszystko if w["srodowisko"] == n]
        naj[n] = max(kps(w) or 0.0 for w in gr)
    if naj:
        lo, hi = min(naj.values()), max(naj.values())
        for n, v in sorted(naj.items(), key=lambda kv: kv[1]):
            gwiazdka = "  <-- nasze" if n.startswith("nasze") else ""
            print(f"    {n:<22} {v:>14,.0f} krokow/s{gwiazdka}")
        print(f"\n    rozrzut x{hi / max(lo, 1e-9):.0f}")
        nasze_v = next((v for n, v in naj.items() if n.startswith("nasze")), None)
        if nasze_v:
            print(f"    nasze: x{nasze_v / lo:.1f} powyzej najslabszego, "
                  f"x{hi / nasze_v:.0f} ponizej najmocniejszego")

    os.makedirs(a.wyniki, exist_ok=True)
    sciezka = os.path.join(a.wyniki, "porownanie_pgx.json")
    with open(sciezka, "w") as f:
        json.dump(wszystko, f, indent=2)
    print(f"\n  zapisane: {sciezka}")


if __name__ == "__main__":
    main()
