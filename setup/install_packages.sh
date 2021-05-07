#!/usr/bin/env bash

source ../packages.sh
$install ${packages[@]}

if is_mac; then
	ln -s "$(brew --prefix llvm)/bin/clang-tidy" "/usr/local/bin/clang-tidy"
	brew cleanup
fi