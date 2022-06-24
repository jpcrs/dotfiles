#!/usr/bin/env bash

packages=(
    git
    curl
    bat
    jq
    tldr
    fzf
    fd-find
    ripgrep
    htop
    httpie
    nmap
    gh
    xclip
    exa

    #
    build-essentials
    cmake
    pkg-config
    libfreetype6-dev
    libfontconfig1-dev
    libxcb-xfixes0-dev
    libxkbcommon-dev
    python3

    #
    telegram-desktop
    flameshot
)

main() {
    for pkg in "${packages[@]}"
    do
        verify_install $pkg
    done
}

verify_install() {
    [ -x "$(command -v $1)" ] && echo "$1 already is installed." || install $1
}

install() {
    echo ➡️  Downloading and installing $1! ...
    sudo apt-get install -y $1 > /dev/null
}

main; exit