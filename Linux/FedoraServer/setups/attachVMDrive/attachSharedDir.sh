#!/usr/bin/bash
# Attaches the shared host drive to the
# guest virtual machine
#
# The following command will mount the 
# shared directory in $HOME/shares
#
# Run this script as sudo

source "$MIKE_Setup_Utilities"/utilsLib.sh

localShareDir="$HOME/shares"


attachSharedVMDir() {

local -i lastExitCode=0

sudo /usr/bin/vmhgfs-fuse .host:/ "$localShareDir" -o subtype=vmhgfs-fuse,allow_other ||
  {
    lastExitCode=$?

    echo "Error attaching VM Shared Directory!"
    echo "Error Code: $lastExitCode"
    echo "Function: attachSharedVMDir()"
    echo "Script: attachSharedDir.sh"

    return "$lastExitCode"
  }


  return 0
}

 makeDirIfNotExist "$localShareDir" "776" "" &&
 attachSharedVMDir &&
 successMsg "Successfully Attached VM Shared Directory!" "Local Directory Share: $localShareDir"
