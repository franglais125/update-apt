#!/bin/bash

######################################
#                                    #
#   Check for local packages         #
#                                    #
######################################

JUST_SHOW=$1
path=$2

file=${path}local.list
if [ "$JUST_SHOW" -lt 1 ]
then
  apt-show-versions | grep 'newer than version in archive\|*manually*' | awk '{print $1}' > ${file}
fi

num=`cat ${file} | wc -l`
if [ "$num" -gt 0 ]
then
  echo -e "\e[1m"
  echo " *      List of local packages      * "
  echo -e "\e[0m"
  cat ${file}
fi
