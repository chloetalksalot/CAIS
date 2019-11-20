wget https://raw.githubusercontent.com/myles1509/CAIS/master/elephant.txt
wget https://raw.githubusercontent.com/myles1509/CAIS/master/programs.sh
wget https://raw.githubusercontent.com/myles1509/CAIS/master/pacmanupdate.sh
wget https://raw.githubusercontent.com/myles1509/CAIS/master/gitsetup.sh
wget https://raw.githubusercontent.com/myles1509/CAIS/master/zshinstall.sh
wget https://raw.githubusercontent.com/myles1509/CAIS/master/zshrc
wget https://raw.githubusercontent.com/myles1509/CAIS/master/spinstall.sh
cat elephant.txt
chmod +x programs.sh
chmod +x pacmanupdate.sh
chmod +x gitsetup.sh
chmod +x zshinstall.sh
chmod +x spinstall.sh
./pacmanupdate.sh
sudo pacman -Syu --noconfirm go
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
yay -Syyu
./gitsetup.sh
./programs.sh
./zshinstall.sh
./spinstall.sh
