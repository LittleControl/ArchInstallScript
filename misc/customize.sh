#!/bin/sh

FILE_DIR=`dirname $0`

# Grub Theme
mkdir -p ~/Downloads && cd ~/Downloads
git clone https://github.com/vinceliuice/grub2-themes.git
cd grub2-themes
sudo chmod +x ./install.sh
sudo ./install.sh -b -t tela

# Font Config
pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji

# Basic Software

yay -S firefox nodejs npm yarn visual-studio-code-bin lsof nss alacritty mvi mpv

# oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# sound driver
yay -S alsa-utils pulseaudio pulseaudio-alsa  pipewire pipewire-docs pipewire-alsa pipewire-pulse helvum 

# vim config

mkdir -p ~/.vim/{colors,autoload}
cd FILE_DIR 
cp ./vim/.vimrc ~/
cp -r ./vim/colors/* ~/.vim/colors/
cp -r ./vim/autoload/* ~/.vim/autoload/

# alacritty config

mkdir -p ~/.config/alacritty
cd FILE_DIR
cp ./alacritty.yml ~/.config/alacritty/
