#!/usr/bin/env bash
# Cala seria pomiarow po kolei, w jednym przebiegu, odporna na zerwanie ssh.
#
# URUCHOMIENIE
# ------------
#   ./uruchom/kolejka.sh --pokaz       # 1 s: wypisz etapy i komendy, nic nie odpalaj
#   ./uruchom/kolejka.sh --probnie     # 10-15 min: czy KAZDY etap startuje
#   ./uruchom/kolejka.sh               # pelna seria, 5-7 h
#
# ZAWSZE NAJPIERW --probnie. Kazdy etap wykonuje sie wtedy na malym wsadzie i
# kilku krokach; zadna liczba z tego nie nadaje sie do artykulu, ale jesli
# wszystkie etapy wyjda "zrobiony", to znaczy, ze pelna seria nie wywroci sie
# po czterech godzinach na brakujacej zmiennej albo literowce w nazwie flagi.
# Zdarzylo sie to w tym projekcie kilka razy i kazdy raz kosztowal wieczor.
#
# ETAPY, w kolejnosci wykonania
# -----------------------------
#   zegar            czy zegar karty nie jest przypiety (wszystkie trzy karty)
#   brama            KRYTYCZNY: czy odniesienie odtwarza liczby z pracy
#   testy            KRYTYCZNY: 68 testow semantycznych, MUSZA byc na karcie
#   naruszenia       200 partii z kontrola niezmiennikow po kazdym kroku
#   szybkie          ablacja klasy III, narastanie klas, skalowanie klasy I
#   pokrycie         ile stosow ma dana zdolnosc, zniesienia bufow
#   akcje            rozklad liczby akcji dopuszczalnych (wynik x1,39)
#   zasieg           rownowaznosc obu implementacji fali + ich koszt
#   wznawianie       koszt bezwarunkowego resetu epizodow
#   czasowe_gesty    krzywa przepustowosci i skalowanie D, wariant gesty
#   czasowe_gather   to samo dla wariantu indeksowanego, INNE zakresy wsadow
#   pgx              rozrzut przepustowosci miedzy srodowiskami PGX
#   drzewo           model pamieciowy drzewa i koszt przeszukiwania
#   liczniki_D       liczniki L2, trzy rozmiary stanu, stale |A|
#   liczniki_A_male  liczniki L2, |A| = 1322
#   liczniki_A_duze  liczniki L2, |A| = 2642 - razem z poprzednim rozdziela |A| od D
#   liczniki_gather  liczniki L2 dla wariantu indeksowanego
#   liczniki_pgx     liczniki L2 dla szachow - czy model progu przenosi sie
#   prog             slad jadra i prog, zestawienie wszystkich skanow
#   tabele           tablice LaTeX-a z plikow wynikow
#
# Piec ostatnich etapow licznikowych to okolo dwie trzecie calego czasu, bo
# ncu serializuje jadra. Dlatego sa na koncu: jesli cos sie wywroci w nocy,
# wszystko tanie i wazne jest juz policzone.
#
# Skrypt sam zaklada sesje tmuksa i sie do niej odlacza, wiec mozna zamknac
# terminal od razu po uruchomieniu. Potem:
#
#   ./uruchom/stan.sh                  # gdzie jest, bez wchodzenia do tmuksa
#   tmux attach -t pomiary             # podglad na zywo (Ctrl+B potem D wyjscie)
#
# TEN SKRYPT CHODZI NA HOSCIE, nie w kontenerze. Kazdy etap odpala wlasny
# kontener przez uruchom/w_dockerze.sh. Dzieki temu wywrocenie sie jednego
# etapu nie zabiera ze soba pozostalych.
#
# KOLEJNOSC NIE JEST DOWOLNA
# --------------------------
# Etap 'brama' sprawdza, czy konfiguracja odniesienia odtwarza liczby z pracy,
# w tym 371 011 krokow/s. Jesli nie odtwarza, dalsze pomiary czasowe sa bez
# wartosci - wiec kolejka sie wtedy ZATRZYMUJE i czeka na decyzje. Etapy
# liczace tylko z kompilatora sa od tego niezalezne i ida dalej.
set -uo pipefail

cd "$(dirname "$0")/.."
KORZEN=$(pwd)

SESJA=${SESJA:-pomiary}
WYNIKI=${WYNIKI:-wyniki}
LOGI="$WYNIKI/logi"
STAN="$WYNIKI/stan.tsv"
KARTA=${KARTA:-0}
PROBNIE=0
BEZ_KARTY=0
POKAZ=0

for a in "$@"; do
  case "$a" in
    --probnie) PROBNIE=1 ;;
    --pokaz) POKAZ=1 ;;
    --bez-karty) BEZ_KARTY=1 ;;
    --bez-tmuksa) BEZ_TMUKSA=1 ;;
    -h|--help) sed -n '2,30p' "$0"; exit 0 ;;
    *) echo "nieznany argument: $a"; exit 1 ;;
  esac
done

# --- samo-odlaczenie do tmuksa ------------------------------------------
# Bez tego zerwanie ssh ubija caly przebieg w polowie, a nie ma nic gorszego
# niz stracic czterdziesta minute skanu licznikow przez chwilowy brak sieci.
# --pokaz nic nie uruchamia, wiec nie potrzebuje tmuksa ani wolnej sesji
[[ "$POKAZ" == "1" ]] && BEZ_TMUKSA=1

if [[ -z "${W_TMUKSIE:-}" && -z "${BEZ_TMUKSA:-}" ]]; then
  command -v tmux >/dev/null || {
    echo "Nie ma tmuksa, a bez niego zerwanie ssh przerwie pomiary."
    echo "Instalacja: sudo apt install tmux"
    echo "Na wlasne ryzyko mozna tez: ./uruchom/kolejka.sh --bez-tmuksa $*"
    exit 1; }
  if tmux has-session -t "$SESJA" 2>/dev/null; then
    echo "Sesja '$SESJA' juz istnieje, wiec NIE STARTUJE drugiej."
    echo
    # Pokazujemy od razu, co w tej sesji jest. Bez tego komunikat mowi tylko
    # "cos tam chodzi albo zostalo" i trzeba osobno szukac, a wtedy latwo
    # uznac resztke za dzialajaca serie - zwlaszcza ze stan.sh pokazuje wtedy
    # zywa sesje z pusta tabela, co wyglada jak seria, ktora stoi.
    echo "--- ostatnie linie tej sesji ---"
    tmux capture-pane -p -t "$SESJA" 2>/dev/null | grep -v '^$' | tail -8 \
      | sed 's/^/  /' || echo "  (nie udalo sie odczytac zawartosci)"
    echo "--------------------------------"
    echo
    if tmux capture-pane -p -t "$SESJA" 2>/dev/null \
         | grep -q "koniec serii, okno zostaje otwarte"; then
      echo "Powyzej widac 'koniec serii' - to RESZTKA, seria sie skonczyla"
      echo "albo wywrocila, a okno zostalo otwarte. Mozesz ja usunac:"
      echo
      echo "    tmux kill-session -t $SESJA && ./uruchom/kolejka.sh $*"
    else
      echo "Nie widze 'koniec serii', wiec cos tam prawdopodobnie JESZCZE"
      echo "CHODZI. Zanim cokolwiek usuniesz:"
      echo
      echo "    ./uruchom/stan.sh"
      echo "    tmux attach -t $SESJA        (wyjscie: Ctrl+B potem D)"
      echo
      echo "Jesli to jednak resztka:  tmux kill-session -t $SESJA"
    fi
    exit 1
  fi
  echo "Startuje seria w sesji tmuksa '$SESJA'."
  echo "Mozesz zamknac terminal. Podglad:  tmux attach -t $SESJA"
  echo "Stan bez wchodzenia:              ./uruchom/stan.sh"
  tmux new-session -d -s "$SESJA" -c "$KORZEN" \
      "W_TMUKSIE=1 KARTA=$KARTA WYNIKI=$WYNIKI $0 $*; \
       echo; echo '--- koniec serii, okno zostaje otwarte ---'; \
       exec bash"
  exit 0
fi

# --- przygotowanie ------------------------------------------------------
# Tryb bez karty pisze do OSOBNEGO katalogu. Nie z zamilowania do porzadku:
# liczby z procesora wygladaja tak samo jak z karty i trafilyby do tych
# samych plikow, z ktorych potem beda brane dane do artykulu. Raz pomylone
# nie dadza sie odroznic.
if [[ "$BEZ_KARTY" == "1" ]]; then
  WYNIKI="${WYNIKI}_bez_karty"
  LOGI="$WYNIKI/logi"
  STAN="$WYNIKI/stan.tsv"
fi

mkdir -p "$LOGI"

if [[ "$BEZ_KARTY" == "1" ]]; then
  cat > "$WYNIKI/UWAGA.txt" <<'TRESC'
Te wyniki pochodza z PROCESORA, nie z karty.

WAZNE i przenosne (identyczne na karcie, bo wynikaja z definicji):
  zgodnosc.json   rozmiar stanu D, |A|, kanaly, model pamieciowy drzewa,
                  B_max, B_opt, niezmienniki na losowych partiach
  pokrycie.json   ktore mechaniki faktycznie sie odpalaja

BEZ WARTOSCI (zalezne od zaplecza, nie przenosic do artykulu):
  ablacja3.json   flopy, bajty, liczba jader - procesor fuzjuje zupelnie
  narastanie.json inaczej niz karta
  klasa1.json     (kolumny D, |A|, B_max, B_opt sa przenosne, reszta nie)

Po naprawie dockera powtorz wszystko do katalogu wyniki/ i stamtad bierz
liczby. Ten katalog mozna wtedy usunac.
TRESC
fi
: > "$STAN"
START_SERII=$(date +%s)

export KARTA WYNIKI
[[ "$PROBNIE" == "1" ]] && export PROBNIE=1
[[ "$BEZ_KARTY" == "1" ]] && export BEZ_KARTY=1

# Nadpisywalne, zeby dalo sie przetestowac kolejke bez dockera
# (W_DOCKERZE=env ./uruchom/kolejka.sh --probnie uruchomi etapy wprost).
W_DOCKERZE=${W_DOCKERZE:-./uruchom/w_dockerze.sh}

zapisz() {   # nazwa stan sekundy uwaga
  printf '%s\t%s\t%s\t%s\n' "$1" "$2" "$3" "${4:-}" >> "$STAN"
}

usun_trwa() {   # usuwa wiersz 'trwa' danego etapu; awk, zeby nie polegac
                # na tym, czy tabulator przezyl kopiowanie pliku
  awk -F'\t' -v n="$1" '!($1 == n && $2 == "trwa")' "$STAN" > "$STAN.tmp" \
    && mv "$STAN.tmp" "$STAN"
}

PRZERWANE=0

etap() {     # nazwa krytycznosc komenda...
  local nazwa="$1" krytyczny="$2"; shift 2
  local log="$LOGI/${nazwa}.log"

  # --pokaz: wypisz, co BY sie uruchomilo, i nic nie uruchamiaj. Najtanszy
  # mozliwy test poprawnosci kolejki - sprawdza rozwiniecia $( ... ) w
  # argumentach, ktore sa tu najbardziej podatne na literowke, a ktorej
  # inaczej dowiedzielibysmy sie po kilku godzinach.
  if [[ "$POKAZ" == "1" ]]; then
    # Argumenty w nawiasach kwadratowych, kazdy osobno. Bez tego nie widac,
    # czy KANALY="0 9 18" poszlo jako JEDEN argument dla env, czy rozpadlo sie
    # na trzy - a w drugim przypadku env probuje uruchomic "9" jako komende
    # i etap wywala sie natychmiast.
    printf '%-18s %-11s' "$nazwa" "$krytyczny"
    local a
    for a in "$@"; do printf ' [%s]' "$a"; done
    printf '\n'
    return 0
  fi

  if [[ "$PRZERWANE" == "1" ]]; then
    zapisz "$nazwa" pominiety 0 "brama nie przeszla"
    echo "### POMIJAM $nazwa (brama nie przeszla)"
    return
  fi

  echo
  echo "================================================================"
  echo "### ETAP: $nazwa    ($(date '+%H:%M:%S'))"
  echo "================================================================"
  zapisz "$nazwa" trwa 0 ""
  local t0=$(date +%s)

  if "$@" 2>&1 | tee "$log"; then
    local dt=$(( $(date +%s) - t0 ))
    usun_trwa "$nazwa"
    zapisz "$nazwa" zrobiony "$dt" ""
    echo "### $nazwa: OK, ${dt}s"
  else
    local kod=$?
    local dt=$(( $(date +%s) - t0 ))
    usun_trwa "$nazwa"
    zapisz "$nazwa" blad "$dt" "kod $kod, log: $log"
    echo "### $nazwa: BLAD (kod $kod), szczegoly w $log"
    if [[ "$krytyczny" == "krytyczny" ]]; then
      echo
      echo "### To byl etap krytyczny. Zatrzymuje kolejke, bo dalsze pomiary"
      echo "### czasowe bylyby bez wartosci. Zobacz $log i zdecyduj."
      PRZERWANE=1
    fi
  fi
}

# --- seria --------------------------------------------------------------
GIER=$( [[ "$PROBNIE" == "1" ]] && echo 2 || echo 30 )
KROKI=$( [[ "$PROBNIE" == "1" ]] && echo 2 || echo 50 )
POWT=$( [[ "$PROBNIE" == "1" ]] && echo 2 || echo 8 )
SEK=$( [[ "$PROBNIE" == "1" ]] && echo 3 || echo 20 )

echo "seria startuje $(date '+%Y-%m-%d %H:%M:%S')"
echo "wyniki: $WYNIKI, tryb: $( [[ "$PROBNIE" == "1" ]] && echo PROBNY || echo pelny )"
if [[ "$POKAZ" == "1" ]]; then
  echo
  echo "TRYB --pokaz: wypisuje etapy i ich komendy, nic nie uruchamiam."
  echo
  printf '%-18s %-11s %s\n' "ETAP" "WAZNOSC" "KOMENDA"
  printf '%-18s %-11s %s\n' "----" "-------" "-------"
fi
if [[ "$BEZ_KARTY" == "1" ]]; then
  echo "karta: BRAK - tryb bez karty"
else
  echo "karta: $KARTA"
fi

if [[ "$BEZ_KARTY" == "1" ]]; then
  # TRYB BEZ KARTY
  # Kontener bez przekazanej karty wstaje nawet wtedy, gdy spis bibliotek
  # sterownika jest nieaktualny, bo wtedy zadne z tych bibliotek nie sa
  # montowane. Da sie wiec domknac wszystko, co nie zalezy od sprzetu.
  #
  # Zostaja tylko dwa etapy, i to nie przez wygode: pozostale mierza czas
  # albo liczniki karty, a tych bez karty nie ma skad wziac. Lepiej ich nie
  # uruchamiac wcale niz zapisac bezwartosciowe liczby do tych samych plikow,
  # z ktorych potem beda brane dane do artykulu.
  echo
  echo "### TRYB BEZ KARTY - tylko liczby niezalezne od sprzetu"
  echo "### Wazne: rozmiar stanu D, |A|, model pamieciowy drzewa, niezmienniki,"
  echo "###         semantyka mechanik, pokrycie mechanik."
  echo "### Pomijane: zegar, przepustowosc, liczniki L2, koszt drzewa."
  echo "### Z tego przebiegu NIE WOLNO brac zadnej liczby czasowej ani zadnej"
  echo "### liczby z kompilatora - procesor fuzjuje inaczej niz karta."

  etap brama krytyczny \
    $W_DOCKERZE python3 eksperymenty.py --wyniki "$WYNIKI" zgodnosc \
    --gier "$GIER"

  etap szybkie nieistotny $W_DOCKERZE uruchom/01_szybkie.sh

  for E in zegar czasowe liczniki drzewo; do
    zapisz "$E" pominiety 0 "tryb bez karty"
  done
else
  # Petla po kartach musi zglosic blad, jesli ktorakolwiek nie przeszla -
  # inaczej 'echo' na koncu petli zawsze zwraca zero i etap wyglada na udany.
  etap zegar nieistotny \
    env KARTA=all $W_DOCKERZE bash -c '
      ZLE=0
      for K in 0 1 2; do
        python3 narzedzia/sprawdz_zegar.py --karta $K --sekundy '"$SEK"' || ZLE=1
        echo
      done
      exit $ZLE'

  etap brama krytyczny \
    $W_DOCKERZE python3 eksperymenty.py --wyniki "$WYNIKI" zgodnosc --czas \
    --gier "$GIER" --kroki "$KROKI" --powtorzenia "$POWT"

  # Testy semantyczne MUSZA isc na karcie, nie na procesorze. Jeden z nich
  # sprawdza zapis liczebnosci stosu, a blad, ktory lapie, wystepuje WYLACZNIE
  # na karcie: XLA mnozy tam przez przyblizona odwrotnosc zamiast dzielic, i
  # sufit z 90/30 wychodzi 4 zamiast 3. Na procesorze ten test przechodzi
  # zawsze i niczego nie mowi. Dlatego krytyczny - jesli semantyka nie
  # przechodzi, zadna liczba ponizej nie opisuje tej gry.
  etap testy krytyczny \
    $W_DOCKERZE python3 test_mechanik.py $( [[ "$PROBNIE" == "1" ]] \
      && echo "--bez-kosztu" )

  etap naruszenia nieistotny \
    $W_DOCKERZE python3 narzedzia/zlap_naruszenie.py --preset wszystko \
    --gier $( [[ "$PROBNIE" == "1" ]] && echo 5 || echo 200 )

  # --- liczby z kompilatora i semantyka: tanie, wiec wczesnie ----------
  etap szybkie nieistotny $W_DOCKERZE uruchom/01_szybkie.sh

  etap pokrycie nieistotny \
    $W_DOCKERZE python3 eksperymenty.py --wyniki "$WYNIKI" pokrycie \
    --gier "$GIER"

  etap akcje nieistotny \
    $W_DOCKERZE python3 eksperymenty.py --wyniki "$WYNIKI" akcje \
    --presety odniesienie I_4 wszystko --wsad 2048 \
    --kroki $( [[ "$PROBNIE" == "1" ]] && echo 5 || echo 100 )

  # rownowaznosc obu implementacji fali zasiegu plus ich koszt z kompilatora
  etap zasieg nieistotny \
    $W_DOCKERZE python3 eksperymenty.py --wyniki "$WYNIKI" zasieg \
    --wsady $( [[ "$PROBNIE" == "1" ]] && echo "128 256" \
      || echo "1024 2048 4096 8192" )

  etap wznawianie nieistotny \
    $W_DOCKERZE python3 eksperymenty.py --wyniki "$WYNIKI" wznawianie \
    --wsady $( [[ "$PROBNIE" == "1" ]] && echo "128 256" \
      || echo "1024 2048 4096" )

  # --- krzywe przepustowosci -------------------------------------------
  etap czasowe_gesty nieistotny $W_DOCKERZE uruchom/02_czasowe.sh

  # Wariant indeksowany ma optimum czterokrotnie wyzej, wiec ZAKRESY MUSZA
  # BYC INNE. Raz juz caly etap przeleciał na zakresie dobranym do wariantu
  # gestego i tabela pokazala maksimum na brzegu skanu, co wyglada jak wynik.
  # POWT=15, bo punkt przy 12288 ma rozrzut 10 procent i to nie jest szum -
  # tam przeplataja sie dwa rezimy i srednia z pieciu powtorzen go zgubi.
  etap czasowe_gather nieistotny \
    env GATHER=1 POWT=$( [[ "$PROBNIE" == "1" ]] && echo 2 || echo 15 ) \
      WSADY="$( [[ "$PROBNIE" == "1" ]] && echo "128 256" \
        || echo "2048 4096 6144 7168 8192 9216 10240 11264 12288 13312 14336 16384" )" \
      WSADY_REZ="$( [[ "$PROBNIE" == "1" ]] && echo "128 256" \
        || echo "2048 4096 6144 8192 10240 12288 16384" )" \
    $W_DOCKERZE uruchom/02_czasowe.sh

  # rozrzut przepustowosci miedzy srodowiskami na tym samym sprzecie
  etap pgx nieistotny \
    $W_DOCKERZE python3 narzedzia/porownanie_pgx.py \
    --preset odniesienie \
    --powt $( [[ "$PROBNIE" == "1" ]] && echo 2 || echo 5 ) \
    $( [[ "$PROBNIE" == "1" ]] \
      && echo "--srodowiska go_9x9 --wsady 128 256 --kroki 5" \
      || echo "--srodowiska chess go_19x19 shogi go_9x9 --wsady 128 256 512 768 1024 1536 2048 3072 4096 6144 8192" )

  etap drzewo nieistotny $W_DOCKERZE uruchom/03_drzewo.sh

  # --- liczniki: najdluzsze, wiec na koniec ----------------------------
  # Kazdy z tych etapow pisze do WLASNEGO podkatalogu wyniki/skan_*/, bo
  # nazwa zawiera preset i wariant. Gdyby nie to, kazdy nastepny nadpisywalby
  # poprzedni pod ta sama nazwa i analiza_progu.py zestawialaby kopie tego
  # samego pomiaru.

  # (a) skalowanie D: trzy rozmiary stanu, ta sama przestrzen akcji
  etap liczniki_D nieistotny \
    env PRESET=III_II KANALY="$( [[ "$PROBNIE" == "1" ]] && echo "0" \
      || echo "0 9 18" )" \
    $W_DOCKERZE uruchom/04_liczniki_l2.sh

  # (b) i (c) skalowanie |A|: ten sam rozmiar stanu, dwie przestrzenie akcji.
  #     To jest para, ktora rozdziela |A| od D - i to jest ten pomiar, ktory
  #     u Ciebie w sekcji o L2 byl robiony PRZED poprawka z zakotwiczeniem
  #     nazwy jadra, wiec trzeba go powtorzyc.
  etap liczniki_A_male nieistotny \
    env PRESET=odniesienie KANALY="0" \
    $W_DOCKERZE uruchom/04_liczniki_l2.sh

  etap liczniki_A_duze nieistotny \
    env PRESET=wszystko KANALY="0" \
    $W_DOCKERZE uruchom/04_liczniki_l2.sh

  # (d) wariant indeksowany
  etap liczniki_gather nieistotny \
    env GATHER=1 PRESET=III_II KANALY="$( [[ "$PROBNIE" == "1" ]] && echo "0" \
      || echo "0 9 18" )" \
      WSADY="$( [[ "$PROBNIE" == "1" ]] && echo "256" \
        || echo "1024 2048 3072 4096 6144 8192 12288 14336 16384 20480" )" \
    $W_DOCKERZE uruchom/04_liczniki_l2.sh

  # (e) cudza implementacja: czy poprawiony model progu przenosi sie
  etap liczniki_pgx nieistotny $W_DOCKERZE uruchom/05_liczniki_pgx.sh

  # --- zbiorcze: tylko czytaja pliki, wiec na samym koncu --------------
  etap prog nieistotny \
    $W_DOCKERZE python3 narzedzia/analiza_progu.py

  etap tabele nieistotny \
    $W_DOCKERZE python3 narzedzia/tabele_tex.py --wyniki "$WYNIKI" \
    --wyjscie tabele
fi

# --- podsumowanie -------------------------------------------------------
DT=$(( $(date +%s) - START_SERII ))
echo
echo "================================================================"
if [[ "$POKAZ" == "1" ]]; then
  echo "### KONIEC WYDRUKU - nic nie zostalo uruchomione."
  echo "### Jesli lista wyglada dobrze:  ./uruchom/kolejka.sh --probnie"
else
  echo "### KONIEC SERII, razem $((DT / 60)) min"
fi
echo "================================================================"
./uruchom/stan.sh || true

if [[ "$PROBNIE" == "1" ]]; then
  echo
  echo "To byl przebieg PROBNY - zadna liczba z niego nie nadaje sie do"
  echo "artykulu. Jesli wszystkie etapy wyszly 'zrobiony', odpal pelna serie:"
  echo
  echo "    tmux kill-session -t $SESJA"
  echo "    ./uruchom/kolejka.sh"
fi
