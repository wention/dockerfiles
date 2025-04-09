#!/bin/sh

ARCHS="amd64 arm64"
TAGS="ubuntu-latest ubuntu-24.04 ubuntu-22.04 ubuntu-20.04"

for arch in $ARCHS;do
  for tag in $TAGS;do
    echo pull wention/gitea-runner-images:${tag}-${arch}
    docker pull wention/gitea-runner-images:${tag}-${arch}
  done
done
