#!/bin/bash
# Installs SDDM Qt Login Manger
# Run this as sudo

echo
echo "Installing SDDM Qt"
echo

sudo apt install sddm-qt6 || {

  declare -i theErrCode=0

  theErrCode=$?

  echo "Error: Installation of SDDM Login Manager FAILED"
  echo "Command: sudo apt install sddm-qt6"
  echo "Script: installSddmQt"
  echo "Error Code: $theErrCode"

  return $theErrCode


}