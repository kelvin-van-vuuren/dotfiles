#!/usr/bin/env bash

echo "Mac Xcode Command Line Tools"
xcode-select --install

#setup homebrew and install packages / apps
sh setup_homebrew.sh

#setup zsh via oh my zsh and change to default shell
sh setup_zsh.sh

read -p "Setup git config? (y/n): "
if [ ${REPLY} == "y" ] 
then
	sh setup_git.sh
fi

read -p "Use hyper settings sync? (y/n): "
if [ ${REPLY} == "y" ] 
then
	sh setup_hyper_settings.sh
fi

read -p "Use vs-code settings sync? (y/n): "
if [ ${REPLY} == "y" ] 
then 
	sh setup_vs_code.sh
fi

killall Finder

echo "Done!"