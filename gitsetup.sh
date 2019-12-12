#!/bin/bash
. /scripts/vars/GitUser
. /scripts/vars/GitEmail
. /scripts/vars/GitPass
git config --global user.name "$GitUser"
git config --global user.email "$GitEmail"
(
echo 
echo $GitPass
echo $GitPass
) | ssh-keygen -t rsa -b 4096 -C "$GitEmail"
curl -u $GitUser \
	--data "{\"title\":\"Arch`date +%Y%m%d`\",\"key\":\"`cat ~/.ssh/id_rsa.pub`\"}" \
	https://api.github.com/user/keys
read -p 'Github ssh key added!' NOVAR
