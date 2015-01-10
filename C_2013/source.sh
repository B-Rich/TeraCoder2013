#!/bin/bash

##
# source.sh
# TeraCoder 2013
#
# @author kuroneko
# @copyright 2014 kuroneko. All rights reserved
##

text=$(cat -);
ip='';
mask='';
for value in $text
do
    if [ "${value}" = '0.0.0.0' ]
    then
        break;
    fi
    if [ "${ip}" = '' ]
    then
        ip=${value};
        continue;
    fi
    mask=${value};
    IFS='.';
    ip=(${ip});
    n=$(( ${ip[0]} << 24 | ${ip[1]} << 16 | ${ip[2]} << 8 | ${ip[3]} ));
    n=$(( ${n} & ( 0xFFFFFFFF << ( 32 - ${mask} ) ) ));
    printf "%d.%d.%d.%d\n" $(( $n >> 24 )) $(( ( $n >> 16 ) & 0xFF )) $(( ( $n >> 8 ) & 0xFF )) $(( $n & 0xFF ))
    IFP=' ';
    ip='';
done
