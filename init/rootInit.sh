#!/bin/sh
systemctl enable --now systemd-networkd.service
systemctl enable --now systemd-resolved.service
systemctl enable --now iwd.service
timedatectl set-ntp true
hwclock -w
pacman -S reflector terminus-font
setfont ter-124b
git config --system user.name 'littlecontrol'
git config --system user.email 'i@littlecontrol.me'
git config --system user.autocrlf input
cp misc/.vimrc ~/
echo "--save /etc/pacman.d/mirrorlist" > /etc/xdg/reflector/reflector.conf
echo "--country China" >> /etc/xdg/reflector/reflector.conf
echo "--latest 5" >> /etc/xdg/reflector/reflector.conf
echo "--sort rate" >> /etc/xdg/reflector/reflector.conf
echo "select fastest mirrors, plz wait..."
systemctl start reflector.service
useradd -m -G wheel -s /usr/bin/zsh archer
chmod +w /etc/sudoers
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sed -i 's/#wheel ALL=(ALL) NOPASSWD: ALL/wheel ALL=(ALL) NOPASSWD: ALL' /etc/sudoers
chmod -w /etc/sudoers
passwd archer
exit
