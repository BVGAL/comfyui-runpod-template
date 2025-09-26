#!/bin/bash
set -e

cd /workspace

# Se la cartella non esiste, clona comfyUI
if [ ! -d "ComfyUI" ]; then
    git clone https://github.com/comfyanonymous/ComfyUI.git
fi

# Aggiorna sempre ComfyUI
cd ComfyUI
git pull origin master

# Installa/aggiorna requirements
pip install -r requirements.txt

# ComfyUI Manager (nella cartella custom_nodes)
cd custom_nodes
if [ ! -d "ComfyUI-Manager" ]; then
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git
fi
cd ComfyUI-Manager
git pull origin main

# Torna alla root ComfyUI
cd /workspace/ComfyUI

# Avvia comfyUI alla porta 8188
exec python3 main.py --listen 0.0.0.0 --port 8188
