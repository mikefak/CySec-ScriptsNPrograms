#!/bin/bash

#run with sudo

#default backup name, feel free to change
backup='databases.sql'

#backup command
mysqldump --flush-privileges --all-databases > $backup

#Save backup in desired directory
echo where would you like to save your backup?
read -r bkupd
mv databases.sql "$bkupd"

#Error handling 
if [ $? == 0 ]; then

	echo 'Backup sucessfully created'
else
	echo 'Backup failed. Please enter a valid directory/backup name and try again'
	exit
fi
