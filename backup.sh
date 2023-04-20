#!/bin/bash
GREEN="\033[0;32m"
BLUE="\033[0;34m"
NC="\033[0m"

# Backup xbacklight
cp -v /etc/X11/xorg.conf .

# Backup openbox
cp -vr /etc/xdg/openbox/ .

# Backup vim
cp -v /etc/vim/vimrc .

# Backup tint2
cp -v ~/.config/tint2/tint2rc .

# Backup yakuake
cp -v ~/.config/yakuakerc .

# Backup nitrogen
cp -vr ~/.config/nitrogen/ .
cp -vr ~/Wallpapers/ .
cp -vr /usr/share/themes/Arc-Dark/ .

# Backup ulauncher
cp -vr ~/.config/ulauncher/ .

# Backup start menu script
cp -v /usr/sbin/start_menu .

# Backup muting script
cp -v /usr/sbin/toggle_mute .
