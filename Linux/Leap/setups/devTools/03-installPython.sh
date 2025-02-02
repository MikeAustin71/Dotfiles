#!/bin/bash
# Installs Python Version 3
# Run this as sudo

echo
echo "Installing Python 3"
echo

  sudo zypper install -t pattern devel_python3  || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Installation of pattern devel_python3 FAILED!"
    echo "Command: sudo zypper install -t pattern devel_python3 "
    echo "Script: 03-installPython.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode

  }


