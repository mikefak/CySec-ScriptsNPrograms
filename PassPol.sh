#!/bin/bash

# Password Policy script ("PassPol") by young

#!/bin/bash

# Password Policy Script ("PassPol") by young

# check if pam.d directory exists to determine whether or not pam is installed. if not, notify the user.
FILE="pam.d"
if [ -d "$FILE" ]
then

    echo The following password policies will be enforced:
    echo 1. All four types of characters (1 upper case character, 1 lower case character, 1 special
    character, 1 number)
    echo 2. 10 Character Minimum
    echo 3. Lockout the user after 5 failed password attempts
    echo 4. Set the lockout period to last 15 minutes
    echo 5. Maximum of 90 days before a user’s password must be changed
    echo 6. Remember the last 3 passwords
    echo 7. No password hints.
    echo 8. Minimum password age of 1 day for non-service accounts
    echo 9. Disable storing passwords with reversible encryption
    echo 10. Enable password complexity requirements

# line that actually sets the policies in the pam configuration file, change depending on what you want the policies to be
sed -i '1s/^/password requisite pam_pwquality.so retry=4 minlen=9 difok=4 lcredit=-2 ucredit=-2 dcredit=-1 ocredit=-1 reject_username enforce_for_root password\n/' /etc/pam.d/common-password

# tell user to install pam if not installed
else
    
    echo You must have PAM installed to use this script.
