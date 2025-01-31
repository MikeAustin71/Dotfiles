#!/bin/bash
# Installs Development Tools
# Run this as sudo

echo
echo "Installing Default Java Package"
echo

  sudo apt install default-jdk -y  || {

   declare -i theErrCode=0

   theErrCode=$?

   echo "Error: Installation of default Java Package FAILED!"
   echo "Command: sudo apt install meson generate-ninja gdb"
   echo "Script: sudo apt install default-jdk -y"
   echo "Error Code: $theErrCode"

   return $theErrCode
  }
