#!/bin/bash
# Installs Java Libraries and Tools
# Run this as sudo

echo
echo "Installing Java"
echo

sudo zypper install -t pattern devel_java || {

  declare -i theErrCode=0

  theErrCode=$?

  echo "Error: Installation of pattern 'devel_java' (Java Tools) FAILED"
  echo "Command: sudo zypper install -t pattern devel_java"
  echo "Script: 05-installJava.sh"
  echo "Error Code: $theErrCode"

  return $theErrCode


}

