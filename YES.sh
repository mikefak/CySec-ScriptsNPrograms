#!/bin/bash

# Yorge's Enumeration Script ("YES")

echo "------------------------------------------------------------"
echo "
ooooo  oooo  ooooooooooo      oooooooo8      
  888  88     888    88      888             
    888       888ooo8         888oooooo      
    888  ooo  888    oo  ooo         888 ooo 
   o888o 888 o888ooo8888 888 o88oooo888  888  Version 0.1 (beta)             
"
echo -e "Yorge's Enumeration Script (Y.E.S.) by @YorgeZ\n"
echo -e "------------------------------------------------------------\n"

function OS()
{
	echo "OPERATING SYSTEM (-o)"
    
    echo "The current user is:"
	WHOAMI=$(whoami 2>/dev/null)
	if [ "$WHOAMI" ];
	then
		echo -e "$WHOAMI\n"
	else
		echo -e "ERROR (Make sure you run as root)\n 'whoami' did not return anything\n"
	fi
    
	echo "Current user's group info:"
	ID=$(id 2>/dev/null)
	if [ "$ID" ];
	then
		echo -e "$ID\n"
	else
		echo -e "ERROR (Make sure you run as root)\n 'id' did not return anything\n"
	fi

	echo "Host distribution and version:"
	RELEASE=$(cat /etc/*-release 2>/dev/null)
	if [ "$RELEASE" ];
	then
		echo -e "$RELEASE\n"
	else
		echo -e "ERROR (Make sure you run as root)\n 'release' did not return anything\n"
	fi 

	echo "Kernel version and info:"
	PROCVERSION=$(cat /proc/version 2>/dev/null)
	if [ "$PROCVERSION" ];
	then
		echo -e "$PROCVERSION\n"
	else
		echo -e "ERROR (Make sure you run as root)\n 'procversion' did not return anything\n"
	fi
    
	echo "Mounted partitions:"
	LSBLK=$(lsblk 2>/dev/null)
	if [ "$LSBLK" ];
	then
		echo -e "$LSBLK\n"
	else
		echo -e "ERROR (Make sure you run as root)\n 'lsblk' did not return anything\n"
	fi
    
    echo "CPU info:"
	CPUINFO=$(lscpu 2>/dev/null)
	if [ "$CPUINFO" ];
	then
		echo -e "$CPUINFO\n"
	else
		echo -e "ERROR (Make sure you run as root)\n 'cpuinfo' did not return anything\n"
	fi
    
    echo ""
}

function OptionsList()
{
	echo -e " Usage: ./yes.sh <option>\n"
	echo " Options List:"
	echo -e "-o : Host OS info\n"

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
                OptionsList
        fi
    fi
}

YES