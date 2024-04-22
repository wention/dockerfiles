from ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Asia/Shanghai

RUN sed -E -i 's/(archive|security).ubuntu.com/mirrors.ustc.edu.cn/' /etc/apt/sources.list

RUN apt-get -y update \
    && apt upgrade -y \
    && apt-get -y install \
    sudo \
    ack  \
    antlr3  \
    aria2  \
    asciidoc  \
    autoconf  \
    automake  \
    autopoint  \
    binutils  \
    bison  \
    build-essential  \
    bzip2  \
    ccache  \
    cmake  \
    cpio  \
    curl  \
    device-tree-compiler  \
    fastjar  \
    flex  \
    gawk  \
    gettext  \
    gcc-multilib  \
    g++-multilib  \
    git  \
    gperf  \
    haveged  \
    help2man  \
    intltool  \
    libc6-dev-i386  \
    libelf-dev  \
    libglib2.0-dev  \
    libgmp3-dev  \
    libltdl-dev  \
    libmpc-dev  \
    libmpfr-dev  \
    libncurses5-dev  \
    libncursesw5-dev  \
    libreadline-dev  \
    libssl-dev  \
    libtool  \
    lrzsz  \
    mkisofs  \
    msmtp  \
    nano  \
    ninja-build  \
    p7zip  \
    p7zip-full  \
    patch  \
    pkgconf  \
    python3  \
    python3-pip  \
    libpython3-dev  \
    qemu-utils  \
    rsync  \
    scons  \
    squashfs-tools  \
    subversion  \
    swig  \
    texinfo  \
    uglifyjs  \
    upx-ucl  \
    unzip  \
    vim  \
    wget  \
    xmlto  \
    xxd  \
    zlib1g-dev \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --uid 1000 --disabled-password --gecos '' openwrt 
RUN adduser openwrt sudo
RUN echo '%openwrt ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER openwrt

WORKDIR /build

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["build"]
