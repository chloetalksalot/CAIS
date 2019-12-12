#!/bin/bash
. /scripts/vars/User
read -p "Do you want Myles Becker's i3 .configs?" -n 1 -r Reply
echo 
if [[ $Reply =~ ^[Yy]$ ]]
then 
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


