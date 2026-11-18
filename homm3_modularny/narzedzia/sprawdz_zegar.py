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


def smi(zapytanie, karta=None):
    cmd = ["nvidia-smi", f"--query-gpu={zapytanie}",
           "--format=csv,noheader,nounits"]
    if karta is not None:
        cmd += ["-i", str(karta)]
    try:
        out = subprocess.run(cmd, capture_output=True, text=True, timeout=10)
    except (OSError, subprocess.SubprocessError) as e:
        print(f"nvidia-smi nie odpowiada: {e}")
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

    maks = liczba(smi("clocks.max.sm", karta)[0]) if smi("clocks.max.sm", karta) else float("nan")
    zegar_bezczynny = liczba(smi("clocks.sm", karta)[0]) if smi("clocks.sm", karta) else float("nan")
    nazwa = smi("name", karta)
    print(f"karta {karta}: {nazwa[0] if nazwa else '?'}")
    print(f"  zegar graniczny:   {maks:.0f} MHz")
    print(f"  zegar bezczynny:   {zegar_bezczynny:.0f} MHz")

    zablokowany_app = smi("clocks.applications.graphics", karta)
    if zablokowany_app and zablokowany_app[0] not in ("[N/A]", "N/A", ""):
        print(f"  zegar narzucony:   {zablokowany_app[0]} MHz  "
              f"<-- ktos ustawil nvidia-smi -ac albo -lgc")

    # import JAX-a po ustawieniu widocznosci kart
    import jax
    import jax.numpy as jnp

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

    print()
    udzial = szczyt / maks if maks == maks and maks > 0 else float("nan")
    stoi_w_miejscu = (max(zegary) - min(zegary)) < 30 and abs(
        sredni - zegar_bezczynny) < 30

    if stoi_w_miejscu and udzial < 0.75:
        print("  WERDYKT: ZEGAR NADAL ZABLOKOWANY.")
        print(f"  Zegar nie ruszyl sie z {sredni:.0f} MHz mimo "
              f"{statistics.mean(uzycia):.0f}% uzycia, a karta potrafi "
              f"{maks:.0f} MHz.")
        print("  Nie mierz na tej karcie. Przywrocenie: "
              f"nvidia-smi -rgc -i {karta}")
        return 1
    if udzial > 0.80:
        print("  WERDYKT: KARTA SPRAWNA.")
        print(f"  Zegar podniosl sie do {szczyt:.0f} MHz, czyli "
              f"{100 * udzial:.0f}% granicznego. Mozna mierzyc.")
        return 0
    print("  WERDYKT: NIEJASNY.")
    print(f"  Szczyt {szczyt:.0f} MHz to {100 * udzial:.0f}% granicznego. "
          f"To moze byc zwykle ograniczenie mocy albo temperatury "
          f"(moc {statistics.mean(moce):.0f} W), a nie blokada.")
    print("  Sprawdz te sama liczbe na karcie, o ktorej wiesz, ze jest "
          "sprawna, i porownaj.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
