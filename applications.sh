#!/usr/bin/env bash

applications=(
	sublime-text
	slack
)

if is_mac; then
	applications+=(
		google-chrome
		visual-studio-code
		hyper
		fiji
	)
fi

if is_linux; then
	applications+=(
		google-chrome-stable
	)

	declare -A applications_wget=(
		["hyper"]=https://releases.hyper.is/download/deb
		["code"]=https://go.microsoft.com/fwlink/?LinkID=760868
	)
fi