#!/bin/bash
# Installs Development Tools
# Run this as sudo

echo
echo "Installing meson ninja gdb"
echo

  sudo zypper install meson ninja gdb  || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Installation of meson ninja gdb FAILED!"
    echo "Command: sudo zypper install meson ninja gdb"
    echo "Script: 02-installDevTools.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode

  }

