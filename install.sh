#!/bin/bash
wget https://raw.githubusercontent.com/myles1509/CAIS/master/peng1.txt
wget https://raw.githubusercontent.com/myles1509/CAIS/master/peng2.txt
cat peng1.txt
echo "This will fully reset linux"
echo "Ensure ethernet is connected"
read -p "Are you positive?" -n 1 -r Reply
echo
if [[ $Reply =~ ^[Yy]$ ]]
then
  wget https://raw.githubusercontent.com/myles1509/CAIS/master/installchroot.sh
  chmod +x *.sh
  (
  echo d
  echo 6
  echo d
  echo 5
  echo n
  echo 5
  echo
  echo +8G
  echo t
  echo 5
  echo 19
  echo n
  echo 6
  echo
  echo
  echo w
  ) | fdisk /dev/sda
  partprobe
  fdisk -l /dev/sda
  mkswap -L "archSwap" /dev/sda5
  swapon /dev/sda5
  free -m
  (
  echo y
  ) | mkfs.ext4 -L "archRoot" /dev/sda6
  mount /dev/sda6 /mnt
  pacstrap /mnt base base-devel linux linux-firmware
  mkdir -p /mnt/boot/efi
  mount /dev/sda2 /mnt/boot/efi
  genfstab -p /mnt >> /mnt/etc/fstab
  cat /mnt/etc/fstab
  mkdir /mnt/scripts
  cp * /mnt/scripts
  arch-chroot /mnt /scripts/installchroot.sh
  echo
  read -p 'Welcome to Arch! Make sure to download and run installpost.sh after reboot.' novar
  reboot
fi
