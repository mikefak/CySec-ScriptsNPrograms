#!/bin/bash

#Asset Inventory Fast (AIF) - By mikefak

#Date and os/version assignent
date=$(date "+DATE: %Y-%m-%d %nTIME: %H:%M:%S")
osv=$(cat /etc/issue | awk '{print $1, $2}')

#Ip info, also running external ip will provide user permission status to run the command 
internalip=$(hostname -I | cut -d " " -f1)
externalip=$(curl ifconfig.me 2>/dev/null)

if [[ '$externalip' == 1 ]];
then
	echo 'Sudo access is needed, please check your permissions and try again.'
	exit 1
fi

#Users, services, and ports - need to find a better way to format services/users
users=$(cat /etc/passwd | awk -F: '{print$1}' | column)

services=$(service --status-all | grep + | awk '{print$4}' | column)
ports=$(netstat -plnt | grep LISTEN |  awk '{print$4}' | sed 's/.*://')

#Only info needed from user for AI
read -r -p "What is the purpose of this sytem?: " purpose 
read -r -p "What are the current critical applications running?: " critapp


clear

echo '----------------------- ASSET INVENTORY -----------------------'
echo $date


echo -e  '\nHostname: '$(hostname)'' 
echo  'O/S and Version: '$osv

echo -e  '\nPurpose: '$purpose

echo -e '\nInternal IP address: '$internalip

if [ '$externalip' ];
then
	echo "External IP address: " $externalip
else
	echo "Unable reach if.config.me, check your internet connection and try again."
fi


echo -e "\nList of Admin/User/Service Accounts:\n" $users


echo -e '\nCritical Applications: '$critapp
echo 'Services currently running: ' $services

echo -e '\nList of open ports: '$ports


