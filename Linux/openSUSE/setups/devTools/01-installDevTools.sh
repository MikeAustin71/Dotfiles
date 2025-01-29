#!/bin/bash
# Installs GNU C and C++ Development Tools
# https://www.pragmaticlinux.com/2022/01/how-to-install-build-essential-on-opensuse/
# zypper search -t pattern
# zypper info -t pattern devel_basis


echo
echo "Installing C & C++ Packages"
echo

  sudo zypper install -t pattern devel_C_C++ || {

   declare -i theErrCode=0

   theErrCode=$?

   echo "Error: Installation of pattern 'devel_C_C++' (C and C++ Tools) FAILED!"
   echo "Command: sudo zypper install -t pattern devel_C_C++"
   echo "Script: 01-installDevTools.sh"
   echo "Error Code: $theErrCode"

   return $theErrCode

  }

