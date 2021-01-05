#!/usr/bin/env bash

echo "Setting up VSCode..."
#osascript -e 'activate app "Visual Studio Code"' &
#wait %1

#install vs code settings sync
#/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension shan.code-settings-sync
code --install-extension shan.code-settings-sync

#open welcome to settings sync page for login
#osascript -e 'activate app "Visual Studio Code"' &
#wait %1
code

read -p "Login via Github on the Welcome to Settings Sync tab that will open in VS Code then press [Enter] key when done..."

echo "To download settings go to VSCode and open the Command Palette and enter the 'Sync: Download Settings' Command"