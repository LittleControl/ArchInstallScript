#!/bin/sh

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "Avalon" > /etc/hostname
# echo "127.0.0.1     Avalon" >> /etc/hosts
# echo "::1           Avalon" >> /etc/hosts
# echo "127.0.1.1     Avalon.localdomain  Avalon" >> /etc/hosts
sed -i 's/#COMPRESSION="zstd"/COMPRESSION="zstd"/g' /etc/mkinitcpio.conf
mkinitcpio -P

echo "please set your root password"
passwd root
echo "basic setting finished, now back to archiso"
echo "run umount -R /mnt to umount /mnt"
echo "run reboot to reboot system"
exit
