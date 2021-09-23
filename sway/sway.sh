#!/bin/sh

yay -S sway swaylock swayidle alacritty ulauncher
mkdir -p ~/.config/{sway,alacritty}
cp config ~/.config/sway/ 
cp ../misc/alacritty.yml ~/.conf/alacritty
