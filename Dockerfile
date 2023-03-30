FROM nvidia/cuda:11.8.0-base-ubuntu22.04

ENV PYTHONUNBUFFERED=1 

# system
# python3
RUN apt update -y -q && DEBIAN_FRONTEND=noninteractive apt install -y -q --no-install-recommends \
    software-properties-common apt-utils \
    curl git git-lfs vim \
    python3.10 pip \
    && rm -rf /var/lib/apt/lists/*

# git
RUN git clone https://github.com/comfyanonymous/ComfyUI.git
WORKDIR /ComfyUI

# requirements pytorch
RUN pip install --upgrade -r requirements.txt \
&& pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118 xformers

# shell
CMD ["/bin/bash"]
