#!/bin/bash
# Installs Python Version 3
# Run this as sudo

echo
echo "Installing Base Development Tools"
echo

sudo zypper install -t pattern devel_basis  || {

  declare -i theErrCode=0

  theErrCode=$?

  echo "Error: Installation of pattern 'devel_basis ' (Base Development Tools) FAILED!"
  echo "Command: sudo zypper install -t pattern devel_basis"
  echo "Script: 05-installJava.sh"
  echo "Error Code: $theErrCode"

  return $theErrCode


}
