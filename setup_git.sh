#!/usr/bin/env bash

read -p "Setup new ssh keys? (y/n): "
if [ ${REPLY} == "y" ] then
	ssh-keygen -t rsa

	echo "Please add this public key to Github via following link:\n"
	echo "https://github.com/account/ssh \n"
	read -p "Press [Enter] key after this..."
fi

read -p "Enter full name (to show on commits): " name
read -p "Enter Github email: " email
git config --global user.name "$name"
git config --global user.email "$email"