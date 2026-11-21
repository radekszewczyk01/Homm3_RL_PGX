#!/usr/bin/env bash
# Cala seria pomiarow po kolei, w jednym przebiegu, odporna na zerwanie ssh.
#
# URUCHOMIENIE
# ------------
#   ./uruchom/kolejka.sh --probnie     # 5-10 min: czy wszystko w ogole startuje
#   ./uruchom/kolejka.sh               # pelna seria, ~2 h
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

for a in "$@"; do
  case "$a" in
    --probnie) PROBNIE=1 ;;
    --bez-karty) BEZ_KARTY=1 ;;
    --bez-tmuksa) BEZ_TMUKSA=1 ;;
    -h|--help) sed -n '2,30p' "$0"; exit 0 ;;
    *) echo "nieznany argument: $a"; exit 1 ;;
  esac
done

# --- samo-odlaczenie do tmuksa ------------------------------------------
# Bez tego zerwanie ssh ubija caly przebieg w polowie, a nie ma nic gorszego
# niz stracic czterdziesta minute skanu licznikow przez chwilowy brak sieci.
if [[ -z "${W_TMUKSIE:-}" && -z "${BEZ_TMUKSA:-}" ]]; then
  command -v tmux >/dev/null || {
    echo "Nie ma tmuksa, a bez niego zerwanie ssh przerwie pomiary."
    echo "Instalacja: sudo apt install tmux"
    echo "Na wlasne ryzyko mozna tez: ./uruchom/kolejka.sh --bez-tmuksa $*"
    exit 1; }
  if tmux has-session -t "$SESJA" 2>/dev/null; then
    echo "Sesja '$SESJA' juz istnieje - cos tam chodzi albo zostalo po"
    echo "poprzednim przebiegu. Sprawdz, zanim wystartujesz drugi raz:"
    echo
    echo "  ./uruchom/stan.sh"
    echo "  tmux attach -t $SESJA"
    echo
    echo "Jesli to resztka, usun ja:  tmux kill-session -t $SESJA"
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

  etap szybkie nieistotny $W_DOCKERZE uruchom/01_szybkie.sh
  etap czasowe nieistotny $W_DOCKERZE uruchom/02_czasowe.sh
  etap liczniki nieistotny $W_DOCKERZE uruchom/04_liczniki_l2.sh
  etap drzewo nieistotny $W_DOCKERZE uruchom/03_drzewo.sh
fi

# --- podsumowanie -------------------------------------------------------
DT=$(( $(date +%s) - START_SERII ))
echo
echo "================================================================"
echo "### KONIEC SERII, razem $((DT / 60)) min"
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
