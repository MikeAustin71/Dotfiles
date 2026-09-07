#!/bin/bash
# Installs Python version 2
# Run this as sudo


echo
echo "Installing libpython2_7-1_0"
echo

  sudo zypper install libpython2_7-1_0  || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Installation of library 'libpython2_7-1_0' FAILED!"
    echo "Command: sudo zypper install libpython2_7-1_0"
    echo "Script: 04-installPython2.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode

  }
