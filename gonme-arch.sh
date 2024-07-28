#!/bin/bash

#yay the AUR helper needs to be isntalled to do most of the installs. It gets isntalled first.
yes | sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
returnPath=$PWD
cd yay
makepkg -si
cd $returnPath

#flatpak because evrything is shit
yes | sudo pacman -S flatpak

#update yo self madafaka
sudo pacman -Sy

#Gnome custom stuff
sudo pacman -S dconf-editor gnome-shell-extensions
flatpak install flathub com.mattjakeman.ExtensionManager
yay -S yaru-icon-theme yaru-gnome-shell-theme yaru-gtksourceview-theme yaru-gtk-theme yaru-sound-theme ttf-ubuntu-font-family

#gaming
sudo pacman -S wine lutris steam
#wine sound packages
sudo pacman -S lib32-alsa-plugins lib32-libpulse lib32-openal

#advenced features
sudo pacman -S doublecmd-gtk2 meld bash-completion qpwgraph syncthing zed deluge-gtk piper

#common desktop
sudo pacman -S thunderbird inkscape gimp spotify-launcher
flatpak install flathub org.ferdium.Ferdium org.onlyoffice.desktopeditors md.obsidian.Obsidian
yay -S eyedropper


########################
#Service cunfigurations#
########################

#rust as service
rustdesk
sudo systemctl enable rustdesk.service

#rust as service
sudo systemctl enable syncthing@$USER.service

#QEMU virt-manager config
sudo systemctl start libvirtd.service virtlogd.service
sudo systemctl enable libvirtd.service virtlogd.service
sudo pacman -S ebtables dnsmasq
sudo virsh net-start default
sudo virsh net-autostart default
sudo usermod -aG libvirt $USER
