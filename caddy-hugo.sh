#!/bin/sh

# Generate a basic Caddyfile for Caddy-hugo
[ -f /srv/Caddyfile ] || cat <<EOF > /srv/Caddyfile
localhost:2015
tls off                    # disable HTTPS to run the server on localhost
root      public           # the folder where Hugo generates the website
hugo                       # enable the admin panel
EOF

/home/go/bin/caddydev --source /home/go/src/github.com/hacdias/caddy-hugo hugo
