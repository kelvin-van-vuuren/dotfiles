#!/usr/bin/env bash

echo "Mac Xcode Command Line Tools"
xcode-select --install

# Check for Homebrew and install if not already
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

# Install Brew Packages
brew install git
brew install glew
brew install glfw
brew install cmake
brew install python
brew install tree
brew install pytest
brew install node

echo "Cleaning up brew"
brew cleanup

sh setup_zsh.sh

# Install MacOS Applications
apps=(
  google-chrome
  sublime-text
  visual-studio-code
  fiji
  hyper
  virtualbox
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew cask install --no-quarantine --appdir="/Applications" ${apps[@]}

brew cask cleanup
brew cleanup

read -p "Use hyper settings sync? (y/n): "
if [ ${REPLY} == "y" ]
then
	sh setup_hyper_settings.sh
fi

read -p "Use vs-code settings sync? (y/n): "
if [ ${REPLY} == "y" ]
then 
	read -p "Enter personal access token: " accessToken
	read -p "Enter gist id: " gistId
	echo "{\n\t\"personalAccessToken\": \"$accessToken\",\n\"gistId\": \"$gistId\"\n}" >> ~/.hyper_plugins/.hyper-sync-settings.json
fi

killall Finder

echo "Done!"
