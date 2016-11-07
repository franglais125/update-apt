#!/bin/bash

######################################
#                                    #
#   Check for new packages           #
#                                    #
######################################

JUST_SHOW=$1
path=$2

file_all=${path}all-packages.list
file=${path}new-packages.list
temporary=${path}temporary.list

if [ "$JUST_SHOW" -gt 0 ]
then
  num=`cat ${file} | wc -l`
  if [ "$num" -gt 0 ]
  then
    less $file
  fi
  exit
fi

first_run=false

#Prepare
if [ -f ${file_all} ]; then
  mv ${file_all} ${file_all}.old
else
  first_run=true
fi

apt-cache search . | awk '{print $1}' | sort > ${file_all}
if [ "$first_run" = true ]; then
  exit 0
fi
diff ${file_all} ${file_all}.old | awk '{print $2}' | grep -v -e '^$' > ${temporary}

# Check that the difference doesn't come from the `.old` file
touch ${file}.test
rm ${file}.test
touch ${file}.test
for line in $(cat ${temporary})
do
  if grep -Fxq $line ${file_all}
  then
    echo $line >> ${file}.test
  fi
done

#Erase the file if there are new packages
num=`cat ${file}.test | wc -l`

if [ "$num" -gt 0 ]
then
  mv ${file}.test ${file}
fi

if [ ! -f ${file} ]; then
  touch ${file}
fi

#Print!
num=`cat ${file} | wc -l`

if [ "$num" -gt 30 ]
then
  echo -e "\e[1m"
  echo " *    New packages in repository    * "
  echo " * List is too long. You can open:  * "
  echo -e "\e[0m"${file}
elif [ "$num" -gt 0 ]
then
  echo -e "\e[1m"
  echo " *    New packages in repository    * "
  echo -e "\e[0m"
  cat ${file} | grep -v -e '^$'
fi
