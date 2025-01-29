#!/bin/bash
# Installs Python Version 3
# Run this as sudo

echo
echo "Installing Python 3"
echo

  sudo apt install python3  || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Installation of 'python3' FAILED!"
    echo "Command: sudo apt install python3"
    echo "Script: 03-installPython.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
  }

