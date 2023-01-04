#!/bin/zsh
. linkdots.sh

echo "➡️ Linking dots! ..."
linkDotfile .aliases
linkDotfile .tmux.conf
linkDotfile .zshrc
linkDotfile .config/alacritty
linkDotfile .config/JetBrains
linkDotfile .config/karabiner
linkDotfile .config/linearmouse
linkDotfile .config/nvim
linkDotfile .config/sketchybar
linkDotfile .config/skhd
linkDotfile .config/vimari
linkDotfile .config/vimium
linkDotfile .config/vscode
linkDotfile .config/yabai
linkDotfile .config/starship.toml
linkDotfile .local/bin/binocular
linkDotfile .local/bin/keep
cp -r $(pwd)/.local/bin/git-fuzzy $HOME/.local/bin/git-fuzzy

echo "➡️  Installing commandline tools! ..."
xcode-select --install

echo "➡️  Installing brew! ..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

echo "➡️ Installing brew formulaes! ..."
brew install asdf
brew install bat
brew install btop
brew install coreutils
brew install fd
brew install fmt
brew install fzf
brew install gh
brew install httpie
brew install mas
brew install neovim
brew install nnn
brew install ripgrep
brew install ruby
brew install sk
brew install FelixKratz/formulae/sketchybar
brew install skhd
brew install starship
brew install tldr
brew install tmux
brew install tree-sitter
brew install koekeishiya/formulae/yabai
brew install wget
brew install zoxide
brew install zsh

echo "➡️ Installing Brew Casks! ..."
brew install 1password
brew install alacritty
brew install alt-tab
brew install brave-browser
brew install discord
brew install iina
brew install iterm2
brew install jetbrains-toolbox
brew install kap
brew install karabiner-elements
brew install linear-linear
brew install linearmouse
brew install notion
brew install orion
brew install qbittorrent
brew install raycast
brew install shottr
brew install spotify
brew install stats
brew install steam
brew install surfshark
brew install telegram
brew install textual
brew install todoist
brew install visual-studio-code
brew install warp
brew install whatsapp
wget https://raw.githubusercontent.com/Homebrew/homebrew-cask-versions/master/Casks/visual-studio-code-insiders.rb -P ~/Downloads
brew install --build-from-source ~/Downloads/visual-studio-code-insiders.rb
rm ~/Downloads/visual-studio-code-insiders.rb

echo "➡️ Installing Brew Fonts! ..."
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font
brew install font-fira-mono-nerd-font
brew install font-hack-nerd-font
brew install font-inconsolata-go-nerd-font
brew install font-inconsolata-lgc-nerd-font
brew install font-inconsolata-nerd-font
brew install font-iosevka-nerd-font
brew install font-jetbrains-mono-nerd-font
brew install font-jetbrains-mono
brew install font-material-design-icons-webfont
brew install font-sf-pro
brew install font-terminess-ttf-nerd-font

echo "➡️ Installing AppStore apps! ..."
mas install 1569813296 #1Password for Safari
mas install 985367838 #Outlook
mas install 1480933944 #Vimari
mas install 1091189122 #Bear
mas install 1287239339 #ColorSlurp
mas install 1289583905 #Pixelmator Pro

source $HOME/.zshrc

echo "➡️ Installing asdf packages! ..."
asdf plugin add dotnet
asdf install dotnet latest
asdf global dotnet latest

asdf plugin add elixir
asdf install elixir latest
asdf global elixir latest

asdf plugin add golang
asdf install golang latest
asdf global golang latest

asdf plugin add java
asdf install java openjdk-19.0.1
asdf global java openjdk-19.0.1

asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

asdf plugin add python
asdf install python latest
asdf global python latest

echo "➡️ Installing rustup! ..."
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# Start Services
echo "➡️ Installing brew services! ..."
brew services start skhd
brew services start yabai
brew services start sketchybar