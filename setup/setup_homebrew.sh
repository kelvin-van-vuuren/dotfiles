# Check for Homebrew and install if not already
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Exit if, for some reason, Homebrew is not installed
[[ ! "$(type -P brew)" ]] && echo "Homebrew failed to install." && return 1

echo "Updating homebrew..."
brew doctor
brew update

ln -s "$(brew --prefix llvm)/bin/clang-tidy" "/usr/local/bin/clang-tidy"
brew cleanup

