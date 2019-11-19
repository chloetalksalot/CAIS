#!/bin/bash
read -p 'Name for git setup: ' GitName
read -p 'Email for git setup: ' GitEmail
read -p 'Pass for git: ' GitPass
git config --global user.name "$GitName"
git config --global user.email "$GitEmail"
(
echo 
echo $GitPass
echo $GitPass
) | ssh-keygen -t rsa -b 4096 -C "$GitEmail"
cp ~/.ssh/id_rsa.pub ~/githubssh.txt
read -p 'Do not forget to add ssh to github, the ssh pub key is in the users home folder.' NOVAR
