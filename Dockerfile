# Usa immagine base con CUDA 12.8 e Python 3.11
FROM nvidia/cuda:12.8.0-runtime-ubuntu22.04

# Evita interazioni durante l’installazione
ENV DEBIAN_FRONTEND=noninteractive

# Aggiorna sistema e installa dipendenze base
RUN apt-get update && apt-get install -y \
    git wget curl python3 python3-pip python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Crea una directory per comfyUI
WORKDIR /workspace

# Clona sempre comfyUI + comfyUI manager all’avvio (vedi entrypoint.sh)
# Qui non cloniamo nulla, lasciamo al bootstrap

# Copia requirements (per eventuali pacchetti aggiuntivi)
COPY requirements.txt .

# Installiamo eventuali dipendenze Python globali
RUN pip3 install --upgrade pip

# Copia lo script di avvio
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Espone la porta 8188 (UI)
EXPOSE 8188

# Avvia entrypoint
ENTRYPOINT ["/entrypoint.sh"]
