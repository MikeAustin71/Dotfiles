#!/bin/bash
# This script copies all the setup files in
# /home/mike/bashOps/setups to the shared VM Drive
# /home/mike/shares/HostVlMShared/fedora_server/final_production/setups
# Make sure the VM Shared drive is attached before calling this
# script.

source "$MIKE_Setup_Utilities"/utilsLib.sh


 declare -i saveSetupsToVM_ErrorCode=0

 declare vmShareTargetBaseDir="$MIKE_VMShared_Drive"/fedora_server/final_production

 declare vmShareTargetSetupsDir="$vmShareTargetBaseDir"/setups


function deleteVMShareSetups() {

  [[ -d $vmShareTargetBaseDir ]] || {

    saveSetupsToVM_ErrorCode=199

    errXMsg "VM Target Base Directory Does NOT Exist!" "$vmShareTargetBaseDir" "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh" "Error Code: $saveSetupsToVM_ErrorCodee"

    return $saveSetupsToVM_ErrorCode
  }

  [[ ! -d $vmShareTargetSetupsDir ]] || {

    zapFilesCmd "$vmShareTargetSetupsDir" "-rfv" "sudo" || {

      saveSetupsToVM_ErrorCode=$?

      errXMsg "Attempted deletion of target VM Directory Failed" "$vmShareTargetSetupsDir" "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh" "Error Code: $saveSetupsToVM_ErrorCode"

      return $saveSetupsToVM_ErrorCode

    }

    echo
    echo "Successfully Deleted VM Setups Directory:"
    echo "$vmShareTargetSetupsDir"
    echo "Function: deleteVMShareSetups"
    echo "Script: saveSetupsToVM.sh"
    echo

    return 0
  }

  echo
  echo "VM Setups Directory Does NOT Exist."
  echo "Setups Dir: $vmShareTargetSetupsDir"
  echo "Continuing with 'copy' operation."
  echo "Function: deleteVMShareSetups"
  echo "Script: saveSetupsToVM.sh"
  echo

  return 0
}

function copyHomeSetupsToVMShare() {

  local sourceDir="$MIKE_Setup_Scripts"


   [[ -d $sourceDir ]] || {

    saveSetupsToVM_ErrorCode=198

    errXMsg "Copy Source Directory Does NOT Exist!" "$sourceDir" "Function: copyHomeSetupsToVMShare" "Script: saveSetupsToVM.sh" "Error Code: $saveSetupsToVM_ErrorCode"

    return $saveSetupsToVM_ErrorCode
  }

  sudo cp -rfLv "$sourceDir"/ "$vmShareTargetBaseDir" || {

      saveSetupsToVM_ErrorCode=$?

      errXMsg "Copy Operation Failed" "Source Dir: $sourceDir" "Target Base Dir: $vmShareTargetBaseDir" "Function: copyHomeSetupsToVMShare" "Script: saveSetupsToVM.sh" "Error Code: $saveSetupsToVM_ErrorCode"

      return $saveSetupsToVM_ErrorCode

  }

  return 0
}

deleteVMShareSetups &&
copyHomeSetupsToVMShare &&
successMsg "saveSetupsToVM.sh - Successful Completion!" "Copied Home Setups to VM Drive" || {

  saveSetupsToVM_ErrorCode=$?
  errXMsg "saveSetupsToVM.sh" "Error-Exit!" "Error Code: $saveSetupsToVM_ErrorCode"

}


