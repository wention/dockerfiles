#!/bin/sh

docker run --rm -i ubuntu:22.04 bash <<EOF
export DEBIAN_FRONTEND=noninteractive
export TZ=Asia/Shanghai

http_proxy=http://192.168.32.121:3128 apt -o pkgProblemResolver=true -o Acquire::http=true update -y
http_proxy=http://192.168.32.121:3128 apt -o pkgProblemResolver=true -o Acquire::http=true install -y cmake build-essential
EOF
