#!/bin/bash
# This script copies all the setup files in
# "$HOME"/bashOps/setups to the shared VM Drive
# "$VMShare"/OpenSUSE/Tumbleweed/setups
# Make sure the VM Shared drive is attached before calling this
# script.

 declare baseSetups57Dir="$HOME"/bashOps/setups

 source "$baseSetups57Dir"/utils/utilsLib.sh

 declare -i saveSetupsToVM_ErrorCode
declare vmShareBaseDir="$VMShare"
 declare vmShareTargetSetupsDir="$vmShareBaseDir"/setups


function deleteVMShareSetups() {

  local -i THE_ErrorCode=0

  if [[ ! -d $baseSetups57Dir ]]; then

    THE_ErrorCode=98

    errXMsg "The copy operation cannot proceed." "Source Directory does NOT exist!" "Source Dir: $baseSetups57Dir" "Error Code:$THE_ErrorCode" "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh"

    return $THE_ErrorCode

   fi


  [[ -d $vmShareBaseDir ]] || {

    THE_ErrorCode=77

    errXMsg "The Base VM Share Directory is NOT Attached!" "The copy copy operation cannot proceed!" "Make sure $vmShareBaseDir is attached and then retry." "Also check VMShare is configured environment variable." "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh"

    return $THE_ErrorCode
  }

  if [[ ! -d $vmShareTargetSetupsDir ]]
  then

    mkdir -m 775 -p "$vmShareTargetSetupsDir" || {

      THE_ErrorCode=$?

      errXMsg "Attempted creation of target VM Directory Failed"  "Target VM Dir: $vmShareTargetSetupsDir"  "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh" "Error Code: $THE_ErrorCode"

      return $THE_ErrorCode

    }

  else

    # The VM Setups Dir Exists. Now delete that directory and all associated files
    zapFilesCmd "$vmShareTargetSetupsDir" "-rfv" "sudo" || {

    THE_ErrorCode=$?
    errXMsg "Attempted deletion of target VM Directory Failed" "Target VM Dir: $vmShareTargetSetupsDir" "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh" "Error Code: $THE_ErrorCode"

    return $THE_ErrorCode

  }

  mkdir -m 775 -p "$vmShareTargetSetupsDir" || {

    THE_ErrorCode=$?

    errXMsg "Attempted creation of target VM Directory Failed"  "Target VM Dir: $vmShareTargetSetupsDir"  "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh" "Error Code: $THE_ErrorCode"

    return $THE_ErrorCode

  }

  fi
  
  msgNotify "Successfully configured VM Setups Directory:" "VM Setups Dir: $vmShareTargetSetupsDir" "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh"

  return 0
}

function copyHomeSetupsToVMShare() {

  local -i THE_ErrorCode=0

  if [[ ! -d $baseSetups57Dir ]]; then

    THE_ErrorCode=99

    errXMsg "The copy operation cannot proceed." "Source Directory does NOT exist!" "Source Dir: $baseSetups57Dir" "Error Code:$THE_ErrorCode" "Function: copyHomeSetupsToVMShare" "Script: saveSetupsToVM.sh"

    return $THE_ErrorCode

  fi


    [[ -d $vmShareTargetSetupsDir ]] || {

      msgNotify "VM Target Base Directory Does NOT Exist!" "VMShare Target Dir: $vmShareTargetSetupsDir" "Attempting to create target directory" "Function: copyHomeSetupsToVMShare" "Script: saveSetupsToVM.sh"

    makeDirIfNotExist "$vmShareTargetSetupsDir" "775" "sudo" || {

    THE_ErrorCode=$?

    errXMsg "makeDirIfNotExist() failed to create target directory:" "$vmShareTargetSetupsDir" "The copy operation cannot proceed!" "Returned Error Code:$THE_ErrorCode" "Function: copyHomeSetupsToVMShare" "Script: saveSetupsToVM.sh"

    return $THE_ErrorCode

    }
  }

  msgNotify "Beginning Copy Operation using rsync ..."

  # Configued as 'mirror' operation
  #sudo rsync -L --archive --ignore-errors --force "$HOME"/.config $VMShare"/OpenSUSE/Tumbleweed/setups
  sudo rsync -L --archive --delete --ignore-errors --force "$baseSetups57Dir" "$vmShareTargetSetupsDir" || {

    THE_ErrorCode=$?

    errXMsg "Copy Operation Failed" "Source Dir: $baseSetups57Dir" "Target Base Dir: $vmShareTargetSetupsDir" "Function: copyHomeSetupsToVMShare" "Script: saveSetupsToVM.sh" "Error Code: $THE_ErrorCode"

  }


  return $THE_ErrorCode
}

msgNotify "Preparing to copy 'setups' to VM Shared Directory" "Step-1 Deleting existing setups in target directory." "Script: saveSetupsToVM.sh" &&
  deleteVMShareSetups &&
  msgNotify "Step-2 Starting main copy operation..."
  copyHomeSetupsToVMShare &&
    successMsg "saveSetupsToVM.sh - Successful Completion!" "Copied Home Setups to VM Drive" "Script: saveSetupsToVM.sh" || {

    saveSetupsToVM_ErrorCode=$?

    errXMsg "saveSetupsToVM.sh" "Error-Exit!" "Error Code: $saveSetupsToVM_ErrorCode"

    exit $saveSetupsToVM_ErrorCode
}


