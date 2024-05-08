from ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Asia/Shanghai

RUN sed -E -i 's/(archive|security).ubuntu.com/mirrors.ustc.edu.cn/' /etc/apt/sources.list

RUN apt update \
    && apt install -y \
    build-essential \
    clang \
    flex \
    bison \
    g++ \
    gawk \
    gcc-multilib \
    g++-multilib \
    gettext \
    git \
    libncurses-dev \
    libssl-dev \
    python3-distutils \
    rsync \
    unzip \
    zlib1g-dev \
    file \
    wget \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*


RUN adduser --uid 1000 --disabled-password --gecos '' openwrt 
RUN adduser openwrt sudo
RUN echo '%openwrt ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER openwrt

COPY ./scripts /

WORKDIR /build
