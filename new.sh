#!/bin/bash

######################################
#                                    #
#   Check for new packages           #
#                                    #
######################################

path=$1

file_all=${path}all-packages.list
file=${path}new-packages.list
temporary=${path}temporary.list

#Prepare
mv ${file_all} ${file_all}.old

apt-cache search . | awk '{print $1}' | sort > ${file_all}
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
