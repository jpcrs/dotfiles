#!/usr/bin/env bash

main() {
    [ -x "$(command -v asdf)" ] && echo "asdf already is installed." || install
}

function install() {
    export ASDF_DIR="$HOME/.asdf"
    if [ ! -d $ASDF_DIR ]; then
    echo ➡️  Downloading and installing asdf! ...
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
    fi
    
    echo '. $HOME/.asdf/asdf.sh' >> ~/.zshrc

    echo ➡️  Downloading and installing asdf dotnet-core! ...
    asdf plugin-add dotnet-core
    asdf install dotnet-core 6.0.301
    asdf global dotnet-core 6.0.301

    echo ➡️  Downloading and installing elixir! ...
    asdf plugin-add elixir
    asdf install elixir 1.13.4
    asdf global elixir 1.13.4

    echo ➡️  Downloading and installing golang! ...
    asdf plugin-add golang
    asdf install golang 1.18.3
    asdf global golang 1.18.3

    echo ➡️  Downloading and installing nodejs! ...
    asdf plugin-add nodejs
    asdf install nodejs 18.4.0
    asdf global nodejs 18.4.0
}

main; exit