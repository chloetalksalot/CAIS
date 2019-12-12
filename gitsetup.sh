#!/bin/bash
read -p 'Username for git setup: ' GitName
read -p 'Email for git setup: ' GitEmail
read -p 'Pass for git: ' GitPass
git config --global user.name "$GitName"
git config --global user.email "$GitEmail"
(
echo 
echo $GitPass
echo $GitPass
) | ssh-keygen -t rsa -b 4096 -C "$GitEmail"
curl -u $GitName \
	--data "{\"title\":\"Arch`date +%Y%m%d`\",\"key\":\"`cat ~/.ssh/id_rsa.pub`\"}" \
	https://api.github.com/user/keys
read -p 'Github ssh key added!' NOVAR
