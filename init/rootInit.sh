#!/bin/sh

useradd -m -G wheel -s /usr/bin/zsh archer
chmod +w /etc/sudoers
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chmod -w /etc/sudoers
passwd archer
exit
