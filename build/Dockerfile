FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ubuntu-server

RUN apt-get update && apt install -y \ 
    sudo \ 
    locate

RUN apt-get update && apt-get install -q -y --no-install-recommends \
    bash-completion \
    usbutils \
    lsb-release \
    python3-pip \
    vim \
    curl \
    wget \
    nano \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -q -y \
    build-essential \
    git \
    libpoco-dev \
    libeigen3-dev \
    jstest-gtk \ 
    cmake

RUN apt update && sudo apt install locales
# RUN locale-gen en_US en_US.UTF-8
# RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8


RUN apt install software-properties-common
RUN add-apt-repository universe

RUN apt update && sudo apt install curl -y
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu \
    $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN sudo apt update
RUN sudo apt upgrade

RUN apt install ros-humble-ros-base
RUN apt install ros-dev-tools
RUN sudo apt-get install ros-humble-demo-nodes-cpp

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
WORKDIR /home/docker

USER docker
