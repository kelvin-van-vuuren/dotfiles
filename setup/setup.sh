#!/usr/bin/env bash

source config.sh

# if [ $machine = Mac ]; then
# 	echo "Installing Mac Xcode Command Line Tools..."
# 	xcode-select --install
# fi

#setup homebrew and install packages / apps
sh setup_homebrew.sh

if [ $machine = Mac ]; then
	sh mac/mac-settings.sh
fi

#setup zsh via oh my zsh and change to default shell
sh setup_zsh.sh

#if mac set system settings


if [ ! -f $sshkeys ]; then
	sh setup_git.sh
fi

# read -p "Use hyper settings sync? (y/n): "
# if [ ${REPLY} == "y" ] 
# then
# 	sh setup_hyper_settings.sh
# fi

read -p "Use vs-code settings sync? (y/n): "
if [ ${REPLY} == "y" ] 
then 
	sh setup_vs_code.sh
fi

killall Finder

echo "Done!"