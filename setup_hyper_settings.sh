
function reload_hyper {
	osascript -e 'activate app "Hyper"' &
	wait %1
	sleep 2
	osascript -e 'quit app "Hyper"'
}

rm ~/.hyper.js

reload_hyper

#add hyper-sync-settings and reload to install
sed -i '' -e 's/plugins: \[\]/plugins: \[ '\''hyper-sync-settings'\'' \]/g' ~/.hyper.js

reload_hyper

# downgrade hyper-sync-settings to 3.0.0 to get around issue with dugite library not being able to find git
# will keep and eye on the repo to see when maintainers fix this
~/.hyper_plugins & npm i --save hyper-sync-settings@3.0.0

reload_hyper

read -p "First time setup? (y/n): " firstTimeSetup
if [ $firstTimeSetup == "y" ] 
then
	read -p "Use kelvin settings as starting point? (y/n): "
	if [ ${REPLY} == "y" ] 
	then
		git clone git@gist.github.com:904f8f7c3780580178027b1121545c3f.git
		cp ./.hyper.js ~/.hyper.js
	fi

	# download from kelvin settings
	echo "Create a secret Gist on Github via https://gist.github.com/"
	read -p "Press [Enter] key to continue after doing this..."
	#use kelvin settings as starting point? 
fi

echo "Create a new personal access token for this machine via https://github.com/settings/tokens/new?scopes=gist"
read -p "Press [Enter] key to continue after doing this..."

# setup access token and gist id to fetch settings
read -p "Enter personal access token: " accessToken
read -p "Enter Gist ID (end section of Gist URL): " gistId
rm ~/.hyper_plugins/.hyper-sync-settings.json
echo "{\n\t\"personalAccessToken\": \"$accessToken\",\n\"gistId\": \"$gistId\"\n}" >> ~/.hyper_plugins/.hyper-sync-settings.json

osascript -e 'activate app "Hyper"' &
wait %1

if [ $firstTimeSetup == "y" ] 
then
	#upload settings
	osascript -e 'tell application "System Events" to tell process "Hyper" to click menu item "Backup Settings" of menu 1 of menu item "Sync Settings" of menu 1 of menu bar item "Plugins" of menu bar 1' 
	delay 2
fi
#pull settings
osascript -e 'tell application "System Events" to tell process "Hyper" to click menu item "Restore Settings" of menu 1 of menu item "Sync Settings" of menu 1 of menu bar item "Plugins" of menu bar 1' 
delay 2
osascript -e 'quit app "Hyper"'
