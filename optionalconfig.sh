#!/bin/bash
read -p "Do you want Myles Becker's i3 .configs?" -n 1 -r Reply
echo 
if [[ $Reply =~ ^[Yy]$ ]]
then 
echo "Add ssh found in user home to github"
chromium https://lastpass.com/\?ac\=1\&lpnorefresh\=1 
chromium https://github.com/login
read -p "added?" NOVAR
git clone git@github.com:myles1509/archConfigs.git
cd archConfigs
chmod +x install.sh
./install.sh
cd ..
rm -rf archConfigs
read -p "Do you want to clone all Myles' git projects?" -n 1 -r ReplyTwo
echo 
if [[ $ReplyTwo =~ ^[Yy]$ ]]
then
read -p "type in user, no spaces or symbols: " User
echo
cd /home/$User/
mkdir Downloads
mkdir Shows
mkdir Pics
mkdir Projects
cd Projects
git clone git@github.com:myles1509/CAIS.git
git clone git@github.com:myles1509/archConfigs.git
#ADD other projects here in future.
echo "Git and configs setup."
fi
fi


