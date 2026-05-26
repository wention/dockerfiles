#!/bin/sh

set -e

docker run --rm data.forgejo.org/forgejo/runner:12 \
  forgejo-runner generate-config > ./data/runner/runner-config.yml
