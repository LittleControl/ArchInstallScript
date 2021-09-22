#!/bin/sh
ls /sys/firmware/efi/efivars
timedatectl set-ntp true
pacstrap /mnt base linux linux-firmware linux-headers vim iwd man-db man-pages texinfo base-devel grub efibootmgr os-prober ntfs-3g
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
