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
brew install colima
brew install docker
brew install exa
brew install fd
brew install FelixKratz/formulae/sketchybar
brew install fmt
brew install fzf
brew install gh
brew install httpie
brew install koekeishiya/formulae/yabai
brew install kubernetes-cli
brew install mas
brew install neovim
brew install nnn
brew install ripgrep
brew install ruby
brew install sk
brew install skhd
brew install starship
brew install tldr
brew install tmux
brew install tree-sitter
brew install wget
brew install zoxide
brew install zsh

echo "➡️ Installing Brew Casks! ..."
brew install 1password
brew install alacritty
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
brew install postman
brew install qbittorrent
brew install raycast
brew install sf-symbols
brew install shottr
brew install spotify
brew install stats
brew install steam
brew install surfshark
brew install telegram
brew install todoist
brew install visual-studio-code
wget https://raw.githubusercontent.com/Homebrew/homebrew-cask-versions/master/Casks/visual-studio-code-insiders.rb -P ~/Downloads
brew install --build-from-source ~/Downloads/visual-studio-code-insiders.rb
rm ~/Downloads/visual-studio-code-insiders.rb

echo "➡️ Installing Brew Fonts! ..."
brew tap homebrew/cask-fonts
brew install font-3270-nerd-font
brew install font-agave-nerd-font
brew install font-anonymice-nerd-font
brew install font-arimo-nerd-font
brew install font-aurulent-nerd-font
brew install font-bigblue-terminal-nerd-font
brew install font-bitstream-vera-sans-mono-nerd-font
brew install font-blex-mono-nerd-font
brew install font-caskaydia-cove-nerd-font
brew install font-code-new-roman-nerd-font
brew install font-cousine-nerd-font
brew install font-daddy-time-mono-nerd-font
brew install font-dejavu-sans-mono-nerd-font
brew install font-droid-sans-mono-nerd-font
brew install font-fantasque-sans-mono-nerd-font
brew install font-fira-code-nerd-font
brew install font-fira-mono-nerd-font
brew install font-fontawesome
brew install font-go-mono-nerd-font
brew install font-gohufont-nerd-font
brew install font-hack-nerd-font
brew install font-hasklug-nerd-font
brew install font-heavy-data-nerd-font
brew install font-hurmit-nerd-font
brew install font-im-writing-nerd-font
brew install font-inconsolata-go-nerd-font
brew install font-inconsolata-lgc-nerd-font
brew install font-inconsolata-nerd-font
brew install font-iosevka-nerd-font
brew install font-jetbrains-mono
brew install font-jetbrains-mono-nerd-font
brew install font-lekton-nerd-font
brew install font-liberation-nerd-font
brew install font-lilex-nerd-font
brew install font-material-design-icons-webfont
brew install font-meslo-lg-nerd-font
brew install font-monofur-nerd-font
brew install font-monoid-nerd-font
brew install font-mononoki-nerd-font
brew install font-mplus-nerd-font
brew install font-noto-nerd-font
brew install font-open-dyslexic-nerd-font
brew install font-overpass-nerd-font
brew install font-profont-nerd-font
brew install font-proggy-clean-tt-nerd-font
brew install font-roboto-mono-nerd-font
brew install font-sauce-code-pro-nerd-font
brew install font-sf-pro
brew install font-shure-tech-mono-nerd-font
brew install font-space-mono-nerd-font
brew install font-symbols-only-nerd-font
brew install font-terminess-ttf-nerd-font
brew install font-tinos-nerd-font
brew install font-ubuntu-mono-nerd-font
brew install font-ubuntu-nerd-font
brew install font-victor-mono-nerd-font

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
brew services start sketchybar
brew services start skhd
brew services start yabai

echo "➡️ Installing npm tools! ..."
# Install npm tools 
npm install -g typescript yo githubnext/github-copilot-cli corepack vsce

echo "➡️ Installing cargo tools! ..."
# Install cargo tools
cargo install afl
cargo install binocular-cli
cargo install cargo-bloat
cargo install cargo-edit
cargo install cargo-expand
cargo install cargo-instruments
cargo install cargo-show-asm
cargo install cargo-watch
cargo install rust-script

echo "➡️ Changing mac defaults! ..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
