#!/bin/bash

echo "please enter your ID:"
read uid

while [[ $uid != +([0-9]) ]]
do
    echo "please enter int value"
    read uid
done

checked_id=`awk -F : -v id=$uid 'id == $1 { print $1 }' users`

while [ -z $checked_id ]
do
    echo "please enter a valid ID:"
    read uid
    checked_id=`awk -F : -v id=$uid 'id == $1 { print $1 }' users`
done


name=`awk -F : -v id=$uid 'id == $1 { print $2 }' users`
oldpassword=`awk -F : -v id=$uid 'id == $1 { print $3 }' users`

echo "welcome $name, please enter your old password in order to reset your password:"
read oldpasswordInput

while [[ $oldpassword != $oldpasswordInput ]]
do
    echo "wrong password, try again:"
    read oldpasswordInput
done

echo "please enter the new password:"
read newpassword

sed "s/:$oldpassword/:$newpassword/g" users > newusers

mv newusers users

echo "done"