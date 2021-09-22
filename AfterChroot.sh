#!/bin/sh

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "Inspiron" >> /etc/hostname
echo "127.0.0.1     Inspiron" >> /etc/hosts
echo "::1           Inspiron" >> /etc/hosts
echo "127.0.1.1     Inspiron.localdomain  Inspiron" >> /etc/hosts
echo "COMPRESSION="zstd"" >> /etc/mkinitcpio.conf
mkinitcpio -P linux
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
passwd root
umount -R /mnt
reboot
