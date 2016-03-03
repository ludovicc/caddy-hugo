#!/bin/sh

# Generate a basic Caddyfile for Caddy-hugo
[ -f /srv/Caddyfile ] || cat <<EOF > /srv/Caddyfile
# disable HTTPS to run the server on localhost
tls off

# the folder where Hugo generates the website
root /srv/public

# enable the admin panel
hugo /srv {
   buildDrafts
   watch
   baseURL http://localhost:$PORT/
}
EOF

ln -s -f -b /srv/Caddyfile /etc/Caddyfile
cd /
/home/go/bin/caddydev --source /home/go/src/github.com/hacdias/caddy-hugo hugo -port $PORT $@
