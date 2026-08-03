FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y python3 python3-pip && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

# Nowy, oficjalny sposób instalacji JAX z CUDA 12
RUN pip3 install -U "jax[cuda12]"

# Reszta bibliotek
RUN pip3 install pgx flax mctx optax
