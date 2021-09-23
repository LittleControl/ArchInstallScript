#!/bin/sh

git config --global user.name 'littlecontrol'
git config --global user.email 'i@littlecontrol.me'
git config --global user.autocrlf true
cp /etc/zsh/zshrc ~/.zshrc
mkdir ~/Downloads && cd ~/Downloads
pacman -S go
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
