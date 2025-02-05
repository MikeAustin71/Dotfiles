#!/bin/bash
# Lists list disk usage stats for
# second hard drive.
# Run this as sudo
#


  sudo btrfs filesystem usage /



  echo
  echo "Listing Disk Usage Stats for Second Hard Drive"

  if [ -z "$someVariable" ]
  then
    echo
    echo "ERROR: The Environment Variable identifying"
    echo "the second hard drive is empy and INVALID!"
    echo "Environment Variable MIKEHARDDRIVE2 has"
    echo "NOT BEEN SET!"
    echo
  fi

  echo "Second Hard Drive: $MIKEHARDDRIVE2"
    echo

  sudo btrfs filesystem usage "$MIKEHARDDRIVE2" || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Listing disk usage stats for 'root' FAILED"
    echo "Command: sudo btrfs filesystem usage $MIKEHARDDRIVE2"
    echo "Script: hd2Usage.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
   }


  echo
  echo "Successfully Listed Disk Usage Stats for $MIKEHARDDRIVE2"
  echo
