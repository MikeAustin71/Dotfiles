#!/bin/bash
# This script copies all the config files in
# /home/mike/.config to the shared VM Drive
# /home/mike/shares/HostVlMShared/fedora_server/final_production/.config
# Make sure the VM Shared drive is attached before calling this
# script.

source "$MIKE_Setup_Utilities"/utilsLib.sh


 declare -i saveConfigsToVM_ErrorCode=0

 declare vmShareTargetBaseDir="$MIKE_VMShared_Drive"/fedora_server/final_production

 declare vmShareTargetCfgDir="$vmShareTargetBaseDir"/.config


function deleteHomeConfigVMShare() {

  [[ -d $vmShareTargetBaseDir ]] || {

    saveConfigsToVM_ErrorCode=199

    errXMsg "VM Target Base Directory Does NOT Exist!" "$vmShareTargetBaseDir" "Function: deleteHomeConfigVMShare" "Script: saveConfigsToVM.sh" "Error Code: $saveConfigsToVM_ErrorCodee"

    return $saveConfigsToVM_ErrorCode
  }

  [[ ! -d $vmShareTargetCfgDir ]] || {

    zapFilesCmd "$vmShareTargetCfgDir" "-rfv" "sudo" || {

      saveConfigsToVM_ErrorCode=$?

      errXMsg "Attempted deletion of target VM Directory Failed" "$vmShareTargetCfgDir" "Function: deleteHomeConfigVMShare" "Script: saveConfigsToVM.sh" "Error Code: $saveConfigsToVM_ErrorCode"

      return $saveConfigsToVM_ErrorCode

    }

    echo
    echo "Successfully Deleted VM Config Directory:"
    echo "$vmShareTargetCfgDir"
    echo "Function: deleteHomeConfigVMShare"
    echo "Script: saveConfigsToVM.sh"
    echo

    return 0
  }

  echo
  echo "VM Config Directory Does NOT Exist."
  echo "VM Configs Dir: $vmShareTargetCfgDir"
  echo "Continuing with 'copy' operation."
  echo "Function: deleteHomeConfigVMShare"
  echo "Script: saveConfigsToVM.sh"
  echo

  return 0
}

function copyHomeConfigToVMShare() {

  local sourceDir="/home/mike/.config"


   [[ -d $sourceDir ]] || {

    saveConfigsToVM_ErrorCode=198

    errXMsg "Copy Source Directory Does NOT Exist!" "$sourceDir" "Function: copyHomeConfigToVMShare" "Script: saveConfigsToVM.sh" "Error Code: $saveConfigsToVM_ErrorCode"

    return $saveConfigsToVM_ErrorCode
  }

  # sudo rsync -L --archive --ignore-errors --force /home/mike/.config /home/mike/shares/HostVlMShared/fedora_server/final_production
  sudo rsync -L --archive --ignore-errors --force  "$sourceDir" "$vmShareTargetBaseDir" || {

      saveConfigsToVM_ErrorCode=$?

      errXMsg "Copy Operation Failed" "Source Dir: $sourceDir" "Target Base Dir: $vmShareTargetBaseDir" "Function: copyHomeConfigToVMShare" "Script: saveConfigsToVM.sh" "Error Code: $saveConfigsToVM_ErrorCode"

      return $saveConfigsToVM_ErrorCode

  }

  echo 
  echo "Successfully Copied configs to VM Config Directory"
  echo "Source Dir: $sourceDir"
  echo "Target Dir: $vmShareTargetCfgDir"
  echo "Function: copyHomeConfigToVMShare"
  echo "Script: saveConfigsToVM.sh"
  echo 

  return 0
}

deleteHomeConfigVMShare &&
copyHomeConfigToVMShare &&
successMsg "saveConfigsToVM.sh - Successful Completion!" "Copied Home Configs to VM Drive" || {

  saveConfigsToVM_ErrorCode=$?
  errXMsg "saveConfigsToVM.sh" "Error-Exit!" "Error Code: $saveConfigsToVM_ErrorCode"

}


