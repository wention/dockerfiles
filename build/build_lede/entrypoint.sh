#!/bin/bash

set -xe

create_user() {
    groupadd -g 1000 wention
    useradd -u 1000 -ms /bin/bash -g wention wention
}

build() {
    if [ ! -e lede ];then
        git clone https://github.com/coolsnowwolf/lede
    fi

    cd lede
    git pull


    if [ -e .env.build ];then
        . .env.build
    fi

    ./scripts/feeds update -a
    ./scripts/feeds install -a

    make menuconfig

    make -j8 download V=s

    make -j$(($(nproc) + 1)) V=s
}

if [ "$1" == 'build' ]; then
    shift

    build
else
    # for debug
    exec $@
fi

