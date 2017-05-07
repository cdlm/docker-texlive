from ubuntu:latest
label maintainer "Damien Pollet <damien.pollet@gmail.com>" \
      description "Minimal TeXlive installation supporting SBAbook documents"

env LANG=C.UTF-8 DEBIAN_FRONTEND=noninteractive
run apt update && apt upgrade --yes && \
    # install build packages
    apt install --yes --no-install-recommends \
        bsdmainutils \
        git \
        latexmk \
        lmodern \
        make \
        texlive-fonts-extra \
        texlive-generic-recommended \
        texlive-generic-extra \
        texlive-luatex \
        texlive-xetex \
        unzip \
        wget \
        && \
    # would get done before each compile otherwise
    luaotfload-tool --update && \
    # directory/mount-point for work
    mkdir -p /work

workdir /work
volume [ "/work" ]

cmd [ "/bin/bash" ]
