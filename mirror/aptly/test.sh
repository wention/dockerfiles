#!/bin/sh

docker run --rm -i ubuntu:22.04 bash <<EOF
export DEBIAN_FRONTEND=noninteractive
export TZ=Asia/Shanghai

echo "deb [trusted=yes] http://172.17.0.1/ focal main" > /etc/apt/sources.list

http://172.17.0.1/repo_signing.key

apt update -y
apt install -y nginx
EOF
