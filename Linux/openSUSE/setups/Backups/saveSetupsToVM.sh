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

 declare vmShareTargetBaseDir="$vmShareBaseDir"/OpenSUSE/Tumbleweed

 declare vmShareTargetSetupsDir="$vmShareTargetBaseDir"/setups

 declare vmShareTargetDir="$vmShareTargetBaseDir"/"$vmShareTargetSetupsDir"

function deleteVMShareSetups() {

  local -i THE_ErrorCode=0

  [[ -d $vmShareBaseDir ]] || {

    THE_ErrorCode=77

    errXMsg "The Base VM Share Directory is NOT Attached!" "The copy copy operation cannot proceed!" "Make sure $vmShareBaseDir is attached and then retry." "Also check VMShare is configured environment variable." "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh"

    return $THE_ErrorCode
  }

  [[ -d $vmShareTargetDir ]] || {

    THE_ErrorCode=0

    msgNotify "VM Target Base Directory Does NOT Exist!" "$vmShareTargetDir" "Nothing to do..." "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh"

    return $THE_ErrorCode
   }

  zapFilesCmd "$vmShareTargetDir" "-rfv" "sudo" || {

    THE_ErrorCode=$?

    errXMsg "Attempted deletion of target VM Directory Failed" "$vmShareTargetDir" "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh" "Error Code: $THE_ErrorCode"

    return $THE_ErrorCode

  }

  msgNotify "Successfully Deleted VM Setups Directory:" "$vmShareTargetDir" "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh"

  return 0
}

function copyHomeSetupsToVMShare() {

  local sourceDir="$baseSetups57Dir"


  local -i THE_ErrorCode=0

   if [[ ! -d $sourceDir ]]; then

     THE_ErrorCode=99

     errXMsg "The copy operation cannot proceed." "Source Directory does NOT exist!" "$sourceDir" "Error Code:$THE_ErrorCode" "Function: copyHomeSetupsToVMShare" "Script: saveSetupsToVM.sh"

     return $THE_ErrorCode

   fi


   [[ -d $vmShareTargetDir ]] || {

    msgNotify "VM Target Base Directory Does NOT Exist!" "$vmShareTargetDir" "Attempting to create target directory" "Function: copyHomeSetupsToVMShare" "Script: saveSetupsToVM.sh"

     makeDirIfNotExist "$vmShareTargetDir" "775" "sudo" || {

          THE_ErrorCode=$?

         errXMsg "makeDirIfNotExist() failed to create target directory:" "$vmShareTargetDir" "The copy operation cannot proceed!" "Returned Error Code:$THE_ErrorCode" "Function: copyHomeSetupsToVMShare" "Script: saveSetupsToVM.sh"

         return $THE_ErrorCode

      }
  }

    msgNotify "Beginning Copy Operation using rsync ..."

    # Configued as 'mirror' operation
    #sudo rsync -L --archive --ignore-errors --force "$HOME"/.config $VMShare"/OpenSUSE/Tumbleweed/setups

    sudo rsync -L --archive --delete --ignore-errors --force "$sourceDir" "$vmShareTargetBaseDir" || {

      THE_ErrorCode=$?

      errXMsg "Copy Operation Failed" "Source Dir: $sourceDir" "Target Base Dir: $vmShareTargetBaseDir" "Function: copyHomeSetupsToVMShare" "Script: saveSetupsToVM.sh" "Error Code: $THE_ErrorCode"

      return $THE_ErrorCode

  }

  return 0
}

msgNotify "Preparing to copy 'setups' to VM Shared Directory" "Step-1 Deleting existing setups in target directory." "Script: saveSetupsToVM.sh"
deleteVMShareSetups &&
msgNotify "Step-2 Starting main copy operation..."
copyHomeSetupsToVMShare &&
successMsg "saveSetupsToVM.sh - Successful Completion!" "Copied Home Setups to VM Drive" "Script: saveSetupsToVM.sh" || {

  saveSetupsToVM_ErrorCode=$?
  errXMsg "saveSetupsToVM.sh" "Error-Exit!" "Error Code: $saveSetupsToVM_ErrorCode"

}


