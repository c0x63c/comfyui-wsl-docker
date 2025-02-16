FROM nvidia/cuda:12.4.1-base-ubuntu22.04

ARG UID
ARG GID
ARG USERNAME
ARG GROUPNAME
ENV PYTHONUNBUFFERED=1 

# user&group
RUN groupadd -g ${GID} ${GROUPNAME} -f && \
    useradd -m -s /bin/bash -u ${UID} -g ${GID} ${USERNAME}

# shell
COPY ./service/entrypoint.sh /docker/entrypoint.sh
RUN chmod +x /docker/entrypoint.sh \
    && chown ${GROUPNAME}:${USERNAME} /docker/entrypoint.sh

# system
# python3
RUN apt update -y -q && DEBIAN_FRONTEND=noninteractive apt install -y -q --no-install-recommends \
    software-properties-common apt-utils \
    curl git git-lfs vim ffmpeg \
    python3.10 pip \
    && rm -rf /var/lib/apt/lists/*

# git
RUN git clone https://github.com/comfyanonymous/ComfyUI.git \
    && chown -R ${GROUPNAME}:${USERNAME} /ComfyUI
WORKDIR /ComfyUI
USER ${USERNAME}

# requirements pytorch
RUN pip install -r requirements.txt \
 && pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu126

# entry
ENTRYPOINT ["/docker/entrypoint.sh"]
CMD python3 main.py ${CLI_ARGS}
