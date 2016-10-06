#!/bin/bash

######################################
#                                    #
#   Check for obsolete packages      #
#                                    #
######################################

path=$1

file=${path}obsolete.list
apt-show-versions | grep 'No available version' | awk '{print $1}' > ${file}
num=`cat ${file} | wc -l`
if [ "$num" -gt 0 ]
then
  echo -e "\e[1m"
  echo " *    List of obsolete packages     * "
  echo -e "\e[0m"
  cat ${file}
fi

