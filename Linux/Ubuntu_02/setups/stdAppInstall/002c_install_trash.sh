#!/bin/bash
# Installs Trash
# This procedure is error prone and
# requires user intervention.



function installTrashCli() {

  local -i theErrCode=0

  echo
  echo "Installing Trash"
  echo

  sudo apt install trash-cli || {

    theErrCode=$?

    echo
    echo "Error installing trash-cli"
    echo "Command: apt install trash-cli "
    echo "Error Code: $theErrCode"
    echo "Function: installTrashCli()"
    echo "Script File: 002b_install_trash.sh"
    echo

  }


  return $theErrCode
}

installTrashCli &&
successMsg "Installed 'trash' a.k.a. 'trash-cli'." "Script: 002c_install_trash.sh" || {

  errXMsg "002c_install_trash.sh Execution Failed" "Error-Exit!"
}
