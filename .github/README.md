# dotfiles
configuration files for *nix systems using x11

##### Installation:
```
# clone repository
git clone --bare --recurse-submodules git@github.com:kelvin-van-vuuren/dotfiles.git $HOME/.dotfiles

# checkout will move any pre-existing dotfiles that are in the way to a backup folder '.dotfiles-backup'
cd ${HOME}
mkdir -p .dotfiles-backup && \
# create missing directories in .dotfiles-backup
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | sed 's%/[^/]*$%%' | uniq | xargs -I{} mkdir -p {} .dotfiles-backup/{} && \
# move pre-existing dotfiles into corresponding locations in .dotfiles-backup
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}

# now check out
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

# hide untracked files
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

# source freshly cloned zshrc to get dotfiles alias
source $HOME/.config/zsh/zshrc

# recursively initialise submodules (nvim + dwm + st + dmenu)
dotfiles submodule update --init --recursive
```

##### Usage
The following alias, set in zshrc, is used to modify the git bare repo managing the dotfiles
```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
For example, if you create a new config for some program and want it to be added to the dotfiles repo:
```
mkdir .config/program-config
echo "config text for new program" >> .config/program-config/config
dotfiles add .config/program-config
dotfiles commit -m "Added new config file for a new program"
dotfiles push
```
