#!/bin/bash

source config.sh

if is_mac; then
	xcode-select --install
	bash mac/mac-settings.sh
	bash setup_homebrew.sh
elif is_linux; then
	sudo apt install build-essential  
fi

bash setup_zsh.sh

bash install_packages.sh
bash install_applications.sh

[ ! -f $sshkeys ] && bash setup_git.sh || echo "SSH keys already generated. Skipping git setup."

[[ ! $(code --list-extensions) =~ "code-settings-sync" ]] && bash setup_vs_code.sh || echo "VSCode has already been set up."

echo "Setup script finished!"