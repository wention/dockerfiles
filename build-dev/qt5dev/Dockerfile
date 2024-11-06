FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Asia/Shanghai

RUN sed -E -i 's/(ports|archive|security).ubuntu.com/mirrors.ustc.edu.cn/' /etc/apt/sources.list

RUN apt-get -y update \
    && apt-get -y install \
    git \
    cmake \
    ccache \
    build-essential \
    chrpath \
    patchelf \
    qtbase5-dev \
    qtbase5-dev-tools \
    qtbase5-private-dev \
    qtlocation5-dev \
    qtpositioning5-dev \
    libqt5websockets5-dev \
    libqt5networkauth5-dev \
    qtdeclarative5-dev \
    qtdeclarative5-dev-tools \
    qtdeclarative5-private-dev \
    qtquickcontrols2-5-dev \
    qtmultimedia5-dev \
    libqt5gstreamer-dev \
    libqt5serialport5-dev \
    libqt5charts5-dev \
    libqt5datavisualization5-dev \
    qt3d5-dev \
    qt3d5-dev-tools \
    qttools5-dev \
    qttools5-dev-tools \
    qttools5-private-dev \
    qtwebengine5-dev \
    qtwebengine5-dev-tools \
    qtwebengine5-private-dev \
    qtconnectivity5-dev \
    qtscript5-dev \
    libqt5gamepad5-dev \
    libqt5opengl5-dev \
    libqt5pas-dev \
    libqt5remoteobjects5-dev \
    libqt5scxml5-dev \
    libqt5sensors5-dev \
    libqt5serialbus5-dev \
    libqt5svg5-dev \
    libqt5texttospeech5-dev \
    libqt5virtualkeyboard5-dev \
    libqt5webchannel5-dev \
    libqt5webkit5-dev \
    libqt5webview5-dev \
    qt5keychain-dev \
    qtwayland5-dev-tools \
    libqt5waylandclient5-dev \
    libqt5waylandcompositor5-dev \
    libqt5x11extras5-dev \
    libqt5xdg-dev \
    libqt5xdgiconloader-dev \
    libqt5xmlpatterns5-dev \
    qtxmlpatterns5-dev-tools \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

CMD ["bash"]
