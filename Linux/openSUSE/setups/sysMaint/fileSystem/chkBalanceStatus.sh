#!/bin/bash
# This script will check the status of
# a btrfs 'balance' operation running
# on the directory passed as the first
# parameter for this script
# Run this as sudo
#
# Parameter #1: The directory for which the btrfs
#               balance operation status check
#               will be run

  declare targetDrive="$1"


  echo
  echo "Checking btrfs 'balance' operation status"

  if [ -z "$targetDrive" ]
  then
    echo
    echo "ERROR: Parameter #1 Passed to this script"
    echo "is empty and INVALID!"
    echo "Parameter #1 should contain the drive"
    echo "on which the 'btrfs' balance operation"
    echo "status check will be run."
    echo "Script: chkBalanceStatus.sh"
    echo

    exit 99

  fi

  if [ ! -d "$targetDrive" ]
  then
    echo
    echo "ERROR: Parameter #1 Passed to this script"
    echo "does NOT contain a valid directory."
    echo "A valid directory is required in order"
    echo "to check status on a 'btrfs' balance operation"
    echo "in progress."
    echo "Script: chkBalanceStatus.sh"
    echo

    exit 98
  fi

  echo "The btrfs 'balance' operation will now"
  echo "be started on Drive: $targetDrive"
  echo "Script: chkBalanceStatus.sh"
  echo

  sudo btrfs balance status "$targetDrive" || {

    declare -i theErrCode=0

    theErrCode=$?

    echo
    echo "Error: Checking status on 'balance' operation in progress"
    echo "on Target Drive: $targetDrive"
    echo "Command: sudo btrfs balance status $targetDrive"
    echo "Script: chkBalanceStatus.sh"
    echo "Error Code: $theErrCode"
    echo

    return $theErrCode
   }


  echo
  echo "Successful Completion"
  echo "Provided status check on 'btrfs' balance operation"
  echo "now in progress on Target Drive: $targetDrive"
  echo "Script: chkBalanceStatus.sh"
  echo

  exit 0