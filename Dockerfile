# Immagine base con CUDA 12.8 runtime + Ubuntu 22.04
FROM nvidia/cuda:12.8.0-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

# Installa dipendenze di base
RUN apt-get update && apt-get install -y \
    git wget curl python3 python3-pip python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Aggiorna pip
RUN pip3 install --upgrade pip

# Workspace
WORKDIR /workspace

# Copia requirements (anche se ora è vuoto)
COPY requirements.txt .

# Copia entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Espone la porta di ComfyUI
EXPOSE 8188

# Avvio container
ENTRYPOINT ["/entrypoint.sh"]
