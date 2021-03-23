#!/bin/bash

#Enter mysql user and pass

username='Enter username here'
password='Enter password here'

#Output directory, defaults to /var/backups
direc=/var/backups
echo 'backing up mysql databases to $(date)...'

mysqldump -u $username -p $password --flush-privileges --all-databases > databases.sql

#Save backup in desired directory
echo where would you like to save your backup?
read bkupd
mv databases.sql $bkupd

#Error handling 
if [ $? == 0 ]; then

	echo 'Backup sucessfully created'
else
	echo 'Backup failed. Please enter a valid directory and try again.'
	#exit
fi

