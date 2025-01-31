#!/bin/bash
# Installs Development Tools
# Run this as sudo

echo
echo "Installing Btrfs Tools"
echo

  sudo sudo apt install btrfs-progs -y  || {

   declare -i theErrCode=0

   theErrCode=$?

   echo "Error: Installation Btrfs Package FAILED!"
   echo "Command: sudo sudo apt install btrfs-progs -y"
   echo "Script: 06-installBTRFS.sh"
   echo "Error Code: $theErrCode"

   return $theErrCode
  }
