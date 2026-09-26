FROM pytorch/pytorch:2.9.0-cuda13.0-cudnn9-runtime

ARG UID
ARG GID
ARG PASSWD
ARG USERNAME
ARG GROUPNAME
ENV PYTHONUNBUFFERED=1 
ENV PIP_BREAK_SYSTEM_PACKAGES=1

# user&group
RUN groupadd -g ${GID} ${GROUPNAME} -f \
    && useradd -m -s /bin/bash -u ${UID} -g ${GID} ${USERNAME} \
    && echo ${USERNAME}:${PASSWD} | chpasswd \
    && gpasswd -a ${USERNAME} sudo
#    && echo "${UID} ALL=(ALL) ALL" >> /etc/sudoers

# shell
COPY ./service/entrypoint.sh /docker/entrypoint.sh
RUN chmod +x /docker/entrypoint.sh \
    && chown ${GROUPNAME}:${USERNAME} /docker/entrypoint.sh

# system
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt install -y -q --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# git
RUN git clone https://github.com/Comfy-Org/ComfyUI.git /ComfyUI \
    && chown -R ${GROUPNAME}:${USERNAME} /ComfyUI
WORKDIR /ComfyUI
USER ${USERNAME}

# requirements pytorch
RUN pip install -r requirements.txt \
  && pip install -r manager_requirements.txt


# entry
ENTRYPOINT ["/docker/entrypoint.sh"]
CMD python main.py ${CLI_ARGS}
