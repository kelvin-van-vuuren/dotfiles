# dotfiles
configuration files for *nix systems using x11

### Installation:
##### clone repository
```
git clone --bare git@github.com:kelvin-van-vuuren/dotfiles.git $HOME/.dotfiles
```
##### create folder to backup any pre-existing dotfiles that will clash with setup
```
cd ${HOME} && mkdir -p .dotfiles-backup
```
##### create folder structure in .dotfiles-backup
```
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} \
| sed 's%/[^/]*$%%' | uniq | xargs -I{} mkdir -p {} .dotfiles-backup/{} 
```
##### move pre-existing dotfiles into corresponding locations in .dotfiles-backup
```
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} \
| xargs -I{} mv {} .dotfiles-backup/{}
```
##### now check out
```
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```
##### source new zshrc to get dotfiles alias
```
source $HOME/.config/zsh/zshrc
```
##### hide untracked files
```
dotfiles config --local status.showUntrackedFiles no
```
##### initialise submodules (nvim + dwm + st + dmenu)
```
dotfiles submodule update --init --recursive
```

##### Setup suckless programs: dwm (window manager), st (terminal) and dmenu (program launcher)
```
cd .config/suckless/dwm && sudo make clean install && cd ../st && sudo make clean install && \
cd ../dmenu && sudo make clean install
```

##### Setup nvim: backup previous nvim share folder then run nvim to install plugins + language servers
```
cd {$HOME} && mv .local/share/nvim .local/share/nvim-backup && nvim
```

### Usage
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
