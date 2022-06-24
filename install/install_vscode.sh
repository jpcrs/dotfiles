#!/usr/bin/env bash

main() {
    [ -x "$(command -v code)" ] && echo "vscode already is installed." || install
}

function install() {
    echo ➡️  Downloading and installing vscode! ...
    sudo apt-get install -y wget gpg > /dev/null
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg

    sudo apt-get install apt-transport-https > /dev/null
    (sudo apt-get update && sudo apt-get install -y code code-insider) > /dev/null
}

main; exit