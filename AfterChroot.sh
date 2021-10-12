#!/bin/sh

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "Inspiron" > /etc/hostname
echo "127.0.0.1     Inspiron" >> /etc/hosts
echo "::1           Inspiron" >> /etc/hosts
echo "127.0.1.1     Inspiron.localdomain  Inspiron" >> /etc/hosts
sed -i 's/#COMPRESSION="zstd"/COMPRESSION="zstd/g"' /etc/mkinitcpio.conf
mkinitcpio -P linux
sed -i '8a\GRUB_DISABLE_OS_PROBER=false' /etc/default/grub
# echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
sed -i '/^GRUB_DEFAULT/c\GRUB_DEFAULT=saved'
sed -i '/#GRUB_SAVEDEFAULT/c\GRUB_SAVEDEFAULT=true'
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
echo "please set your root password"
passwd root
echo "basic setting finished, now back to archiso"
echo "run umount -R /mnt to umount /mnt"
echo "run reboot to reboot system"
exit
