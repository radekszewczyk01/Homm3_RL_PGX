# data/

## WRZUC TU homm3_static_lut.npy

Bez tego pliku silnik uzywa puli awaryjnej wpisanej na sztywno w
`homm3/rdzen.py` - trzynascie stworow zamiast stu jednego, inne szybkosci,
inny rozklad zdolnosci.

Nie jest to drobiazg i zdarzylo sie naprawde: caly wieczor pomiarow policzyl
sie na puli awaryjnej, bo kontener montuje `homm3_modularny` jako /work,
a plik lezal pietro wyzej, w korzeniu repozytorium.

    cp ../data/homm3_static_lut.npy data/

Albo wskaz go zmienna:  export HOMM3_LUT=/sciezka/do/homm3_static_lut.npy

`load_pool` szuka teraz w kilku miejscach (HOMM3_LUT, data/, ../data/, obok
pakietu) i KRZYCZY na stderr, gdy nie znajdzie. `eksperymenty.py zgodnosc`
odmawia przejscia na puli awaryjnej, a `otoczenie()` zapisuje zrodlo puli
do kazdego pliku wynikow.

## CO ZALEZY OD PULI, A CO NIE

Nie zalezy (wlasnosci KSZTALTOW, identyczne na kazdej puli):
  rozmiar stanu D, przestrzen akcji |A|, liczba kanalow,
  operacje i bajty w skompilowanym programie, liczba jader,
  slad pamieciowy jadra i prog rezydencji w L2,
  przepustowosc - bo kod jest bezgaleziowy i wykonuje te sama prace
  niezaleznie od tego, co jest w tablicach

Zalezy:
  dlugosc epizodu, rozklad liczby akcji dopuszczalnych,
  pokrycie mechanik (ile stosow ma dana zdolnosc),
  najwyzsza szybkosc w puli - a od niej minimalna liczba iteracji fali
  zasiegu, ktora nie psuje zasad gry
