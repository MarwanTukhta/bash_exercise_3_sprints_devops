#!/bin/bash


for ((a=0; a < 25 ; a++))
do
    x=`ls | grep -c Marwan$((777+$a))`
    if [ $x == "0" ]
    then
        touch "Marwan$((777+$a))"
    fi
done