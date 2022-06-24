#!/usr/bin/env bash

main() {
    [ -x "$(command -v cargo)" ] && echo "rust already is installed." || install
}

function install() {
    echo ➡️  Downloading and installing rust! ...
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source $HOME/.cargo/env
}

main; exit