from ubuntu:latest
maintainer Damien Pollet <damien.pollet@gmail.com>

env DEBIAN_FRONTEND noninteractive
run apt update && apt upgrade --yes && \
    # install build packages
    apt install --yes --no-install-recommends \
        git \
        latexmk \
        lmodern \
        make \
        texlive-fonts-extra \
        texlive-generic-extra \
        texlive-luatex \
        texlive-xetex \
        && \
    # would get done before each compile otherwise
    luaotfload-tool --update && \
    # directory/mount-point for work
    mkdir -p /work

workdir /work
volume [ "/work" ]

cmd [ "/bin/bash" ]
