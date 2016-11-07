#!/bin/bash

######################################
#                                    #
#   Check for residual config files  #
#                                    #
######################################

JUST_SHOW=$1
path=$2

file=${path}residual-config.list
if [ "$JUST_SHOW" -lt 1 ]
then
  dpkg -l | grep '^rc'| awk '{print $2}' > ${file}
fi

num=`cat ${file} | wc -l`
if [ "$num" -gt 0 ]
then
  echo -e "\e[1m"
  echo " * List of residual config packages * "
  echo -e "\e[0m"
  cat ${file}
fi

