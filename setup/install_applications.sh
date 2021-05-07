#!/usr/bin/env bash

source ../applications.sh
if is_mac; then install="brew install --cask --appdir=\"/Applications\""; fi
$install ${applications[@]} 

if is_linux; then
	mkdir deb_downloads
	for key in ${!applications_wget[@]}; do
		wget -O deb_downloads/${key}.deb ${applications_wget[${key}]}
		$install ./deb_downloads/${key}.deb
	done
	rm -rf deb_downloads
fi