#!/bin/bash
# Creates a manual or custom snapshot of
# the 'home' directory
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
    echo "Script: startBtrfsBalance.sh"
    echo

    exit 99

  fi


  echo
  echo "Creating Custom Snapper Snapshot for 'home'"
  echo




  sudo snapper -c home create --description "$snapDesc" --userdata important=yes || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Creation of custom 'home' snapshot FAILED"
    echo "Command: sudo snapper -c home create --description $snapDesc --userdata important=yes"
    echo "Script: makeHomeSnapshot.sh"
    echo "Error Code: $theErrCode"

    exit $theErrCode
   }


  echo
  echo "Successfully created Custom 'home' Snapper Snapshot"
  echo
