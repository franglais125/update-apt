#!/bin/bash

path=___BASEDIR___

if   [ "$1" = "update" ]
then
  sudo apt update
  exit 0
elif [ "$1" = "upgrade" ]
then
  sudo apt upgrade
  exit 0
elif [ "$1" = "fupgrade" ]
then
  sudo apt full-upgrade
  exit 0
elif [ "$1" = "upgradable" ]
then
  ${path}/upgradable.sh ${path}/tmp/
  exit 0
elif [ "$1" = "residual" ]
then
  ${path}/residual.sh ${path}/tmp/
  exit 0
elif [ "$1" = "obsolete" ]
then
  ${path}/obsolete.sh ${path}/tmp/
  exit 0
elif [ "$1" = "new" ]
then
  ${path}/new.sh ${path}/tmp/
  exit 0
elif [ "$1" = "local" ]
then
  ${path}/local.sh ${path}/tmp/
  exit 0
elif [ "$1" = "clean" ]
then
  ${path}/clean.sh
  exit 0
elif [ "$1" = "help" ]
then
  ${path}/help.sh
  exit 0
elif [ $# -eq 0 ]
then
  # If no option is passed, execute the whole update sequence
  #   Update the repo information      #
  sudo apt update
  #   Check for residual config files  #
  ${path}/residual.sh ${path}/tmp/
  #   Check for obsolete packages      #
  ${path}/obsolete.sh ${path}/tmp/
  #   Check for local packages         #
  ${path}/local.sh ${path}/tmp/
  #   Check for new packages           #
  ${path}/new.sh ${path}/tmp/
  #   Check for upgradable pacakges    #
  ${path}/upgradable.sh ${path}/tmp/
  exit 0
else
  echo "Error: \"$1\" is not a valid command"
  exit 1
fi


