#!/bin/sh
ls /sys/firmware/efi/efivars
timedatectl set-ntp true
# Shell的一些基本操作不是很会,只能暂时用这种基本笨的办法了
echo "" >> /etc/xdg/reflector/reflector.conf
echo "--save /etc/pacman.d/mirrorlist" >> /etc/xdg/reflector/reflector.conf
echo "--protocol https,http" >> /etc/xdg/reflector/reflector.conf
echo "--country China" >> /etc/xdg/reflector/reflector.conf
echo "--latest 5" >> /etc/xdg/reflector/reflector.conf
echo "--sort rate" >> /etc/xdg/reflector/reflector.conf
systemctl start reflector.service
pacstrap /mnt base linux linux-firmware linux-headers vim iwd man-db man-pages texinfo base-devel grub efibootmgr os-prober ntfs-3g bash-completion zsh zsh-completions git intel-ucode
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
