#!/bin/bash

set -e

XUID=1000

ARGS=$@

drop_privileges() {
  if [ "$(id -u)" == "0" ]; then
    if ! id $XUID > /dev/null 2>&1; then
      adduser --uid $XUID --disabled-password --gecos '' cibot > /dev/null 2>&1
      adduser cibot sudo > /dev/null 2>&1

      # Ensure sudo group users are not 
      # asked for a password when using 
      # sudo command by ammending sudoers file
      echo '%cibot ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
    fi

    exec su - $(id -nu $XUID) --pty -c "/entrypoint.sh $ARGS"
  fi
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

    sed -i 's/#src-git helloworld/src-git helloworld/g' ./feeds.conf.default
    ./scripts/feeds update -a
    ./scripts/feeds install -a

    make defconfig

    make download -j16

    make -j$(nproc) || make -j1 V=s
    echo "======================="
    echo "Space usage:"
    echo "======================="
    df -h
    echo "======================="
    du -h --max-depth=1 ./ --exclude=build_dir --exclude=bin
    du -h --max-depth=1 ./build_dir
    du -h --max-depth=1 ./bin
}


drop_privileges

if [ "$1" == 'build' ]; then
    build
else
    # for debug
    exec $@
fi

