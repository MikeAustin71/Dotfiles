#!/bin/bash
# Creates a manual or custom snapshot of
# the 'home' directory
# Run this as sudo
#
# Parameter $1 = Description Text
#


  declare snapDesc="\"$1\""

  echo
  echo "Creating Custom Snapper Snapshot for 'home'"
  echo

  sudo snapper -c home create --description "$snapDesc" || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Creation of custom 'home' snapshot FAILED"
    echo "Command: sudo snapper -c home create --description $snapDesc"
    echo "Script: makRootSnapshot.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
   }
