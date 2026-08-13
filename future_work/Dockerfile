FROM nvidia/cuda:12.4.1-runtime-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y python3 python3-pip git \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install -U pip
RUN pip3 install "jax[cuda12]==0.4.35" pgx==2.4.2 flax==0.10.2 \
                 mctx==0.0.5 optax==0.2.4 \
                 numpy pandas matplotlib nvidia-ml-py
ENV XLA_PYTHON_CLIENT_PREALLOCATE=false
WORKDIR /work