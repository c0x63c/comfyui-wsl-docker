FROM nvidia/cuda:12.1.0-base-ubuntu22.04

ENV PYTHONUNBUFFERED=1 

# system
# python3
RUN apt update -y -q && DEBIAN_FRONTEND=noninteractive apt install -y -q --no-install-recommends \
    software-properties-common apt-utils \
    curl git git-lfs vim ffmpeg \
    python3.10 pip \
    && rm -rf /var/lib/apt/lists/*

# git
RUN git clone https://github.com/comfyanonymous/ComfyUI.git
WORKDIR /ComfyUI

# requirements pytorch
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121 \
    pip install -r requirements.txt

# shell
COPY ./service/entrypoint.sh /docker/entrypoint.sh
RUN chmod +x /docker/entrypoint.sh
ENTRYPOINT ["/docker/entrypoint.sh"]
CMD python3 main.py ${CLI_ARGS}