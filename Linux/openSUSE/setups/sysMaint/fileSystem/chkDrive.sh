#!/bin/bash
# Lists list disk usage stats for a drive
# passed as Parameter #1
# Run this as sudo
#
# Parameter # 1 - The drive for which usage stats
#                 will be listed.

 declare locTargetDrive="$1"

  echo
  echo "Listing Disk/Drive Usage Statistics"


  if [ -z "$locTargetDrive" ]
  then
    echo
    echo "ERROR: Parameter #1 Passed to this script"
    echo "is empty and INVALID!"
    echo "Parameter #1 should contain the drive"
    echo "for which usage statistics will be"
    echo "listed."
    echo "Script: chkDrive.sh"
    echo

    exit 99

  fi

  if [ ! -d "$locTargetDrive" ]
  then
    echo
    echo "ERROR: Parameter #1 Passed to this script"
    echo "does NOT contain a valid directory."
    echo "A valid directory is required in order"
    echo "to list disk/drive usage statistics"
    echo "Script: chkDrive.sh"
    echo

    exit 98
  fi

  echo "for drive: $locTargetDrive"
  echo "Script: chkDrive.sh"
  echo

  sudo btrfs filesystem usage "$locTargetDrive" || {

    declare -i theErrCode=0

    theErrCode=$?

    echo "Error: Listing disk usage stats for '$locTargetDrive' FAILED"
    echo "Command: sudo btrfs filesystem usage $locTargetDrive"
    echo "Script: driveUsage.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
   }


  echo
  echo "Successfully Listed Disk Usage Stats for '$locTargetDrive'"
  echo

  exit 0