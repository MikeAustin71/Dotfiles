#!/bin/bash
# Install additional python libraries


echo
echo "Installing pip and pipx"
echo

  sudo apt install python3-pip pipx  || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Installation of 'pip' and 'pipx' FAILED!"
    echo "Command: sudo apt install python3-pip pipx"
    echo "Script: 03b-installPythonLibs.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
  }
