# Check for Homebrew and install if not already
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

# Install Brew Packages
packages=(
 	git
	glew
	glfw
	cmake
	python
	tree
	pytest
	node
	llvm
)

brew install ${packages[@]}

echo "Cleaning up brew"
brew cleanup

#setup clang-tidy
ln -s "$(brew --prefix llvm)/bin/clang-tidy" "/usr/local/bin/clang-tidy"

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