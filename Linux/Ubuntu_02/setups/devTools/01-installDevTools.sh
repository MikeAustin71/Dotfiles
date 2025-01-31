#!/bin/bash
# Installs GNU C and C++ Development Tools
# https://www.pragmaticlinux.com/2022/01/how-to-install-build-essential-on-opensuse/


  declare -i packDev01ErrCode=0

  echo
  echo "Installing build-essentials Package"
  echo

  sudo sudo apt install build-essential || {

    packDev01ErrCode=$?

    echo "Error: 'build-essentials' installation FAILED"
    echo "Command: sudo apt install build-essential"
    echo "Script: 01-installDevTools.sh"
    echo "Error Code: $packDev01ErrCode"
    return $packDev01ErrCode

  }

  echo
  echo "Installing manpages-dev Package"
  echo


  sudo apt-get install manpages-dev || {

    packDev01ErrCode=$?

    echo "Error: 'manpages-dev' installation FAILED"
    echo "Command: sudo apt-get install manpages-dev"
     echo "Script: 01-installDevTools.sh"
    echo "Error Code: $packDev01ErrCode"
    return $packDev01ErrCode

  }

  echo
  echo "Installing C & C++ Packages"
  echo

  sudo sudo apt install gcc || {

    packDev01ErrCode=$?

    echo "Error: 'gcc' installation FAILED"
    echo "Command: sudo sudo apt install gcc"
     echo "Script: 01-installDevTools.sh"
    echo "Error Code: $packDev01ErrCode"
    return $packDev01ErrCode

  }
