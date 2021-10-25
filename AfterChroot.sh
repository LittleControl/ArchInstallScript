#!/bin/sh

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "Avalon" > /etc/hostname
echo "127.0.0.1     Avalon" >> /etc/hosts
echo "::1           Avalon" >> /etc/hosts
echo "127.0.1.1     Avalon.localdomain  Avalon" >> /etc/hosts
sed -i 's/#COMPRESSION="zstd"/COMPRESSION="zstd/g"' /etc/mkinitcpio.conf
mkinitcpio -p linux
# GRUB
sed -i '8a\GRUB_DISABLE_OS_PROBER=false' /etc/default/grub
sed -i '/^GRUB_DEFAULT/c\GRUB_DEFAULT=saved' /etc/default/grub
sed -i '/#GRUB_SAVEDEFAULT/c\GRUB_SAVEDEFAULT=true' /etc/default/grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
# Systemd-boot
# bootctl install
# echo "default  arch.conf" > /boot/loader/loader.conf
# echo "console-mode  max" >> /boot/loader/loader.conf
# echo "please set your root password"
# echo "title   Arch Linux" > /boot/loader/entries/arch.conf
# echo "linux   /vmlinuz-linux" >> /boot/loader/entries/arch.conf
# echo "initrd    /amd-ucode.img" >> /boot/loader/entries/arch.conf
# echo "initrd    /initramfs-linux.img" >> /boot/loader/entries/arch.conf
# echo "options   root=\"LABEL=rootfs\"  rw rootflags=subvol=@" >> /boot/loader/entries/arch.conf
# echo "title   Arch Linux (fallback initramfs)" > /boot/loader/entries/arch-fallback.conf
# echo "linux   /vmlinuz-linux" >> /boot/loader/entries/arch-fallback.conf
# echo "initrd    /amd-ucode.img" >> /boot/loader/entries/arch-fallback.conf
# echo "initrd    /initramfs-linux-fallback.img" >> /boot/loader/entries/arch-fallback.conf
# echo "options   root=\"LABEL=rootfs\"  rw rootflags=subvol=@" >> /boot/loader/entries/arch-fallback.conf
passwd root
echo "basic setting finished, now back to archiso"
echo "run umount -R /mnt to umount /mnt"
echo "run reboot to reboot system"
exit
