#!/bin/bash
# Lists list disk usage stats for root '/'
# Run this as sudo
#


  sudo btrfs filesystem usage /


  echo
  echo "Listing Disk Usage Stats for 'root' ('/')"
  echo

  sudo btrfs filesystem usage / || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Listing disk usage stats for 'root' FAILED"
    echo "Command: sudo btrfs filesystem usage /"
    echo "Script: fsUsage.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
   }


  echo
  echo "Successfully Listed Disk Usage Stats for 'root' ('/')"
  echo
