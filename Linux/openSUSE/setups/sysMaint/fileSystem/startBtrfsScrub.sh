#!/bin/bash
# This script will run btrfs 'scrub'
# operation on the directory passed as
# the first parameter for this script
# Run this as sudo
#
# Parameter #1: The directory on which the btrfs
#               scrub opeartion will be run

  declare targetDrive="$1"


  echo
  echo "Starting btrfs 'scrub' operation"

  if [ -z "$targetDrive" ]
  then
    echo
    echo "ERROR: Parameter #1 Passed to this script"
    echo "is empty and INVALID!"
    echo "Parameter #1 should contain the drive"
    echo "on which the 'btrfs' scrub operation"
    echo "will be started."
    echo "Script: startBtrfsScrub.sh"
    echo

    exit 99

  fi

  if [ ! -d "$targetDrive" ]
  then
    echo
    echo "ERROR: Parameter #1 Passed to this script"
    echo "does NOT contain a valid drive/directory."
    echo "A valid drive/directory is required in order"
    echo "to start the 'btrfs' scrub operation."
    echo "Script: startBtrfsScrub.sh"
    echo

    exit 98
  fi

  echo "The btrfs 'scrub' operation will now"
  echo "be started on Drive: $targetDrive"
  echo "Script: startBtrfsScrub.sh"
  echo

  sudo btrfs scrub start "$targetDrive" || {

    declare -i theErrCode=0

    theErrCode=$?

    echo
    echo "Error: Starting 'scrub' operation on $targetDrive FAILED!"
    echo "Command: sudo btrfs scrub start $targetDrive"
    echo "Script: startBtrfsScrub.sh"
    echo "Error Code: $theErrCode"
    echo

    return $theErrCode
   }


  echo
  echo "Successfully started 'btrfs' scrub operation on $targetDrive"
  echo "To check the status of this running scrub operation,"
  echo "execute the command: sudo btrfs scrub status $targetDrive"
  echo "Script: startBtrfsScrub.sh"
  echo

  exit 0