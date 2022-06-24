.PHONY: apt rust alacritty asdf brave flatpak flatpakutilities nvim rust starship vscode dots
.SILENT: apt rust alacritty asdf brave flatpak flatpakutilities nvim rust starship vscode dots

install_dir = install

help : ## Show this help. See README.rst for appropriate run order of these commands
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

alacritty : ## Install Alacritty [See: install/install_alacritty.sh]
	bash $(install_dir)/install_alacritty.sh

apt : ## Install a list of tools [See: install/install_apt_utilities.sh]
	bash $(install_dir)/install_apt_utilities.sh

asdf : ## Install Alacritty [See: install/install_asdf.sh]
	bash $(install_dir)/install_asdf.sh

brave : ## Install Brave [See: install/install_brave.sh]
	bash $(install_dir)/install_brave.sh

flatpak : ## Install Flatpak [See: install/install_flatpak.sh]
	bash $(install_dir)/install_flatpak.sh

flatpakutilities : ## Install a list of flatpak tools [See: install/install_flatpak_utilities.sh]
	bash $(install_dir)/install_flatpak_utilities.sh

nvim : ## Install neovim [See: install/install_neovim.sh]
	bash $(install_dir)/install_neovim.sh

rust : ## Install Rust [See: install/install_rust.sh]
	bash $(install_dir)/install_rust.sh

starship : ## Install starship [See: install/install_starship.sh]
	bash $(install_dir)/install_starship.sh

vscode : ## Install vscode [See: installjk/install_vsdode.sh]
	bash $(install_dir)/install_vscode.sh

regolith-misk : ## Install regolith misk config [See: install/install_regolith_misk.sh]
	bash $(install_dir)/install_regolith_misk.sh

dots : ## Apply dotfiles config [See: install/install_dots.sh]
	bash $(install_dir)/install_dots.sh

zsh : ## Install zsh, ohmyzsh and some other plugins [See: install/install_zsh.sh]
	bash $(install_dir)/install_zsh.sh

all : apt zsh rust alacritty asdf brave flatpak flatpakutilities nvim rust starship vscode ## Install all scripts