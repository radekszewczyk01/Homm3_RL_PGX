#!/usr/bin/env python3
"""
Odtwarzacz powtorek zapisanych przez nagraj8.py.

Dziala lokalnie: potrzebuje wylacznie pygame i pliku JSON (bez JAX-a
i bez silnika). Obsluguje jednostki dwuheksowe, przeszkody terenowe,
pasek zdrowia stosu oraz zapis klatek do PNG (material na film).

UZYCIE
    python3 podglad8.py powtorka_gumbel-m16_s0_siec_vs_zachlanna_s7.json
    python3 podglad8.py powtorka.json --auto 8          # 8 klatek na sekunde
    python3 podglad8.py powtorka.json --zapis klatki/   # PNG do zlozenia w film

STEROWANIE
    spacja / strzalka w prawo   nastepna klatka
    backspace / strzalka w lewo poprzednia klatka
    a                           wlacz lub wylacz automatyczne odtwarzanie
    home / end                  poczatek / koniec
    esc                         wyjscie

Film z zapisanych klatek:
    ffmpeg -framerate 8 -i klatki/%05d.png -c:v libx264 -pix_fmt yuv420p film.mp4
"""

import argparse
import json
import math
import os
import sys

import pygame

HEX = 32
MARGINES_X, MARGINES_Y = 40, 80
SZER = math.sqrt(3) * HEX
WYS = 2 * HEX

TLO = (24, 26, 32)
SIATKA = (70, 74, 86)
PRZESZKODA = (58, 52, 44)
STRONA = [(70, 120, 200), (200, 80, 70)]
STRONA_TYL = [(48, 84, 142), (142, 56, 50)]
AKTYWNY = (245, 200, 60)
OBRYS = (230, 232, 238)
TEKST = (235, 237, 242)
PRZYGASZONY = (150, 154, 164)
ZDROWIE = (120, 200, 120)


def wierzcholki(cx, cy):
    return [(cx + HEX * math.cos(math.radians(60 * i - 30)),
             cy + HEX * math.sin(math.radians(60 * i - 30))) for i in range(6)]


def srodek(kol, wier):
    # uklad even-r: wiersze parzyste przesuniete w prawo (jak w silniku)
    przesuniecie = (SZER / 2) if wier % 2 == 0 else 0
    return (MARGINES_X + kol * SZER + przesuniecie,
            MARGINES_Y + wier * (WYS * 0.75))


def srodek_heksu(idx, kolumny):
    return srodek(idx % kolumny, idx // kolumny)


def heks_tylny(poz, strona, dwuheks, kolumny):
    """Pole tylne jednostki dwuheksowej albo None."""
    if not dwuheks:
        return None
    kol = poz % kolumny
    if strona == 0:
        return poz - 1 if kol >= 1 else None
    return poz + 1 if kol <= kolumny - 2 else None


def rysuj(ekran, fonty, dane, nr):
    font, maly = fonty
    st, kl = dane["stale"], dane["klatki"][nr]
    kolumny, wiersze = st["kolumny"], st["wiersze"]

    ekran.fill(TLO)
    for i in range(kolumny * wiersze):
        cx, cy = srodek_heksu(i, kolumny)
        if st["przeszkody"][i]:
            pygame.draw.polygon(ekran, PRZESZKODA, wierzcholki(cx, cy))
        pygame.draw.polygon(ekran, SIATKA, wierzcholki(cx, cy), width=1)

    for u in range(st["jednostek"]):
        if not kl["alive"][u]:
            continue
        strona = st["side"][u]
        poz = kl["pos_idx"][u]
        tyl = heks_tylny(poz, strona, st["is_two_hex"][u], kolumny)
        if tyl is not None:
            tx, ty = srodek_heksu(tyl, kolumny)
            pygame.draw.polygon(ekran, STRONA_TYL[strona], wierzcholki(tx, ty))
            pygame.draw.polygon(ekran, SIATKA, wierzcholki(tx, ty), width=1)

        cx, cy = srodek_heksu(poz, kolumny)
        pygame.draw.polygon(ekran, STRONA[strona], wierzcholki(cx, cy))
        czy_aktywny = (u == kl["aktywny"])
        pygame.draw.polygon(ekran, AKTYWNY if czy_aktywny else OBRYS,
                            wierzcholki(cx, cy), width=4 if czy_aktywny else 2)

        # liczebnosc stosu oraz udzial pozostalego zdrowia
        etykieta = font.render(str(kl["count"][u]), True, TEKST)
        ekran.blit(etykieta, etykieta.get_rect(center=(cx, cy - 6)))
        znaczniki = ""
        if st["is_shooter"][u]:
            znaczniki += f"L{kl['shots'][u]}"
        if st["is_flyer"][u]:
            znaczniki += " ^"
        if znaczniki:
            mini = maly.render(znaczniki.strip(), True, TEKST)
            ekran.blit(mini, mini.get_rect(center=(cx, cy + 11)))

        maks = max(st["count_start"][u] * st["max_hp"][u], 1)
        teraz = max((kl["count"][u] - 1) * st["max_hp"][u] + kl["hp_left"][u], 0)
        szer = 2 * HEX * 0.6
        x0, y0 = cx - szer / 2, cy + HEX * 0.62
        pygame.draw.rect(ekran, (40, 44, 52), (x0, y0, szer, 4))
        pygame.draw.rect(ekran, ZDROWIE, (x0, y0, szer * min(teraz / maks, 1.0), 4))

    nagl = (f"{st['agent_a']}  (niebieski)   vs   {st['agent_b']}  (czerwony)"
            if st["strona_a"] == 0 else
            f"{st['agent_a']}  (czerwony)   vs   {st['agent_b']}  (niebieski)")
    ekran.blit(font.render(nagl, True, TEKST), (MARGINES_X, 14))

    opis = kl["akcja_opis"] or "stan poczatkowy"
    kto = kl["akcja_jednostki"]
    if kto is not None:
        opis = f"stos {kto} (gracz {st['side'][kto]}): {opis}"
    linia = f"klatka {nr}/{len(dane['klatki']) - 1}   {opis}"
    if kl["terminated"]:
        r = kl["rewards"]
        wynik = "remis" if r[0] == r[1] else ("wygrana gracza 0" if r[0] > r[1]
                                              else "wygrana gracza 1")
        linia += f"   ---   koniec bitwy: {wynik}"
    ekran.blit(maly.render(linia, True, PRZYGASZONY), (MARGINES_X, 42))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("plik")
    ap.add_argument("--auto", type=float, default=0.0,
                    help="klatek na sekunde (0 = sterowanie reczne)")
    ap.add_argument("--zapis", default=None,
                    help="katalog na klatki PNG; zapisuje wszystko i konczy")
    args = ap.parse_args()

    try:
        with open(args.plik) as f:
            dane = json.load(f)
    except FileNotFoundError:
        sys.exit(f"nie znaleziono pliku: {args.plik}")

    st = dane["stale"]
    szerokosc = int(st["kolumny"] * SZER + 2 * MARGINES_X + SZER / 2)
    wysokosc = int(st["wiersze"] * WYS * 0.75 + MARGINES_Y + HEX)

    pygame.init()
    if args.zapis:
        os.environ.setdefault("SDL_VIDEODRIVER", "dummy")
    ekran = pygame.display.set_mode((szerokosc, wysokosc))
    pygame.display.set_caption(os.path.basename(args.plik))
    fonty = (pygame.font.SysFont("DejaVu Sans", 15, bold=True),
             pygame.font.SysFont("DejaVu Sans", 13))

    if args.zapis:
        os.makedirs(args.zapis, exist_ok=True)
        for nr in range(len(dane["klatki"])):
            rysuj(ekran, fonty, dane, nr)
            pygame.image.save(ekran, os.path.join(args.zapis, f"{nr:05d}.png"))
        print(f"zapisano {len(dane['klatki'])} klatek do {args.zapis}/")
        print(f"ffmpeg -framerate 8 -i {args.zapis}/%05d.png "
              f"-c:v libx264 -pix_fmt yuv420p film.mp4")
        return

    zegar = pygame.time.Clock()
    nr, auto = 0, args.auto > 0
    ostatnia = 0

    while True:
        rysuj(ekran, fonty, dane, nr)
        pygame.display.flip()

        for zdarzenie in pygame.event.get():
            if zdarzenie.type == pygame.QUIT:
                pygame.quit(); return
            if zdarzenie.type != pygame.KEYDOWN:
                continue
            k = zdarzenie.key
            if k == pygame.K_ESCAPE:
                pygame.quit(); return
            if k in (pygame.K_SPACE, pygame.K_RIGHT):
                nr = min(nr + 1, len(dane["klatki"]) - 1)
            elif k in (pygame.K_BACKSPACE, pygame.K_LEFT):
                nr = max(nr - 1, 0)
            elif k == pygame.K_a:
                auto = not auto
            elif k == pygame.K_HOME:
                nr = 0
            elif k == pygame.K_END:
                nr = len(dane["klatki"]) - 1

        if auto and args.auto > 0:
            ostatnia += zegar.get_time()
            if ostatnia >= 1000.0 / args.auto:
                ostatnia = 0
                nr = min(nr + 1, len(dane["klatki"]) - 1)
        zegar.tick(60)


if __name__ == "__main__":
    main()