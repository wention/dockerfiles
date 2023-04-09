#!/bin/bash

set -x


TOPDIR=$(pwd)

sudo docker rm -f t_wine
sudo docker run \
  -ti \
  --name t_wine \
  -e DISPLAY \
  --device /dev/dri \
  --device /dev/snd \
  -v /run/user/1000/gdm/Xauthority:/root/.Xauthority:Z \
  -v ~/Downloads:/data \
  -v $TOPDIR/entrypoints.sh:/entrypoints.sh \
  -v /etc/localtime:/etc/localtime:ro \
  --net=host \
  ubuntu:22.04 bash
