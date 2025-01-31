#!/bin/bash
# Installs GNU C and C++ Development Tools
# https://www.pragmaticlinux.com/2022/01/how-to-install-build-essential-on-opensuse/

echo
echo "Installing C & C++ Packages"
echo

  sudo sudo apt install gcc || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error 'gcc' install FAILED"
    echo "Command: sudo sudo apt install gcc"
    echo "Function: installGCCPlus()"
    echo "Script: 01-installDevTools.sh"
    echo "Error Code: $theErrCode"
    return $theErrCode

  }
