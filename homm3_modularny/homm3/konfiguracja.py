"""
Konfiguracja silnika: jedno miejsce, w ktorym zapada decyzja, ktore mechaniki
sa wkompilowane w program.

DLACZEGO TO JEST OSOBNY PLIK I DLACZEGO KONFIGURACJA JEST ZAMROZONA
-------------------------------------------------------------------
XLA wymaga statycznych ksztaltow. Oznacza to, ze o zestawie mechanik trzeba
zdecydowac PRZED kompilacja, na poziomie Pythona. To nie jest ograniczenie,
ktore trzeba obejsc - to jest dokladnie to, co chcemy mierzyc:

  * mechanika wylaczona  -> jej kod nie trafia do grafu wcale, koszt zero,
  * mechanika wlaczona   -> jej kod liczy sie bezwarunkowo, w kazdym kroku,
                            dla kazdego elementu wsadu, nawet jesli warunek
                            nigdy nie jest spelniony.

Kazda konfiguracja to osobny program. Porownanie dwoch konfiguracji to
porownanie dwoch programow, a nie dwoch sciezek w jednym programie - dlatego
roznica w liczbie operacji, bajtow i jader jest czysta.

TAKSONOMIA MECHANIK (numeracja jak w pracy magisterskiej)
---------------------------------------------------------
  klasa I   - powiekszaja przestrzen akcji.
              Koszt: pamiec drzewa MCTS rosnie proporcjonalnie do |A|, bo
              szesc tablic krawedziowych ma rozmiar [B, N+1, |A|].
              Przyklad: czary atakujace rzucane na wybrany heks.

  klasa II  - dokladaja trwaly stan jednostek.
              Koszt: rosnie D, czyli rozmiar wektora stanu, a wraz z nim
              zbior roboczy 2BD - czyli maleje wsad, przy ktorym program
              jeszcze miesci sie w pamieci podrecznej ostatniego poziomu.
              Przyklad: blogoslawienstwo/klatwa, przyspieszenie/spowolnienie.

  klasa III - czysta arytmetyka na istniejacym stanie.
              Koszt: operacje i bajty w gorace petli, bez zmiany D ani |A|.
              Przyklad: oddech smoka, atak trojglowy, wysysanie zycia.

  klasa IV  - wprowadzaja losowosc do przejscia.
              Koszt: dodatkowe losowania (w JAX-ie generator jest licznikowy,
              wiec kazde losowanie to realna praca), a w drzewie - wezly
              losowe, ktorych mctx w wariancie gestym nie obsluguje.
              Przyklad: morale, szczescie.

UWAGA O NUMERACJI: morale i szczescie to klasa IV, nie VI. Klas jest cztery.
"""

import dataclasses
from typing import Dict, Tuple


# ===========================================================================
# KATALOG CZAROW (klasa I)
# ===========================================================================
# Dane, nie logika - logika siedzi w homm3/klasa1_czary.py. Katalog jest tutaj,
# bo konfiguracja musi z niego policzyc |A| i sprawdzic nazwy, zanim cokolwiek
# zostanie zaimportowane.
#
# Wartosci obrazen sa wziete z gry, ale NIE one sa tu przedmiotem badania.
# Przedmiotem jest kształt obliczeniowy: czar celowany w heks to 165 nowych
# akcji, czar obszarowy to dodatkowo odczyt tablicy sasiedztwa.

RODZAJ_OBRAZENIA = "obrazenia"
RODZAJ_BUF = "buf"

KATALOG_CZAROW: Dict[str, dict] = {
    # nazwa          rodzaj             baza  skala  obszar  mana  pole bufa
    "strzala": dict(rodzaj=RODZAJ_OBRAZENIA, baza=10, skala=10,
                    obszar=False, mana=5, pole=None, znak=0),
    "lod": dict(rodzaj=RODZAJ_OBRAZENIA, baza=10, skala=20,
                obszar=False, mana=8, pole=None, znak=0),
    "meteor": dict(rodzaj=RODZAJ_OBRAZENIA, baza=25, skala=25,
                   obszar=True, mana=16, pole=None, znak=0),
    "implozja": dict(rodzaj=RODZAJ_OBRAZENIA, baza=75, skala=75,
                     obszar=False, mana=25, pole=None, znak=0),

    # czary bufujace maja sens tylko razem z klasa II - konfiguracja to sprawdza
    "blogoslawienstwo": dict(rodzaj=RODZAJ_BUF, baza=0, skala=0,
                             obszar=False, mana=5, pole="obrazen", znak=+1),
    "klatwa": dict(rodzaj=RODZAJ_BUF, baza=0, skala=0,
                   obszar=False, mana=5, pole="obrazen", znak=-1),
    "przyspieszenie": dict(rodzaj=RODZAJ_BUF, baza=0, skala=0,
                           obszar=False, mana=6, pole="szybkosci", znak=+1),
    "spowolnienie": dict(rodzaj=RODZAJ_BUF, baza=0, skala=0,
                         obszar=False, mana=6, pole="szybkosci", znak=-1),
}

CZARY_OBRAZENIOWE = tuple(n for n, c in KATALOG_CZAROW.items()
                          if c["rodzaj"] == RODZAJ_OBRAZENIA)
CZARY_BUFUJACE = tuple(n for n, c in KATALOG_CZAROW.items()
                       if c["rodzaj"] == RODZAJ_BUF)


# ===========================================================================
# MECHANIKI KLASY III - nazwy uzywane w wierszu polecen i w wynikach
# ===========================================================================

MECHANIKI_III = (
    "oddech",                # oddech smoka: dodatkowy heks za celem
    "trojglowy",             # Cerber: dwaj sasiedzi atakujacego przylegli do celu
    "dookolny",              # Hydra: wszyscy sasiedzi atakujacego (i heksu tylnego)
    "wyssanie",              # wampir: leczenie rowne zadanym obrazeniom
    "powrot",                # Harpia: powrot na heks startowy po ciosie
    "podwojny_atak",         # Kuszniki, Krzyzowiec: dwa ciosy
    "kara_zwarcia",          # strzelec w zwarciu zadaje polowe obrazen
    "bez_kary_zwarcia",      # zdolnosc znoszaca te kare (wymaga kara_zwarcia)
    "wielokrotny_kontratak", # Gryf: licznik kontratakow zamiast flagi
)

MECHANIKI_II = ("bufy_obrazen", "bufy_szybkosci")
MECHANIKI_IV = ("morale", "szczescie")


# ===========================================================================
# KONFIGURACJA
# ===========================================================================

@dataclasses.dataclass(frozen=True)
class Konfiguracja:
    """Zamrozony opis jednej konfiguracji silnika.

    Zamrozony celowo: ta sama konfiguracja musi dawac ten sam program przy
    kazdym uruchomieniu, a przypadkowa zmiana pola po kompilacji byla by
    bledem niemozliwym do wykrycia w wynikach.
    """

    # --- klasa III: arytmetyka ataku (domyslnie wszystko wlaczone, bo tak
    #     wygladal silnik w wersji trzeciej - to jest konfiguracja odniesienia)
    oddech: bool = True
    trojglowy: bool = True
    dookolny: bool = True
    wyssanie: bool = True
    powrot: bool = True
    podwojny_atak: bool = True
    kara_zwarcia: bool = True
    bez_kary_zwarcia: bool = True
    wielokrotny_kontratak: bool = True

    # --- klasa II: trwaly stan
    bufy_obrazen: bool = False      # blogoslawienstwo (+) / klatwa (-)
    bufy_szybkosci: bool = False    # przyspieszenie (+) / spowolnienie (-)
    czas_bufa: int = 3              # ile rund trzyma buf zasiany na starcie
    szansa_bufa_start: float = 0.0  # prawdopodobienstwo bufa na starcie bitwy

    # --- klasa IV: losowosc
    morale: bool = False
    szczescie: bool = False
    zakres_morale: int = 3          # morale losowane z [-zakres, +zakres]
    zakres_szczescia: int = 3

    # --- klasa I: przestrzen akcji
    czary: Tuple[str, ...] = ()
    mana_start: int = 30
    moc_czarow: int = 3

    # --- sterowanie eksperymentem (nie sa to mechaniki gry)
    kanaly_wypelniajace: int = 0    # sztuczne kanaly obserwacji; kazdy to
                                    # 165 liczb float32 pisanych w kazdym
                                    # kroku, czyli wzrost D W GORACEJ SCIEZCE

    # Implementacja fali zasiegu ruchu. Semantyka IDENTYCZNA, inny koszt:
    #   False - iloczyn macierzowy STATIC_ADJ @ r, 27 225 operacji/iteracje
    #   True  - odczyt szesciu sasiadow,              990 operacji/iteracje
    # Wersja macierzowa jest ta z pracy i jest domyslna, zeby liczby dawaly
    # sie zestawiac. Wersja z odczytem sluzy do sprawdzenia, czy ta petla
    # wyznacza prog rezydencji w L2 - i jesli tak, jest po prostu lepsza.
    zasieg_gatherem: bool = False

    # Liczba iteracji fali. Musi byc NIE MNIEJSZA od najwyzszej szybkosci
    # w puli, inaczej jednostki przestaja dochodzic tam, gdzie powinny -
    # czyli zmienia sie ZASADY GRY, a nie tylko koszt. Obnizanie tej liczby
    # ma sens WYLACZNIE jako pomiar sladu pamieciowego i wyniki z takiego
    # przebiegu nie sa wynikami o grze. eksperymenty.py zgodnosc odmawia
    # przejscia, gdy wartosc jest inna niz 20.
    iteracje_zasiegu: int = 20

    nazwa: str = "bez_nazwy"

    # -------------------------------------------------------------------
    def __post_init__(self):
        for c in self.czary:
            if c not in KATALOG_CZAROW:
                raise ValueError(
                    f"nieznany czar {c!r}; dostepne: "
                    f"{', '.join(sorted(KATALOG_CZAROW))}")
        for c in self.czary:
            opis = KATALOG_CZAROW[c]
            if opis["rodzaj"] != RODZAJ_BUF:
                continue
            pole = opis["pole"]
            wlaczone = getattr(self, f"bufy_{pole}")
            if not wlaczone:
                raise ValueError(
                    f"czar {c!r} dziala na pole bufa {pole!r}, ale mechanika "
                    f"bufy_{pole} jest wylaczona. Wlacz ja albo usun czar.")
        if self.bez_kary_zwarcia and not self.kara_zwarcia:
            raise ValueError(
                "bez_kary_zwarcia to zdolnosc znoszaca kare za zwarcie, wiec "
                "nie ma sensu bez kara_zwarcia. Wlacz kara_zwarcia albo "
                "wylacz bez_kary_zwarcia.")
        if self.kanaly_wypelniajace < 0:
            raise ValueError("kanaly_wypelniajace musi byc nieujemne")

    # --- pochodne: przestrzen akcji ------------------------------------
    @property
    def liczba_czarow(self) -> int:
        return len(self.czary)

    @property
    def liczba_akcji(self) -> int:
        """|A|. Akcje rdzenia zachowuja swoje indeksy, czary ida na koniec.

        Uklad:
            [0, 1320)                  165 heksow x 8 plaszczyzn
            1320                       czekaj
            1321                       obrona
            1322 + s*165 + h           czar s rzucony na heks h
        """
        from .rdzen import MAX_AKCJI_RDZENIA, NUM_HEXES
        return MAX_AKCJI_RDZENIA + NUM_HEXES * self.liczba_czarow

    # --- pochodne: kanaly obserwacji -----------------------------------
    @property
    def kanaly(self) -> Tuple[str, ...]:
        from .rdzen import KANALY_RDZENIA
        dodatkowe = []
        if self.bufy_obrazen:
            dodatkowe.append("buf_obrazen")
        if self.bufy_szybkosci:
            dodatkowe.append("buf_szybkosci")
        if self.morale:
            dodatkowe.append("morale")
        if self.szczescie:
            dodatkowe.append("szczescie")
        if self.czary:
            dodatkowe.append("mana")
        dodatkowe += [f"wypelnienie_{i}"
                      for i in range(self.kanaly_wypelniajace)]
        return tuple(KANALY_RDZENIA) + tuple(dodatkowe)

    @property
    def indeksy(self) -> Dict[str, int]:
        return {n: i for i, n in enumerate(self.kanaly)}

    @property
    def liczba_kanalow(self) -> int:
        return len(self.kanaly)

    # --- pochodne: ktore klasy sa aktywne ------------------------------
    @property
    def aktywne_III(self) -> Tuple[str, ...]:
        return tuple(m for m in MECHANIKI_III if getattr(self, m))

    @property
    def aktywne_II(self) -> Tuple[str, ...]:
        return tuple(m for m in MECHANIKI_II if getattr(self, m))

    @property
    def aktywne_IV(self) -> Tuple[str, ...]:
        return tuple(m for m in MECHANIKI_IV if getattr(self, m))

    @property
    def klasy_aktywne(self) -> str:
        z = []
        if self.czary:
            z.append("I")
        if self.aktywne_II:
            z.append("II")
        if self.aktywne_III:
            z.append("III")
        if self.aktywne_IV:
            z.append("IV")
        return "+".join(z) if z else "rdzen"

    def opis(self) -> dict:
        """Slownik do zapisania razem z wynikiem pomiaru."""
        d = dataclasses.asdict(self)
        d["liczba_akcji"] = self.liczba_akcji
        d["liczba_kanalow"] = self.liczba_kanalow
        d["klasy_aktywne"] = self.klasy_aktywne
        return d


# ===========================================================================
# KONFIGURACJE NAZWANE
# ===========================================================================
# "odniesienie" musi byc bajt w bajt rownowazna silnikowi z wersji trzeciej -
# to sprawdza test_zgodnosci.py. Wszystkie inne liczby w artykule sa liczone
# wzgledem niej.

def _bez_III(**kw) -> dict:
    return {m: False for m in MECHANIKI_III} | kw


PRESETY: Dict[str, Konfiguracja] = {
    # --- punkty odniesienia ---
    "rdzen": Konfiguracja(nazwa="rdzen", **_bez_III()),
    "odniesienie": Konfiguracja(nazwa="odniesienie"),

    # --- narastanie klas ---
    "III": Konfiguracja(nazwa="III"),
    "III_II": Konfiguracja(nazwa="III_II",
                           bufy_obrazen=True, bufy_szybkosci=True,
                           szansa_bufa_start=0.25),
    "III_II_IV": Konfiguracja(nazwa="III_II_IV",
                              bufy_obrazen=True, bufy_szybkosci=True,
                              szansa_bufa_start=0.25,
                              morale=True, szczescie=True),
    "wszystko": Konfiguracja(
        nazwa="wszystko",
        bufy_obrazen=True, bufy_szybkosci=True, szansa_bufa_start=0.25,
        morale=True, szczescie=True,
        czary=("strzala", "lod", "meteor", "implozja",
               "blogoslawienstwo", "klatwa",
               "przyspieszenie", "spowolnienie")),

    # --- pojedyncze klasy nad rdzeniem, do rozlacznego pomiaru ---
    "tylko_II": Konfiguracja(nazwa="tylko_II", **_bez_III(
        bufy_obrazen=True, bufy_szybkosci=True, szansa_bufa_start=0.25)),
    "tylko_IV": Konfiguracja(nazwa="tylko_IV", **_bez_III(
        morale=True, szczescie=True)),
    "tylko_I": Konfiguracja(nazwa="tylko_I", **_bez_III(
        czary=("strzala", "lod", "meteor", "implozja"))),

    # --- klasa I w czterech krokach: |A| = 1322, 1487, 1652, 1817, 1982 ---
    "I_0": Konfiguracja(nazwa="I_0"),
    "I_1": Konfiguracja(nazwa="I_1", czary=("strzala",)),
    "I_2": Konfiguracja(nazwa="I_2", czary=("strzala", "lod")),
    "I_3": Konfiguracja(nazwa="I_3", czary=("strzala", "lod", "meteor")),
    "I_4": Konfiguracja(nazwa="I_4", czary=("strzala", "lod", "meteor",
                                            "implozja")),

    # --- czary bufujace: klasa I ktora faktycznie odpala logike klasy II ---
    "I_bufy": Konfiguracja(nazwa="I_bufy",
                           bufy_obrazen=True, bufy_szybkosci=True,
                           czary=("blogoslawienstwo", "klatwa",
                                  "przyspieszenie", "spowolnienie")),
}


def preset(nazwa: str) -> Konfiguracja:
    if nazwa not in PRESETY:
        raise ValueError(f"nieznany preset {nazwa!r}; dostepne: "
                         f"{', '.join(sorted(PRESETY))}")
    return PRESETY[nazwa]


def z_wiersza_polecen(args) -> Konfiguracja:
    """Buduje konfiguracje z obiektu argparse.

    Kolejnosc: preset daje podstawe, flagi --wlacz/--wylacz ja modyfikuja.
    """
    baza = preset(args.preset) if args.preset else Konfiguracja()
    zmiany = {}

    for nazwa in getattr(args, "wylacz", None) or []:
        if not hasattr(baza, nazwa):
            raise ValueError(f"nie ma mechaniki {nazwa!r}")
        zmiany[nazwa] = False
    for nazwa in getattr(args, "wlacz", None) or []:
        if not hasattr(baza, nazwa):
            raise ValueError(f"nie ma mechaniki {nazwa!r}")
        zmiany[nazwa] = True

    if getattr(args, "czary", None) is not None:
        zmiany["czary"] = tuple(c for c in args.czary if c)
    if getattr(args, "kanaly_wypelniajace", None) is not None:
        zmiany["kanaly_wypelniajace"] = args.kanaly_wypelniajace
    if getattr(args, "szansa_bufa_start", None) is not None:
        zmiany["szansa_bufa_start"] = args.szansa_bufa_start
    if getattr(args, "nazwa", None):
        zmiany["nazwa"] = args.nazwa

    return dataclasses.replace(baza, **zmiany)


def dodaj_argumenty(p):
    """Wspolne argumenty wiersza polecen dla wszystkich skryptow."""
    p.add_argument("--preset", default=None,
                   help=f"jedna z: {', '.join(sorted(PRESETY))}")
    p.add_argument("--wlacz", nargs="*", default=None,
                   metavar="MECHANIKA",
                   help=f"do wlaczenia: {', '.join(MECHANIKI_III + MECHANIKI_II + MECHANIKI_IV)}")
    p.add_argument("--wylacz", nargs="*", default=None, metavar="MECHANIKA")
    p.add_argument("--czary", nargs="*", default=None,
                   help=f"czary klasy I: {', '.join(sorted(KATALOG_CZAROW))}")
    p.add_argument("--kanaly-wypelniajace", type=int, default=None,
                   dest="kanaly_wypelniajace",
                   help="sztuczne kanaly obserwacji; powiekszaja D w goracej "
                        "sciezce (do skanu rezydencji L2)")
    p.add_argument("--szansa-bufa-start", type=float, default=None,
                   dest="szansa_bufa_start")
    p.add_argument("--nazwa", default=None)
    return p
