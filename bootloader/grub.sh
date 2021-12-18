#!/bin/sh

## GRUB
pacman -S grub efibootmgr
sed -i '8a\GRUB_DISABLE_OS_PROBER=false' /etc/default/grub
sed -i '/^GRUB_DEFAULT/c\GRUB_DEFAULT=saved' /etc/default/grub
sed -i '/#GRUB_SAVEDEFAULT/c\GRUB_SAVEDEFAULT=true' /etc/default/grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
