#!/bin/bash

export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"

cat << EOF > /etc/apt/apt.conf.d/99proxy
Acquire {
  HTTP::proxy "${http_proxy}";
  HTTPS::proxy "${https_proxy}";
}
EOF

dpkg --add-architecture i386
sed -E -i 's/(archive|security).ubuntu.com/mirrors.ustc.edu.cn/' /etc/apt/sources.list
apt update

mkdir -pm755 /etc/apt/keyrings
apt install -y wget mesa-utils libgl1:i386

wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
apt update

apt install -y --install-recommends winehq-devel
apt install -y winetricks

winetricks corefonts gdiplus riched20 riched30 cjkfonts

#export LC_ALL=zh_CN.UTF-8
