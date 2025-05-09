### Description
* ComfyUI's docker compose for WSL2 (GPU support).
* The feature is that folders under volumes are treated as symbolic links in docker, so you only need to place local files in the volumes folder.

### Prerequisites

* Windows 11(196GB) + NVidia video card (RTX3060 12GB)
* Windows 11(128GB) + NVidia video card (RTX5070ti 16GB)
* WSL2 (32GB and operation confirmed on Ubuntu 20.04 or 24.04)

*Not confirmed in other configurations than those listed above.

### Installing

* Build Docker with the following command
```
docker compose build --build-arg UID="$(id -u)" --build-arg GID="$(id -g)" 
```
```
# Other than RTX50XX
docker compose build --build-arg UID="$(id -u)" --build-arg GID="$(id -g)" 
```
```
# RTX50XX
docker compose -f docker-compose_RTX50XX.yaml build --build-arg UID="$(id -u)" --build-arg GID="$(id -g)" 
```

* Place checkpoint files (*.ckpt and *.safetensors) in /volumes/models/checkpoints.
* Put vae files (*.pt and *.safetensors) in /volumes/models/vae.
* Place LoRA, LoCoN and LoHA in /volumes/models/lolas.
* Output files are placed in /volumes/output/.

## Usage

* After build, do the following.
```
# Other than RTX50XX
docker compose up -d
```
```
# RTX50XX
docker compose -f docker-compose_RTX50XX.yaml up -d
```
* After docker compose up -d, access the following.
```
http://localhost:8188
```
* docker compose stop to exit.

## Version

* 2025/04/19 fix: Supports RTX50XX and PEP668 (using venv).

## Acknowledgments

* [ComfyUI](https://github.com/comfyanonymous/ComfyUI) 
* [nVidia 525 + Cuda 11.8 + Python 3.10 + pyTorch GPU Docker image](https://dev.to/ordigital/nvidia-525-cuda-118-python-310-pytorch-gpu-docker-image-1l4a)
* [stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui) 
* [docker-composeを使う上でホストとコンテナのユーザーIDとグループIDを揃える](https://qiita.com/ma-me/items/c80f7f8bf9a61cbd21f7)
