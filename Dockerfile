FROM abiosoft/caddy

RUN apk add go>=1.6 --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/community --allow-untrusted && apk add mercurial && mkdir /home/go
ENV GOPATH /home/go
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/go/bin/
RUN /usr/bin/go get -u github.com/jteeuwen/go-bindata/...
RUN /usr/bin/go get github.com/caddyserver/caddydev
RUN /usr/bin/go get -u github.com/xenolf/lego
# Skip the error about assets containing no buildable Go sources
RUN /usr/bin/go get github.com/hacdias/caddy-hugo || true
RUN cd /home/go/src/github.com/hacdias/caddy-hugo && /usr/bin/go generate

COPY caddy-hugo.sh /caddy-hugo.sh
RUN chmod +x /caddy-hugo.sh
ENTRYPOINT ["/bin/sh", "-c", "/caddy-hugo.sh"]
CMD ["--conf", "/etc/Caddyfile"]
