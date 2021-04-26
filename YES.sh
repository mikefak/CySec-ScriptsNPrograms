#!/bin/bash

# Yorge's Enumeration Script ("YES")

echo "------------------------------------------------------------"
echo "
ooooo  oooo  ooooooooooo      oooooooo8      
  888  88     888    88      888             
    888       888ooo8         888oooooo      
    888  ooo  888    oo  ooo         888 ooo 
   o888o 888 o888ooo8888 888 o88oooo888  888  Version 0.2.3 (beta)"
echo -e "Yorge's Enumeration Script (Y.E.S.) by @YorgeZ\n"
echo -e "------------------------------------------------------------\n"

function OS()
{
	echo -e "OPERATING SYSTEM (-o)\n"
    
    echo "The current user is:"
	WHOAMI=$(whoami 2>/dev/null)
	if [ "$WHOAMI" ];
	then
		echo -e "$WHOAMI\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'whoami' did not return anything\n"
	fi
    
	echo "Current user's group info:"
	ID=$(id 2>/dev/null)
	if [ "$ID" ];
	then
		echo -e "$ID\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'id' did not return anything\n"
	fi

	echo "Host distribution and version:"
	RELEASE=$(cat /etc/*-release 2>/dev/null)
	if [ "$RELEASE" ];
	then
		echo -e "$RELEASE\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'release' did not return anything\n"
	fi 

	echo "Kernel version and info:"
	PROCVERSION=$(cat /proc/version 2>/dev/null)
	if [ "$PROCVERSION" ];
	then
		echo -e "$PROCVERSION\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'procversion' did not return anything\n"
	fi
    
	echo "Mounted partitions:"
	LSBLK=$(lsblk 2>/dev/null)
	if [ "$LSBLK" ];
	then
		echo -e "$LSBLK\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'lsblk' did not return anything\n"
	fi
    
    echo "CPU info:"
	CPUINFO=$(lscpu 2>/dev/null)
	if [ "$CPUINFO" ];
	then
		echo -e "$CPUINFO\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'cpuinfo' did not return anything\n"
	fi
    
    echo "Log info:"
	LOG=$(lastlog 2>/dev/null)
	if [ "$LOG" ];
	then
		echo -e "$LOG\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'lastlog' did not return anything\n"
	fi
    
}

function Net()
{
    echo -e "Network Enumeration (-n)\n"

    echo "The current user is:"
	WHOAMI=$(whoami 2>/dev/null)
	if [ "$WHOAMI" ];
	then
		echo -e "$WHOAMI\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'whoami' did not return anything\n"
	fi
    
    echo "Available interfaces:"
    IFCONFIG=$(sudo ifconfig 2>/dev/null)
	if [ "$IFCONFIG" ];
	then
		echo -e "$IFCONFIG\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'ifconfig' did not return anything\n"
    fi
    
    echo "Hosts:"
    HOST=$(cat /etc/hosts 2>/dev/null)
	if [ "$HOST" ];
	then
		echo -e "$HOST\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'cat /etc/hosts' did not return anything\n"
	fi
    
    echo "Active Connections:"
	NETSTAT=$(netstat -plant 2>/dev/null)
	if [ "$NETSTAT" ];
	then
		echo -e "$NETSTAT\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'netstat -plunt' did not return anything\n"
	fi
    
        echo "Active TCP/UDP Connections:"
	NETSTAT=$(netstat -putan 2>/dev/null)
	if [ "$NETSTAT" ];
	then
		echo -e "$NETSTAT\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'netstat -plunt' did not return anything\n"
	fi
    
    echo "DNS Settings:"
	DNSRESOLV=$(cat /etc/resolv.conf 2>/dev/null)
	if [ "$DNSRESOLV" ];
	then
		echo -e "$DNSRESOLV\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'netstat -plunt' did not return anything\n"
	fi

    # TO DO LIST:
    # add more network settings from /etc/ files
    # add selinux settings check
    # add routing table check
    # add iptables settings check
    
}

function AIF()
{

#Date and os/version assignent
date=$(date "+DATE: %Y-%m-%d %nTIME: %H:%M:%S")
osv=$(cat /etc/issue | awk '{print $1, $2}')

#Ip info, also running external ip will provide user permission status to run the command 
internalip=$(hostname -I | cut -d " " -f1)
externalip=$(curl ifconfig.me)


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


echo -e '\nCritical Applications: \n'$critapp
echo -e 'Services currently running: \n' $services

echo -e '\nList of open ports: '$ports

}

function UserAndPassInfo
 {
    echo "The Current User Is:"
	WHOAMI=$(whoami 2>/dev/null)
	if [ "$WHOAMI" ];
	then
		echo -e "$WHOAMI\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'whoami' did not return anything\n"
	fi
    
	echo "Current User's Group Info:"
	ID=$(id 2>/dev/null)
	if [ "$ID" ];
	then
		echo -e "$ID\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'id' did not return anything\n"
	fi
    
    echo "PermitRootLogin Check:"
	ROOTLOGINCHECK=$(grep "PermitRootLogin" /etc/ssh/sshd_config | grep -v "#" | awk '{print $2}')
	if [ "$ROOTLOGINCHECK" ];
	then
		echo "[/] Root is allowed to login via SSH"
		echo -e "$ROOTLOGINCHECK\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'grep 'PermitRootLogin'' did not return anything\n"
	fi
    
    echo "Password Policy Check:"
	PASSPOLCHECK=$(grep "^PASS_MAX_DAYS\|^PASS_MIN_DAYS\|^PASS_WARN_AGE\|^ENCRYPT_METHOD" /etc/login.defs 2>/dev/null)
	if [ "$PASSPOLCHECK" ];
	then
		echo -e "$PASSPOLCHECK\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'grep' did not return anything\n"
	fi
    
    echo "Check /etc/passwd For Shell Access:"
	ETCPASSWD=$(cat /etc/passwd | grep "/bin/bash\|/bin/sh\|/bin/dash\|/bin/zsh" 2>/dev/null)
	if [ "$ETCPASSWD" ];
	then
		echo -e "$ETCPASSWD\n"
	else
		echo -e "ERROR (Make sure you run as root)\n'cat /etc/passwd' did not return anything\n"
	fi
    
    echo "Check master.passwd File:"
    MASTERPASSWD=$(cat /etc/master.passwd 2>/dev/null)
	if [ "$MASTERPASSWD" ];
	then
		echo "[/] Readable - /etc/master.passwd"
		echo -e "$MASTERPASSWD\n"
	else
		echo -e "master.passwd not readable (or you failed to run as root)\n"
	fi
    
    echo "Grep passwd From .bash_history:"
	PASSWDHISTORY=$(grep passwd /home/*/.bash_history 2>/dev/null)
	if [ "$PASSWDHISTORY" ];
	then
		echo -e "$PASSWDHISTORY\n"
	else
        echo -e "'passwd' command not found in bash_history (or you failed to run as root)\n"
	fi
    
    echo "Check .conf files for the string 'password':"
	CONFPASSCHECK=$(grep -r 'password' /etc/*.conf 2>/dev/null)
	if [ "$CONFPASSCHECK" ];
	then
		echo -e "$CONFPASSCHECK\n"
	else
        echo -e "No files containing the string 'password' were found in /etc/*.conf files (or you failed to run as root)\n"
	fi
    # TO DO LIST:
    # check /etc/passwd /etc/shadow /etc/sudoers etc...
    # plain text password check in program history (bash, sql, php, etc.)

}

function OptionsList()
{
	echo -e " Usage: ./yes.sh <option>\n"
	echo " Options List:"
	echo -e "-o : Host OS Info\n"
    echo -e "-n : Network Config Info\n"
    echo -e "-u : User and Password Management Info\n"
	echo -e "-AI : Compiled Asset Inventory"
}

OPTIONS="$1"
function YES()
{
	if [ "$OPTIONS" == "" ];
	then
		OptionsList
        else
        
		if [ "$OPTIONS" == "-o" ] || [ "$OPTIONS" == "o" ];
		then
            clear
            OS
            else
            
            if [ "$OPTIONS" == "-n" ] || [ "$OPTIONS" == "n" ];
            then
                clear
                Net
				else
                
				if [ "$OPTIONS" == "-AI" ] || [ "$OPTIONS" == "AI" ]
				then
					clear
					AIF
                    else
                    
				    if [ "$OPTIONS" == "-u" ] || [ "$OPTIONS" == "u" ]
				    then
					   clear
					   UserAndPassInfo
                       else
                       
                       OptionsList
                    fi
				fi
            fi
        fi
    fi
}

YES