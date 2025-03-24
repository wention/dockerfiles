#!/bin/sh

docker run --entrypoint="" --rm -it gitea/act_runner act_runner generate-config > config.yaml