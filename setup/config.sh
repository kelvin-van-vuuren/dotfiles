#!/usr/bin/env bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     os=Linux
				package_manager=apt
				copy_to_clipboard="xclip -selection clipboard -i"
				open_webpage=xdg-open;;
    Darwin*)    os=Mac
				package_manager=brew
				copy_to_clipboard="pbcopy <"
				open_webpage=open;;
    CYGWIN*)    os=Cygwin;;
    MINGW*)     os=MinGw;;
    *)          os="UNKNOWN:${unameOut}"
esac

sshkeys="$HOME/.ssh/id_ed25519"
install="$package_manager install"

function is_mac {
	[[ $os == Mac ]] && return 0 || return 1
}

function is_linux {
	[[ $os == Linux ]] && return 0 || return 1	
}

export os
export sshkeys
export package_manager
export install
export copy_to_clipboard
export open_webpage
export -f is_mac
export -f is_linux