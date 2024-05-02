#!/bin/bash
# This script copies all the config files in
# /home/mike/.config to the shared VM Drive
# /home/mike/shares/HostVlMShared/fedora_server/final_production/.config
# Make sure the VM Shared drive is attached before calling this
# script.

source "$MIKE_Setup_Utilities"/utilsLib.sh


  declare -i saveConfigsToVM_ErrorCode=0


function copyHomeConfigToVMShare() {

  local targetBaseDir="$MIKE_VMShared_Drive"/fedora_server/final_production

  local targetDir="$targetBaseDir"/.config

  local sourceDir="/home/mike/.config"


   [[ -d sourceDir ]] || {

    saveConfigsToVM_ErrorCode=199

    errXMsg "Copy Source Directory Does NOT Exist!" "$sourceDir" "Script: saveConfigsToVM.sh" "Error Code: $errorCode"

    return $saveConfigsToVM_ErrorCode
  }

  [[ -d $targetBaseDir ]] || {

    saveConfigsToVM_ErrorCode=198

    errXMsg "VM Target Base Directory Does NOT Exist!" "$targetBaseDir" "Script: saveConfigsToVM.sh" "Error Code: $errorCode"

    return $saveConfigsToVM_ErrorCode
  }

  [[ ! -d $targetDir ]] || {

    zapFilesCmd "$targetDir/*" "-rfv" "" || {

      saveConfigsToVM_ErrorCode=$?

      errXMsg "Attempted deletion of target VM Directory Failed" "$targetDir" "Script: saveConfigsToVM.sh" "Error Code: $errorCode"

      return $saveConfigsToVM_ErrorCode

    }

  }

  cp -rv "$sourceDir" "$targetDir" || {

      saveConfigsToVM_ErrorCode=$?

      errXMsg "Copy Operation Failed" "Source Dir: $sourceDir" "Target Dir: $targetDir" "Script: saveConfigsToVM.sh" "Error Code: $saveConfigsToVM_ErrorCode"

      return $saveConfigsToVM_ErrorCode

  }

  return 0
}


copyHomeConfigToVMShare &&
successMsg "saveConfigsToVM.sh - Successful Completion!" || {

  saveConfigsToVM_ErrorCode=$?
  errXMsg "saveConfigsToVM.sh" "Error-Exit!" "Error Code: $saveConfigsToVM_ErrorCode"

}


