
function start_hyper {
	osascript -e 'activate app "Hyper"
	repeat until application "Hyper" is running
		delay 0.5
	end repeat'
	sleep 1
}

function quit_hyper {
	osascript -e 'quit app "Hyper"'
}

start_hyper

hyper i hyper-sync-settings

# downgrade hyper-sync-settings to 3.0.0 to get around issue with dugite library not being able to find git
# will keep and eye on the repo to see when maintainers fix this
~/.hyper_plugins & npm i --save hyper-sync-settings@3.0.0

read -p "First time setup? (y/n): " firstTimeSetup
if [ $firstTimeSetup == "y" ] 
then
	read -p "Use kelvin settings as starting point? (y/n): "
	if [ ${REPLY} == "y" ] 
	then
		# download from kelvin settings
		git clone git@gist.github.com:904f8f7c3780580178027b1121545c3f.git
		cp ./904f8f7c3780580178027b1121545c3f/.hyper.js ~/.hyper.js
		rm -rf 904f8f7c3780580178027b1121545c3f
	fi

	open https://gist.github.com/
	echo "Create a secret Gist on Github via https://gist.github.com/"
	read -p "Press [Enter] key to continue after doing this..."
fi

open https://github.com/settings/tokens/new?scopes=gist
echo "Create a new personal access token for this machine via https://github.com/settings/tokens/new?scopes=gist"
read -p "Press [Enter] key to continue after doing this..."

# setup access token and gist id to fetch settings
read -p "Enter personal access token: " accessToken
read -p "Enter Gist ID (end section of Gist URL): " gistId
printf '{\n\t"personalAccessToken": "'"$accessToken"'",\n\t"gistId": "'"$gistId"'"\n}\n' > ~/.hyper_plugins/.hyper-sync-settings.json

quit_hyper
start_hyper

if [ $firstTimeSetup == "y" ] 
then
	echo -e "Go to Hyper App and on the menu bar click Plugins -> Sync Settings -> Backup Settings to upload settings to your Github."
else
	echo -e "Go to Hyper App and on the menu bar click Plugins -> Sync Settings -> Restore Settings to download settings from your Github."
fi
read -p "Press [Enter] key to continue after doing this..."
