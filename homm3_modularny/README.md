# Silnik HoMM3 w JAX/PGX — wersja modularna

Rdzeń jest niezmienny. Mechaniki gry wchodzą do programu jako rozszerzenia,
podzielone na klasy według tego, **co kosztują** — a nie według tego, czym są
w fabule gry.

Celem tego układu jest jedna rzecz: móc odpalić dużo konfiguracji i dla każdej
z nich powiedzieć, ile dokładnie kosztuje każda mechanika osobno.

---

## 1. Dlaczego to w ogóle jest podzielone na klasy

W silniku gałęziowym każda zdolność kosztuje tylko wtedy, gdy jednostka ją ma.
Instrukcja warunkowa przeskakuje blok i procesor go nie wykonuje.

W sformułowaniu tensorowym nie ma skoku. Maska mnoży wynik przez zero, ale wynik
trzeba wcześniej policzyć. **Płacimy więc za każdą zaimplementowaną mechanikę,
w każdym kroku, dla każdego elementu wsadu** — niezależnie od tego, czy
ktokolwiek na planszy ma tę zdolność.

Mamy na to własny przykład. W puli stworów dopuszczonej do symulacji było
**zero** jednostek z atakiem dookolnym. Kod tej mechaniki liczył się w każdym
kroku każdej bitwy i nie zmienił wyniku ani razu. To nie jest błąd
implementacji — to jest cena wektoryzacji. Pomiar z tego repozytorium pokazuje,
że ta jedna nieużywana mechanika kosztuje około dwóch procent bajtów w gorącej
pętli.

Klasy biorą się stąd, że różne mechaniki kosztują w **różnych walutach**:

| klasa | co dokłada | co się przez to psuje | gdzie w kodzie |
|---|---|---|---|
| **I** | akcje | pamięć drzewa MCTS rośnie liniowo z \|A\| | `homm3/klasa1_czary.py` |
| **II** | trwały stan | rośnie *D*, czyli maleje wsad mieszczący się w L2 | `homm3/klasa2_bufy.py` |
| **III** | arytmetykę | operacje i bajty w gorącej pętli | `homm3/klasa3_ataki.py` |
| **IV** | losowość | przejście przestaje być funkcją — drzewo potrzebuje węzłów losowych | `homm3/klasa4_losowe.py` |

Numeracja jest ta sama co w pracy magisterskiej. Morale i szczęście to
**klasa IV**, nie VI — klas jest cztery.

---

## 2. Układ katalogu

```
homm3/
  konfiguracja.py   flagi mechanik, katalog czarów, pochodne |A| i kanały
  rdzen.py          NIEZMIENNY: geometria, stan, ruch, cios, kolejka, PGX
  klasa1_czary.py   czary atakujące i bufujące — rozszerzają przestrzeń akcji
  klasa2_bufy.py    błogosławieństwo/klątwa, przyspieszenie/spowolnienie
  klasa3_ataki.py   oddech, trójgłowy, dookolny, wyssanie, powrót, podwójny…
  klasa4_losowe.py  morale i szczęście
  silnik.py         SKŁADA środowisko z konfiguracji — jedyny plik znający
                    wszystkie klasy naraz
  pomiar.py         koszt z kompilatora, rozmiar stanu, modele, przepustowość

eksperymenty.py     wszystkie eksperymenty jako podkomendy
test_mechanik.py    testy semantyki mechanik (59 sprawdzeń)

narzedzia/
  sprawdz_zegar.py         czy karta nie ma zablokowanego zegara (pod obciążeniem)
  krotki_przebieg.py       minimalny przebieg do podstawienia pod ncu
  najwazniejsze_jadro.py   wskazuje jądro decydujące o czasie kroku
  wykres_rezydencji.py     wykresy i tabela do sekcji o L2

uruchom/
  kolejka.sh          CAŁA SERIA po kolei, w tmuksie, odporna na zerwanie ssh
  stan.sh             gdzie jest kolejka, bez wchodzenia do tmuksa
  00_srodowisko.sh    wspólne ustawienia (karta, pamięć, powtarzalność)
  01_szybkie.sh       wszystko, co nie wymaga sprawnego zegara
  02_czasowe.sh       pomiary czasowe
  03_drzewo.sh        koszt przeszukiwania (mctx)
  04_liczniki_l2.sh   liczniki sprzętowe — zamyka TODO z sekcji o L2
  w_dockerze.sh       uruchamia dowolny z powyższych w kontenerze

Każdy skrypt etapu przyjmuje `PROBNIE=1` — skraca wszystko do minimum, żeby
sprawdzić, że startuje. Wyniki z takiego przebiegu są bez wartości.

Dockerfile.profil   obraz z Nsight Compute
data/               tu wrzuć homm3_static_lut.npy
```

Rdzeń nie wie o żadnej mechanice. Każda klasa nie wie o pozostałych.
`silnik.py` jest jedynym miejscem, które zna wszystkie.

---

## 3. Instalacja

**Na serwerze JAX jest tylko w obrazie dockerowym**, więc wszystko idzie przez
kontener — również zwykłe skrypty, nie tylko te zbierające liczniki:

```bash
docker build -f Dockerfile.profil -t homm3_profil:latest \
    --build-arg BAZA=homm3_az_v2:latest .

./uruchom/w_dockerze.sh uruchom/01_szybkie.sh
./uruchom/w_dockerze.sh python3 eksperymenty.py zgodnosc --czas
KARTA=all ./uruchom/w_dockerze.sh python3 narzedzia/sprawdz_zegar.py --karta 1
```

`KARTA=0|1|2` przekazuje jedną kartę (w kontenerze widać ją jako numer 0),
`KARTA=all` przekazuje wszystkie trzy i wtedy numery są jak na hoście.

Gdziekolwiek indziej wystarczy:

```bash
pip install jax jaxlib flax pgx matplotlib
pip install mctx            # tylko do pomiarów drzewa
```

Plik `data/homm3_static_lut.npy` skopiuj ze starego repozytorium. Bez niego
silnik użyje puli awaryjnej (dwanaście stworów wpisanych w `rdzen.py`) —
wszystko będzie działać, ale liczby **nie będą** porównywalne z pracą,
bo pula się różni.

Sprawdzenie, że wszystko stoi:

```bash
python3 eksperymenty.py zgodnosc
python3 test_mechanik.py
```

Pierwsza komenda musi wypisać `WSZYSTKO SIE ZGADZA`, druga `oblane: 0`.

---

## 4. Konfiguracja odniesienia odtwarza wersję trzecią

To jest warunek, bez którego żadna liczba z tego repozytorium nie daje się
porównać z pracą ani z wcześniejszymi pomiarami. Sprawdzone automatycznie:

| co | zmierzone | z pracy |
|---|---|---|
| rozmiar stanu *D* | 10 479 B | 10 479 B |
| przestrzeń akcji \|A\| | 1322 | 1322 |
| kanały obserwacji | 12 | 12 |
| bajtów na krawędź drzewa | 34,03 | 34,0 |
| *B*<sub>max</sub> przy 6 GB, *N* = 150 | 883 | 884 |
| *B*<sub>opt</sub> z reguły projektowej | 2053 | zmierzone kolano 2048 |

---

## 5. Jak dodać mechanikę

Trzy kroki, bez dotykania rdzenia.

**Krok pierwszy — flaga w konfiguracji.** W `homm3/konfiguracja.py` dopisz pole
do `Konfiguracja` i nazwę do `MECHANIKI_III` (albo `II`, albo `IV`).

**Krok drugi — funkcja w pliku swojej klasy.** Napisz funkcję o sygnaturze
pasującej do jednego z punktów zaczepienia (są wypisane w `Haki` w
`rdzen.py`) i dopisz ją do `haki_klasy_*`:

```python
def mnoznik_nienawisci(state, atk, dfn, key, is_melee, kfg):
    """Pikinier zadaje o 50% więcej obrażeń jeździe."""
    return jnp.where(state.nienawidzi[atk] & state.jest_jazda[dfn], 1.5, 1.0)

def haki_klasy_III(kfg):
    ...
    if kfg.nienawisc:
        mnoznik.append(mnoznik_nienawisci)
```

**Krok trzeci — nowe pole stanu, jeśli trzeba.** Pola klas II i IV deklaruje
się w `Rozszerzenie` w `rdzen.py`. Deklaracja **musi** być w rdzeniu, bo XLA
wymaga znanego układu stanu przed kompilacją. Wyłączona mechanika dostaje
tablicę o długości zero: nie zajmuje pamięci i nie generuje żadnej operacji,
więc jej koszt jest **dokładnie** zerowy, a nie „mały".

Potem dopisz sprawdzenie semantyki do `test_mechanik.py`. Nie z sumienności —
mechanika zaimplementowana błędnie ma identyczny koszt jak poprawna i wynik
pomiaru wygląda tak samo. Bez testu ablacja mierzy koszt kodu, o którym nie
wiadomo, czy cokolwiek liczy.

### Chwyt, który warto powtórzyć w innych mechanikach

Błogosławieństwo i klątwa znoszą się wzajemnie. Zamiast dwóch tablic i
sprawdzania warunku trzymamy jedną liczbę ze znakiem, gdzie znak to rodzaj,
a wartość bezwzględna to pozostałe rundy:

```
+3  błogosławieństwo na trzy rundy
 0  brak
-2  klątwa na dwie rundy
```

Wzajemne znoszenie jest wtedy zwykłym **przypisaniem**, a nie warunkiem:
nałożenie klątwy na +3 daje -3, bo po prostu wpisujemy -3. Wygaszanie to
odjęcie znaku. Połowa pamięci, zero rozgałęzień, a semantyka gry oddana
dosłownie. Ten sam chwyt działa dla przyspieszenia i spowolnienia.

---

## 6. Dwie rodziny liczb — i dlaczego pierwsza jest ważniejsza

**Liczby z kompilatora**: operacje zmiennoprzecinkowe, bajty w ruchu, liczba
jąder, pamięć buforów. Deterministyczne. Nie zależą od zegara karty, od tego
kto jeszcze liczy na tej maszynie, ani od temperatury. **Nie wymagają nawet
uruchomienia programu** — wystarczy go skompilować, co trwa sekundy.

Nauczyła nas tego przykra historia: dwukrotny spadek przepustowości, który
wyglądał na regresję w kodzie, okazał się zablokowanym zegarem karty zero
(1155 MHz w każdym stanie, od bezczynności do pełnego obciążenia). Liczby
z kompilatora były wtedy nietknięte i od razu wskazywały, że kod jest bez winy.

**Liczby z pomiaru czasu**: kroki na sekundę, trafienia w pamięć podręczną,
ruch do DRAM. Niezbędne, żeby pokazać *skutek*, ale wymagają sprawnej karty.

Blokada na karcie zero została zdjęta, więc karta zero jest znowu punktem
odniesienia — wszystkie liczby w pracy pochodzą z niej. **To nie znaczy, że
sprawdzanie przestało być potrzebne.** Blokada wraca przy każdym
`nvidia-smi -lgc` albo `-ac`, a przy bezczynności jest niewidoczna: zablokowana
i sprawna karta wyglądają identycznie, dopóki się ich nie obciąży.

```bash
python3 narzedzia/sprawdz_zegar.py --karta 0
```

Skrypt mnoży macierze przez dwadzieścia sekund i próbkuje zegar w trakcie.
Sprawna karta podnosi go do ponad 80% granicznego; zablokowana zostaje tam,
gdzie była. Przywrócenie, jeśli trzeba: `nvidia-smi -rgc -i 0`.

---

## 7. Eksperymenty

### 7.1 Czy mechaniki w ogóle się odpalają

```bash
python3 eksperymenty.py pokrycie --gier 40
```

Rozgrywa losowe partie i zlicza, ile razy każda mechanika faktycznie coś
zmieniła. Wypisuje ostrzeżenie przy mechanice włączonej i nieużywanej ani razu.

**Ta kontrola musi iść w artykule obok każdej liczby z ablacji.** Mechanika
o pełnym koszcie i zerowym efekcie jest w pomiarze nierozróżnialna od
działającej — a to różnica między wynikiem a pomyłką.

### 7.2 Koszt każdej mechaniki klasy III osobno

```bash
python3 eksperymenty.py ablacja3 --wsad 1024              # liczby z kompilatora
python3 eksperymenty.py ablacja3 --wsad 2048 --czas       # plus przepustowość
```

Metoda pominięcia jednej. Przykładowy wynik na procesorze:

```
odniesienie (wszystko)      flopy/krok 146 260   bajty/krok 568 128
bez dookolnego              flopy/krok 146 107   bajty/krok 555 576   (-2,2%)
bez wielokrotnego kontrat.  flopy/krok 146 260   bajty/krok 568 128   (  0,0%)
rdzen (nic z klasy III)     flopy/krok 136 942   bajty/krok 517 763   (-8,9%)
```

Dwa wnioski widać od razu. Atak dookolny kosztuje dwa procent bajtów, mimo że
w tej puli prawie nikt go nie ma — to jest ta teza o braku rozgałęzień, podana
liczbą. A wielokrotny kontratak kosztuje **dokładnie zero**, bo jest mechaniką
*danych*, nie kodu: rdzeń i tak trzyma licznik kontrataków, a mechanika zmienia
tylko jego wartość początkową. Nie każde rozszerzenie zasad kosztuje, i to też
jest wynik.

**Przy czytaniu tabeli:** oddech, atak trójgłowy i atak dookolny dzielą jedną
pętlę uderzeń w cele dodatkowe. Pominięcie jednej z nich zdejmuje tylko
wyznaczanie heksów; pętla znika dopiero przy pominięciu wszystkich trzech.
Dlatego w tabeli jest osobny wiersz „bez wszystkich wielocelowych". Pierwsza
włączona mechanika wielocelowa jest droga, każda następna tania — i nie wolno
tego pomylić z „mechanika X jest tania".

### 7.3 Koszt całych klas

```bash
python3 eksperymenty.py narastanie --wsad 1024
```

Rdzeń → +III → +II → +IV → +I. Pokazuje, że klasy nie są porównywalne:
klasa III zmienia operacje i bajty, klasa II zmienia *D* (a więc wsad
optymalny), klasa I zmienia \|A\| (a więc pamięć drzewa).

### 7.4 Klasa I: skalowanie przestrzeni akcji

```bash
python3 eksperymenty.py klasa1 --wsad 1024 --symulacje 150
python3 eksperymenty.py klasa1 --drzewo --wsad-drzewa 64     # z prawdziwym mctx
```

Zero do czterech czarów atakujących, czyli \|A\| od 1322 do 1982. Najważniejsza
kolumna to *B*<sub>max</sub> drzewa. **Czary nie obciążają symulatora w sposób
wart wzmianki — obciążają reprezentację drzewa, i to liniowo.** Tu jest cała
teza: mechanika prawie darmowa w symulatorze jest droga w planowaniu.

### 7.5 Klasa II i objętość stanu: test reguły projektowej

```bash
# bez karty, same przewidywania
python3 eksperymenty.py stan --preset III_II --kanaly 0 9 18 --rozbicie

# najpierw odtwórz krzywą z pracy, żeby mieć punkt odniesienia
python3 eksperymenty.py klasa2 --preset odniesienie --kanaly 0 \
    --wsady 1024 1536 2048 2176 2304 2560 3072 4096

# potem test reguły: trzy rozmiary stanu, ten sam skan wsadów
python3 eksperymenty.py klasa2 --preset III_II --kanaly 0 9 18 \
    --wsady 512 768 1024 1280 1536 1792 2048 2304 2560 3072

# z licznikami sprzętowymi (w kontenerze)
./uruchom/w_dockerze.sh uruchom/04_liczniki_l2.sh
```

**To zamyka otwarte TODO z sekcji o L2.** Pierwsze podejście było nieudane
i wiadomo dlaczego: sztuczne pole było doklejane *po* kroku przez monkey patch,
więc XLA wystawiała je jako osobne małe jądro elementowe, a mierzona fuzja nadal
operowała tylko na prawdziwych polach gry. Zbiór roboczy mierzonego jądra się
nie zmienił — i właśnie dlatego próg załamania stał przy *B* ≈ 2048 dla
wszystkich trzech rozmiarów stanu. To nie był wynik „objętość nie decyduje",
to był niewykonany eksperyment.

Teraz powiększamy **obserwację**, która jest 90% stanu i jest przebudowywana
w każdym kroku wewnątrz głównej fuzji:

| kanałów+ | *D* | *D*/*D*₀ | *B*<sub>opt</sub> z reguły |
|---|---|---|---|
| 0 | 11 827 B | 1,00 | 1819 |
| 9 | 17 767 B | 1,50 | 1210 |
| 18 | 23 707 B | 2,00 | 907 |

Jeśli próg przesuwa się zgodnie z ostatnią kolumną, reguła
*B*<sub>opt</sub> = *C*<sub>eff</sub>/2*D* **przewiduje**, a nie tylko opisuje.
Mocniejszy test jest na rysunku `fig_rezydencja_zbior.pdf`: wykreślone wobec
zbioru roboczego 2*BD*, wszystkie trzy krzywe mają się **nałożyć na jedną** —
bo ten sam zbiór roboczy ma dawać to samo zachowanie niezależnie od tego, czy
wziął się z dużego wsadu, czy z dużego stanu.

Jeśli próg stanie w miejscu — znowu nie trafiliśmy w gorącą ścieżkę i wynik
trzeba odrzucić, a nie opisać.

### 7.6 Koszt drzewa przeszukiwania

```bash
./uruchom/03_drzewo.sh
```

Sieci celowo **nie ma** — apriori jest równomierne na akcjach dopuszczalnych,
wartość zerowa. Gdyby sieć była, nie dałoby się odróżnić kosztu drzewa od
kosztu splotów, a interesuje nas drzewo. Kolumna „spowolnienie" mówi, ile razy
ten sam symulator jest wolniejszy wewnątrz drzewa niż samodzielnie; w pracy
wyszło 76×.

---

## 8. Co odpalić i w jakiej kolejności

Jedna komenda na całą serię. Kolejka sama zakłada sesję tmuksa i się do niej
odłącza, więc terminal można zamknąć od razu — zerwanie ssh nic nie przerwie.

```bash
# obraz raz
docker build -f Dockerfile.profil -t homm3_profil:latest \
    --build-arg BAZA=homm3_az_v2:latest .

# najpierw próba: 10-15 min, sprawdza że KAŻDY etap startuje i dochodzi do końca
./uruchom/kolejka.sh --probnie
./uruchom/stan.sh                  # gdzie jest
./uruchom/stan.sh -w               # odświeża co 20 s

# jeśli wszystkie etapy wyszły 'zrobiony' — pełna seria, ~2 h
tmux kill-session -t pomiary
./uruchom/kolejka.sh
```

Etapy idą po kolei i każdy ma swój log w `wyniki/logi/`:

| etap | co robi | krytyczny |
|---|---|---|
| `zegar` | czy któraś karta nie ma przypiętego zegara | nie |
| `brama` | pięć liczb z pracy + odtworzenie 371 011 kroków/s | **tak** |
| `szybkie` | zgodność, semantyka, pokrycie, ablacja, narastanie, klasa I | nie |
| `czasowe` | krzywa przepustowości i test reguły projektowej | nie |
| `liczniki` | skan `ncu` rezydencji L2 | nie |
| `drzewo` | koszt przeszukiwania z mctx | nie |

`brama` jest krytyczna: jeśli konfiguracja odniesienia nie odtwarza liczb
z pracy, kolejka **zatrzymuje się** i oznacza pozostałe etapy jako pominięte,
bo dalsze pomiary czasowe byłyby bez wartości. Pozostałe etapy nie zabijają
serii — jeśli na przykład zabraknie `ncu`, resztę policzy normalnie.

`stan.sh` pokazuje też, czy przebieg został przerwany: etap w stanie `trwa`
przy nieistniejącej sesji tmuksa oznacza ubity proces albo restart maszyny.

Pojedyncze etapy nadal idą osobno, jeśli trzeba coś powtórzyć:

```bash
./uruchom/w_dockerze.sh uruchom/02_czasowe.sh
PROBNIE=1 ./uruchom/w_dockerze.sh uruchom/04_liczniki_l2.sh
```

### Gdy `--gpus` nie działa

Na tym serwerze spis urządzeń, przez który docker przekazuje karty, wskazuje
na `libnvidia-egl-wayland.so.1.1.21`, a na hoście leży `1.1.23` — więc żaden
kontener z przekazaną kartą nie wstaje. Naprawa wymaga roota:

```bash
sudo nvidia-ctk cdi generate --output=/var/run/cdi/nvidia.yaml
```

Dopóki tego nie ma, `w_dockerze.sh` **sam** przechodzi na drugą drogę: pomija
środowisko uruchomieniowe NVIDII, podaje węzły urządzeń przez `--device`
i montuje tylko te biblioteki sterownika, które są potrzebne do obliczeń —
`libcuda`, `libnvidia-ml`, `libnvidia-ptxjitcompiler`, `libnvidia-nvvm`.
Biblioteki graficzne, czyli te zepsute, nie są w ogóle dotykane, bo do
liczenia nie służą. Nie potrzeba do tego roota: węzły `/dev/nvidia*` są
czytelne dla wszystkich, a biblioteki montujemy tylko do odczytu.

**To nie zmienia tego, co mierzymy.** Ten sam sprzęt, ten sam sterownik, te
same biblioteki — inny jest tylko sposób, w jaki stają się widoczne
w kontenerze.

```bash
BEZ_CDI=1 ./uruchom/w_dockerze.sh ...   # wymuś tę drogę, bez komunikatu
BEZ_CDI=0 ./uruchom/w_dockerze.sh ...   # zabroń jej, tylko --gpus
```

Przejście na nią jest zgłaszane głośno przy każdym uruchomieniu i celowo:
trzeba wiedzieć, że maszyna jest w stanie nienaprawionym. Jeśli `/dev/nvidia-uvm`
nie istnieje, skrypt próbuje go utworzyć przez `nvidia-modprobe -u -c 0` —
to polecenie ma ustawiony bit setuid, więc działa bez roota.

Ścieżkę poszukiwania bibliotek i odświeżenie ich spisu ustawia
`uruchom/_wstrzyknij.sh`, uruchamiany jako punkt wejścia **wewnątrz**
kontenera. Musi to być osobny plik, a nie zmienna `-e LD_LIBRARY_PATH`,
bo zmienna **nadpisuje** wartość z obrazu, a wtedy wtyczka CUDA przestaje
znajdować `libcusparse` i JAX po cichu przechodzi na procesor.

**Każde uruchomienie sprawdza, czy JAX faktycznie widzi kartę**, i odmawia
startu, jeśli nie. Nie wystarczy sprawdzić, czy kontener wstaje, ani czy
`jax.devices()` kończy się sukcesem — kończy się nim także wtedy, gdy zwróci
procesor. Mierzenie wtedy dalej byłoby najgorszym możliwym wynikiem: liczby
wychodzą normalne i są nieprawdziwe, a potem nie da się tego rozpoznać.
Sprawdzenie kosztuje kilka sekund; `BEZ_SPRAWDZENIA=1` je pomija.

### Gdy karta jest niedostępna w ogóle

Kontener bez przekazanej karty wstaje nawet wtedy, gdy spis bibliotek
sterownika jest nieaktualny — bo wtedy żadna z nich nie jest montowana. Da się
więc domknąć wszystko, co nie zależy od sprzętu:

```bash
./uruchom/kolejka.sh --bez-karty
BEZ_KARTY=1 ./uruchom/w_dockerze.sh uruchom/01_szybkie.sh
```

**Przenosi się**: rozmiar stanu *D*, przestrzeń akcji, liczba kanałów, model
pamięciowy drzewa, *B*<sub>max</sub>, *B*<sub>opt</sub>, niezmienniki na
losowych partiach, semantyka mechanik, pokrycie mechanik. Te liczby wynikają
z definicji, nie z pomiaru, więc na karcie wyjdą identyczne.

**Nie przenosi się**: cokolwiek czasowego oraz liczby z kompilatora (flopy,
bajty, liczba jąder) — procesor fuzjuje zupełnie inaczej niż karta.

Dlatego ten tryb pisze do osobnego katalogu `wyniki_bez_karty/` i zostawia
tam plik `UWAGA.txt` z rozbiciem na jedno i drugie. Nie z zamiłowania do
porządku: liczby z procesora wyglądają tak samo jak z karty i raz pomylone
nie dadzą się już odróżnić.

Każdy skrypt zapisuje surowy wynik do `wyniki/*.json` razem z opisem otoczenia
(karta, sterownik, zegary, wersje, zmienne środowiskowe). Bez tego opisu wyniku
czasowego nie da się potem obronić.

Pojedyncza konfiguracja z wiersza polecenia:

```bash
python3 eksperymenty.py ablacja3 --wsad 2048 \
    --wylacz dookolny trojglowy --czary strzala lod --nazwa moja_proba
```

---

## 9. Uczciwe ograniczenia

**Liczby z kompilatora zależą od zaplecza.** Procesor i karta fuzjują
zupełnie inaczej, więc liczbę jąder i bajtów wolno porównywać tylko w obrębie
jednego zaplecza. Liczby do artykułu zbieraj na karcie.

**Pomiar drzewa wymaga realnych rozmiarów.** Przy `--wsad 4 --symulacje 8`
czasy są czystym szumem — narzut wywołania przeważa nad pracą i kolumna
„spowolnienie" wychodzi mniejsza od jedności, co jest bez sensu. Do artykułu
używaj co najmniej `--wsad 128 --symulacje 32`, a najlepiej `--symulacje 150`
jak w pracy. Małe rozmiary są dobre tylko do sprawdzenia, że skrypt chodzi.

**Bufy zasiane na starcie nie odpalają logiki wzajemnego znoszenia.** Żeby
klątwa faktycznie zdejmowała błogosławieństwo, trzeba włączyć czary bufujące
(`--preset I_bufy`). Konfiguracja `III_II` mierzy wtedy **sam koszt noszenia
bufów**, co jest osobnym i też potrzebnym pomiarem — ale `pokrycie` wypisze
przy niej ostrzeżenie i słusznie.

**Przy losowym agencie czary są wybierane rzadko**, bo \|A\| jest duże. Koszt
mierzy się i tak poprawnie (liczy się bezwarunkowo), ale pomiar *efektu*
czarów na przebieg bitwy wymagałby wytrenowanego agenta.

**Model bohatera jest uproszczony**: jeden czar na stronę na rundę, moc stała,
brak odnawiania many w trakcie bitwy, czary ignorują odporności. Rzucenie czaru
nie zużywa tury jednostki — jak w grze.

**Morale ujemne odrzuca akcję wybraną przez agenta.** Dla symulatora to jedna
linia, dla uczenia zmiana semantyki: nagroda przestaje odpowiadać wybranej
akcji. To nie jest usterka, to jest właśnie ten koszt klasy IV, o którym
artykuł ma mówić.

**`wielokrotny_kontratak` jest mechaniką danych, nie kodu.** Jego koszt
obliczeniowy wynosi zero i tak trzeba go opisać, a nie jako „pomiar poniżej
czułości".

---

## 10. Licencja

MIT, jak główne repozytorium.
