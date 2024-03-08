#!/usr/bin/bash
# Attaches the shared host drive to the
# guest virtual machine
#
# The following command will mount the 
# shared directory in $HOME/shares
#
# Run this script as sudo

localShareDir="$HOME/shares"

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"



attachSharedVMDir() {

local -i lastExitCode=0

sudo /usr/bin/vmhgfs-fuse .host:/ "$localShareDir" -o subtype=vmhgfs-fuse,allow_other ||
  {
    lastExitCode=$?

    echo -e "Error attaching VM Shared Directory!\n
    Error Code: $lastExitCode\n
    Function: attachSharedVMDir()" ; return "$lastExitCode"
  }


  return 0
}

 makeDirIfNotExist "$localShareDir" "776" "" &&
 attachSharedVMDir &&
 successMsg "Successfully Attached VM Shared Directory!" "Local Directory Share: $localShareDir"
