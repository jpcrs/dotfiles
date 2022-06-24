#!/usr/bin/env bash

packages=(
    com.jetbrains.Rider
    com.jetbrains.CLion
    com.jetbrains.IntelliJ-IDEA-Ultimate
    md.obsidian.Obsidian
)

main() {
    for pkg in "${packages[@]}"
    do
        verify_install $pkg
    done
}

verify_install() {
    [ "$(flatpak list | grep $1)" ] && echo "$1 already is installed." || install $1
}

install() {
    echo ➡️  Downloading and installing $1! ...
    flatpak install flathub $1 -y
}

main; exit