
### Prerequisites

* Windows 11(64GB)
* NVidia video card (RTX3060 12GB)
* WSL2 (32GB and operation confirmed on Ubuntu 20.04)

*Not confirmed in other configurations than those listed above.

### Installing

* Build Docker with the following command
```
docker compose build
```

* . Place *.ckpt and *.safetensors in /volumes/models/checkpoints
* . LoRA and LoCoN in /volumes/models/loras

## Usage

* Access the following after docker compose up -d
```
http://localhost:8188
```
* The output file will appear in . /volumes/output/.

## Version

* 2023/03/19

## Acknowledgments

* [ComfyUI](https://github.com/comfyanonymous/ComfyUI) 
* [nVidia 525 + Cuda 11.8 + Python 3.10 + pyTorch GPU Docker image](https://dev.to/ordigital/nvidia-525-cuda-118-python-310-pytorch-gpu-docker-image-1l4a)
