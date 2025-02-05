#!/bin/bash
# Creates a manual or custom snapshot of
# the 'root' directory
# Run this as sudo
#
# Parameter $1 = Description Text
#


  declare snapDesc="\"$1\""

  echo
  echo "Creating Custom Snapper Snapshot for 'root'"
  echo

  sudo snapper -c root create --description "$snapDesc" || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Creation of custom 'root' snapshot FAILED"
    echo "Command: sudo snapper -c root create --description $snapDesc"
    echo "Script: makeRootSnapshot.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
   }


  echo
  echo "Successfully created Custom 'root' Snapper Snapshot"
  echo
