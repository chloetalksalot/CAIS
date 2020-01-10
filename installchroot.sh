#!/bin/bash
echo CHROOTED!
(
echo $RootPass
echo $RootPass
) | passwd
ln -s /usr/share/zoneinfo/America/Boise /etc/localtime
mkinitcpio -p linux
pacman -S --noconfirm archlinux-keyring
pacman -Syu --noconfirm grub efibootmgr sddm i3-gaps i3blocks plasma i3status tilix os-prober vim wpa_supplicant wireless_tools networkmanager sudo chromium git openssh wget bc linux-headers dkms go
wget https://raw.githubusercontent.com/myles1509/CAIS/master/peng2.txt
cat peng2.txt
echo
mkdir /boot/grub
grub-mkconfig -o /boot/grub/grub.cfg
grub-install /dev/sda
systemctl enable NetworkManager.service
systemctl enable wpa_supplicant.service
systemctl enable sddm
useradd -G wheel -s /bin/bash -m -c "$User" $User
(
echo $UserPass
echo $UserPass
) | passwd $User
echo "$User ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo "Defaults        env_reset,timestamp_timeout=120"
cd /home/$User/
sudo -u $User wget https://raw.githubusercontent.com/myles1509/CAIS/master/installpost.sh
# ADDED YAY?
sudo -u $User git clone https://aur.archlinux.com/yay.git
cd yay/
sudo -u $User makepkg -si
cd ..
rm -rf yay
sudo -u $User yay -S rtl8821ce-dkms-git
chmod +x installpost.sh
exit
