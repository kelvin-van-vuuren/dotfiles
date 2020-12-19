
#install vs code settings sync
/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code --install-extension shan.code-settings-sync

read -p "Enter personal access token: " accessToken
read -p "Enter gist id: " gistId

# /Users/$USER/Library/Application Support/Code/User/syncLocalSettings.json
# # "token": "62e0bd312378de6714ff10cdfee4afeb31c534d7",
# /Users/$USER/Library/Application Support/Code/User/settings.json
# # "sync.gist": "20c88baae23450a682c85301b283c6c0",

#set access token + gist id and turn on auto upload / auto download
sed -i '' -e 's/"token":.*/"token": "$accessToken",/' /Users/$USER/Library/Application Support/Code/User/syncLocalSettings.json
sed -i '' -e 's/"sync.gist":.*/"sync.gist": "$gistId",/' /Users/$USER/Library/Application Support/Code/User/settings.json
sed -i '' -e 's/"sync.autoUpload":.*/"sync.autoUpload": true,/' /Users/$USER/Library/Application Support/Code/User/settings.json 
sed -i '' -e 's/"sync.forceDownload":.*/"sync.forceDownload": true/' /Users/$USER/Library/Application Support/Code/User/settings.json 


osascript -e 'activate app "Visual Studio Code"' &
wait %1
sleep 2
osascript -e 'quit app "Visual Studio Code"'

