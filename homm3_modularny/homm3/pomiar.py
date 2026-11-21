"""
Warstwa pomiarowa.

DWIE RODZINY LICZB I DLACZEGO PIERWSZA JEST WAZNIEJSZA
------------------------------------------------------
1. Liczby z analizy skompilowanego programu: operacje zmiennoprzecinkowe,
   bajty w ruchu, liczba jader, pamiec argumentow i buforow tymczasowych.
   Pochodza od kompilatora, sa deterministyczne, nie zaleza od zegara karty,
   od tego kto jeszcze liczy na tej maszynie, ani od temperatury. Uzyskanie
   ich nie wymaga nawet URUCHOMIENIA programu - wystarczy go skompilowac,
   co trwa sekundy.

   To jest wlasciwa podstawa porownania mechanik. Nauczyla nas tego przykra
   historia: dwukrotny spadek przepustowosci, ktory wygladal na regresje
   w kodzie, okazal sie zablokowanym zegarem jednej karty (1155 MHz w kazdym
   stanie, od bezczynnosci do pelnego obciazenia). Liczby z kompilatora byly
   wtedy nietkniete i od razu wskazywaly, ze kod jest bez winy.

2. Liczby z pomiaru czasu: kroki na sekunde, trafienia w pamiec podreczna,
   ruch do DRAM. Niezbedne, zeby pokazac SKUTEK, ale wymagaja sprawnej karty
   i kontroli nad otoczeniem.

Kazdy wynik z rodziny drugiej zapisujemy razem z identyfikatorem karty,
zegarem i wersjami, bo bez tego nie da sie go potem obronic.
"""

import json
import os
import platform
import subprocess
import time

import jax
import jax.numpy as jnp
import numpy as np

from .rdzen import MAX_UNITS, bajtow_stanu


# ===========================================================================
# stale sprzetowe i stale modelu pamieciowego drzewa
# ===========================================================================

L2_MIB_DOMYSLNIE = 72.0       # nominalna pojemnosc L2 karty RTX 5000 Ada
UDZIAL_UZYTECZNY = 0.57       # C_eff / C_L2, zmierzone (kolano sigmoidy)
BAJTOW_STATYSTYK_KRAWEDZI = 26.1   # szesc tablic 32-bitowych + wyrownanie
SZCZYT_BW_GBS = 576.0


# ===========================================================================
# 1. ANALIZA SKOMPILOWANEGO PROGRAMU
# ===========================================================================

def _licz_jadra(hlo: str) -> int:
    """Liczba fuzji w zoptymalizowanym HLO - przyblizenie liczby jader.

    Zaleznie od zaplecza liczba moze wygladac inaczej (procesor fuzjuje
    zupelnie inaczej niz karta), dlatego porownywac wolno tylko wartosci
    z tego samego zaplecza.
    """
    return hlo.count(", kind=k")


def _skompiluj(fn, *args):
    t0 = time.perf_counter()
    skompilowany = jax.jit(fn).lower(*args).compile()
    return skompilowany, time.perf_counter() - t0


def analiza_kosztu(env, B: int, ziarno: int = 0) -> dict:
    """Koszt jednego kroku srodowiska, wyliczony przez kompilator.

    Nie uruchamia programu. Wszystkie wartosci sa podane na jeden krok
    jednego srodowiska, czyli podzielone przez B - dzieki temu daja sie
    porownywac miedzy wsadami.
    """
    klucz = jax.random.PRNGKey(ziarno)
    st = jax.jit(jax.vmap(env.init))(jax.random.split(klucz, B))

    def krok(s, a, k):
        return jax.vmap(env.step)(s, a, k)

    akcje = losuj_legalne(st, jax.random.fold_in(klucz, 1))
    klucze = jax.random.split(jax.random.fold_in(klucz, 2), B)

    skompilowany, czas_kompilacji = _skompiluj(krok, st, akcje, klucze)
    koszt = skompilowany.cost_analysis()
    if isinstance(koszt, list):
        koszt = koszt[0]
    pamiec = skompilowany.memory_analysis()
    hlo = skompilowany.as_text()

    flopy = float(koszt.get("flops", float("nan")))
    bajty = float(koszt.get("bytes accessed", float("nan")))

    return {
        "wsad": B,
        "flopy_na_krok": flopy / B,
        "bajty_na_krok": bajty / B,
        "jadra": _licz_jadra(hlo),
        "linii_hlo": hlo.count("\n"),
        "bajty_argumentow": int(pamiec.argument_size_in_bytes),
        "bajty_wyjscia": int(pamiec.output_size_in_bytes),
        "bajty_tymczasowe": int(pamiec.temp_size_in_bytes),
        "bajty_tymczasowe_na_krok": pamiec.temp_size_in_bytes / B,
        "czas_kompilacji_s": czas_kompilacji,
    }


def losuj_legalne(st, klucz):
    """Losowa legalna akcja dla kazdego elementu wsadu."""
    return jax.random.categorical(
        klucz, jnp.where(st.legal_action_mask, 0.0, -1e9), axis=-1)


# ===========================================================================
# 2. ROZMIAR STANU
# ===========================================================================

def rozmiar_stanu(env, szczegoly: bool = False):
    """D w bajtach. Opcjonalnie rozbicie na pola."""
    st = jax.jit(env.init)(jax.random.PRNGKey(0))
    D = bajtow_stanu(st)
    if not szczegoly:
        return D
    rozbicie = {}
    for sciezka, lisc in jax.tree_util.tree_flatten_with_path(st)[0]:
        nazwa = ".".join(str(k).lstrip(".") for k in sciezka)
        rozbicie[nazwa] = int(np.asarray(lisc).nbytes)
    return D, dict(sorted(rozbicie.items(), key=lambda kv: -kv[1]))


# ===========================================================================
# 3. MODEL PAMIECIOWY: DRZEWO I REZYDENCJA
# ===========================================================================

def model_drzewa(D: int, A: int, N: int = 150,
                 pamiec_gb: float = 6.0) -> dict:
    """Przewidywany koszt pamieciowy gestego drzewa mctx.

    mctx trzyma szesc tablic krawedziowych o rozmiarze [B, N+1, |A|] oraz
    tablice stanow [B, N+1]. Po rozlozeniu stanow na krawedzie wychodzi
    jedna stala na krawedz:

        c = c_stat + D / |A|

    gdzie c_stat to same statystyki (zmierzone 26,1 B/krawedz), a D/|A| to
    udzial stanu. Dla konfiguracji odniesienia D/|A| = 10479/1322 = 7,93,
    czyli c = 34,0 B/krawedz - i to jest liczba z pracy.

    Zwraca rowniez wsad graniczny przy zadanym budzecie pamieci.
    """
    c_stan = D / A
    c = BAJTOW_STATYSTYK_KRAWEDZI + c_stan
    na_jeden_wsad = (N + 1) * A * c
    return {
        "D": D,
        "A": A,
        "N": N,
        "bajtow_stanu_na_krawedz": c_stan,
        "bajtow_na_krawedz": c,
        "bajtow_na_element_wsadu": na_jeden_wsad,
        "B_max": pamiec_gb * 1e9 / na_jeden_wsad,
        "pamiec_gb": pamiec_gb,
    }


def model_rezydencji(D: int, l2_mib: float = L2_MIB_DOMYSLNIE,
                     udzial: float = UDZIAL_UZYTECZNY) -> dict:
    """Regula projektowa B_opt = C_eff / (2D).

    Zbior roboczy jednego kroku to 2BD: stan czytany i stan pisany.
    Zmierzony udzial uzyteczny pamieci L2 to 0,57 jej pojemnosci nominalnej.
    """
    c_eff = udzial * l2_mib * 2 ** 20
    return {
        "D": D,
        "C_L2_MiB": l2_mib,
        "C_eff_MiB": c_eff / 2 ** 20,
        "B_opt": c_eff / (2 * D),
        "zbior_przy_B_opt_MiB": c_eff / 2 ** 20,
    }


# ===========================================================================
# 4. PRZEPUSTOWOSC
# ===========================================================================

METODY = ("benchark", "silnik", "python")


def zbuduj_przebieg(env, B: int, kroki: int, ze_wznawianiem: bool):
    """Ciag krokow jako JEDNA petla w grafie (lax.scan).

    scan, a nie petla pythonowa: mierzymy czas silnika, a nie narzut
    interpretera i kolejkowania wywolan asynchronicznych.

    ze_wznawianiem=True odtwarza metodyke benchark.py z pracy, czyli
    wznawianie zakonczonych epizodow. Trzeba przy tym wiedzieć, CO to
    dokladnie znaczy w sformulowaniu tensorowym: `vmap(env.init)` wykonuje
    sie w KAZDYM kroku dla WSZYSTKICH srodowisk, niezaleznie od tego, czy
    ktorykolwiek epizod sie zakonczyl, a `where` tylko wybiera, ktore stany
    podmienic. Przy losowej polityce konczy sie okolo 139 epizodow na 204 800
    krokow - czyli placimy pelny koszt wznowienia 2048 srodowisk, zeby
    wznowic dwa.

    To nie jest niedoskonalosc pomiaru, to ta sama teza co w calym artykule,
    tylko w innym miejscu: bez rozgalezien placi sie za kazda mozliwosc,
    a nie za te, ktora zachodzi. Dlatego mierzymy obie wielkosci i podajemy
    ich stosunek.
    """
    def jeden(carry, _):
        st, klucz = carry
        klucz, k_akcja, k_krok, k_reset = jax.random.split(klucz, 4)
        logity = jnp.where(st.legal_action_mask, 0.0, -1e9)
        akcje = jax.random.categorical(k_akcja, logity, axis=-1)
        st = jax.vmap(env.step)(st, akcje, jax.random.split(k_krok, B))
        if ze_wznawianiem:
            gotowe = st.terminated | st.truncated
            swieze = jax.vmap(env.init)(jax.random.split(k_reset, B))
            st = jax.tree_util.tree_map(
                lambda a, b: jnp.where(
                    gotowe.reshape((-1,) + (1,) * (a.ndim - 1)), b, a),
                st, swieze)
        return (st, klucz), None

    def przebieg(st, klucz):
        (st, klucz), _ = jax.lax.scan(jeden, (st, klucz), None, length=kroki)
        return st, klucz

    return przebieg


def przepustowosc(env, B: int, kroki: int = 50, powtorzenia: int = 8,
                  rozgrzewka: int = 1, metoda: str = "benchark",
                  petla: str = None, ziarno: int = 0) -> dict:
    """Kroki srodowiska na sekunde.

    metoda="benchark" - DOMYSLNA i jedyna porownywalna z praca: scan,
                        wznawianie zakonczonych epizodow, czas NAJKROTSZY
                        z powtorzen. Tak powstala liczba 371 011 krokow/s.
    metoda="silnik"   - to samo bez wznawiania, czyli sam koszt kroku.
                        Wychodzi okolo 1,8 raza wyzej; uzywaj tylko tam,
                        gdzie interesuje cie silnik w oderwaniu od petli
                        uczenia, i NIGDY nie zestawiaj z liczbami z pracy.
    metoda="python"   - petla po stronie Pythona, czas sredni. Zostawiona
                        do porownan, nie do artykulu.

    Czas najkrotszy, a nie sredni, bo mierzymy zdolnosc sprzetu, a nie
    obciazenie maszyny przez innych. Tak liczy benchark.py i tak trzeba,
    zeby liczby dalo sie zestawic.
    """
    if petla is not None:          # zgodnosc ze starym wywolaniem
        metoda = {"scan": "silnik", "python": "python"}.get(petla, metoda)
    if metoda not in METODY:
        raise ValueError(f"nieznana metoda {metoda!r}; dostepne: {METODY}")

    klucz = jax.random.PRNGKey(ziarno)
    st = jax.jit(jax.vmap(env.init))(jax.random.split(klucz, B))

    if metoda == "python":
        krok = jax.jit(jax.vmap(env.step))

        def seria(s, k):
            for i in range(kroki):
                k1 = jax.random.fold_in(k, i)
                k2 = jax.random.fold_in(k, 10_000 + i)
                s = krok(s, losuj_legalne(s, k1), jax.random.split(k2, B))
            return s, k
    else:
        seria = jax.jit(zbuduj_przebieg(env, B, kroki,
                                        metoda == "benchark"))

    for i in range(max(rozgrzewka, 1)):
        st, _ = seria(st, jax.random.fold_in(klucz, 1000 + i))
    jax.block_until_ready(st)

    czasy = []
    for i in range(powtorzenia):
        t0 = time.perf_counter()
        st, _ = seria(st, jax.random.fold_in(klucz, i))
        jax.block_until_ready(st)
        czasy.append(time.perf_counter() - t0)

    czasy = np.array(czasy)
    najkrotszy = float(czasy.min())
    krokow = B * kroki
    return {
        "wsad": B,
        "metoda": metoda,
        "krokow_na_sekunde": float(krokow / najkrotszy),
        "krokow_na_sekunde_mediana": float(krokow / float(np.median(czasy))),
        "czas_najkrotszy_s": najkrotszy,
        "czas_mediana_s": float(np.median(czasy)),
        "odchylenie_pct": float(100 * czasy.std() / czasy.mean()),
        "powtorzenia": powtorzenia,
        "kroki_w_serii": kroki,
    }


# ===========================================================================
# 5. KOSZT DRZEWA PRZESZUKIWANIA
# ===========================================================================

def _siec_zastepcza(st, A):
    """Apriori rownomierne na akcjach dopuszczalnych, wartosc zero.

    Celowo NIE uzywamy prawdziwej sieci. Chcemy zmierzyc koszt samego drzewa,
    a nie splotow - inaczej nie wiadomo, co zmierzylismy.
    """
    logity = jnp.where(st.legal_action_mask, 0.0, -1e9)
    return logity, jnp.zeros(st.legal_action_mask.shape[0])


def koszt_drzewa(env, B: int, symulacje: int = 32,
                 polityka: str = "gumbel", max_glebokosc: int = 0,
                 max_rozwazanych: int = 16, powtorzenia: int = 3,
                 ziarno: int = 0) -> dict:
    """Czas jednej decyzji drzewa i koszt z analizy kompilatora.

    Wymaga pakietu mctx. Jesli go nie ma, zwraca slownik z kluczem 'blad'.
    """
    try:
        import mctx
    except ImportError:
        return {"blad": "brak pakietu mctx"}

    A = env.kfg.liczba_akcji
    klucz = jax.random.PRNGKey(ziarno)
    st = jax.jit(jax.vmap(env.init))(jax.random.split(klucz, B))

    def rekurencja(params, rng, akcja, osadzenie):
        klucze = jax.random.split(rng, B)
        nowy = jax.vmap(env.step)(osadzenie, akcja, klucze)
        logity, _ = _siec_zastepcza(nowy, A)
        gracz = jnp.clip(nowy.current_player, 0, 1)
        return mctx.RecurrentFnOutput(
            reward=jnp.take_along_axis(
                nowy.rewards, gracz[:, None], axis=1).squeeze(1),
            discount=jnp.where(nowy.terminated, 0.0, -1.0),
            prior_logits=logity,
            value=jnp.zeros(B),
        ), nowy

    def decyzja(s, rng):
        logity, _ = _siec_zastepcza(s, A)
        korzen = mctx.RootFnOutput(prior_logits=logity,
                                   value=jnp.zeros(B),
                                   embedding=s)
        wspolne = dict(params=None, rng_key=rng, root=korzen,
                       recurrent_fn=rekurencja, num_simulations=symulacje,
                       invalid_actions=~s.legal_action_mask)
        if max_glebokosc:
            wspolne["max_depth"] = max_glebokosc
        if polityka == "gumbel":
            return mctx.gumbel_muzero_policy(
                max_num_considered_actions=max_rozwazanych, **wspolne)
        return mctx.muzero_policy(**wspolne)

    skompilowany, czas_kompilacji = _skompiluj(decyzja, st,
                                               jax.random.PRNGKey(7))
    koszt = skompilowany.cost_analysis()
    if isinstance(koszt, list):
        koszt = koszt[0]
    pamiec = skompilowany.memory_analysis()

    f = jax.jit(decyzja)
    wynik = f(st, jax.random.PRNGKey(7))
    jax.block_until_ready(wynik)

    czasy = []
    for i in range(powtorzenia):
        t0 = time.perf_counter()
        wynik = f(st, jax.random.fold_in(jax.random.PRNGKey(7), i))
        jax.block_until_ready(wynik)
        czasy.append(time.perf_counter() - t0)
    czasy = np.array(czasy)

    model = model_drzewa(rozmiar_stanu(env), A, N=symulacje)
    return {
        "wsad": B,
        "symulacje": symulacje,
        "polityka": polityka,
        "A": A,
        "decyzji_na_sekunde": float(B / czasy.mean()),
        "krokow_srodowiska_na_sekunde": float(B * symulacje / czasy.mean()),
        "czas_decyzji_s": float(czasy.mean()),
        "odchylenie_pct": float(100 * czasy.std() / czasy.mean()),
        "flopy": float(koszt.get("flops", float("nan"))),
        "bajty": float(koszt.get("bytes accessed", float("nan"))),
        "jadra": _licz_jadra(skompilowany.as_text()),
        "bajty_tymczasowe": int(pamiec.temp_size_in_bytes),
        "bajtow_na_krawedz_model": model["bajtow_na_krawedz"],
        "czas_kompilacji_s": czas_kompilacji,
    }


# ===========================================================================
# 6. OTOCZENIE POMIARU - bez tego wynik jest nieobronny
# ===========================================================================

def _nvidia(zapytanie: str):
    try:
        out = subprocess.run(
            ["nvidia-smi", f"--query-gpu={zapytanie}",
             "--format=csv,noheader"],
            capture_output=True, text=True, timeout=10)
        return [w.strip() for w in out.stdout.strip().split("\n") if w.strip()]
    except (OSError, subprocess.SubprocessError):
        return []


def otoczenie() -> dict:
    """Wszystko, co trzeba podac razem z wynikiem czasowym.

    Zegary sa tu nie bez powodu. Karta z zablokowanym zegarem daje liczby
    o polowe nizsze i nic w kodzie tego nie pokazuje. Jesli zegar graniczny
    jest rowny zegarowi biezacemu przy zerowym obciazeniu, karta jest
    zablokowana (nvidia-smi -rgc -i NUMER przywraca normalne dzialanie).
    """
    import jaxlib
    return {
        "host": platform.node(),
        "python": platform.python_version(),
        "jax": jax.__version__,
        "jaxlib": getattr(jaxlib, "__version__", "?"),
        "zaplecze": jax.default_backend(),
        "urzadzenia": [str(d) for d in jax.devices()],
        "CUDA_VISIBLE_DEVICES": os.environ.get("CUDA_VISIBLE_DEVICES", ""),
        "XLA_FLAGS": os.environ.get("XLA_FLAGS", ""),
        "gpu_nazwa": _nvidia("name"),
        "gpu_sterownik": _nvidia("driver_version"),
        "gpu_zegar_sm": _nvidia("clocks.sm"),
        "gpu_zegar_sm_max": _nvidia("clocks.max.sm"),
        "gpu_obciazenie": _nvidia("utilization.gpu"),
        "gpu_pamiec_zajeta": _nvidia("memory.used"),
        "czas": time.strftime("%Y-%m-%dT%H:%M:%S"),
    }


def zapisz(sciezka: str, dane) -> str:
    os.makedirs(os.path.dirname(os.path.abspath(sciezka)) or ".",
                exist_ok=True)
    with open(sciezka, "w") as f:
        json.dump(dane, f, indent=2, ensure_ascii=False, default=str)
    return sciezka
