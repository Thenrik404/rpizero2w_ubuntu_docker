FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ubuntu-server


# apt autocomplete fix
RUN rm /etc/apt/apt.conf.d/docker-clean &&\
    apt-get update


# user setup
ARG UID=1000
ARG GID=1000

# adding user and group (docker)
RUN groupadd -g $GID docker
RUN useradd -rm -d /home/docker -s /bin/bash -g docker -G sudo -u $UID docker -p "$(openssl passwd -1 docker)"
# COPY .bashrc /home/docker/.bashrc


# RUN updatedb

# entrypoint stuff
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# USER docker
WORKDIR /home

USER docker
