#!/usr/bin/env bash

main() {
    [ -x "$(command -v brave-browser)" ] && echo "Brave already is installed." || install
}

function install() {
    echo ➡️  Downloading and installing brave! ...
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    (sudo apt-get update && sudo apt-get install -y brave-browser) > /dev/null
}

main; exit