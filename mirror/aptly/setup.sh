#!/bin/sh

if [ ! -d ./data/gpg ];then
docker compose exec -T aptly bash <<EOF
set -x
/opt/keys_gen.sh "wention" "xuyi.828@gmail.com" "wention"
EOF
fi

docker compose exec -T aptly bash <<EOF
set -x
aptly mirror drop -force focal-main | true
aptly mirror create \
  -ignore-signatures \
  -architectures=amd64 \
  -filter='nginx' \
  -filter-with-deps \
  focal-main http://archive.ubuntu.com/ubuntu focal main

aptly mirror update -ignore-signatures focal-main
aptly snapshot create focal-nginx-2503 from mirror focal-main
aptly publish snapshot --batch -passphrase="wention" -distribution=focal focal-nginx-2503
EOF
