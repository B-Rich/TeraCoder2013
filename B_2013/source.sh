#!/bin/bash

##
# source.sh
# TeraCoder 2013
#
# @author kuroneko
# @copyright 2014 kuroneko. All rights reserved
##

text=$(cat -);
for value in $text
do
    if [ $value -eq -1 ]
    then
        break;
    fi
    result=0;
    numbers=$(echo $value | grep -o '.')
    for number in $numbers
    do
        result=`expr $result + $number`
    done
    result=`expr $result % 10`
    if [ $result -eq 0 ]
    then
        echo 'OK';
    else
        echo 'NG';
    fi
done
