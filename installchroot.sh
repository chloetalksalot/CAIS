#!/bin/bash
echo CHROOTED!
. /scripts/vars/RootPass
. /scripts/vars/User
. /scripts/vars/UserPass
(
echo $RootPass
echo $RootPass
) | passwd
ln -s /usr/share/zoneinfo/America/Boise /etc/localtime
mkinitcpio -p linux
pacman -S --noconfirm archlinux-keyring
pacman -Syu --noconfirm grub efibootmgr lightdm lightdm-gtk-greeter lightdm-webkit2-greeter i3-gaps i3blocks sddm i3status tilix os-prober vim wpa_supplicant wireless_tools networkmanager sudo chromium git openssh wget
wget https://raw.githubusercontent.com/myles1509/CAIS/master/peng2.txt
cat peng2.txt
echo
mkdir /boot/grub
grub-mkconfig -o /boot/grub/grub.cfg
grub-install /dev/sda
systemctl enable NetworkManager.service
systemctl enable wpa_supplicant.service
systemctl enable lightdm
useradd -G wheel -s /bin/bash -m -c "$User" $User
(
echo $UserPass
echo $UserPass
) | passwd $User
echo "$User ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo "Defaults        env_reset,timestamp_timeout=120"
cd /home/$User/
sudo -u $User wget https://raw.githubusercontent.com/myles1509/CAIS/testing/installpost.sh
chmod +x installpost.sh
sudo -u $User ./installpost.sh
exit
