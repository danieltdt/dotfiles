#!/usr/bin/sh

set -x

docker build -t dotfiles:test - <<DOCKERFILE
FROM alpine

WORKDIR /usr/local/src/dotfiles

RUN apk add --no-cache bash gawk sed grep bc coreutils ncurses
DOCKERFILE

exec docker run -v "$PWD:/usr/local/src/dotfiles:ro" --rm -it dotfiles:test /bin/bash "$@"
