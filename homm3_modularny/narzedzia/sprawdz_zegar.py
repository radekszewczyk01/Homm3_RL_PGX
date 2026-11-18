#!/usr/bin/env python3
"""
Sprawdza, czy karta ma zablokowany zegar. Odpalaj PRZED kazda seria pomiarow.

DLACZEGO TO MA SWOJ SKRYPT
--------------------------
Zablokowany zegar daje liczby o polowe nizsze i nie zostawia zadnego sladu
w kodzie. Wyglada to na regresje w silniku i mozna za tym gonic wieczorami.
Nam sie to przytrafilo: karta zero stala na 1155 MHz w kazdym stanie, od
bezczynnosci do pelnego obciazenia, a wygladalo to na zmiane strategii
kompilatora.

Przy bezczynnosci NIE DA SIE tego zobaczyc. Zablokowana i sprawna karta
roznia sie dopiero pod obciazeniem: sprawna podnosi zegar blisko granicznego,
zablokowana zostaje tam, gdzie byla. Dlatego ten skrypt faktycznie obciaza
karte mnozeniem macierzy i probkuje zegar w trakcie.

UZYCIE
------
    python3 narzedzia/sprawdz_zegar.py                # karta widoczna domyslnie
    python3 narzedzia/sprawdz_zegar.py --karta 0      # konkretna karta
    python3 narzedzia/sprawdz_zegar.py --karta 0 --sekundy 30
"""

import argparse
import os
import statistics
import subprocess
import sys
import time


_zgloszony_brak = False


def smi(zapytanie, karta=None):
    global _zgloszony_brak
    cmd = ["nvidia-smi", f"--query-gpu={zapytanie}",
           "--format=csv,noheader,nounits"]
    if karta is not None:
        cmd += ["-i", str(karta)]
    try:
        out = subprocess.run(cmd, capture_output=True, text=True, timeout=10)
    except (OSError, subprocess.SubprocessError) as e:
        if not _zgloszony_brak:
            print(f"nvidia-smi nie odpowiada: {e}")
            _zgloszony_brak = True
        return []
    return [w.strip() for w in out.stdout.strip().split("\n") if w.strip()]


def liczba(tekst):
    try:
        return float(tekst.split(",")[0].strip())
    except (ValueError, IndexError):
        return float("nan")


def powody_ograniczenia(karta):
    """Czy sterownik sam przyznaje sie do ograniczenia zegara."""
    try:
        out = subprocess.run(["nvidia-smi", "-q", "-d", "PERFORMANCE",
                              "-i", str(karta)],
                             capture_output=True, text=True, timeout=10)
    except (OSError, subprocess.SubprocessError):
        return []
    aktywne, w_sekcji = [], False
    for linia in out.stdout.splitlines():
        if "Clocks Event Reasons" in linia or "Clocks Throttle" in linia:
            w_sekcji = True
            continue
        if w_sekcji:
            if not linia.strip():
                break
            if ":" in linia:
                nazwa, wartosc = linia.split(":", 1)
                if wartosc.strip().lower() in ("active", "true"):
                    aktywne.append(nazwa.strip())
    return aktywne


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--karta", type=int, default=None,
                   help="numer karty wedlug nvidia-smi")
    p.add_argument("--sekundy", type=float, default=20.0)
    p.add_argument("--rozmiar", type=int, default=8192,
                   help="bok macierzy; 8192 wysyca karte bez ryzyka OOM")
    args = p.parse_args()

    if args.karta is not None:
        os.environ["CUDA_VISIBLE_DEVICES"] = str(args.karta)
    karta = args.karta if args.karta is not None else 0

    if not smi("name", karta):
        print("Bez nvidia-smi nie da sie odczytac zegara. Ten skrypt ma sens")
        print("tylko tam, gdzie widac karte - czyli w kontenerze:")
        print(f"\n    KARTA=all ./uruchom/w_dockerze.sh \\")
        print(f"        python3 narzedzia/sprawdz_zegar.py --karta {karta}\n")
        return 2

    maks = liczba(smi("clocks.max.sm", karta)[0]) if smi("clocks.max.sm", karta) else float("nan")
    zegar_bezczynny = liczba(smi("clocks.sm", karta)[0]) if smi("clocks.sm", karta) else float("nan")
    nazwa = smi("name", karta)
    print(f"karta {karta}: {nazwa[0] if nazwa else '?'}")
    print(f"  zegar graniczny:   {maks:.0f} MHz")
    print(f"  zegar bezczynny:   {zegar_bezczynny:.0f} MHz")

    # Zegar aplikacyjny: wartosc, do ktorej karta dazy, gdy pracuje. Sam
    # w sobie NIE jest usterka - administrator ustawia go, zeby karty
    # zachowywaly sie jednakowo i przewidywalnie. To wlasnie ta wartosc,
    # a nie zegar graniczny, jest oczekiwana pod obciazeniem.
    #
    # Usterka, ktora nas kosztowala weekend, wygladala inaczej: zegar byl
    # taki sam przy bezczynnosci i przy pelnym obciazeniu. Jesli zegar
    # bezczynny zszedl do kilkuset MHz, karta nie jest przypieta.
    zegar_aplikacyjny = float("nan")
    app = smi("clocks.applications.graphics", karta)
    if app and app[0] not in ("[N/A]", "N/A", ""):
        zegar_aplikacyjny = liczba(app[0])
        print(f"  zegar aplikacyjny: {zegar_aplikacyjny:.0f} MHz  "
              f"(ustawiony przez nvidia-smi -ac; to wartosc oczekiwana "
              f"pod obciazeniem)")

    if zegar_bezczynny == zegar_bezczynny and zegar_bezczynny > 1000:
        print(f"  UWAGA: zegar bezczynny {zegar_bezczynny:.0f} MHz jest "
              f"wysoki. Sprawna karta schodzi do kilkuset MHz, gdy nic nie "
              f"liczy.\n         To jest sygnatura przypietego zegara.")

    # import JAX-a po ustawieniu widocznosci kart
    try:
        import jax
        import jax.numpy as jnp
    except ImportError:
        print("\n  Nie moge obciazyc karty: w tym srodowisku nie ma JAX-a.")
        print("  Na tym serwerze JAX siedzi w obrazie dockerowym, wiec:")
        print(f"\n    KARTA=all ./uruchom/w_dockerze.sh \\")
        print(f"        python3 narzedzia/sprawdz_zegar.py --karta {karta}\n")
        print("  Bez obciazenia da sie powiedziec tylko tyle: zegar "
              f"bezczynny to {zegar_bezczynny:.0f} MHz.")
        if zegar_bezczynny == zegar_bezczynny and zegar_bezczynny < 1000:
            print("  Jest niski, czyli karta NIE jest przypieta na stale -")
            print("  ale czy podnosi sie pod obciazeniem, pokaze dopiero test.")
        return 3

    print(f"\n  obciazam karte mnozeniem macierzy "
          f"{args.rozmiar}x{args.rozmiar} na {args.sekundy:.0f} s...")
    x = jnp.ones((args.rozmiar, args.rozmiar), jnp.float32)
    f = jax.jit(lambda a: a @ a)
    f(x).block_until_ready()

    zegary, moce, uzycia = [], [], []
    t0 = time.perf_counter()
    while time.perf_counter() - t0 < args.sekundy:
        for _ in range(4):
            y = f(x)
        y.block_until_ready()
        w = smi("clocks.sm,utilization.gpu,power.draw", karta)
        if not w:
            continue
        czesci = [c.strip() for c in w[0].split(",")]
        try:
            zegary.append(float(czesci[0]))
            uzycia.append(float(czesci[1]))
            moce.append(float(czesci[2]))
        except (ValueError, IndexError):
            continue

    if not zegary:
        print("  nie udalo sie odczytac zegara w trakcie obciazenia")
        return 2

    sredni = statistics.mean(zegary)
    szczyt = max(zegary)
    print(f"  zegar pod obciazeniem: sredni {sredni:.0f} MHz, "
          f"szczyt {szczyt:.0f} MHz")
    print(f"  uzycie: {statistics.mean(uzycia):.0f}%, "
          f"moc: {statistics.mean(moce):.0f} W")
    print(f"  rozrzut zegara: {min(zegary):.0f} - {max(zegary):.0f} MHz")

    powody = powody_ograniczenia(karta)
    if powody:
        print(f"  sterownik zglasza ograniczenia: {', '.join(powody)}")

    # Odniesienie to zegar APLIKACYJNY, jesli jest ustawiony. Karta
    # z zegarem aplikacyjnym 2550 MHz nie ma siegac 3105 - ma siegac 2550,
    # i wtedy jest sprawna. Mierzenie jej wzgledem granicznego dawalo by
    # werdykt "ograniczona" za kazdym razem, co jest bezuzyteczne.
    odniesienie = (zegar_aplikacyjny if zegar_aplikacyjny == zegar_aplikacyjny
                   else maks)
    nazwa_odniesienia = ("aplikacyjnego" if zegar_aplikacyjny == zegar_aplikacyjny
                         else "granicznego")
    udzial = szczyt / odniesienie if odniesienie > 0 else float("nan")

    print(f"  szczyt to {100 * udzial:.0f}% zegara {nazwa_odniesienia} "
          f"({odniesienie:.0f} MHz)", end="")
    if maks == maks and maks > 0:
        print(f", a {100 * szczyt / maks:.0f}% granicznego ({maks:.0f} MHz)")
    else:
        print()

    # Sygnatura usterki: zegar taki sam przy bezczynnosci i pod obciazeniem.
    stoi_w_miejscu = ((max(zegary) - min(zegary)) < 30
                      and abs(sredni - zegar_bezczynny) < 30)

    print()
    if stoi_w_miejscu and udzial < 0.75:
        print("  WERDYKT: ZEGAR PRZYPIETY.")
        print(f"  Zegar nie ruszyl sie z {sredni:.0f} MHz mimo "
              f"{statistics.mean(uzycia):.0f}% uzycia, a powinien dojsc do "
              f"{odniesienie:.0f} MHz.")
        print("  To jest dokladnie ta usterka, ktora udawala regresje "
              "w kodzie.")
        print(f"  Nie mierz na tej karcie. Przywrocenie: "
              f"nvidia-smi -rgc -i {karta}")
        return 1
    if udzial > 0.90:
        print("  WERDYKT: KARTA SPRAWNA.")
        print(f"  Zegar podniosl sie z {zegar_bezczynny:.0f} MHz "
              f"bezczynnie do {szczyt:.0f} MHz pod obciazeniem. "
              f"Mozna mierzyc.")
        if zegar_aplikacyjny == zegar_aplikacyjny:
            print(f"  Do sekcji o powtarzalnosci podaj zegar aplikacyjny "
                  f"{zegar_aplikacyjny:.0f} MHz - karty sa nim ograniczone "
                  f"celowo\n  i bez tej informacji liczb nie da sie "
                  f"powtorzyc.")
        return 0
    if udzial > 0.75:
        print("  WERDYKT: SPRAWNA, ALE SCIETA.")
        print(f"  Zegar sie podnosi (z {zegar_bezczynny:.0f} do "
              f"{szczyt:.0f} MHz), wiec nie jest przypiety, ale nie dochodzi "
              f"do {odniesienie:.0f} MHz.")
        print(f"  Przy mocy {statistics.mean(moce):.0f} W i rozrzucie "
              f"{min(zegary):.0f}-{max(zegary):.0f} MHz to zwykle "
              f"ograniczenie mocy albo temperatury.")
        print("  Mierzyc mozna, ale zapisz te liczby razem z wynikiem.")
        return 0
    print("  WERDYKT: NIEJASNY.")
    print(f"  Szczyt {szczyt:.0f} MHz to tylko {100 * udzial:.0f}% "
          f"oczekiwanych {odniesienie:.0f} MHz, ale zegar nie stoi w miejscu.")
    print("  Zmierz to samo na karcie, o ktorej wiesz, ze jest sprawna, "
          "i porownaj.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
