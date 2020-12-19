
cat << EOF >> ~/.zprofile \
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" \
EOF




read -p "Enter personal access token: " accessToken
read -p "Enter gist id: " gistId