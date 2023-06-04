<div align="center">
    <h1>🏠</h1>
</div>
<div align="center">
Configuration files for my <a href="https://en.wikipedia.org/wiki/Tiling_window_manager">tiling window manager</a> / <a href="https://en.wikipedia.org/wiki/Terminal_emulator">terminal</a> based <a href="https://en.wikipedia.org/wiki/Linux">Linux</a> setup.
</div>
<p></p>
<div align="center">
    	<a href="https://github.com/kelvin-van-vuuren/dotfiles#about">About</a>
  <span> • </span>
       	<a href="https://github.com/kelvin-van-vuuren/dotfiles#structure">Structure</a>
  <span> • </span>
	<a href="https://github.com/kelvin-van-vuuren/dotfiles#Usage">Usage</a>
  <span> • </span>
       	<a href="https://github.com/kelvin-van-vuuren/dotfiles#screenshots">Screenshots</a>
  <span> • </span>
	<a href="https://github.com/kelvin-van-vuuren/dotfiles#Install">Install</a>
  <span> • </span>
	<a href="https://github.com/kelvin-van-vuuren/dotfiles#Manage">Manage</a>
  <p></p>
</div>

![2023-03-21-144708_3840x2160_scrot](https://user-images.githubusercontent.com/54939625/226643470-512a4f22-9fdb-465f-99fb-4eb83d32eb14.png)

### About
My [dotfiles](https://wiki.archlinux.org/title/Dotfiles), managed via [git bare repos](https://www.atlassian.com/git/tutorials/dotfiles). This setup is not designed to be used with a [Desktop Environment](https://wiki.archlinux.org/title/Desktop_environment). Instead, it relies on my fork of [dwm](https://github.com/kelvin-van-vuuren/dwm) to provide window management and a series of shell scripts to start programs and set environment variables upon login. To follow the startup process, start at [``zprofile``](https://github.com/kelvin-van-vuuren/dotfiles/blob/main/.config/zsh/zprofile), which is automatically executed by [zsh](https://www.zsh.org/) after successfully logging in to a [tty](https://en.wikipedia.org/wiki/Virtual_console) session. This is the beginning of a chain of scripts that eventually complete the system setup.

### Structure
The structure of the repo follows the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) which specifies where different folders / files should be stored and looked for. As such, the majority of this setup is stored across the following two folders:
#### ``.config``
The single base directory relative to which user-specific configuration files should be written. Config for the following programs is provided, most of which are [terminal](https://en.wikipedia.org/wiki/Terminal_emulator) based / [cli](https://en.wikipedia.org/wiki/Command-line_interface) applications:
* [**X11**](https://www.x.org): an open source implementation of the [X Window System](https://en.wikipedia.org/wiki/X_Window_System) (graphics server). Config includes [X Server](https://www.x.org/wiki/XServer/) startup script, key remaps and [Xresources](https://wiki.archlinux.org/title/X_resources).
* [**dwm**](https://github.com/kelvin-van-vuuren/dwm): my fork of the tiling window manager [dwm](https://dwm.suckless.org), providing added functionality and changes to appearance.
* [**st**](https://github.com/kelvin-van-vuuren/st): my fork of the simple terminal emulator [st](https://st.suckless.org), providing added functionality and changes to appearance.
* [**dmenu**](https://github.com/kelvin-van-vuuren/dmenu): my fork of [dmenu](https://suckless.org/tools/dmenu), a fast and dynamic menu for [X](https://www.x.org).
* [**slock**](https://github.com/kelvin-van-vuuren/slock): my fork of [slock](https://suckless.org/tools/slock), a simple display locker.
* [**nvim**](https://github.com/kelvin-van-vuuren/nvim): my config of [Neovim](https://neovim.io/), a modal text editor, using [NvChad](https://nvchad.com/) as a base.
* [**zsh**](https://www.zsh.org/): [shell](https://en.wikipedia.org/wiki/Unix_shell) config, [aliases](https://wiki.archlinux.org/title/Bash#Aliases) and a handful of associated [plugins](https://github.com/kelvin-van-vuuren/dotfiles/blob/main/.config/zsh/zshrc#L22).
* [**lf**](https://github.com/gokcehan/lf): terminal based file manager
* [**mpv**](https://mpv.io): command line video player.
* [**newsboat**](https://newsboat.org/): terminal based [RSS](https://en.wikipedia.org/wiki/RSS) feed reader.
* [**picom**](https://wiki.archlinux.org/title/Picom): standalone compositor for [Xorg](https://wiki.archlinux.org/title/Xorg).
* [**redshift**](https://wiki.archlinux.org/title/Redshift): adjusts screen colour temperature according to time of day. May help your eyes whilst working at night or in low light levels.
* [**zathura**](https://wiki.archlinux.org/title/Zathura): document viewer with vi-style keybindings.
* [**GTK**](https://wiki.archlinux.org/title/GTK): settings for GTK 2.0 + 3.0 which are used by some graphical applications.
* [**dunst**](https://wiki.archlinux.org/title/Dunst): lightweight notification daemon. Icons stored in [``.local/share/icons``](https://github.com/kelvin-van-vuuren/dotfiles/tree/main/.local/share/icons/dunst).
* [**fontconfig**](https://wiki.archlinux.org/title/Font_configuration): font configuration to be read by applications.
* [**yt-dlp**](https://github.com/yt-dlp/yt-dlp): a [youtube-dl](https://youtube-dl.org/) fork with additional features and fixes.
* [**cron**](https://wiki.archlinux.org/title/Cron): time based scheduler. Provides a local crontab to check for mail, rss and package updates.
* [**clangd**](https://clangd.llvm.org/): language server for C / C++.
* [**git**](https://git-scm.com/): config for git, a distributed version control system.
* [**mpd**](https://www.musicpd.org/): server daemon for playing music which can be controlled via its network protocol.
* [**ncmpcpp**](https://github.com/ncmpcpp/ncmpcpp): terminal based mpd client.
* [**mimeapps.list**](https://wiki.archlinux.org/title/XDG_MIME_Applications#mimeapps.list): specify programs to open various mime types.
#### ``.local``
The single base directory relative to where user-specific data / executable should be stored.
* ``bin``: various scripts. This is added to [zsh](https://github.com/kelvin-van-vuuren/dotfiles/tree/main/.local/bin)'s ``$PATH`` variable so that anything in ``.local/bin`` can be executed without a path prefix.
* ``share``: user data such as [desktop entries](https://wiki.archlinux.org/title/Desktop_entries), wallpapers, fonts and icons.

### Usage
To get an idea of how to use this setup, see my forks of [dwm](https://github.com/kelvin-van-vuuren/dwm) and [st](https://github.com/kelvin-van-vuuren/st).

### Screenshots
![2023-03-21-154845_3840x2160_scrot](https://user-images.githubusercontent.com/54939625/226665822-716d4a5d-81b6-440d-9e68-880c0c88b877.png)
![dunst-notification](https://user-images.githubusercontent.com/54939625/226697125-7f401d13-d05b-49d5-873e-ce81fca44300.jpg)
![setup](https://user-images.githubusercontent.com/54939625/226666178-e03048f6-8551-4040-9af4-70a63593b899.jpg)
![2023-03-21-160246_3840x2160_scrot](https://user-images.githubusercontent.com/54939625/226668497-addfb5ad-2bf1-4041-bfbc-19214bfb0390.png)

https://user-images.githubusercontent.com/54939625/226586165-a95ae9f0-aba2-4bc2-9981-6b60cd5c84df.mp4


### Installation
#### Install
1) Clone repository
```
git clone --bare git@github.com:kelvin-van-vuuren/dotfiles.git $HOME/.dotfiles
```
2) Create folder to backup any pre-existing dotfiles that will clash with setup
```
cd ${HOME} && mkdir -p .dotfiles-backup
```
3) Create folder structure in .dotfiles-backup
```
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} \
| sed 's%/[^/]*$%%' | uniq | xargs -I{} mkdir -p {} .dotfiles-backup/{} 
```
4) Move pre-existing dotfiles into corresponding locations in .dotfiles-backup
```
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} \
| xargs -I{} mv {} .dotfiles-backup/{}
```
5) Now check out
```
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```
6) Source new zshrc to get dotfiles alias
```
source $HOME/.config/zsh/zshrc
```
7) Hide untracked files
```
dotfiles config --local status.showUntrackedFiles no
```
8) Initialise submodules (nvim + dwm + st + dmenu)
```
dotfiles submodule update --init --recursive
```
9) Setup suckless programs: dwm (window manager), st (terminal), dmenu (program launcher) and slock (screen locker)
```
cd .config/suckless/dwm && sudo make clean install && cd ../st && sudo make clean install && \
cd ../dmenu && sudo make clean install && cd ../slock && sudo make clean install
```
10) Setup nvim: backup previous nvim share folder then run nvim to install plugins + language servers
```
cd {$HOME} && mv .local/share/nvim .local/share/nvim-backup && nvim
```

#### Manage
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
