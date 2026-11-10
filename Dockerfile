# =====================================================================
#  Obraz do benchmarku i treningu silnika HoMM3 w JAX
#
#  BUDOWA
#      docker build -t homm3-jax .
#
#  URUCHOMIENIE
#      docker run --rm --gpus all -v $PWD:/work -it homm3-jax \
#          python3 bench.py --tag server-1gpu --engine v3
#
#      # wybrane karty
#      docker run --rm --gpus '"device=0,1,2"' -v $PWD:/work -it homm3-jax \
#          python3 bench.py --tag server-3gpu --engine v3
#
#  DLACZEGO TE WERSJE
#      jax 0.6.x usunal API, z ktorych korzysta mctx 0.0.5 (biblioteka nie
#      byla aktualizowana od 2023 r.). Przypiecie 0.4.38 to ostatnia wersja
#      przetestowana z tym zestawem. Do pracy dyplomowej wersje MUSZA byc
#      przypiete - inaczej wyniki nie sa odtwarzalne.
#
#      Obraz bazowy w wariancie -base, nie -devel: pakiety pip jax[cuda12]
#      przynosza wlasne biblioteki CUDA i cuDNN, wiec cieższa baza tylko
#      dubluje je w innej wersji.
# =====================================================================

FROM nvidia/cuda:12.4.1-base-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        git \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir --upgrade pip==24.3.1

# --- rdzen: JAX z obsluga CUDA 12 -----------------------------------
RUN python3 -m pip install --no-cache-dir "jax[cuda12]==0.6.2"

RUN python3 -m pip install --no-cache-dir \
        "numpy==2.2.6" \
        "chex==0.1.90" \
        "flax==0.10.7" \
        "optax==0.2.8" \
        "mctx==0.0.5" \
        "pgx==2.6.0"

# --- narzedzia pomiarowe i wykresy ----------------------------------
RUN python3 -m pip install --no-cache-dir \
        "pandas==2.2.3" \
        "matplotlib==3.9.2" \
        "nvidia-ml-py==12.560.30"

# Bez tego JAX rezerwuje 75% VRAM na starcie i pomiar zajetosci pamieci
# pokazuje stala wartosc zamiast rzeczywistej - a stad wyliczamy bajty
# na stan D.
ENV XLA_PYTHON_CLIENT_PREALLOCATE=false

WORKDIR /work

# Szybka weryfikacja zestawu przy budowie obrazu
RUN python3 -c "import jax, mctx, pgx, flax, chex; \
    print('jax', jax.__version__, '| mctx', mctx.__version__, \
          '| pgx', pgx.__version__, '| flax', flax.__version__)"

CMD ["python3", "-c", "import jax; print(jax.devices())"]