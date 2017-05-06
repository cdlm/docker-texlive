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
	unzip \
	wget \
        && \
    # would get done before each compile otherwise
    luaotfload-tool --update && \
    # directory/mount-point for work
    mkdir -p /work

run dpkg --add-architecture i386 
run apt-get update 
run apt-get install -y libx11-6:i386 
run apt-get install -y libgl1-mesa-glx:i386 
run apt-get install -y libfontconfig1:i386 
run apt-get install -y libssl1.0.0:i386 
run apt-get install -y texlive-generic-recommended
workdir /work
volume [ "/work" ]



cmd [ "/bin/bash" ]
