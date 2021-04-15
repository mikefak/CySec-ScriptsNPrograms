#!/bin/bash

#Asset Inventory Fast - By mikeffakhouri

date=$(date "+DATE: %Y-%m-%d %nTIME: %H:%M:%S")


internalip=$(hostname -I | cut -d " " -f1)
externalip=$(curl ifconfig.me 2>/dev/null)
#System Name

read -r -p "What is the purpose of this sytem?" purpose 

echo -e $date\n
echo $hostname
echo 'Purpose: '$purpose

echo 'Internal IP address: '$internalip

if [ '$externalip' ];
then
	echo "External IP address: " $externalip
else
	echo no
fi

#Add Essential services, applications, user/admin/service accounts, open ports and running services.

