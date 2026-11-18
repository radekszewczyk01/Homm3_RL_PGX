"""
Sklada srodowisko z konfiguracji.

To jedyny plik, ktory zna wszystkie klasy mechanik naraz. Rdzen nie wie
o zadnej z nich, a kazda klasa nie wie o pozostalych. Dodanie nowej klasy
albo nowej mechaniki to nowy plik plus jedna linia tutaj.
"""

import dataclasses

from .konfiguracja import Konfiguracja, preset
from .klasa1_czary import haki_klasy_I
from .klasa2_bufy import haki_klasy_II
from .klasa3_ataki import haki_klasy_III
from .klasa4_losowe import haki_klasy_IV
from .rdzen import Haki, HoMM3Env


# Kolejnosc ma znaczenie tylko tam, gdzie haki sie skladaja (granice losowania
# obrazen). Mnozniki sa przemienne, a haki init dzialaja na rozlacznych polach.
ZRODLA_HAKOW = (
    ("III", haki_klasy_III),
    ("II", haki_klasy_II),
    ("IV", haki_klasy_IV),
    ("I", haki_klasy_I),
)


def zbuduj_haki(kfg: Konfiguracja) -> Haki:
    pola = {f.name: [] for f in dataclasses.fields(Haki)}
    for _, zrodlo in ZRODLA_HAKOW:
        for nazwa, funkcje in zrodlo(kfg).items():
            if nazwa not in pola:
                raise KeyError(f"nieznany punkt zaczepienia {nazwa!r}")
            pola[nazwa].extend(funkcje)
    return Haki(**{k: tuple(v) for k, v in pola.items()})


def zbuduj(kfg: Konfiguracja, **kw) -> HoMM3Env:
    """Buduje srodowisko dla danej konfiguracji."""
    return HoMM3Env(kfg, zbuduj_haki(kfg), **kw)


def zbuduj_z_presetu(nazwa: str, **kw) -> HoMM3Env:
    return zbuduj(preset(nazwa), **kw)


def raport_hakow(kfg: Konfiguracja) -> str:
    """Co dokladnie weszlo do programu - do wydruku przy pomiarze."""
    haki = zbuduj_haki(kfg)
    linie = [f"konfiguracja {kfg.nazwa!r}  klasy: {kfg.klasy_aktywne}",
             f"  |A| = {kfg.liczba_akcji}, kanalow = {kfg.liczba_kanalow}",
             f"  klasa I   : {', '.join(kfg.czary) or '-'}",
             f"  klasa II  : {', '.join(kfg.aktywne_II) or '-'}",
             f"  klasa III : {', '.join(kfg.aktywne_III) or '-'}",
             f"  klasa IV  : {', '.join(kfg.aktywne_IV) or '-'}",
             f"  hakow razem: {haki.ile()}"]
    for f in dataclasses.fields(haki):
        v = getattr(haki, f.name)
        if v:
            linie.append(f"    {f.name:<20} {len(v)}")
    return "\n".join(linie)
