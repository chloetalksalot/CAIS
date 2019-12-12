#!/bin/bash
wget https://raw.githubusercontent.com/myles1509/CAIS/master/peng1.txt
wget https://raw.githubusercontent.com/myles1509/CAIS/master/peng2.txt
cat peng1.txt
echo "This will fully reset linux"
echo "Ensure ethernet is connected"
read -p "Are you positive?" -n 1 -r Reply
mkdir vars
echo
read -p 'Root Password: ' RootPass
echo RootPass=\"$RootPass\" >> /root/vars/RootPass
echo
read -p 'Username: ' User
echo User=\"$User\" >> /root/vars/User
echo
read -p 'User Password: ' UserPass
echo UserPass=\"$UserPass\" >> /root/vars/UserPass
echo
read -p 'Github Username: ' GithubUser
echo GithubUser=\"$GithubUser\" >> /root/vars/GithubUser
echo 
read -p 'Github Email: ' GithubEmail
echo GithubEmail=\"$GithubEmail\" >> /root/vars/GithubEmail
echo
read -p 'Github Password: ' GithubPass
echo GithubPass=\"$GithubPass\" >> /root/vars/GithubPass
echo
if [[ $Reply =~ ^[Yy]$ ]]
then
  wget https://raw.githubusercontent.com/myles1509/CAIS/testing/installchroot.sh
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
  mkdir /mnt/scripts/vars
  cp * /mnt/scripts
  cp /root/vars/* /mnt/scripts/vars/
  rm -rf /root/vars
  arch-chroot /mnt /scripts/installchroot.sh
  echo
  read -p "Welcome to Arch $User!" novar
  reboot
fi
