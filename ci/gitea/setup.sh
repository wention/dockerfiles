#!/bin/sh

ARCHS="amd64 arm64"
TAGS="ubuntu-latest ubuntu-24.04 ubuntu-22.04 ubuntu-20.04"

for arch in $ARCHS;do
  for tag in $TAGS;do
    echo pull, retag and push linux/${arch} gitea/runner-images:${tag}
    docker pull --platform linux/${arch} gitea/runner-images:${tag}
    docker image tag gitea/runner-images:${tag} wention/gitea-runner-images:${tag}-${arch}
    docker push wention/gitea-runner-images:${tag}-${arch}
  done
done

for tag in $TAGS;do
  DOCKER_IMAGES=()
  for arch in $ARCHS;do
    DOCKER_IMAGES+=( "wention/gitea-runner-images:${tag}-${arch}" )
  done
  echo "create and push manifest wention/gitea-runner-images:${tag}"
  docker manifest create wention/gitea-runner-images:${tag} "${DOCKER_IMAGES[@]}"
  docker manifest push wention/gitea-runner-images:${tag}
done
