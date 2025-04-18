#!/bin/bash
# Creates a manual or custom snapshot of
# the 'root' directory
# Run this as sudo
#
# Parameter $1 = Description Text
#


  declare snapDesc="\"$1\""

  if [ -z "$snapDesc" ]
  then
    echo
    echo "ERROR: Parameter #1 Passed to this script"
    echo "is empty and INVALID!"
    echo "Parameter #1 should contain the description"
    echo "which be associated with the custom snap shot."
    echo "Script: makeRootSnapshot.sh"
    echo

    exit 99

  fi


  echo
  echo "Creating Custom Snapper Snapshot for 'root'"
  echo "Script: makeRootSnapshot.sh"
  echo

  sudo snapper -c root create --description "$snapDesc" --userdata important=yes || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Creation of custom 'root' snapshot FAILED"
    echo "Command: sudo snapper -c root create --description $snapDesc --userdata important=yes"
    echo "Script: makeRootSnapshot.sh"
    echo "Error Code: $theErrCode"

    exit $theErrCode
   }


  echo
  echo "Successfully created Custom 'root' Snapper Snapshot"
  echo
