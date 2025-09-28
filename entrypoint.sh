#!/bin/bash
set -e
cd /workspace

# --- ComfyUI core ---
if [ ! -d "ComfyUI" ]; then
    git clone https://github.com/comfyanonymous/ComfyUI.git
fi
cd ComfyUI && git pull origin master
pip install -r requirements.txt || true

# --- ComfyUI Manager ---
cd custom_nodes
if [ ! -d "ComfyUI-Manager" ]; then
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git
fi
cd ComfyUI-Manager && git pull origin main
cd ..

# --- RES4LYF node ---
if [ ! -d "RES4LYF" ]; then
    git clone https://github.com/ClownsharkBatwing/RES4LYF.git
fi
cd RES4LYF && git pull origin main
pip install -r requirements.txt || true
cd ..

# --- Models download ---
# Clip Vision
mkdir -p /workspace/ComfyUI/models/clip_vision
if [ ! -f "/workspace/ComfyUI/models/clip_vision/clip-vision.safetensors" ]; then
    wget -O /workspace/ComfyUI/models/clip_vision/clip-vision.safetensors \
    "https://civitai.com/api/download/models/2039365?type=Model&format=SafeTensor&size=full&fp=fp16"
fi

# Lightx2v
mkdir -p /workspace/ComfyUI/models/video
if [ ! -f "/workspace/ComfyUI/models/video/lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.safetensors" ]; then
    wget -O /workspace/ComfyUI/models/video/lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.safetensors \
    "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.safetensors"
fi

# Diffusion Wan2_2 HIGH
mkdir -p /workspace/ComfyUI/models/diffusion
if [ ! -f "/workspace/ComfyUI/models/diffusion/Wan2_2-I2V-A14B-HIGH_fp8_e4m3fn_scaled_KJ.safetensors" ]; then
    wget -O /workspace/ComfyUI/models/diffusion/Wan2_2-I2V-A14B-HIGH_fp8_e4m3fn_scaled_KJ.safetensors \
    "https://huggingface.co/Kijai/WanVideo_comfy_fp8_scaled/resolve/main/I2V/Wan2_2-I2V-A14B-HIGH_fp8_e4m3fn_scaled_KJ.safetensors"
fi

# --- Avvio ComfyUI ---
cd /workspace/ComfyUI
exec python3 main.py --listen 0.0.0.0 --port 8188
