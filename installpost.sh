wget https://raw.githubusercontent.com/myles1509/CAIS/master/elephant.txt
wget https://raw.githubusercontent.com/myles1509/CAIS/master/programs.sh
cat elephant.txt
chmod +x programs.sh
chmod +x pacmanupdate.sh
chmod +x gitsetup.sh
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

