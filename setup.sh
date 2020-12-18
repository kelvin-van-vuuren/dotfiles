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

echo "Cleaning up brew"
brew cleanup

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting up Zsh plugins..."
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
git clone git://github.com/zsh-users/zsh-autosuggestions.git
git clone git://github.com/zsh-users/zsh-history-substring-search.git

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

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
brew cask install --appdir="/Applications" ${apps[@]}

brew cask cleanup
brew cleanup

killall Finder

echo "Done!"
