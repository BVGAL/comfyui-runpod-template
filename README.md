# ComfyUI RunPod Template

Questo template lancia un’istanza RunPod con:

- CUDA 12.8 (runtime)
- Python 3.11
- ComfyUI sempre aggiornato all’ultima versione
- ComfyUI Manager incluso e aggiornato

## Uso

1. Clona la repo
2. Costruisci e pubblica l’immagine Docker:

```bash
docker build -t ghcr.io/<username>/comfyui-runpod:latest .
docker push ghcr.io/<username>/comfyui-runpod:latest
