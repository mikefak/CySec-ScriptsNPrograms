#!/bin/bash

#Passpol setup by mikeffakhouri and youngysf


function complex()
{
    #update libpam-pwquality and ensure sudo access 
    pwq=$(apt-get install libpam-pwquality 2>/dev/null)

    if [ "$pwq" ];
    then
        apt-get install libpam-pwquality
    else
        echo -e "Error: make sure the script is ran as an administrator or that you have a stable internet connection"
        exit 1
    fi

   #Preset and reccomended complexity for passwords (>=1 uppercase, lowercase, digit, and special character)
    upper="ucredit=-1"
    lower="lcredit=-1"
    digit="dcredit=-1"
    special="ocredit=-1"
    
    echo -e $upper $lower $digit $special will be appended to enforce pw complexity

    echo -e "$upper\n$lower\n$digit\n$special" | tee -a /etc/security/pwquality.conf >/dev/null
 
    #insert actual implementation
}

function optlist()
{

    echo -e "How to use: ./Passpol.sh (option)\n"
    echo -e "Opt List:\n"
    echo -e "-c     Installs libpam-pwquality and enforces Password Compexity --> /etc/security/pwquality.conf"

}
OPTIONS="$1"
function start() {

    if [ "$OPTIONS" == "" ]

    then

        optlist

    else

        if [ "$OPTIONS" == "-c" ] || [ "$OPTIONS" == "c" ];
        then
        complex

        fi 
    fi

}
start



