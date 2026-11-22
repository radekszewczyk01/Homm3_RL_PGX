#!/usr/bin/env python3
"""
Eksperymenty nad kosztem mechanik.

Kazda podkomenda wypisuje tabele na ekran i zapisuje surowy wynik do JSON-a.
Wszystko, co trwa dlugo, mozna uruchomic osobno; kolejnosc nie ma znaczenia.

    python3 eksperymenty.py zgodnosc
    python3 eksperymenty.py pokrycie
    python3 eksperymenty.py ablacja3     --wsad 1024
    python3 eksperymenty.py narastanie   --wsad 1024
    python3 eksperymenty.py klasa1
    python3 eksperymenty.py klasa2       --wsady 1024 1536 2048 2560 3072
    python3 eksperymenty.py drzewo       --wsad 128 --symulacje 32
    python3 eksperymenty.py wszystko
"""

import argparse
import dataclasses
import json
import os
import sys
import time

import jax
import jax.numpy as jnp
import numpy as np

from homm3 import (MECHANIKI_II, MECHANIKI_III, MECHANIKI_IV, Konfiguracja,
                   check_invariants, preset, raport_hakow, zbuduj)
from homm3.konfiguracja import CZARY_OBRAZENIOWE
from homm3.pomiar import (METODY, analiza_kosztu, koszt_drzewa,
                          losuj_legalne, statystyki_akcji,
                          model_drzewa, model_rezydencji, otoczenie,
                          przepustowosc, rozmiar_stanu, zapisz)
from homm3.rdzen import MAX_AKCJI_RDZENIA, MAX_UNITS


KATALOG_WYNIKOW = "wyniki"


def _sciezka(nazwa):
    return os.path.join(KATALOG_WYNIKOW, f"{nazwa}.json")


def _naglowek(tytul):
    print()
    print("=" * 78)
    print(tytul)
    print("=" * 78)


def _tabela(wiersze, kolumny):
    """Prosty wydruk tabeli: kolumny to lista (naglowek, klucz, format)."""
    szer = []
    for nag, klucz, fmt in kolumny:
        w = max([len(nag)] + [len(format(r.get(klucz, ""), fmt) if r.get(klucz) is not None else "-")
                              for r in wiersze])
        szer.append(w)
    print("  ".join(n.rjust(w) for (n, _, _), w in zip(kolumny, szer)))
    print("  ".join("-" * w for w in szer))
    for r in wiersze:
        pola = []
        for (nag, klucz, fmt), w in zip(kolumny, szer):
            v = r.get(klucz)
            pola.append(("-" if v is None else format(v, fmt)).rjust(w))
        print("  ".join(pola))


# ===========================================================================
# 1. ZGODNOSC Z WERSJA TRZECIA
# ===========================================================================

OCZEKIWANE_ODNIESIENIE = dict(D=10479, A=1322, kanalow=12,
                              bajtow_na_krawedz=34.0, B_max=884)

# Przepustowosc z pracy: wsad 2048, karta RTX 5000 Ada. Mierzona starym
# skryptem benchark.py, wiec ta sama liczba z nowej warstwy pomiarowej jest
# jednoczesnie sprawdzeniem, czy nowa petla pomiarowa mierzy to samo.
KROKOW_NA_SEKUNDE_Z_PRACY = 371_011
WSAD_Z_PRACY = 2048
TOLERANCJA_PRZEPUSTOWOSCI = 0.10


def cmd_zgodnosc(args):
    """Sprawdza, ze konfiguracja odniesienia odtwarza silnik z pracy.

    To jest warunek, bez ktorego zadna liczba z tego repozytorium nie daje
    sie porownac z praca magisterska ani z poprzednimi pomiarami.
    """
    _naglowek("ZGODNOSC KONFIGURACJI ODNIESIENIA Z WERSJA TRZECIA")
    kfg = preset("odniesienie")
    env = zbuduj(kfg)
    D = rozmiar_stanu(env)
    model = model_drzewa(D, kfg.liczba_akcji)
    rez = model_rezydencji(D)

    sprawdzenia = [
        ("rozmiar stanu D [B]", D, OCZEKIWANE_ODNIESIENIE["D"], 0),
        ("przestrzen akcji |A|", kfg.liczba_akcji,
         OCZEKIWANE_ODNIESIENIE["A"], 0),
        ("kanalow obserwacji", kfg.liczba_kanalow,
         OCZEKIWANE_ODNIESIENIE["kanalow"], 0),
        ("bajtow na krawedz", model["bajtow_na_krawedz"],
         OCZEKIWANE_ODNIESIENIE["bajtow_na_krawedz"], 0.1),
        ("B_max przy 6 GB, N=150", model["B_max"],
         OCZEKIWANE_ODNIESIENIE["B_max"], 2),
    ]

    ok = True
    for nazwa, mamy, oczekiwane, tol in sprawdzenia:
        zgoda = abs(mamy - oczekiwane) <= tol
        ok &= zgoda
        print(f"  {'OK  ' if zgoda else 'BLAD'} {nazwa:<26} "
              f"{mamy:>12.4g}   oczekiwane {oczekiwane:>10.4g}")

    print(f"\n  B_opt z reguly projektowej: {rez['B_opt']:.0f} "
          f"(zmierzone kolano wypadlo przy 2048)")

    # --- odtworzenie przepustowosci z pracy -------------------------------
    pomiar_czasu = None
    if args.czas and jax.default_backend() != "gpu":
        print(f"\n  pomijam odtworzenie przepustowosci: zaplecze to "
              f"{jax.default_backend()}, nie karta.")
        print("  Liczba z pracy pochodzi z karty, wiec porownanie z "
              "procesorem nic nie znaczy.")
    elif args.czas:
        print(f"\n  odtworzenie przepustowosci z pracy "
              f"(wsad {WSAD_Z_PRACY}, metoda "
              f"{getattr(args, 'metoda', 'benchark')})...")
        print("    metoda 'benchark': scan, wznawianie epizodow, czas "
              "najkrotszy -\n    tylko tak liczona liczba daje sie zestawic "
              "z praca")
        srod = otoczenie()
        print(f"    karta: {srod['gpu_nazwa']}, zegar {srod['gpu_zegar_sm']} "
              f"z {srod['gpu_zegar_sm_max']}")
        pomiar_czasu = przepustowosc(
            env, WSAD_Z_PRACY, kroki=args.kroki,
            powtorzenia=args.powtorzenia,
            metoda=getattr(args, "metoda", "benchark"))
        zmierzone = pomiar_czasu["krokow_na_sekunde"]
        stosunek = zmierzone / KROKOW_NA_SEKUNDE_Z_PRACY
        print(f"    zmierzone  {zmierzone:>12,.0f} krokow/s  "
              f"(+-{pomiar_czasu['odchylenie_pct']:.1f}%)")
        print(f"    z pracy    {KROKOW_NA_SEKUNDE_Z_PRACY:>12,} krokow/s")
        print(f"    stosunek   {stosunek:>12.3f}")
        zgoda_czasu = abs(stosunek - 1.0) <= TOLERANCJA_PRZEPUSTOWOSCI
        pomiar_czasu["stosunek_do_pracy"] = stosunek
        pomiar_czasu["zgoda"] = bool(zgoda_czasu)
        if zgoda_czasu:
            print("    OK   nowa petla pomiarowa mierzy to samo co benchark.py")
        else:
            print("    UWAGA roznica ponad "
                  f"{100 * TOLERANCJA_PRZEPUSTOWOSCI:.0f}%. Zanim uznasz to "
                  "za wynik, sprawdz po kolei:")
            print("      1. zegar karty: python3 narzedzia/sprawdz_zegar.py")
            print("      2. czy data/homm3_static_lut.npy jest na miejscu "
                  "(inna pula to inne bitwy)")
            print("      3. ten sam wsad starym skryptem benchark.py na tej "
                  "samej karcie")
            print("      4. wersje sterownika i CUDA - od sierpnia mogly sie "
                  "zmienic")
            print("    Rozbieznosc tutaj NIE uniewaznia liczb z kompilatora,")
            print("    ale uniewaznia kazda liczbe czasowa z tego "
                  "repozytorium.")
        ok &= zgoda_czasu

    # kontrola niezmiennikow na losowych partiach
    print(f"\n  losowe partie z kontrola niezmiennikow ({args.gier} gier)...")
    wynik_gier = _rozegraj(env, args.gier, args.krokow)
    print(f"    naruszen: {wynik_gier['naruszen']}, "
          f"srednia dlugosc: {wynik_gier['srednia_dlugosc']:.1f}")
    ok &= wynik_gier["naruszen"] == 0

    print(f"\n  {'WSZYSTKO SIE ZGADZA' if ok else 'SA ROZBIEZNOSCI - NIE UZYWAJ WYNIKOW'}")
    zapisz(_sciezka("zgodnosc"), {
        "otoczenie": otoczenie(),
        "sprawdzenia": [{"nazwa": n, "mamy": float(m),
                         "oczekiwane": float(o), "zgoda": abs(m - o) <= t}
                        for n, m, o, t in sprawdzenia],
        "gry": wynik_gier,
        "przepustowosc": pomiar_czasu,
        "ok": bool(ok),
    })
    return 0 if ok else 1


def _rozegraj(env, gier, max_krokow, ziarno=0, zbieraj=False):
    """Rozgrywa losowe partie i kontroluje niezmienniki.

    zbieraj=True dodatkowo zlicza, czy mechaniki faktycznie sie odpalaja.
    """
    init = jax.jit(env.init)
    step = jax.jit(env.step)
    klucz = jax.random.PRNGKey(ziarno)

    naruszen, dlugosci, pierwsze_bledy = 0, [], []
    licznik = dict(bufow_nalozonych=0, bufow_zniesionych=0,
                   bufow_niezerowych=0, dodatkowych_tur=0,
                   czarow_rzuconych=0, akcji_czarow=0,
                   krokow=0, stosow_z_mechanika={})

    for g in range(gier):
        klucz, k = jax.random.split(klucz)
        s = init(k)

        if zbieraj:
            zywe = np.asarray(s.alive)
            for nazwa, pole in (("oddech", "breath_attack"),
                                ("trojglowy", "three_headed"),
                                ("dookolny", "all_around"),
                                ("wyssanie", "life_drain"),
                                ("powrot", "return_after_strike"),
                                ("podwojny_atak", "double_attack"),
                                ("bez_kary_zwarcia", "no_melee_penalty"),
                                ("dwuheksowe", "is_two_hex"),
                                ("strzelcy", "is_shooter")):
                n = int((zywe & np.asarray(getattr(s, pole))).sum())
                licznik["stosow_z_mechanika"][nazwa] = \
                    licznik["stosow_z_mechanika"].get(nazwa, 0) + n
            n = int((zywe & (np.asarray(s.retaliations_max) > 1)).sum())
            licznik["stosow_z_mechanika"]["wielokrotny_kontratak"] = \
                licznik["stosow_z_mechanika"].get("wielokrotny_kontratak", 0) + n

        t = 0
        for t in range(max_krokow):
            errs = check_invariants(s)
            if errs:
                naruszen += 1
                if len(pierwsze_bledy) < 5:
                    pierwsze_bledy.append(f"gra {g} krok {t}: {errs[0]}")
                break
            if bool(s.terminated):
                break

            poprzedni = s
            legal = jnp.where(s.legal_action_mask)[0]
            klucz, k1, k2 = jax.random.split(klucz, 3)
            a = legal[jax.random.randint(k1, (), 0, legal.shape[0])]
            s = step(s, a, k2)

            if zbieraj:
                licznik["krokow"] += 1
                licznik.update(_zmiany(poprzedni, s, int(a), licznik))
        dlugosci.append(t)

    return {
        "gier": gier,
        "naruszen": naruszen,
        "pierwsze_bledy": pierwsze_bledy,
        "srednia_dlugosc": float(np.mean(dlugosci)),
        "licznik": licznik if zbieraj else None,
    }


def _zmiany(a, b, akcja, licznik):
    """Co sie zmienilo miedzy dwoma stanami - do zliczania odpalen."""
    out = {}
    nalozone = zniesione = niezerowe = 0
    sa_bufy = False
    for pole in ("blogoslawienstwo", "przyspieszenie"):
        p = np.asarray(getattr(a.ext, pole))
        n = np.asarray(getattr(b.ext, pole))
        if p.size == 0:
            continue
        sa_bufy = True
        nalozone += int(((p == 0) & (n != 0)).sum())
        # zniesienie: byl buf jednego znaku, jest przeciwnego
        zniesione += int(((p != 0) & (n != 0)
                          & (np.sign(p) != np.sign(n))).sum())
        niezerowe += int((n != 0).sum())
    if sa_bufy:
        out["bufow_nalozonych"] = licznik["bufow_nalozonych"] + nalozone
        out["bufow_zniesionych"] = licznik["bufow_zniesionych"] + zniesione
        out["bufow_niezerowych"] = licznik["bufow_niezerowych"] + niezerowe

    mu_a = np.asarray(a.ext.morale_uzyte)
    mu_b = np.asarray(b.ext.morale_uzyte)
    if mu_a.size:
        out["dodatkowych_tur"] = (licznik["dodatkowych_tur"]
                                  + int((~mu_a & mu_b).sum()))

    mana_a = np.asarray(a.ext.mana)
    mana_b = np.asarray(b.ext.mana)
    if mana_a.size:
        out["czarow_rzuconych"] = (licznik["czarow_rzuconych"]
                                   + int((mana_b < mana_a).sum()))
        if akcja >= MAX_AKCJI_RDZENIA:
            out["akcji_czarow"] = licznik["akcji_czarow"] + 1
    return out


# ===========================================================================
# 2. POKRYCIE - CZY MECHANIKI W OGOLE SIE ODPALAJA
# ===========================================================================

def cmd_pokrycie(args):
    """Sprawdza, ktore mechaniki faktycznie dzialaja, a ktore sa kodem
    liczonym zawsze i nieuzywanym nigdy.

    To nie jest kontrola jakosci dla porzadku. W poprzedniej wersji silnika
    atak dookolny liczyl sie w kazdym kroku kazdej bitwy przy puli, w ktorej
    bylo ZERO jednostek z ta zdolnoscia. Taka mechanika wnosi pelny koszt
    i zerowy efekt, a w pomiarze jest nierozroznialna od dzialajacej. Kazda
    liczba z ablacji wymaga tej kontroli obok siebie.
    """
    _naglowek("POKRYCIE MECHANIK")
    wyniki = {}
    for nazwa in args.presety:
        kfg = preset(nazwa)
        env = zbuduj(kfg)
        print(f"\n--- {nazwa} ({kfg.klasy_aktywne}) ---")
        w = _rozegraj(env, args.gier, args.krokow, zbieraj=True)
        wyniki[nazwa] = w
        lic = w["licznik"]
        print(f"  gier {w['gier']}, krokow {lic['krokow']}, "
              f"naruszen {w['naruszen']}")
        if w["pierwsze_bledy"]:
            for b in w["pierwsze_bledy"]:
                print(f"    {b}")

        print("  stosy wystawione ze zdolnoscia:")
        for m, n in sorted(lic["stosow_z_mechanika"].items()):
            czy_wlaczona = getattr(kfg, m, None)
            uwaga = ""
            if czy_wlaczona and n == 0:
                uwaga = "   <-- MECHANIKA WLACZONA I NIEUZYWANA ANI RAZU"
            elif czy_wlaczona and n < 30:
                uwaga = "   <-- za malo, pomiar efektu nieistotny"
            print(f"    {m:<24} {n:>6}{uwaga}")

        if kfg.aktywne_II:
            print(f"  bufy: nalozonych {lic['bufow_nalozonych']}, "
                  f"zniesionych wzajemnie {lic['bufow_zniesionych']}, "
                  f"srednio niezerowych na krok "
                  f"{lic['bufow_niezerowych'] / max(lic['krokow'], 1):.2f}")
            if lic["bufow_zniesionych"] == 0:
                print("    <-- logika wzajemnego znoszenia NIE ODPALILA SIE "
                      "ani razu; wlacz czary bufujace (preset I_bufy)")
        if kfg.morale:
            print(f"  morale: dodatkowych tur {lic['dodatkowych_tur']}")
        if kfg.czary:
            print(f"  czary: akcji wybranych {lic['akcji_czarow']}, "
                  f"skutecznych rzutow {lic['czarow_rzuconych']}")
            if lic["akcji_czarow"] == 0:
                print("    <-- zaden czar nie zostal wybrany; przy losowym "
                      "agencie to normalne przy duzym |A|, ale wtedy pomiar "
                      "EFEKTU czarow jest bez wartosci (koszt i tak jest)")

    zapisz(_sciezka("pokrycie"), {"otoczenie": otoczenie(),
                                  "wyniki": wyniki})
    return 0


# ===========================================================================
# 3. ABLACJA MECHANIK KLASY III
# ===========================================================================

def _kfg_bez(mechanika, nazwa=None):
    """Konfiguracja odniesienia bez jednej mechaniki."""
    zmiany = {mechanika: False, "nazwa": nazwa or f"bez_{mechanika}"}
    if mechanika == "kara_zwarcia":
        # zdolnosc znoszaca kare nie ma sensu bez kary
        zmiany["bez_kary_zwarcia"] = False
    return dataclasses.replace(preset("odniesienie"), **zmiany)


def cmd_ablacja3(args):
    """Koszt kazdej mechaniki klasy III osobno, metoda pominiecia jednej.

    Mierzymy liczbami z kompilatora, nie czasem. Czas na tej maszynie zalezy
    od zegara, obciazenia i szczescia; liczba operacji i bajtow nie.

    UWAGA przy czytaniu wyniku: oddech, atak trojglowy i atak dookolny dziela
    jedna petle uderzen w cele dodatkowe. Pominiecie JEDNEJ z nich zdejmuje
    tylko wyznaczanie heksow. Petla znika dopiero przy pominieciu wszystkich
    trzech, dlatego w tabeli jest tez wiersz 'bez wszystkich wielocelowych'.
    """
    _naglowek(f"ABLACJA KLASY III (wsad {args.wsad})")
    B = args.wsad
    wiersze = []

    def zmierz(kfg, etykieta):
        env = zbuduj(kfg)
        k = analiza_kosztu(env, B)
        k["konfiguracja"] = etykieta
        k["D"] = rozmiar_stanu(env)
        k["A"] = kfg.liczba_akcji
        if args.czas:
            k.update(przepustowosc(
                env, B, kroki=args.kroki, powtorzenia=args.powtorzenia,
                metoda=getattr(args, "metoda", "benchark")))
        wiersze.append(k)
        print(f"  zmierzono: {etykieta}")
        return k

    # Plan najpierw, pomiar potem - zeby --max-konfiguracji dalo sie zastosowac
    # bez powtarzania listy. Pelna konfiguracja i goly rdzen zostaja zawsze,
    # bo bez nich tabela nie ma odniesienia z gory ani z dolu.
    plan = [(preset("odniesienie"), "odniesienie (wszystko)")]
    for m in MECHANIKI_III:
        if m == "bez_kary_zwarcia":
            continue  # mierzone razem z kara_zwarcia ponizej
        plan.append((_kfg_bez(m), f"bez {m}"))
    plan.append((dataclasses.replace(preset("odniesienie"),
                                     bez_kary_zwarcia=False,
                                     nazwa="bez_zdolnosci_znoszacej"),
                 "bez zdolnosci znoszacej kare"))
    plan.append((dataclasses.replace(preset("odniesienie"),
                                     oddech=False, trojglowy=False,
                                     dookolny=False,
                                     nazwa="bez_wielocelowych"),
                 "bez wszystkich wielocelowych"))
    ogon = (preset("rdzen"), "rdzen (nic z klasy III)")

    n_max = getattr(args, "max_konfiguracji", None)
    if n_max and len(plan) > n_max:
        print(f"  [--max-konfiguracji {n_max}] mierze tylko "
              f"{n_max} z {len(plan)} konfiguracji plus goly rdzen; "
              f"tabela bedzie niepelna")
        plan = plan[:n_max]
    plan.append(ogon)

    pelna = zmierz(*plan[0])
    for kfg, etykieta in plan[1:-1]:
        zmierz(kfg, etykieta)
    goly = zmierz(*plan[-1])

    # koszt wzgledny
    for w in wiersze:
        w["flopy_wzgl_pct"] = 100 * (w["flopy_na_krok"]
                                     / pelna["flopy_na_krok"] - 1)
        w["bajty_wzgl_pct"] = 100 * (w["bajty_na_krok"]
                                     / pelna["bajty_na_krok"] - 1)

    print()
    kolumny = [("konfiguracja", "konfiguracja", "<36"),
               ("flopy/krok", "flopy_na_krok", ",.0f"),
               ("zmiana %", "flopy_wzgl_pct", "+.2f"),
               ("bajty/krok", "bajty_na_krok", ",.0f"),
               ("zmiana %", "bajty_wzgl_pct", "+.2f"),
               ("jadra", "jadra", "d")]
    if args.czas:
        kolumny.append(("krokow/s", "krokow_na_sekunde", ",.0f"))
    _tabela(wiersze, kolumny)

    print(f"\n  cala klasa III kosztuje "
          f"{100 * (pelna['flopy_na_krok'] / goly['flopy_na_krok'] - 1):+.1f}% "
          f"operacji i "
          f"{100 * (pelna['bajty_na_krok'] / goly['bajty_na_krok'] - 1):+.1f}% "
          f"bajtow wzgledem golego rdzenia")
    print("  (liczby ujemne w kolumnie 'zmiana' to OSZCZEDNOSC z pominiecia "
          "mechaniki,\n   czyli jej wlasny koszt)")

    zapisz(_sciezka("ablacja3"), {"otoczenie": otoczenie(),
                                  "wsad": B, "wiersze": wiersze})
    return 0


# ===========================================================================
# 4. NARASTANIE KLAS
# ===========================================================================

def cmd_narastanie(args):
    """Co kosztuje dodanie calej klasy mechanik.

    Pokazuje, ze klasy nie sa porownywalne: klasa III zmienia tylko operacje
    i bajty, klasa II zmienia D (a wiec wsad optymalny), klasa I zmienia |A|
    (a wiec pamiec drzewa), klasa IV zmienia dodatkowo samo pojecie przejscia.
    """
    _naglowek(f"NARASTANIE KLAS (wsad {args.wsad})")
    B = args.wsad
    kolejnosc = ["rdzen", "III", "III_II", "III_II_IV", "wszystko"]
    n_max = getattr(args, "max_konfiguracji", None)
    if n_max and len(kolejnosc) > n_max:
        print(f"  [--max-konfiguracji {n_max}] tabela bedzie niepelna")
        kolejnosc = kolejnosc[:n_max]
    wiersze = []
    for nazwa in kolejnosc:
        kfg = preset(nazwa)
        env = zbuduj(kfg)
        D = rozmiar_stanu(env)
        k = analiza_kosztu(env, B)
        k["konfiguracja"] = f"{nazwa} ({kfg.klasy_aktywne})"
        k["D"] = D
        k["A"] = kfg.liczba_akcji
        k["B_opt"] = model_rezydencji(D)["B_opt"]
        k["B_max_drzewa"] = model_drzewa(D, kfg.liczba_akcji)["B_max"]
        k["bajtow_na_krawedz"] = model_drzewa(D, kfg.liczba_akcji)["bajtow_na_krawedz"]
        if args.czas:
            k.update(przepustowosc(
                env, B, kroki=args.kroki, powtorzenia=args.powtorzenia,
                metoda=getattr(args, "metoda", "benchark")))
        wiersze.append(k)
        print(f"  zmierzono: {nazwa}")

    baza = wiersze[0]
    for w in wiersze:
        w["flopy_wzgl"] = w["flopy_na_krok"] / baza["flopy_na_krok"]
        w["bajty_wzgl"] = w["bajty_na_krok"] / baza["bajty_na_krok"]

    print()
    kolumny = [("konfiguracja", "konfiguracja", "<28"),
               ("D [B]", "D", ",d"), ("|A|", "A", ",d"),
               ("flopy/krok", "flopy_na_krok", ",.0f"),
               ("x rdzen", "flopy_wzgl", ".2f"),
               ("bajty/krok", "bajty_na_krok", ",.0f"),
               ("x rdzen", "bajty_wzgl", ".2f"),
               ("B_opt", "B_opt", ".0f"),
               ("B_max drz.", "B_max_drzewa", ".0f")]
    if args.czas:
        kolumny.append(("krokow/s", "krokow_na_sekunde", ",.0f"))
    _tabela(wiersze, kolumny)
    print("\n  B_opt    - wsad, przy ktorym zbior roboczy 2BD jeszcze miesci "
          "sie w L2")
    print("  B_max drz. - wsad, przy ktorym drzewo 150 symulacji miesci sie "
          "w 6 GB")

    zapisz(_sciezka("narastanie"), {"otoczenie": otoczenie(),
                                    "wsad": B, "wiersze": wiersze})
    return 0


# ===========================================================================
# 5. KLASA I: SKALOWANIE PRZESTRZENI AKCJI
# ===========================================================================

def cmd_klasa1(args):
    """Jak koszt rosnie z liczba czarow, czyli z |A|.

    Najwazniejsza kolumna to B_max drzewa. Czary nie obciazaja symulatora
    w sposob wart wzmianki - obciazaja reprezentacje drzewa, i to liniowo.
    """
    _naglowek("KLASA I: KOSZT POWIEKSZENIA PRZESTRZENI AKCJI")
    B = args.wsad
    wiersze = []
    ile_czarow = len(CZARY_OBRAZENIOWE) + 1
    n_max = getattr(args, "max_konfiguracji", None)
    if n_max and ile_czarow > n_max:
        print(f"  [--max-konfiguracji {n_max}] tabela bedzie niepelna")
        ile_czarow = n_max
    for n in range(ile_czarow):
        kfg = dataclasses.replace(preset("odniesienie"),
                                  czary=CZARY_OBRAZENIOWE[:n],
                                  nazwa=f"czarow_{n}")
        env = zbuduj(kfg)
        D = rozmiar_stanu(env)
        A = kfg.liczba_akcji
        k = analiza_kosztu(env, B)
        md = model_drzewa(D, A, N=args.symulacje)
        k.update({
            "czarow": n, "D": D, "A": A,
            "A_wzgl": A / MAX_AKCJI_RDZENIA,
            "bajtow_na_krawedz": md["bajtow_na_krawedz"],
            "bajtow_drzewa_na_wsad_MB": md["bajtow_na_element_wsadu"] / 1e6,
            "B_max_drzewa": md["B_max"],
            "B_opt": model_rezydencji(D)["B_opt"],
        })
        if args.czas:
            k.update(przepustowosc(
                env, B, kroki=args.kroki, powtorzenia=args.powtorzenia,
                metoda=getattr(args, "metoda", "benchark")))
        if args.drzewo:
            d = koszt_drzewa(env, args.wsad_drzewa, symulacje=args.symulacje,
                             polityka=args.polityka)
            if "blad" not in d:
                k["decyzji_na_sekunde"] = d["decyzji_na_sekunde"]
                k["bajty_drzewa"] = d["bajty"]
        wiersze.append(k)
        print(f"  zmierzono: {n} czarow, |A| = {A}")

    print()
    kolumny = [("czarow", "czarow", "d"), ("|A|", "A", ",d"),
               ("|A|/1322", "A_wzgl", ".2f"), ("D [B]", "D", ",d"),
               ("flopy/krok", "flopy_na_krok", ",.0f"),
               ("bajty/krok", "bajty_na_krok", ",.0f"),
               ("B/krawedz", "bajtow_na_krawedz", ".2f"),
               ("drzewo MB/wsad", "bajtow_drzewa_na_wsad_MB", ".2f"),
               ("B_max drz.", "B_max_drzewa", ".0f")]
    if args.czas:
        kolumny.append(("krokow/s", "krokow_na_sekunde", ",.0f"))
    if args.drzewo:
        kolumny.append(("decyzji/s", "decyzji_na_sekunde", ".1f"))
    _tabela(wiersze, kolumny)

    p, k = wiersze[0], wiersze[-1]
    print(f"\n  cztery czary: |A| rosnie {k['A'] / p['A']:.2f} raza, "
          f"koszt obliczeniowy {k['flopy_na_krok'] / p['flopy_na_krok']:.2f} raza, "
          f"a wsad graniczny drzewa spada "
          f"{p['B_max_drzewa'] / k['B_max_drzewa']:.2f} raza")
    print("  Tu jest cala teza: mechanika prawie darmowa w symulatorze jest "
          "droga w drzewie.")

    zapisz(_sciezka("klasa1"), {"otoczenie": otoczenie(),
                                "wsad": B, "wiersze": wiersze})
    return 0


# ===========================================================================
# 6. KLASA II: REZYDENCJA W PAMIECI PODRECZNEJ
# ===========================================================================

def cmd_klasa2(args):
    """Czy regula B_opt = C_eff / (2D) przewiduje, a nie tylko opisuje.

    Rosnacy D przesuwa przewidywany wsad optymalny w dol. Jesli zmierzona
    przepustowosc zalamuje sie tam, gdzie regula wskazuje - regula jest
    predykcyjna. Jesli zalamuje sie zawsze w tym samym miejscu niezaleznie
    od D, to znaczy, ze dodany stan NIE trafil do goracej sciezki i pomiar
    nalezy odrzucic. Tak wlasnie wypadlo pierwsze podejscie z polem
    doklejonym poza obserwacja.
    """
    _naglowek("KLASA II I OBJETOSC STANU: TEST REGULY PROJEKTOWEJ")
    wiersze = []
    D_bazowe = None
    for k_kan in args.kanaly:
        kfg = dataclasses.replace(
            preset(args.preset), kanaly_wypelniajace=k_kan,
            nazwa=f"{args.preset}_k{k_kan}")
        env = zbuduj(kfg)
        D = rozmiar_stanu(env)
        rez = model_rezydencji(D)
        # wzgledem PIERWSZEGO wiersza tego skanu, nie wzgledem konfiguracji
        # z pracy - inaczej kolumna niczego nie mowi o tym eksperymencie
        if not wiersze:
            D_bazowe = D
        w = {"kanalow_dodanych": k_kan, "kanalow": kfg.liczba_kanalow,
             "D": D, "D_wzgl": D / D_bazowe,
             "B_opt_przewidywany": rez["B_opt"]}

        if args.wsady:
            krzywa = []
            for B in args.wsady:
                try:
                    p = przepustowosc(
                        env, B, kroki=args.kroki,
                        powtorzenia=args.powtorzenia,
                        metoda=getattr(args, "metoda", "benchark"))
                except Exception as e:       # brak pamieci itp.
                    krzywa.append({"wsad": B, "blad": str(e)[:120]})
                    continue
                p["zbior_MiB"] = 2 * B * D / 2 ** 20
                krzywa.append(p)
                print(f"    D={D}  B={B:>5}  "
                      f"{p['krokow_na_sekunde']:>12,.0f} krokow/s  "
                      f"(+-{p['odchylenie_pct']:.1f}%)")
            dobre = [p for p in krzywa if "blad" not in p]
            if dobre:
                naj = max(dobre, key=lambda p: p["krokow_na_sekunde"])
                w["B_zmierzony_najlepszy"] = naj["wsad"]
                w["szczyt_krokow_na_sekunde"] = naj["krokow_na_sekunde"]
            w["krzywa"] = krzywa
        else:
            w.update(analiza_kosztu(env, args.wsad))
        wiersze.append(w)
        print(f"  zmierzono: +{k_kan} kanalow, D = {D}")

    print()
    kolumny = [("kanalow+", "kanalow_dodanych", "d"),
               ("kanalow", "kanalow", "d"), ("D [B]", "D", ",d"),
               ("D/D0", "D_wzgl", ".3f"),
               ("B_opt z reguly", "B_opt_przewidywany", ".0f")]
    if args.wsady:
        kolumny += [("B najlepszy", "B_zmierzony_najlepszy", "d"),
                    ("szczyt krokow/s", "szczyt_krokow_na_sekunde", ",.0f")]
    else:
        kolumny += [("flopy/krok", "flopy_na_krok", ",.0f"),
                    ("bajty/krok", "bajty_na_krok", ",.0f")]
    _tabela(wiersze, kolumny)

    if args.wsady:
        print("\n  Jesli kolumna 'B najlepszy' maleje tak jak 'B_opt z reguly',")
        print("  regula przewiduje. Jesli stoi w miejscu - dodany stan nie "
              "trafil")
        print("  do mierzonego jadra i wynik trzeba odrzucic.")

    zapisz(_sciezka("klasa2"), {"otoczenie": otoczenie(),
                                "wiersze": wiersze})
    return 0


# ===========================================================================
# 6a. ROZKLAD LICZBY AKCJI DOPUSZCZALNYCH
# ===========================================================================

# Tabela z pracy (rozdzial 6, tab:legal_pomiar), N = 4,1e6 obserwacji.
# Liczba 69 cytowana w rozdziale 7 i 8 to SREDNIA DLA POLITYKI ZACHLANNEJ.
Z_PRACY_AKCJE = {
    "losowy":     dict(srednia=76.5, odchylenie=32.9, mediana=69,
                       p05=35, p95=145, wypelnienie_pct=5.8),
    "zachlanny":  dict(srednia=69.2, odchylenie=31.4, mediana=62,
                       p05=31, p95=136, wypelnienie_pct=5.2),
}


def cmd_akcje(args):
    """Ile akcji jest faktycznie dopuszczalnych i ile bufora drzewa stoi puste.

    PO CO TO JEST OSOBNO
    --------------------
    Na tej jednej liczbie stoi caly wniosek o drzewie: skoro dopuszczalnych
    jest okolo 69 akcji z 1322, to ponad 94 procent bufora krawedziowego
    nigdy nie zostaje uzyte. Liczba zalezy jednak od POLITYKI - przy losowej
    wychodzi 76, przy zachlannej 69 - i bez podania ktorej, w artykule nie
    da sie jej obronic.

    Dla konfiguracji z czarami klasy I ten sam pomiar sprawdza przewidywanie
    z pracy: przy osmiu czarach |A| = 2642, a srednia liczba akcji
    dopuszczalnych miala wzrosnac do okolo 369, czyli 5,4 raza.
    """
    _naglowek("ROZKLAD LICZBY AKCJI DOPUSZCZALNYCH")
    wiersze = []
    for nazwa in args.presety:
        kfg = preset(nazwa)
        env = zbuduj(kfg)
        for tryb in args.tryby:
            s = statystyki_akcji(env, B=args.wsad, kroki=args.kroki,
                                 tryb=tryb)
            s["konfiguracja"] = f"{nazwa} ({tryb})"
            odn = Z_PRACY_AKCJE.get(tryb) if nazwa == "odniesienie" else None
            if odn:
                s["z_pracy"] = odn["srednia"]
                s["odchylka_pct"] = 100 * (s["srednia"] / odn["srednia"] - 1)
            wiersze.append(s)
            print(f"  zmierzono: {nazwa}, tryb {tryb}")

    print()
    _tabela(wiersze, [("konfiguracja", "konfiguracja", "<28"),
                      ("|A|", "A", ",d"),
                      ("srednia", "srednia", ".2f"),
                      ("odch.", "odchylenie", ".2f"),
                      ("p05", "p05", "d"), ("med", "mediana", "d"),
                      ("p95", "p95", "d"), ("max", "max", "d"),
                      ("% z |A|", "wypelnienie_pct", ".2f"),
                      ("pusty bufor %", "pusty_bufor_pct", ".2f"),
                      ("dlug. epizodu", "dlugosc_epizodu", ".1f")])

    porownania = [w for w in wiersze if "z_pracy" in w]
    if porownania:
        print("\n  zestawienie z tabela z pracy (rozdzial 6):")
        for w in porownania:
            print(f"    {w['tryb']:<10} zmierzone {w['srednia']:6.2f}, "
                  f"z pracy {w['z_pracy']:6.2f}, "
                  f"roznica {w['odchylka_pct']:+.1f}%")
        print("    Kilka procent roznicy jest oczekiwane: praca liczyla to")
        print("    z 4,1 mln obserwacji, a estymata zalezy od horyzontu")
        print(f"    pomiaru (tu {args.kroki} krokow).")

    # przewidywanie z pracy dla klasy I
    baza = next((w for w in wiersze
                 if w["konfiguracja"].startswith("odniesienie")
                 and w["tryb"] == "zachlanny"), None)
    pelna = next((w for w in wiersze
                  if w["konfiguracja"].startswith("wszystko")
                  and w["tryb"] == "zachlanny"), None)
    if baza and pelna:
        print(f"\n  przewidywanie z pracy dla osmiu czarow: |A| 1322 -> 2642,"
              f" akcje dopuszczalne 69 -> okolo 369 (x5,4)")
        print(f"  zmierzone: |A| {baza['A']} -> {pelna['A']}, "
              f"akcje dopuszczalne {baza['srednia']:.1f} -> "
              f"{pelna['srednia']:.1f} "
              f"(x{pelna['srednia'] / baza['srednia']:.2f})")

    zapisz(_sciezka("akcje"), {"otoczenie": otoczenie(),
                               "z_pracy": Z_PRACY_AKCJE,
                               "wiersze": wiersze})
    return 0


# ===========================================================================
# 6a2. IMPLEMENTACJA FALI ZASIEGU A PROG REZYDENCJI
# ===========================================================================

def cmd_zasieg(args):
    """Czy petla zasiegu ruchu wyznacza prog rezydencji w L2.

    SKAD TO PYTANIE
    ---------------
    Zmierzony slad jadra dominujacego w czasie kroku to okolo 29 kB na
    srodowisko i NIE ZALEZY ani od rozmiaru stanu (sprawdzone na zakresie
    2,26x), ani od przestrzeni akcji (sprawdzone na 1,00x i 2,00x). Zostaja
    polprodukty zalezne tylko od geometrii planszy, a najwiekszym kandydatem
    jest fala zasiegu: dwadziescia iteracji iloczynu 165 x 165 razy wektor,
    liczona DWA RAZY na krok, bo potrzebuje jej i maska akcji, i obserwacja.
    Dwadziescia iteracji po 660 bajtow, dwa razy, to 26,4 kB przy
    zmierzonych 29.

    JAK TO SPRAWDZAMY
    -----------------
    Ta sama fala, policzona odczytem szesciu sasiadow zamiast iloczynem
    macierzowym: 990 operacji na iteracje zamiast 27 225, semantyka
    identyczna (test_mechanik.py sprawdza rownosc masek). Jesli podejrzenie
    jest sluszne, optimum przepustowosci przesunie sie w gore, bo zmalal
    slad. Jesli nie - zostanie tam, gdzie bylo.

    Pomiar czasowy wystarcza i nie trzeba do tego licznikow sprzetowych:
    przesuniecie optimum widac wprost w krzywej.
    """
    _naglowek("IMPLEMENTACJA FALI ZASIEGU A PROG REZYDENCJI")
    bazowa = preset(args.preset)
    warianty = [
        ("macierz (jak w pracy)", dataclasses.replace(
            bazowa, zasieg_gatherem=False, nazwa=f"{args.preset}_macierz")),
        ("odczyt sasiadow", dataclasses.replace(
            bazowa, zasieg_gatherem=True, nazwa=f"{args.preset}_gather")),
    ]

    wiersze, krzywe = [], {}
    for opis, kfg in warianty:
        env = zbuduj(kfg)
        D = rozmiar_stanu(env)
        k = analiza_kosztu(env, args.wsad)
        k["warianty"] = opis
        k["D"] = D
        krzywa = []
        for B in args.wsady:
            try:
                p = przepustowosc(env, B, kroki=args.kroki,
                                  powtorzenia=args.powtorzenia,
                                  metoda=getattr(args, "metoda", "benchark"))
            except Exception as e:
                print(f"    {opis}, wsad {B}: {type(e).__name__}: "
                      f"{str(e)[:80]}")
                continue
            krzywa.append(p)
            print(f"    {opis:<22} B={B:>5}  "
                  f"{p['krokow_na_sekunde']:>10,.0f} krokow/s "
                  f"(+-{p['odchylenie_pct']:.1f}%)")
        if krzywa:
            naj = max(krzywa, key=lambda p: p["krokow_na_sekunde"])
            k["B_najlepszy"] = naj["wsad"]
            k["szczyt"] = naj["krokow_na_sekunde"]
        krzywe[opis] = krzywa
        wiersze.append(k)

    print()
    _tabela(wiersze, [("wariant", "warianty", "<22"),
                      ("D [B]", "D", ",d"),
                      ("flopy/krok", "flopy_na_krok", ",.0f"),
                      ("bajty/krok", "bajty_na_krok", ",.0f"),
                      ("jadra", "jadra", "d"),
                      ("B najlepszy", "B_najlepszy", "d"),
                      ("szczyt krokow/s", "szczyt", ",.0f")])

    if len(wiersze) == 2 and all("szczyt" in w for w in wiersze):
        m, g = wiersze
        print(f"\n  odczyt sasiadow wobec macierzy:")
        print(f"    operacje      x{g['flopy_na_krok'] / m['flopy_na_krok']:.3f}")
        print(f"    bajty         x{g['bajty_na_krok'] / m['bajty_na_krok']:.3f}")
        print(f"    przepustowosc x{g['szczyt'] / m['szczyt']:.3f}")
        print(f"    optimum       {m['B_najlepszy']} -> {g['B_najlepszy']}"
              f"  (x{g['B_najlepszy'] / m['B_najlepszy']:.2f})")
        print()
        if g["B_najlepszy"] > m["B_najlepszy"] * 1.15:
            print("  OPTIMUM SIE PRZESUNELO. Fala zasiegu faktycznie wyznaczala")
            print("  prog rezydencji, a wersja z odczytem sasiadow jest po")
            print("  prostu lepsza - ta sama gra, wiekszy wsad optymalny.")
        else:
            print("  Optimum zostalo na miejscu. Fala zasiegu NIE wyznacza")
            print("  progu, choc kosztuje operacje. Trzeba szukac dalej -")
            print("  najblizszy krok to liczniki dla obu wariantow i")
            print("  porownanie sladow przez narzedzia/analiza_progu.py.")

    zapisz(_sciezka("zasieg"), {"otoczenie": otoczenie(),
                                "wiersze": wiersze,
                                "krzywe": krzywe})
    return 0


# ===========================================================================
# 6b. KOSZT WZNAWIANIA EPIZODOW
# ===========================================================================

def cmd_wznawianie(args):
    """Ile kosztuje wznawianie zakonczonych epizodow w petli wsadowej.

    DLACZEGO TO JEST WYNIK, A NIE CIEKAWOSTKA
    -----------------------------------------
    W silniku galeziowym wznowienie epizodu kosztuje tylko dla tych srodowisk,
    ktore sie zakonczyly. W sformulowaniu tensorowym nie ma takiej mozliwosci:
    `vmap(env.init)` wykonuje sie dla WSZYSTKICH srodowisk w kazdym kroku,
    a wybor `where` tylko decyduje, ktore stany podmienic.

    Przy losowej polityce konczy sie okolo 139 epizodow na 204 800 krokow,
    czyli jeden na pietnascie tysiecy. Placimy wiec pelny koszt wznowienia
    2048 srodowisk, zeby wznowic dwa.

    To ta sama teza, co przy mechanikach klasy III, tylko w innym miejscu
    programu: bez rozgalezien placi sie za kazda mozliwosc, a nie za te,
    ktora zachodzi. I tu akurat da sie to podac jednym czystym stosunkiem.
    """
    _naglowek("KOSZT WZNAWIANIA EPIZODOW")
    wiersze = []
    for B in args.wsady:
        env = zbuduj(preset(args.preset))
        try:
            z = przepustowosc(env, B, kroki=args.kroki,
                              powtorzenia=args.powtorzenia, metoda="benchark")
            bez = przepustowosc(env, B, kroki=args.kroki,
                                powtorzenia=args.powtorzenia, metoda="silnik")
        except Exception as e:
            print(f"  wsad {B}: {type(e).__name__}: {str(e)[:100]}")
            continue
        w = {
            "wsad": B,
            "ze_wznawianiem": z["krokow_na_sekunde"],
            "bez_wznawiania": bez["krokow_na_sekunde"],
            "narzut": bez["krokow_na_sekunde"] / z["krokow_na_sekunde"],
            "odchylenie_pct": max(z["odchylenie_pct"], bez["odchylenie_pct"]),
        }
        wiersze.append(w)
        print(f"  wsad {B:>5}: ze wznawianiem {w['ze_wznawianiem']:>10,.0f}, "
              f"bez {w['bez_wznawiania']:>10,.0f}, "
              f"narzut {w['narzut']:.2f}x")

    if not wiersze:
        return 1

    print()
    _tabela(wiersze, [("wsad", "wsad", ",d"),
                      ("ze wznawianiem", "ze_wznawianiem", ",.0f"),
                      ("bez wznawiania", "bez_wznawiania", ",.0f"),
                      ("narzut", "narzut", ".2f"),
                      ("odch. %", "odchylenie_pct", ".1f")])
    sredni = sum(w["narzut"] for w in wiersze) / len(wiersze)
    print(f"\n  Bezwarunkowe wznawianie kosztuje srednio {sredni:.2f} raza "
          f"przepustowosci,")
    print(f"  mimo ze konczy sie jeden epizod na kilkanascie tysiecy krokow.")
    print(f"  Liczby z pracy (371 011 krokow/s) pochodza z kolumny "
          f"'ze wznawianiem'.")

    zapisz(_sciezka("wznawianie"), {"otoczenie": otoczenie(),
                                    "wiersze": wiersze})
    return 0


# ===========================================================================
# 7. DRZEWO PRZESZUKIWANIA
# ===========================================================================

def cmd_drzewo(args):
    """Koszt decyzji drzewa dla kolejnych konfiguracji.

    Sieci celowo nie ma - apriori jest rownomierne na akcjach dopuszczalnych,
    wartosc zerowa. Inaczej nie wiadomo, czy mierzymy drzewo czy sploty.
    """
    _naglowek(f"KOSZT DRZEWA (wsad {args.wsad}, symulacji {args.symulacje}, "
              f"polityka {args.polityka})")
    wiersze = []
    for nazwa in args.presety:
        kfg = preset(nazwa)
        env = zbuduj(kfg)
        d = koszt_drzewa(env, args.wsad, symulacje=args.symulacje,
                         polityka=args.polityka,
                         max_rozwazanych=args.max_rozwazanych,
                         powtorzenia=args.powtorzenia)
        if "blad" in d:
            print(f"  {nazwa}: {d['blad']}")
            continue
        p = przepustowosc(
            env, args.wsad, kroki=args.kroki,
            powtorzenia=args.powtorzenia,
            metoda=getattr(args, "metoda", "benchark"))
        d["konfiguracja"] = f"{nazwa} ({kfg.klasy_aktywne})"
        d["D"] = rozmiar_stanu(env)
        d["samodzielnie_krokow_na_sekunde"] = p["krokow_na_sekunde"]
        d["spowolnienie_w_drzewie"] = (p["krokow_na_sekunde"]
                                       / d["krokow_srodowiska_na_sekunde"])
        wiersze.append(d)
        print(f"  zmierzono: {nazwa}")

    if not wiersze:
        print("  nic nie zmierzono - sprawdz, czy mctx jest zainstalowany")
        return 1

    print()
    _tabela(wiersze, [
        ("konfiguracja", "konfiguracja", "<28"),
        ("|A|", "A", ",d"), ("D [B]", "D", ",d"),
        ("decyzji/s", "decyzji_na_sekunde", ".1f"),
        ("w drzewie krokow/s", "krokow_srodowiska_na_sekunde", ",.0f"),
        ("samodzielnie krokow/s", "samodzielnie_krokow_na_sekunde", ",.0f"),
        ("spowolnienie", "spowolnienie_w_drzewie", ".1f"),
        ("bufory tymcz. [B]", "bajty_tymczasowe", ",d")])
    print("\n  'spowolnienie' to ile razy ten sam symulator jest wolniejszy "
          "wewnatrz drzewa\n  niz uruchomiony samodzielnie. W pracy wyszlo 76x.")

    zapisz(_sciezka("drzewo"), {"otoczenie": otoczenie(),
                                "wiersze": wiersze})
    return 0


# ===========================================================================
# 7b. ROZMIAR STANU - potrzebny skryptom zbierajacym liczniki
# ===========================================================================

def cmd_stan(args):
    """Wypisuje D i jego rozbicie na pola. Z --json nadaje sie do skryptow.

    Skrypty zbierajace liczniki musza znac D, zeby policzyc zbior roboczy
    2BD. Lepiej zapytac o to silnik, niz przepisywac arytmetyke do basha,
    gdzie nikt jej nie sprawdzi.
    """
    wiersze = []
    for k_kan in args.kanaly:
        kfg = dataclasses.replace(preset(args.preset),
                                  kanaly_wypelniajace=k_kan,
                                  nazwa=f"{args.preset}_k{k_kan}")
        env = zbuduj(kfg)
        D, rozbicie = rozmiar_stanu(env, szczegoly=True)
        w = {"preset": args.preset, "kanalow_dodanych": k_kan,
             "kanalow": kfg.liczba_kanalow, "D": D, "A": kfg.liczba_akcji,
             "B_opt": model_rezydencji(D)["B_opt"]}
        if args.rozbicie:
            w["rozbicie"] = rozbicie
        wiersze.append(w)

    if args.json:
        print(json.dumps(wiersze, indent=2, ensure_ascii=False))
        return 0

    _naglowek(f"ROZMIAR STANU, preset {args.preset}")
    _tabela(wiersze, [("kanalow+", "kanalow_dodanych", "d"),
                      ("kanalow", "kanalow", "d"), ("D [B]", "D", ",d"),
                      ("|A|", "A", ",d"),
                      ("B_opt z reguly", "B_opt", ".0f")])
    if args.rozbicie:
        print("\n  najwieksze pola stanu dla ostatniej konfiguracji:")
        for nazwa, bajty in list(wiersze[-1]["rozbicie"].items())[:12]:
            print(f"    {nazwa:<40} {bajty:>8,} B  "
                  f"({100 * bajty / wiersze[-1]['D']:5.1f}%)")
    return 0


# ===========================================================================
# 8. WSZYSTKO PO KOLEI
# ===========================================================================

def cmd_wszystko(args):
    t0 = time.time()
    kody = []
    for fn, nazwa in ((cmd_zgodnosc, "zgodnosc"), (cmd_pokrycie, "pokrycie"),
                      (cmd_ablacja3, "ablacja3"), (cmd_narastanie, "narastanie"),
                      (cmd_klasa1, "klasa1"), (cmd_klasa2, "klasa2")):
        try:
            kody.append((nazwa, fn(args)))
        except Exception as e:
            print(f"\n  [{nazwa}] przerwane: {type(e).__name__}: {e}")
            kody.append((nazwa, 2))
    if not args.bez_drzewa:
        try:
            kody.append(("drzewo", cmd_drzewo(args)))
        except Exception as e:
            print(f"\n  [drzewo] przerwane: {type(e).__name__}: {e}")
            kody.append(("drzewo", 2))

    _naglowek("PODSUMOWANIE")
    for nazwa, kod in kody:
        print(f"  {nazwa:<14} {'OK' if kod == 0 else 'UWAGA, kod ' + str(kod)}")
    print(f"\n  razem {time.time() - t0:.0f} s, wyniki w {KATALOG_WYNIKOW}/")
    return max(k for _, k in kody)


# ===========================================================================
# WIERSZ POLECEN
# ===========================================================================

def main(argv=None):
    global KATALOG_WYNIKOW
    p = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--wyniki", default=KATALOG_WYNIKOW,
                   help="katalog na pliki JSON")
    pod = p.add_subparsers(dest="komenda", required=True)

    def wspolne(sp, wsad=1024):
        sp.add_argument("--wsad", type=int, default=wsad)
        sp.add_argument("--czas", action="store_true",
                        help="dodatkowo zmierz przepustowosc (wymaga sprawnej "
                             "karty; bez tego licza sie tylko liczby z "
                             "kompilatora)")
        sp.add_argument("--kroki", type=int, default=50)
        sp.add_argument("--powtorzenia", type=int, default=5)
        sp.add_argument("--metoda", default="benchark",
                        choices=list(METODY),
                        help="benchark - jak w pracy (scan, wznawianie "
                             "epizodow, czas najkrotszy); silnik - bez "
                             "wznawiania, okolo 1,8x wyzej i NIEporownywalne "
                             "z praca; python - petla pythonowa")
        sp.add_argument("--max-konfiguracji", type=int, default=None,
                        dest="max_konfiguracji",
                        help="mierz tylko tyle pierwszych konfiguracji; "
                             "do sprawdzenia, ze skrypt startuje - wynik "
                             "jest wtedy niepelny i bez wartosci")
        return sp

    s = wspolne(pod.add_parser("zgodnosc",
                               help="czy odniesienie odtwarza wersje 3"))
    s.add_argument("--gier", type=int, default=50)
    s.add_argument("--krokow", type=int, default=200)
    s.set_defaults(fn=cmd_zgodnosc)

    s = pod.add_parser("pokrycie", help="czy mechaniki sie odpalaja")
    s.add_argument("--presety", nargs="+",
                   default=["odniesienie", "III_II", "III_II_IV", "I_bufy",
                            "wszystko"])
    s.add_argument("--gier", type=int, default=40)
    s.add_argument("--krokow", type=int, default=200)
    s.set_defaults(fn=cmd_pokrycie)

    s = wspolne(pod.add_parser("ablacja3", help="koszt mechanik klasy III"))
    s.set_defaults(fn=cmd_ablacja3)

    s = wspolne(pod.add_parser("narastanie", help="koszt calych klas"))
    s.set_defaults(fn=cmd_narastanie)

    s = wspolne(pod.add_parser("klasa1", help="skalowanie |A|"))
    s.add_argument("--symulacje", type=int, default=150)
    s.add_argument("--drzewo", action="store_true",
                   help="dodatkowo zmierz prawdziwy koszt drzewa (mctx)")
    s.add_argument("--wsad-drzewa", type=int, default=64, dest="wsad_drzewa")
    s.add_argument("--polityka", default="gumbel",
                   choices=["gumbel", "muzero"])
    s.set_defaults(fn=cmd_klasa1)

    s = wspolne(pod.add_parser("klasa2", help="rezydencja L2 i objetosc stanu"))
    s.add_argument("--preset", default="III_II",
                   help="podstawa skanu; 'odniesienie' do odtworzenia "
                        "krzywej z pracy, 'III_II' do testu klasy II")
    s.add_argument("--kanaly", nargs="+", type=int, default=[0, 8, 16, 24],
                   help="ile kanalow syntetycznych dolozyc (0 = tylko bufy)")
    s.add_argument("--wsady", nargs="*", type=int, default=None,
                   help="jesli podane, mierzy przepustowosc dla tych wsadow "
                        "i szuka optimum")
    s.set_defaults(fn=cmd_klasa2)

    s = wspolne(pod.add_parser("akcje",
                               help="rozklad liczby akcji dopuszczalnych"),
                2048)
    s.add_argument("--presety", nargs="+",
                   default=["odniesienie", "I_4", "wszystko"])
    s.add_argument("--tryby", nargs="+", default=["zachlanny", "losowy"],
                   choices=["zachlanny", "losowy"])
    s.set_defaults(fn=cmd_akcje)

    s = wspolne(pod.add_parser("zasieg",
                               help="czy fala zasiegu wyznacza prog L2"),
                2048)
    s.add_argument("--preset", default="odniesienie")
    s.add_argument("--wsady", nargs="+", type=int,
                   default=[1536, 2048, 2304, 2560, 3072, 3584, 4096, 5120])
    s.set_defaults(fn=cmd_zasieg)

    s = wspolne(pod.add_parser("wznawianie",
                               help="koszt bezwarunkowego wznawiania epizodow"),
                2048)
    s.add_argument("--preset", default="odniesienie")
    s.add_argument("--wsady", nargs="+", type=int,
                   default=[1024, 2048, 4096])
    s.set_defaults(fn=cmd_wznawianie)

    s = pod.add_parser("stan", help="rozmiar stanu D i jego rozbicie")
    s.add_argument("--preset", default="III_II")
    s.add_argument("--kanaly", nargs="+", type=int, default=[0])
    s.add_argument("--rozbicie", action="store_true")
    s.add_argument("--json", action="store_true")
    s.set_defaults(fn=cmd_stan)

    s = wspolne(pod.add_parser("drzewo", help="koszt przeszukiwania"), 128)
    s.add_argument("--presety", nargs="+",
                   default=["odniesienie", "III_II_IV", "I_4", "wszystko"])
    s.add_argument("--symulacje", type=int, default=32)
    s.add_argument("--polityka", default="gumbel",
                   choices=["gumbel", "muzero"])
    s.add_argument("--max-rozwazanych", type=int, default=16,
                   dest="max_rozwazanych")
    s.set_defaults(fn=cmd_drzewo)

    s = wspolne(pod.add_parser("wszystko", help="po kolei wszystko"))
    s.add_argument("--gier", type=int, default=30)
    s.add_argument("--krokow", type=int, default=200)
    s.add_argument("--presety", nargs="+",
                   default=["odniesienie", "III_II_IV", "I_4"])
    s.add_argument("--kanaly", nargs="+", type=int, default=[0, 8, 16])
    s.add_argument("--preset", default="III_II")
    s.add_argument("--wsady", nargs="*", type=int, default=None)
    s.add_argument("--symulacje", type=int, default=32)
    s.add_argument("--polityka", default="gumbel",
                   choices=["gumbel", "muzero"])
    s.add_argument("--max-rozwazanych", type=int, default=16,
                   dest="max_rozwazanych")
    s.add_argument("--drzewo", action="store_true")
    s.add_argument("--wsad-drzewa", type=int, default=64, dest="wsad_drzewa")
    s.add_argument("--bez-drzewa", action="store_true", dest="bez_drzewa")
    s.set_defaults(fn=cmd_wszystko)

    args = p.parse_args(argv)
    KATALOG_WYNIKOW = args.wyniki
    os.makedirs(KATALOG_WYNIKOW, exist_ok=True)

    # Na standardowe wyjscie BLEDOW, nie wyjscie zwykle. Podkomenda `stan
    # --json` jest przekierowywana do pliku, a ta linia trafiala wtedy do
    # niego jako pierwsza i psula JSON - przez co skrypt zbierajacy liczniki
    # wywracal sie po czterdziestu siedmiu minutach pomiarow, na samym koncu.
    print(f"zaplecze: {jax.default_backend()}, urzadzenia: {jax.devices()}",
          file=sys.stderr)
    return args.fn(args)


if __name__ == "__main__":
    sys.exit(main())
