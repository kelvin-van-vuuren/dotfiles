#!/usr/bin/env bash

source config.sh

sh setup_homebrew.sh

if [ $machine = Mac ]; then
	sh mac/mac-settings.sh
else 
	echo "Setting Linux settings" 
fi

sh setup_zsh.sh

[ ! -f $sshkeys ] && sh setup_git.sh || echo "SSH keys already generated. Skipping git setup."

[[ ! $(code --list-extensions) =~ "code-settings-sync" ]] && sh setup_vs_code.sh || echo "VSCode has already been set up."

killall Finder

echo "Setup script finished!"