#!/bin/bash

# Yorge's Enumeration Script ("YES")

echo "------------------------------------------------------------"
echo "
ooooo  oooo  ooooooooooo      oooooooo8      
  888  88     888    88      888             
    888       888ooo8         888oooooo      
    888  ooo  888    oo  ooo         888 ooo 
   o888o 888 o888ooo8888 888 o88oooo888  888  Version 0.1 (beta)"
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
    
    # add last/lastlog
    
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
    
    echo "Active TCP/UDP Connections:"
	NETSTAT=$(netstat -plunt 2>/dev/null)
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


    # add more network settings from /etc/ files
    # add selinux settings check
    # add routing table check
    # add iptables settings check
    
}

function OptionsList()
{
	echo -e " Usage: ./yes.sh <option>\n"
	echo " Options List:"
	echo -e "-o : Host OS info\n"
    echo -e "-n : Network Config info\n"
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
                    
                    OptionsList
            fi
        fi
    fi
}

YES