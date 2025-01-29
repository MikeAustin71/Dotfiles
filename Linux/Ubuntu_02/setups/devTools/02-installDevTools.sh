#!/bin/bash
# Installs Development Tools
# Run this as sudo

echo
echo "Installing meson ninja gdb"
echo

  sudo apt install meson generate-ninja gdb  || {

   declare -i theErrCode=0

   theErrCode=$?

   echo "Error: Installation of meson generate-ninja and gdb FAILED!"
   echo "Command: sudo apt install meson generate-ninja gdb"
   echo "Script: 02-installDevTools.sh"
   echo "Error Code: $theErrCode"

   return $theErrCode
  }
