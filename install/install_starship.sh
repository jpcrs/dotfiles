#!/usr/bin/env bash

main() {
    [ -x "$(command -v starship)" ] && echo "starship already is installed." || install
}

function install() {
    echo ➡️  Downloading and installing starship! ...
    curl -sS https://starship.rs/install.sh | sh
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    sudo apt-get install -y fonts-noto-color-emoji > /dev/null
}

main; exit