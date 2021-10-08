#!/bin/sh

# sudo git config --global user.name 'littlecontrol'
# sudo git config --global user.email 'i@littlecontrol.me'
# sudo git config --global user.autocrlf input
cp /etc/zsh/zshrc ~/.zshrc
mkdir ~/Downloads && cd ~/Downloads
sudo pacman -S go
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
