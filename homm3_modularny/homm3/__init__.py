"""
Silnik bitwy HoMM3 w JAX/PGX, wersja modularna.

Rdzen jest niezmienny, mechaniki wchodza jako rozszerzenia podzielone na
klasy wedlug tego, CO KOSZTUJA:

    klasa I   - przestrzen akcji   (homm3/klasa1_czary.py)
    klasa II  - trwaly stan        (homm3/klasa2_bufy.py)
    klasa III - arytmetyka         (homm3/klasa3_ataki.py)
    klasa IV  - losowosc           (homm3/klasa4_losowe.py)

Uzycie:

    from homm3 import zbuduj, Konfiguracja

    env = zbuduj(Konfiguracja(morale=True, czary=("strzala",)))
    state = jax.jit(env.init)(jax.random.PRNGKey(0))
"""

from .konfiguracja import (KATALOG_CZAROW, MECHANIKI_II, MECHANIKI_III,
                           MECHANIKI_IV, PRESETY, Konfiguracja, preset)
from .rdzen import (BOARD_COLS, BOARD_ROWS, MAX_AKCJI_RDZENIA, MAX_UNITS,
                    NUM_HEXES, BattleState, Haki, HoMM3Env, bajtow_stanu,
                    check_invariants)
from .silnik import raport_hakow, zbuduj, zbuduj_haki, zbuduj_z_presetu

__all__ = [
    "KATALOG_CZAROW", "MECHANIKI_II", "MECHANIKI_III", "MECHANIKI_IV",
    "PRESETY", "Konfiguracja", "preset",
    "BOARD_COLS", "BOARD_ROWS", "MAX_AKCJI_RDZENIA", "MAX_UNITS",
    "NUM_HEXES", "BattleState", "Haki", "HoMM3Env", "bajtow_stanu",
    "check_invariants",
    "raport_hakow", "zbuduj", "zbuduj_haki", "zbuduj_z_presetu",
]
