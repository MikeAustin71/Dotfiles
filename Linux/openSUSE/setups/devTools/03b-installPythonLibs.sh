#!/bin/bash
# Install additional python libraries


echo
echo "Installing pip and pipx"
echo

  sudo zypper install python312-pip python312-pipx || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Installation of pip and pipx FAILED!"
    echo "Command:  sudo zypper install python312-pip python312-pipx"
    echo "Script: 03b-installPythonLibs.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
  }
