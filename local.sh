#!/bin/bash

######################################
#                                    #
#   Check for local packages         #
#                                    #
######################################

path=$1

file=${path}local.list
apt-show-versions | grep 'newer than version in archive\|*manually*' | awk '{print $1}' > ${file}
num=`cat ${file} | wc -l`
if [ "$num" -gt 0 ]
then
  echo -e "\e[1m"
  echo " *      List of local packages      * "
  echo -e "\e[0m"
  cat ${file}
fi
