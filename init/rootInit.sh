#!/bin/sh

timedatectl set-ntp true
hwclock -w
pacman -S reflector btrfs-progs terminus-font
setfont ter-124b zsh grml-zsh-config
cp ../vim/.vimrc ~/
# Shell的一些基本操作不是很会,只能暂时用这种基本笨的办法了
echo "" >> /etc/xdg/reflector/reflector.conf
echo "--save /etc/pacman.d/mirrorlist" >> /etc/xdg/reflector/reflector.conf
echo "--protocol https,http" >> /etc/xdg/reflector/reflector.conf
echo "--country China" >> /etc/xdg/reflector/reflector.conf
echo "--latest 5" >> /etc/xdg/reflector/reflector.conf
echo "--sort rate" >> /etc/xdg/reflector/reflector.conf
systemctl start reflector.service
useradd -m -G wheel -s /usr/bin/zsh archer
chmod +w /etc/sudoers
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chmod -w /etc/sudoers
passwd archer
exit
