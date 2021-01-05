#Install Zsh & Oh My Zsh
echo "Setting up ZSH..."

echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting up Zsh plugins..."
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
git clone git://github.com/zsh-users/zsh-autosuggestions.git
git clone git://github.com/zsh-users/zsh-history-substring-search.git

[[ ! $(echo $0) =~ "zsh" ]] && { echo "Setting ZSH as shell..."; chsh -s /bin/zsh } || echo "Shell is already set to ZSH..."

echo "Finished setting up ZSH."
