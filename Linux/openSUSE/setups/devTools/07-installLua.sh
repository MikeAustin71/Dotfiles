#!/bin/bash
# Installs lua Libraries and Tools
# Run this as sudo

echo
echo "Installing Java"
echo

sudo zypper install lua54 || {

  declare -i theErrCode=0

  theErrCode=$?

  echo "Error: Installation of 'lua' FAILED"
  echo "Command: sudo zypper install lua54"
  echo "Script: 07-installLua.sh"
  echo "Error Code: $theErrCode"

  return $theErrCode


}


sudo zypper install lua54-doc || {

  declare -i theErrCode=0

  theErrCode=$?

  echo "Error: Installation of 'lua54-doc' FAILED"
  echo "Command: zypper install lua54-doc"
  echo "Script: 07-installLua.sh"
  echo "Error Code: $theErrCode"

  return $theErrCode


}
