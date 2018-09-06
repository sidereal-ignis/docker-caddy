FROM golang:1.11

RUN set -x \
 && go get github.com/caddyserver/builds \
 && go get github.com/mholt/caddy/caddy  \
 && cd /go/src/github.com/mholt/caddy    \
 && git checkout -b v0.11.0 \
 && cd caddy \
 && tail caddymain/run.go \
 && sed -i.bak -e 's/EnableTelemetry = true/EnableTelemetry = false/' caddymain/run.go \
 && tail caddymain/run.go \
 && go run build.go \
 && mkdir -p /go/opt/bin \
 && mv caddy /go/opt/bin/


FROM gcr.io/distroless/base

COPY --from=0 /go/opt/bin/caddy /

EXPOSE 80 443

VOLUME /root

WORKDIR /root

CMD [ "/caddy", "-agree" ]

