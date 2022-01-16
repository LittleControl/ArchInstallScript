#!/bin/sh

## systemd-boot install script

bootctl install

echo "default  arch.conf" > /boot/loader/loader.conf
echo "timeout  0" >> /boot/loader/loader.conf
echo "console-mode  max" >> /boot/loader/loader.conf

echo "title   Arch Linux" > /boot/loader/entries/arch.conf
echo "linux   /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd    /amd-ucode.img" >> /boot/loader/entries/arch.conf
echo "initrd    /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options   root=\"LABEL=rootfs\" rw" >> /boot/loader/entries/arch.conf

## btrfs filesystem setting
# echo "options   root=\"LABEL=rootfs\"  rw rootflags=subvol=@" >> /boot/loader/entries/arch.conf

echo "title   Arch Linux (fallback initramfs)" > /boot/loader/entries/arch-fallback.conf
echo "linux   /vmlinuz-linux" >> /boot/loader/entries/arch-fallback.conf
echo "initrd    /amd-ucode.img" >> /boot/loader/entries/arch-fallback.conf
echo "initrd    /initramfs-linux-fallback.img" >> /boot/loader/entries/arch-fallback.conf
echo "options   root=\"LABEL=rootfs\"  rw" >> /boot/loader/entries/arch-fallback.conf

## btrfs filesystem setting
# echo "options   root=\"LABEL=rootfs\"  rw rootflags=subvol=@" >> /boot/loader/entries/arch-fallback.conf

## pacman hooks
echo "[Trigger]" > /etc/pacman.d/hooks/100-systemd-boot.hook
echo "Type = Package" >> /etc/pacman.d/hooks/100-systemd-boot.hook
echo "Operation = Upgrade" >> /etc/pacman.d/hooks/100-systemd-boot.hook
echo "Target = systemd" >> /etc/pacman.d/hooks/100-systemd-boot.hook
echo "" >> /etc/pacman.d/hooks/100-systemd-boot.hook
echo "[Action]" >> /etc/pacman.d/hooks/100-systemd-boot.hook
echo "Description = Updating systemd-boot" >> /etc/pacman.d/hooks/100-systemd-boot.hook
echo "When = PostTransaction" >> /etc/pacman.d/hooks/100-systemd-boot.hook
echo "Exec = /usr/bin/bootctl update" >> /etc/pacman.d/hooks/100-systemd-boot.hook
