#!/bin/bash
# Lists all snapshots for the 'home' directory
# Run this as sudo
#

  echo
  echo "Listing 'home' snapshots"
  echo

  sudo snapper -c home list || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Listing 'root' snapshot FAILED"
    echo "Command: sudo snapper -c home list"
    echo "Script: listHomeSnapshots.sh"
    echo "Error Code: $theErrCode"

    exit $theErrCode
   }
