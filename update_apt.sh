#!/bin/bash
path=___BASEDIR___

# Simply show the file
JUST_SHOW=1

date

case "$1" in
  "shortlist")
    echo update upgrade fupgrade list-upgrades residual obsolete local new clean help ;;
  "update")
    sudo apt update ;;
  "upgrade")
    sudo apt upgrade ;;
  "fupgrade")
    sudo apt full-upgrade ;;
  "list-upgrades")
    ${path}/upgradable.sh ${JUST_SHOW} ${path}/tmp/ ;;
  "residual")
    ${path}/residual.sh   ${JUST_SHOW} ${path}/tmp/ ;;
  "obsolete")
    ${path}/obsolete.sh   ${JUST_SHOW} ${path}/tmp/ ;;
  "new")
    ${path}/new.sh        ${JUST_SHOW} ${path}/tmp/ ;;
  "local")
    ${path}/local.sh      ${JUST_SHOW} ${path}/tmp/ ;;
  "clean")
    ${path}/clean.sh ;;
  "help")
    ${path}/help.sh ;;
  "")
    # If no option is passed, execute the whole update sequence
    JUST_SHOW=0
    #   Update the repo information      #
    echo "sudo apt update"
    sudo apt update
    #   Check for new packages           #
    ${path}/new.sh        ${JUST_SHOW} ${path}/tmp/
    #   Check for residual config files  #
    ${path}/residual.sh   ${JUST_SHOW} ${path}/tmp/
    #   Check for obsolete packages      #
    ${path}/obsolete.sh   ${JUST_SHOW} ${path}/tmp/
    #   Check for local packages         #
    ${path}/local.sh      ${JUST_SHOW} ${path}/tmp/
    #   Check for upgradable pacakges    #
    ${path}/upgradable.sh ${JUST_SHOW} ${path}/tmp/ ;;
  *)
    echo "Error: \"$1\" is not a valid command"
    exit 1 ;;
esac

exit 0
