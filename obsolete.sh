#!/bin/bash

######################################
#                                    #
#   Check for obsolete packages      #
#                                    #
######################################

JUST_SHOW=$1
path=$2

file=${path}obsolete.list
if [ "$JUST_SHOW" -lt 1 ]
then
  apt-show-versions | grep 'No available version' | awk '{print $1}' > ${file}
fi

num=`cat ${file} | wc -l`
if [ "$num" -gt 0 ]
then
  echo -e "\e[1m"
  echo " *    List of obsolete packages     * "
  echo -e "\e[0m"
  cat ${file}
fi

