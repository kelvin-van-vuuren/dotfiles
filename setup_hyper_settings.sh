rm ~/.hyper.js

reload_hyper

#add hyper-sync-settings and reload to install
sed -i '' -e 's/plugins: \[\]/plugins: \[ '\''hyper-sync-settings'\'' \]/g' ~/.hyper.js

reload_hyper

# downgrade hyper-sync-settings to 3.0.0 to get around issue with dugite library not being able to find git
# will keep and eye on the repo to see when maintainers fix this
~/.hyper_plugins & npm i --save hyper-sync-settings@3.0.0

reload_hyper

# setup access token and gist id to fetch settings
read -p "Enter personal access token: " accessToken
read -p "Enter gist id: " gistId
rm ~/.hyper_plugins/.hyper-sync-settings.json
echo "{\n\t\"personalAccessToken\": \"$accessToken\",\n\"gistId\": \"$gistId\"\n}" >> ~/.hyper_plugins/.hyper-sync-settings.json
echo "To pull settings open Hyper and go to Plugins -> Sync Settings -> Restore Settings"

reload_hyper

function reload_hyper {
	osascript -e 'activate app "Hyper"' &
	wait %1
	sleep 2
	osascript -e 'quit app "Hyper"'
}