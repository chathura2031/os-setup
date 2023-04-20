#!/bin/bash
BASE='Setup files'
DEFAULT_IFS=$IFS
GREEN="\033[0;32m"
BLUE="\033[0;34m"
NC="\033[0m"

printf "\n${BLUE}===>Updating existing packages...${NC}\n"
sudo apt update -y
sudo apt upgrade -y
printf "\n${BLUE}===>Installing udisks2...${NC}\n"
sudo apt install udisks2 -y
printf "\n${BLUE}===>Installing vim...${NC}\n"
sudo apt install vim -y

printf "\n${BLUE}===>Installing openbox (window manager)...${NC}\n"
sudo apt install xorg -y
sudo apt install openbox -y
sudo apt install obconf -y
printf "\n${BLUE}===>Installing tint2 (panel manager)...${NC}\n"
sudo apt install tint2 -y
printf "\n${BLUE}===>Installing xcompmgr (compositor)...${NC}\n"
sudo apt install xcompmgr -y
printf "\n${BLUE}===>Installing nitrogen (desktop background browser/setter)...${NC}\n"
sudo apt install nitrogen -y
printf "\n${BLUE}===>Installing yakuake...${NC}\n"
sudo apt install yakuake -y
printf "\n${BLUE}===>Installing audio packages...${NC}\n"
sudo apt install pavucontrol -y
# TODO: Figure out how to control audio through cli using pacmd
# These a not needed?:
# sudo apt install linux-sound-base -y
# sudo apt install alsa-base -y
# sudo apt install alsa-utils -y # using as a replacement to pulseaudio
printf "\n${BLUE}===>Installing xbacklight (brightness controller)...${NC}\n"
sudo apt install xbacklight -y
printf "\n${BLUE}===>Installing thunar (file manager)...${NC}\n"
sudo apt install thunar -y
printf "\n${BLUE}===>Installing ulauncher (app launcher)...${NC}\n"
sudo add-apt-repository ppa:agornostal/ulauncher
sudo apt update
sudo apt install ulauncher -y
printf "\n${BLUE}===>Installing jgmenu (menu)...${NC}\n"
sudo apt install jgmenu -y

printf "\n${BLUE}===>Installing mpv (video player)...${NC}\n"
sudo apt install mpv -y
printf "\n${BLUE}===>Installing git...${NC}\n"
sudo apt install git -y
printf "\n${BLUE}===>Installing flatpak...${NC}\n"
sudo apt install flatpak -y
printf "\n${BLUE}===>Installing zip...${NC}\n"
sudo apt install zip -y
printf "\n${BLUE}===>Installing unzip...${NC}\n"
sudo apt install unzip -y
printf "\n${BLUE}===>Installing xclip...${NC}\n"
sudo apt install xclip -y
printf "\n${BLUE}===>Installing qalqulate...${NC}\n"
sudo apt install qalculate-gtk -y
printf "\n${BLUE}===>Installing thunderbird...${NC}\n"
sudo apt install thunderbird -y
printf "\n${BLUE}===>Installing libreoffice...${NC}\n"
sudo apt install libreoffice -y
printf "\n${BLUE}===>Installing discord...${NC}\n"
sudo apt install discord -y
printf "\n${BLUE}===>Installing gimp...${NC}\n"
sudo apt install gimp -y
printf "\n${BLUE}===>Installing podman...${NC}\n"
sudo apt install podman -y

# Install chrome
printf "\n${BLUE}===>Installing ungoogled-chromium...${NC}\n"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub com.github.Eloston.UngoogledChromium -y

# Setup xbacklight
sudo cp -v xorg.conf /etc/X11

# Setup openbox
sudo cp -vr openbox/ /etc/xdg/

# Setup vim
sudo cp -v vimrc /etc/vim

# Setup tint2
mkdir -p ~/.config/tint2/
cp -v tint2rc ~/.config/tint2/

# Setup yakuake
mkdir -p ~/.config/
cp -v yakuakerc ~/.config/

# Setup nitrogen
cp -vr nitrogen/ ~/.config/
cp -vr Wallpapers/ ~/
sudo cp -vr Arc-Dark/ /usr/share/themes/

# Setup ulauncher
cp -vr ulauncher/ ~/.config/

# Setup the time
timedatectl set-timezone Australia/ACT

# Setup start menu
sudo cp -v start_menu /usr/sbin/
sudo chmod +x /usr/sbin/start_menu

# Setup muting script
sudo cp -v toggle_mute /usr/sbin/
sudo chmod +x /usr/sbin/toggle_mute
# lxpolkit
