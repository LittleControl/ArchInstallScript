#!/bin/sh

# Grub Theme
mkdir -p ~/Downloads && cd ~Downloads
git clone https://github.com/vinceliuice/grub2-themes.git
cd grub2-themes
sudo chmod +x ./install.sh
sudo ./install.sh -b -t tela

# Font Config
pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji

# Basic Software

yay -S firefox nodejs npm yarn visual-studio-code-bin lsof nss

# oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# sound driver
yay -S alsa-utils pulseaudio pulseaudio-alsa  pipewire pipewire-docs pipewire-alsa pipewire-pulse helvum 
