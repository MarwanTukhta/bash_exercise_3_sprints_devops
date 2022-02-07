#!/bin/bash

echo "enter first name"
read first

while [[ $first != +([a-zA-Z]) ]]
do
    echo "enter first name as a string value"
    read first
done

echo "enter last name"
read last

while [[ $last != +([a-zA-Z]) ]]
do
    echo "enter last name as a string value"
    read last
done

echo "enter phone number"
read phone

while [[ $phone != +([0-9]) ]]
do
    echo "enter phone number as an int value"
    read phone
done

checked_phone=`awk -F : -v phone=$phone 'phone == $3 { print $3 }' employees`
while [[ $checked_phone != "" ]]
do
    echo "this phone number is taken please enter another one:"
    read phone
    checked_phone=`awk -F : -v phone=$phone 'phone == $3 { print $3 }' employees`
done

echo "enter department"
read dep

while [[ $dep != +([a-zA-Z]) ]]
do
    echo "enter department name as a string value"
    read dep
done

echo "enter salary"
read salary

while [[ $salary != +([0-9]) ]]
do
    echo "enter salary as an int value"
    read salary
done

printf "\n$first:$last:$phone:$dep:$salary" >> employees

echo "insertion done successfully"