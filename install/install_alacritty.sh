#!/usr/bin/env bash

main() {
    [ -x "$(command -v alacritty)" ] && echo "Alacritty already is installed." || install
}

function install() {
    echo ➡️  Downloading and installing alacritty! ...
    cargo install alacritty > /dev/null
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $HOME/.cargo/bin/alacritty 50
}

main; exit