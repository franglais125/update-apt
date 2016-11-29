#!/bin/bash

######################################
#                                    #
#   Check for upgradable pacakges    #
#                                    #
######################################

JUST_SHOW=$1
path=$2

file=${path}upgradable.list
if [ "$JUST_SHOW" -lt 1 ]
then
  apt list --upgradable &> ${file}.tmp
  sed -i ':a;N;$!ba;s/\n/\\\\e[0;32m\n/g' ${file}.tmp
  sed -i 's/\//\\\\e[0m\//g' ${file}.tmp
  tail -n+5 ${file}.tmp > ${file}
fi

num=`cat ${file} | wc -l`
if [ "$num" -gt 0 ]
then
  echo -e "\e[1m"
  echo " *   List of upgradable packages    * "
  echo -e "\e[0m\e[0;32m"
  cat $file | while read line
  do
    echo -e $line
  done
  notify-send -i system-software-update "upd: Updates available"
fi
