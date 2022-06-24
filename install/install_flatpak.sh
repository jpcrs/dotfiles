#!/usr/bin/env bash

main() {
    [ -x "$(command -v flatpak)" ] && echo "flatpak already is installed." || install
}

function install() {
    echo ➡️  Downloading and installing flatpak! ...
    sudo apt-get install -y flatpak gnome-software-plugin-flatpak > /dev/null
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

main; exit