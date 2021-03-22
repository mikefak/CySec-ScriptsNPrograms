#!/bin/bash

#Info collection and iptaples implementation
function fwsetup() {

	#Gather chain info
	read p
	echo you picked $p in the fwsetup function, cool 		
}

#Delete fw rules option
function delete() {

	#ask to delete all rules or a single one, also prob make a warning message
	echo delete func

}

#add logging to rules
function logging() {

	#Option to implement logging for all rules
	echo log func

}

#y/n for traffic
function trafficstat() {

	#ask to accept/drop traffic
	echo trafstat func
}

#list fw rules, maybe add formatted output somehow
function listfw(){

	sudo iptables -L 

}

function fwsave(){

	echo fwsave funct
	#Install iptables persistent if on debian/ubuntu, implement alternative method for other distros later. 
	#Also add way to see if user saved current rules, if they didnt and quit out, then tell them that they forgot to save and if its ok to quit
}

function fwhelp(){

	#Give help to people who dont know what they are doing, might not need this
	echo fwhelp
}

x=0
flag1=0
while [ x=0 ]
do
	
	if [[ flag1 -eq 0 ]]
		then echo 'Welcome to iptaples simplified'
		flag1=1
		else echo '>Anything else?'
	fi

	echo 'Pick one of these'
	read choice
	case $choice in

		1)
			echo you picked one
			fwsetup
			;;
		2) 
			echo you picked two
			delete
			;;
		3) 
			echo you picked three
			logging
			;;
		4)
			echo you picked four
			trafficstat
			;;

		5)
			echo you picked five
			listfw
			;;
		6)
			echo you picked six
			fwsave
			;;
		7)
			echo you picked seven
			fwhelp
			;;
		q) 
			echo you found your way out the loop, peace
			break;;

		*)
			echo $choice is not a valid input command
	esac
done


