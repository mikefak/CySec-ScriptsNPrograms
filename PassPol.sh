#!/bin/bash

# Password Policy script ("PassPol") by young

#!/bin/bash

# Password Policy Script ("PassPol") by young

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
