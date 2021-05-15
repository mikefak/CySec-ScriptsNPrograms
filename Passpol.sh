#!/bin/bash

#Password Policy Script by mikeffakhouri and youngysf

#Script made to easily establish basic and 


#WARNING: The following script will edit pre-existing password policy configurations, proceed with caution

pwq=$(apt-get install libpam-pwquality 2>/dev/null)

if [ "$pwq" ];
then
        apt-get install libpam-pwquality
else
    echo -e "Error: make sure the script is ran as an administrator or that you have a stable internet connection"
    exit 1
fi

function complex()
{

   #Preset and reccomended complexity for passwords (>=1 uppercase, lowercase, digit, and special character)
    upper="ucredit=-1"
    lower="lcredit=-1"
    digit="dcredit=-1"
    special="ocredit=-1"
    
    echo -e "\n$upper\n$lower\n$digit\n$special\n" | tee -a /etc/security/pwquality.conf
    echo "The above libpam-pw complexity rules have been appended to /etc/security/pwquality.conf"
 
}

function minlen()
{

    #Default min password length to eight
    minln="minlen=8"

    echo -e "$minln\n" | tee -a /etc/security/pwquality.conf

    echo -e "The above libpam-pw minimum password length rules have been appended to /etc/security/pwquality.conf"
}

function faillock()
{

    #Defaults to 5 attempts (15 min interval from first failure) and 15 minute lockout period
    deny="deny=5"
    failint="fail_interval=900"
    utime="unlock_time=600"

    echo -e "\n$deny\n$failint\n$utime" | tee -a /etc/security/faillock.conf

    echo -e "The above faillock configurations have been appended to /etc/security/faillock.conf"


}

function optlist()
{

    echo -e "How to use: ./Passpol.sh (option)\n"
    echo -e "Opt List:\t \"-->\" symbolizes the configuration file that will be altered\n"
    echo -e "-c     Appends password complexity rules (lowerchar, upperchar, specialchar, digit) --> /etc/security/pwquality.conf\n"
    echo -e "-l     Establishes Password Minimum Length --> /etc/security/pwquality.conf\n"
    echo -e "-k     Lockouts user for (x) seconds after failing (x) password attempts --> /etc/security/faillock.conf"

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

        else

            if [ "$OPTIONS" == "-l" ] || [ "$OPTIONS" == "l" ];
            then
                minlen
            
            else

                if [ "$OPTIONS" == "-k" ] || [ "$OPTIONS" == "k" ];
                then
                    faillock
                
                fi
            
            fi

        fi 
    fi

}
start



