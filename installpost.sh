wget https://raw.githubusercontent.com/myles1509/CAIS/master/elephant.txt
wget https://raw.githubusercontent.com/myles1509/CAIS/master/programs.sh
wget https://raw.githubusercontent.com/myles1509/CAIS/master/pacmanupdate.sh
wget https://raw.githubusercontent.com/myles1509/CAIS/master/gitsetup.sh
wget https://raw.githubusercontent.com/myles1509/CAIS/master/zshinstall.sh
wget https://raw.githubusercontent.com/myles1509/CAIS/master/zshrc
wget https://raw.githubusercontent.com/myles1509/CAIS/master/spinstall.sh
wget https://raw.githubusercontent.com/myles1509/CAIS/master/lightdm
wget https://raw.githubusercontent.com/myles1509/CAIS/master/optionalconfig.sh
wget https://raw.githubusercontent.com/myles1509/CAIS/master/pacman.conf
wget https://raw.githubusercontent.com/myles1509/CAIS/master/zshasciiart
cat elephant.txt
chmod +x programs.sh
chmod +x pacmanupdate.sh
chmod +x gitsetup.sh
chmod +x zshinstall.sh
chmod +x spinstall.sh
chmod +x optionalconfig.sh
cp zshasciiart ~/.config/zshasciiart
./pacmanupdate.sh
sudo pacman -Syu --noconfirm go
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
timedatectl set-local-rtc 1 --adjust-system-clock
yay -Syyu
./gitsetup.sh
./programs.sh
./zshinstall.sh
./spinstall.sh
git clone https://github.com/vinceliuice/grub2-themes.git
cd grub2-themes
sudo ./install.sh -t
cd ..
rm -rf grub2-themes
sudo cp lightdm /etc/lightdm/lightdm.conf
sudo cp webkit2 /etc/lightdm/lightdm-webkit2-greeter.conf
./optionalconfig.sh
reboot
