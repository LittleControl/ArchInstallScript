#!/bin/sh

echo "set time sync"
timedatectl set-ntp true
echo "--save /etc/pacman.d/mirrorlist" > /etc/xdg/reflector/reflector.conf
echo "--protocol https" >> /etc/xdg/reflector/reflector.conf
echo "--country China" >> /etc/xdg/reflector/reflector.conf
echo "--latest 5" >> /etc/xdg/reflector/reflector.conf
echo "--sort rate" >> /etc/xdg/reflector/reflector.conf
echo "Selecting the fastest mirror, please wait..."
systemctl start reflector.service
echo "Mirror selection completed..."
pacstrap /mnt base linux linux-firmware linux-headers neovim iwd man-db man-pages texinfo base-devel bash-completion zsh git amd-ucode btrfs-progs
genfstab -U /mnt >> /mnt/etc/fstab
