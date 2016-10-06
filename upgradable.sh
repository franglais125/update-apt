#!/bin/bash

######################################
#                                    #
#   Check for upgradable pacakges    #
#                                    #
######################################

path=$1

file=${path}upgradable.list
apt list --upgradable &> ${file}.tmp

sed -i ':a;N;$!ba;s/\n/\\\\e[0;32m\n/g' ${file}.tmp
sed -i 's/\//\\\\e[0m\//g' ${file}.tmp

tail -n+5 ${file}.tmp > ${file}
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
fi
