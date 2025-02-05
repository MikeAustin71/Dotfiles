#!/bin/bash
# Lists all snapshots for the 'root' directory
# Run this as sudo
#

  echo
  echo "Listing 'root' snapshots"
  echo

  sudo snapper -c root list || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Listing 'root' snapshot FAILED"
    echo "Command: sudo snapper -c root list"
    echo "Script: listRootSnapshots.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
   }
