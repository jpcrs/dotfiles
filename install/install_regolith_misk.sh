#!/usr/bin/env bash

main() {
    install
}

function install() {
    echo ➡️  Downloading and installing regolith-themes! ...
    sudo apt-get install -y regolith-look-* > /dev/null
    regolith-look set gruvbox
    regolith-look refresh
    echo ➡️  Downloading and installing nerd-fonts! ...
    sudo apt-get install -y fonts-nerd-font-* > /dev/null
    echo ➡️  Removing i3xrocks temp! ...
    sudo apt-get install -y i3xrocks-temp > /dev/null
    echo ➡️  Removing i3xrocks unecessary entries! ...
    sudo apt-get remove -y i3xrocks-app-launcher i3xrocks-next-workspace i3xrocks-info > /dev/null
}

main; exit