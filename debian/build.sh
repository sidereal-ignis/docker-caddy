#!/bin/bash

set -ex

mkdir -p /go/src/github.com/mholt
pushd /go/src/github.com/mholt
git clone https://github.com/mholt/caddy.git
cd caddy
git checkout -b v0.11.1 v0.11.1
git log -3
git status
popd

pushd /go/src/github.com/mholt/caddy/caddy
tail caddymain/run.go
sed -i.bak -e 's/EnableTelemetry = true/EnableTelemetry = false/' caddymain/run.go
tail caddymain/run.go
popd

go get -v github.com/caddyserver/builds

pushd /go/src/github.com/mholt/caddy/caddy
go run build.go
mv caddy /go
popd

