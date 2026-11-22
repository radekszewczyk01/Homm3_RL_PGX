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
    wiersze = []
    for B in wsady:
        w = pomiar.przepustowosc(env, kfg, B=B, krokow=krokow, powt=powt,
                                 metoda="benchark")
        wiersze.append({
            "srodowisko": f"nasze ({preset})",
            "wsad": B,
            "krokow_na_s": w["krokow_na_s"],
            "D_bajtow": float(pomiar.rozmiar_stanu(kfg)["D"]),
            "akcji": int(kfg.liczba_akcji),
        })
        print(f"    wsad {B:<6} {w['krokow_na_s']:>14,.0f} krokow/s")
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
    # tabela: optimum kazdego srodowiska wobec przewidywania reguly
    # -----------------------------------------------------------------
    print("\n" + "=" * 78)
    print("OPTIMUM WOBEC REGULY  B_opt ~ C_eff / (2 D)")
    print("=" * 78)
    C_L2 = 72 * 2**20
    print(f"  pojemnosc L2 nominalna: {C_L2 / 2**20:.0f} MiB")
    print(f"  {'srodowisko':<22} {'akcji':>7} {'D [B]':>10} "
          f"{'B zmierzone':>12} {'B z reguly':>11} {'C_eff/C_L2':>11}")
    print("  " + "-" * 76)

    wsp = []
    for nazwa in dict.fromkeys(w["srodowisko"] for w in wszystko):
        wiersze = [w for w in wszystko if w["srodowisko"] == nazwa]
        najlepszy = max(wiersze, key=lambda w: w["krokow_na_s"])
        D = najlepszy["D_bajtow"]
        B = najlepszy["wsad"]
        z_reguly = 0.57 * C_L2 / (2 * D)
        udzial = 2 * B * D / C_L2
        na_brzegu = B in (min(a.wsady), max(a.wsady))
        wsp.append((nazwa, udzial, na_brzegu))
        print(f"  {nazwa:<22} {najlepszy.get('akcji', 0):>7,} {D:>10,.0f} "
              f"{B:>12,} {z_reguly:>11,.0f} {udzial:>11.3f}"
              + ("   <-- na brzegu skanu, optimum moze lezec dalej"
                 if na_brzegu else ""))

    srodki = [u for _, u, brzeg in wsp if not brzeg]
    print()
    if len(srodki) >= 2:
        print(f"  C_eff/C_L2 na podstawie {len(srodki)} srodowisk z optimum "
              f"WEWNATRZ skanu:")
        print(f"    srednia {np.mean(srodki):.3f}, odchylenie "
              f"{np.std(srodki):.3f}, zakres "
              f"{min(srodki):.3f}..{max(srodki):.3f}")
        if np.std(srodki) / max(np.mean(srodki), 1e-9) < 0.25:
            print("    STALA w granicach 25 procent - regula przenosi sie")
            print("    miedzy niezaleznymi implementacjami na tej samej karcie.")
        else:
            print("    NIE jest stala. Regula nie przenosi sie poza nasze")
            print("    srodowisko i w artykule trzeba to napisac wprost,")
            print("    zamiast podawac wspolczynnik 0,57 jako ogolny.")
    else:
        print("  Za malo srodowisk z optimum wewnatrz skanu, zeby cos")
        print("  powiedziec. Rozszerz --wsady w obie strony: male srodowiska")
        print("  (kolko i krzyzyk) maja optimum przy bardzo duzym wsadzie.")

    os.makedirs(a.wyniki, exist_ok=True)
    sciezka = os.path.join(a.wyniki, "porownanie_pgx.json")
    with open(sciezka, "w") as f:
        json.dump(wszystko, f, indent=2)
    print(f"\n  zapisane: {sciezka}")


if __name__ == "__main__":
    main()
