#!/bin/sh

FILE_DIR=`dirname $0`
echo FILE_DIR
ls /sys/firmware/efi/efivars
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
pacstrap /mnt base linux linux-firmware linux-headers vim iwd man-db man-pages texinfo base-devel bash-completion zsh git amd-ucode
genfstab -U /mnt >> /mnt/etc/fstab
cd FILE_DIR
cp ./ArchInstallScript /mnt/root/
arch-chroot /mnt
