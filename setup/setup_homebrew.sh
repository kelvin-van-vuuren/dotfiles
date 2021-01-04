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
	node
	llvm
	jq
	shellcheck
	the_silver_searcher
)

brew install ${packages[@]}

#setup clang-tidy
ln -s "$(brew --prefix llvm)/bin/clang-tidy" "/usr/local/bin/clang-tidy"

echo "Cleaning up brew"
brew cleanup

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --cask --no-quarantine --appdir="/Applications" google-chrome
brew install --cask --no-quarantine --appdir="/Applications" sublime-text
brew install --cask --no-quarantine --appdir="/Applications" visual-studio-code
brew install --cask --no-quarantine --appdir="/Applications" hyper
brew install --cask --no-quarantine --appdir="/Applications" fiji
brew install --cask --no-quarantine --appdir="/Applications" slack

brew cleanup
