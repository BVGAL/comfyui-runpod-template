#!/bin/bash
set -e

cd /workspace

# Clona o aggiorna ComfyUI
if [ ! -d "ComfyUI" ]; then
    git clone https://github.com/comfyanonymous/ComfyUI.git
fi
cd ComfyUI
git pull origin master

# Installa/aggiorna requirements di ComfyUI
pip install -r requirements.txt

# Gestione ComfyUI Manager
cd custom_nodes
if [ ! -d "ComfyUI-Manager" ]; then
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git
fi
cd ComfyUI-Manager
git pull origin main

# Torna alla root ComfyUI
cd /workspace/ComfyUI

# Avvia ComfyUI sulla porta 8188
exec python3 main.py --listen 0.0.0.0 --port 8188
