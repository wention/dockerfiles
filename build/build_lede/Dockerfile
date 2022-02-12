from ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Asia/Shanghai

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list


RUN apt-get -y update && apt-get -y install \
        build-essential \
        asciidoc \
        binutils \
        bzip2 \
        gawk \
        gettext \
        git \
        libncurses5-dev \
        libz-dev \
        patch \
        python3 \
        python2.7 \
        unzip \
        zlib1g-dev \
        lib32gcc1 \
        libc6-dev-i386 \
        subversion \
        flex \
        uglifyjs \
        git-core \
        gcc-multilib \
        p7zip \
        p7zip-full \
        msmtp \
        libssl-dev \
        texinfo \
        libglib2.0-dev \
        xmlto \
        qemu-utils \
        upx \
        libelf-dev \
        autoconf \
        automake \
        libtool \
        autopoint \
        device-tree-compiler \
        g++-multilib \
        antlr3 \
        gperf \
        wget \
        curl \
        swig \
        rsync \
        && rm -rf /var/lib/apt/lists/*


WORKDIR /build

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["build"]
