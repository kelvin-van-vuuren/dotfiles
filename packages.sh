#!/usr/bin/env bash

packages=(
 	git
	cmake
	python
	tree
	llvm
	jq
	shellcheck
	clang-tidy
)

if is_mac; then
	packages+=(
		glew
		glfw
		node
		the_silver_searcher
	)
elif is_linux; then
	packages+=(
		libglew2.1
		libglfw3
		nodejs
		silversearcher-ag
	)
fi

