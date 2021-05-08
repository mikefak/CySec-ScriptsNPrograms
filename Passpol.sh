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
        echo -e "Error, make sure you run as root or maintain a stable internet connection"

    #Password complexity (uppercase,lowercase,digit,special character). Negative value indicates minimum
    pcomplexity=( "ucredit=-1" "lcredit=-1" "dcredit=-1" "ocredit=-1" )
    
    echo -e $pcomplexity "will be appended to enforce pw complexity"

    #insert actual implementation
}

function optlist()
{

    echo -e "How to use: ./Passpol.sh (option)\n"
    echo -e "Opt List:\n"
    echo -e "-c - Enforces Password Compexity --> /etc/security/pwquality.conf"
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



