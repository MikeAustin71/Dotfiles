#!/bin/bash
# Installs QT6 Technical Library
# Run this as sudo

echo
echo "Installing QT6 Technical Library"
echo

sudo zypper install -t pattern pattern devel_qt6 || {

  declare -i theErrCode=0

  theErrCode=$?

  echo "Error: Installation of pattern 'devel_qt6' (Tech Libraries) FAILED"
  echo "Command: sudo zypper install -t pattern pattern devel_qt6"
  echo "Script: 06-installQT6TechLib.sh"
  echo "Error Code: $theErrCode"

  return $theErrCode


}
