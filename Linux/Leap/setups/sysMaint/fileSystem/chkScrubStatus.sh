#!/bin/bash
# This script will check the status of
# a btrfs 'scrub' operation running
# on the directory passed as the first
# parameter for this script
# Run this as sudo
#
# Parameter #1: The directory for which the btrfs
#               scrub operation status check
#               will be run

  declare targetDrive="$1"


  echo
  echo "Checking btrfs 'scrub' operation status"

  if [ -z "$targetDrive" ]
  then
    echo
    echo "ERROR: Parameter #1 Passed to this script"
    echo "is empty and INVALID!"
    echo "Parameter #1 should contain the drive/directory"
    echo "on which the 'btrfs' scrub operation"
    echo "status check will be run."
    echo "Script: chkScrubStatus.sh"
    echo

    exit 99

  fi

  if [ ! -d "$targetDrive" ]
  then
    echo
    echo "ERROR: Parameter #1 Passed to this script"
    echo "does NOT contain a valid drive/directory."
    echo "A valid drive or directory is required in order"
    echo "to check status on a 'btrfs' scrub operation"
    echo "in progress."
    echo "Script: chkScrubStatus.sh"
    echo

    exit 98
  fi

  echo "The btrfs 'scrub' operation will now"
  echo "be started on Drive: $targetDrive"
  echo "Script: chkScrubStatus.sh"
  echo

  sudo btrfs scrub status "$targetDrive" || {

    declare -i theErrCode=0

    theErrCode=$?

    echo
    echo "Error: Checking status on 'scrub' operation in progress"
    echo "on Target Drive: $targetDrive"
    echo "Command: sudo btrfs scrub status $targetDrive"
    echo "Script: chkScrubStatus.sh"
    echo "Error Code: $theErrCode"
    echo

    exit $theErrCode
   }


  echo
  echo "Successful Completion"
  echo "Provided status check on 'btrfs' scrub operation"
  echo "now in progress on Target Drive: $targetDrive"
  echo "Script: chkScrubStatus.sh"
  echo

  exit 0