#!/usr/bin/env bash

main() {
    [ -x "$(command -v zsh)" ] && echo "zsh already is installed." || install
}

function install() {
    echo ➡️  Downloading and installing zsh! ...
    sudo apt-get install -y zsh > /dev/null

    echo ➡️  Downloading and installing zsh! ...
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null
    chsh -s $(which zsh)

    echo ➡️  Downloading and installing zsh plugins! ...
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-auytosuggestions
}

main; exit