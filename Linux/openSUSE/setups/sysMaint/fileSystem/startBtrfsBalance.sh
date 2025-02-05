#!/bin/bash
# This script will run btrfs 'balance'
# operation on the directory passed as
# the first parameter for this script
# Run this as sudo
#
# Parameter #1: The directory on which the btrfs
#               balance opeartion will be run

  declare targetDrive="$1"


  echo
  echo "Starting btrfs 'balance' operation"

  if [ -z "$targetDrive" ]
  then
    echo
    echo "ERROR: Parameter #1 Passed to this script"
    echo "is empty and INVALID!"
    echo "Parameter #1 should contain the drive/directory"
    echo "on which the 'btrfs' balance operation"
    echo "will be started."
    echo "Script: startBtrfsBalance.sh"
    echo

    exit 99

  fi

  if [ ! -d "$targetDrive" ]
  then
    echo
    echo "ERROR: Parameter #1 Passed to this script"
    echo "does NOT contain a valid drive/directory."
    echo "A valid drive/directory is required in order"
    echo "to start the 'btrfs' balance operation."
    echo "Script: startBtrfsBalance.sh"
    echo

    exit 98
  fi

  echo "The btrfs 'balance' operation will now"
  echo "be started on Drive: $targetDrive"
  echo "Script: startBtrfsBalance.sh"
  echo

  sudo btrfs balance start "$targetDrive" || {

    declare -i theErrCode=0

    theErrCode=$?

    echo
    echo "Error: Starting 'balance' operation on $targetDrive FAILED"
    echo "Command: sudo btrfs balance start $targetDrive"
    echo "Script: startBtrfsBalance.sh"
    echo "Error Code: $theErrCode"
    echo

    return $theErrCode
   }


  echo
  echo "Successfully started 'btrfs' balance operation on $targetDrive"
  echo "To check the status of this running balance operation,"
  echo "execute the command: sudo btrfs balance status $targetDrive"
  echo "Script: startBtrfsBalance.sh"
  echo

  exit 0