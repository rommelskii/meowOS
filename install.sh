#!/bin/bash
pacman -Syu sudo vim networkmanager xorg nvidia nvidia-settings git openbox cairo-dock cairo-dock-plug-ins tint2 vlc pcmanfm grub dosfstools os-prober efibootmgr mtools pulseaudio pavucontrol sddm
ln -sf /usr/share/zoneinfo/Asia/Manila /etc/localtime
hwlock --systohc 
mv locale.gen /etc/locale.gen 
locale-gen
mv hostname /etc/hostname
mv hosts /etc/hosts
passwd 
useradd -m mels
usermod -aG wheel,audio,video,optical,storage mels
passwd mels
mkdir /boot/EFI
mount /dev/nvme1n1p1 /boot/EFI 
grub-install --target=x86_64-efi --bootloader-id="meowPC"
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable sddm NetworkManager
git clone https://github.com/Arch-study-os
cd Arch-study-os
bash apps.sh 
cd ../ 
mv tint2 .config/tint2
mv openbox /etc/xdg/openbox



