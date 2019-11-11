wget https://raw.githubusercontent.com/myles1509/CAIS/master/elephant.txt
wget https://raw.githubusercontent.com/myles1509/CAIS/master/programs.sh
cat elephant.txt
chmod +x programs.sh
sudo pacman -Syu --noconfirm go
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
./programs.sh
