docker run -d --name mtg-proxy --restart=unless-stopped -v `pwd`/config.toml:/config.toml --network host nineseconds/mtg:2
