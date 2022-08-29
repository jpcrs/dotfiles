#!/usr/bin/env bash

main() {
    [ -x "$(command -v nvim)" ] && echo "nvim already is installed." || install
}

function install() {
    echo ➡️  Downloading and installing nvim! ...
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb -P $HOME/Downloads
    sudo apt-get install -y $HOME/Downloads/nvim-linux64.deb > /dev/null
    rm $HOME/Downloads/nvim-linux64.deb
}

main; exit
