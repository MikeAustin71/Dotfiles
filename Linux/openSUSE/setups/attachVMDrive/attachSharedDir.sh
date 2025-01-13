#!/usr/bin/bash
# Attaches the shared host drive to the
# guest virtual machine
#
# The following command will mount the 
# shared directory in /home/mike/.local/share
#
# Run this script as sudo

declare baseSetups523Dir="$HOME"/bashOps/setups


source "$baseSetups523Dir"/utilsLib.sh

declare localShareDir="$HOME"/.local/share/VMShare


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

 msgNotify "Creating local share directory if NOT Exists!" "$localShareDir" &&
 makeDirIfNotExist "$localShareDir" "775" "" &&
 msgNotify "Attaching Shared Directory: " "    $localShareDir" &&
 attachSharedVMDir &&
 successMsg "Successfully Attached VM Shared Directory!" "Local Directory Share: $localShareDir" || {
  errXMsg "attachSharedDir.sh Script Execution Failed" "Error-Exit!"
 }
