#!/bin/bash
sudo chmod 777 /opt/spotify -R
mkdir pywal
cd pywal
wget https://raw.githubusercontent.com/myles1509/Spicetify-Pywal-Theme/master/color.ini
wget https://raw.githubusercontent.com/myles1509/Spicetify-Pywal-Theme/master/user.css
cd ..
cp -r pywal/ ~/.config/spicetify/Themes/
spicetify config current_theme pywal
rm -rf pywal
spicetify apply
