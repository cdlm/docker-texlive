from dpollet/texlive:base
label description "Full TeXlive installation"

run apt install --yes --no-install-recommends \
        texlive-full \
        && \
    # would get done before each compile otherwise
    luaotfload-tool --update
