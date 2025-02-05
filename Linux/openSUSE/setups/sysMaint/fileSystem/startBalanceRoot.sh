#!/bin/bash
# This script will run btrfs 'balance'
# operation on the 'root' directory
# Run this as sudo
#

  echo
  echo "Running 'balance' operation on 'root' ('/')"
  echo

  sudo btrfs balance start / || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Running 'balance' operation on 'root' FAILED"
    echo "Command:sudo sudo btrfs balance start /"
    echo "Script: balanceFsRoot.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
   }


  echo
  echo "Successfully started 'btrfs' balance operation on 'root' ('/')"
  echo "Script: balanceFsRoot.sh"
 echo
