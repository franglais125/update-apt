#!/bin/bash

######################################
#                                    #
#   Check for residual config files  #
#                                    #
######################################

path=$1

file=${path}residual-config.list
dpkg -l | grep '^rc'| awk '{print $2}' > ${file}
num=`cat ${file} | wc -l`
if [ "$num" -gt 0 ]
then
  echo -e "\e[1m"
  echo " * List of residual config packages * "
  echo -e "\e[0m"
  cat ${file}
fi

