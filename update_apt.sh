#!/bin/bash
path=___BASEDIR___

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
    ${path}/upgradable.sh ${path}/tmp/ ;;
  "residual")
    ${path}/residual.sh ${path}/tmp/ ;;
  "obsolete")
    ${path}/obsolete.sh ${path}/tmp/ ;;
  "new")
    ${path}/new.sh ${path}/tmp/ ;;
  "local")
    ${path}/local.sh ${path}/tmp/ ;;
  "clean")
    ${path}/clean.sh ;;
  "help")
    ${path}/help.sh ;;
  "")
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
    ${path}/upgradable.sh ${path}/tmp/ ;;
  *)
    echo "Error: \"$1\" is not a valid command"
    exit 1 ;;
esac

exit 0
