#!/usr/bin/env bash
echo "Setting up SSH Keys + Git..."

read -p "Enter full name (to show on commits): " name
read -p "Enter Github email: " email
git config --global user.name "$name"
git config --global user.email "$email"

eval "$(ssh-agent -s)"
echo "Creating ssh keys. Use default name and location for key files. Make sure to add a passphrase:"
ssh-keygen -t ed25519 -C "$email"

echo "Host *\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config
ssh-add -K ~/.ssh/id_ed25519

pbcopy < ~/.ssh/id_ed25519.pub

open https://github.com/account/ssh
echo "Please add this public key to Github via following link:\n"
echo "https://github.com/account/ssh \n"
echo "On the top right click new SSH Key.\nEnter a name for the key in the Title field (eg: crick-macbook)\nRight click + paste in the Key field to enter your new public key (it has already been copied to your clipboard)\nFinally, press the Add SSH Key button to finish. \n"
echo "If you need to copy the key again then open a new terminal and run: pbcopy < ~/.ssh/id_ed25519.pub"
read -p "Press [Enter] key to continue after doing this..."

echo "Finished setting up SSH Keys + Git."