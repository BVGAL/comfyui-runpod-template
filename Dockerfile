# Dockerfile parametrico: permette build sia su CUDA 12.4 che 12.8
ARG CUDA_TAG=12.4.1-runtime-ubuntu22.04
FROM nvidia/cuda:${CUDA_TAG}

ENV DEBIAN_FRONTEND=noninteractive

# Dipendenze base
RUN apt-get update && apt-get install -y \
    git wget curl python3 python3-pip python3-venv \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

WORKDIR /workspace

COPY requirements.txt .

RUN pip install --upgrade diffusers transformers accelerate safetensors

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8188

# Start container
ENTRYPOINT ["/entrypoint.sh"]
