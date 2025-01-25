#!/bin/bash
# Installs GNU C and C++ Development Tools
# https://www.pragmaticlinux.com/2022/01/how-to-install-build-essential-on-opensuse/
# zypper search -t pattern
# zypper info -t pattern devel_basis


echo
echo "Installing C & C++ Packages"
echo

function installGCCPlus() {

  local -i theErrCode=0

  sudo sudo apt install gcc || {

    theErrCode=$?

    echo "Error 'gcc' install FAILED"
    echo "Command: sudo sudo apt install gcc"
    echo "Function: installGCCPlus()"
    echo "Script: 01-installDevTools.sh"
    echo "Error Code: $theErrCode"
    return $theErrCode

  }


}

