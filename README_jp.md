### Description
* ComfyUIのWSL2向けdocker compose(GPU対応)です.
* 特徴としては,volumes配下のフォルダはdocker内でシンボリックリンクとして扱われる為,ローカルのファイルをvolumes配下のフォルダに配置するのみで大丈夫です.

### Prerequisites

* Windows 11(64GB)
* NVidia video card (RTX3060 12GB)
* WSL2 (32GB and operation confirmed on Ubuntu 20.04)

*上記以外の構成では未確認.

### Installing

* 以下のコマンドでDockerをビルド.
```
docker compose build --build-arg UID="$(id -u)" --build-arg GID="$(id -g)" 
```

* チェックポイントファイル（*.ckpt と *.safetensors）を /volumes/models/checkpoints に置きます.
* vaeファイル(*.ptと*.safetensors)を/volumes/models/vaeに置きます.
* LoRAとLoCoNとLoHAを/volumes/models/lolasに置きます.
* 出力ファイルは/volumes/output/に出力されます。

## Usage

* Installing実行後に以下を実行して下さい.
```
docker compose up -d
```
* docker compose up -d の後、以下にアクセスして下さい.
```
http://localhost:8188
```
* 終了する場合はdocker compose stopして下さい.

## Version

* 2024/09/05 fix: downした後にupで起動しなくなるバグを修正

## Acknowledgments

* [ComfyUI](https://github.com/comfyanonymous/ComfyUI) 
* [nVidia 525 + Cuda 11.8 + Python 3.10 + pyTorch GPU Docker image](https://dev.to/ordigital/nvidia-525-cuda-118-python-310-pytorch-gpu-docker-image-1l4a)
* [stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui) 
* [docker-composeを使う上でホストとコンテナのユーザーIDとグループIDを揃える](https://qiita.com/ma-me/items/c80f7f8bf9a61cbd21f7)
