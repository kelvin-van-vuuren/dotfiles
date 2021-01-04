#!/usr/bin/env bash

osascript -e 'activate app "Visual Studio Code"' &
wait %1

#install vs code settings sync
/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension shan.code-settings-sync

osascript -e 'quit app "Visual Studio Code"'

read -p "First time setup? (y/n): "
if [ ${REPLY} == "y" ] 
then
	# download from kelvin settings
	git clone git@gist.github.com:20c88baae23450a682c85301b283c6c0.git
	#install all extension from extensions.json
	extensions=( $(jq --raw-output '.[] | .metadata."publisherId"' ./20c88baae23450a682c85301b283c6c0/extensions.json) )
	for extension in "${extensions[@]}"
	do
   		/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension $extension
	done

	#copy settings 
	cp ./20c88baae23450a682c85301b283c6c0/settings.json ~/Library/Application\ Support/Code/User/settings.json
	cp ./20c88baae23450a682c85301b283c6c0/keyBindingsMac.json ~/Library/Application\ Support/Code/User/keybindings.json
	rm -rf 20c88baae23450a682c85301b283c6c0
fi

#open welcome to settings sync page for login
osascript -e 'activate app "Visual Studio Code"' &
wait %1

read -p "Login via Github on the Welcome to Settings Sync tab that will open in VS Code then press [Enter] key when done..."

echo "To download settings go to VSCode and open the Command Palette and enter the 'Sync: Download Settings' Command"