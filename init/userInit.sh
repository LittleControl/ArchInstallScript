#!/bin/sh

git config --global user.name 'littlecontrol'
git config --global user.email 'i@littlecontrol.me'
git config --global user.autocrlf true
mkdir ~/Downloads && cd ~/Downloads
pacman -S go
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
yay -S sway swaylocl swayidle alacritty ulauncher
