# ComfyUI RunPod Template

Questo template lancia un’istanza RunPod con:

- CUDA 12.8 (runtime)
- Python 3.11
- ComfyUI sempre aggiornato all’ultima versione
- ComfyUI Manager incluso e aggiornato

## Uso

### 1. Costruzione e pubblicazione immagine Docker
Questa repo è configurata con **GitHub Actions**: ogni push su `main` builda e pubblica automaticamente l’immagine Docker su GitHub Container Registry.

Immagine disponibile su:

