setxkbmap -layout us
~/dotfiles/scripts/remaps
/bin/bash -c "sleep 1; /usr/bin/xmodmap /home/$USER/.Xmodmap"
xrandr --output DP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-D-1 --mode 1920x1080 --pos 3840x0 --rotate right
xwallpaper --stretch ~/Pictures/backgrounds/sunsetnord.png
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
dunst &
dwmblocks & 
picom -config &:
ssh-agent dwm
