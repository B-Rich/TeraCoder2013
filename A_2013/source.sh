#!/bin/bash

##
# source.sh
# TeraCoder 2013
#
# @author kuroneko
# @copyright 2014 kuroneko. All rights reserved
##

text=$(cat -);
target='';
number=0;
flag=0;
for value in $text
do
    if [ "${target}" = '#' ]
    then
        break;
    fi
    if [ "${target}" = "" ]
    then
        target=${value};
        flag=0;
        continue;
    fi
    if [ ${number} -eq 0 ]
    then
        number=${value};
        continue;
    fi
    number=`expr ${number} - 1`;
    if [ "${value}" = "${target}" ]
    then
        flag=1;
    fi
    if [ ${number} -eq 0 ]
    then
        if [ ${flag} -eq 0 ]
        then
            echo 'NOT FOUND';
        elif [ ${flag} -eq 1 ]
        then
            echo 'FOUND'
        fi
        target='';
    fi
done
