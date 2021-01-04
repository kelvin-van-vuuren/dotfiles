#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting up Zsh plugins..."
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
git clone git://github.com/zsh-users/zsh-autosuggestions.git
git clone git://github.com/zsh-users/zsh-history-substring-search.git

echo "Setting ZSH as shell..."
if [ ! $(echo $0) = "zsh" ]; then
	chsh -s /bin/zsh
fi