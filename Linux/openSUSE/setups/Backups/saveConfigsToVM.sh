#!/bin/bash
# This script copies all the config files in
# "$HOME"/.config to the shared VM Drive
# $VMShare"/OpenSUSE/Tumbleweed/config
# Make sure the VM Shared drive is attached before calling this
# script.

 declare baseSetups58Dir="$HOME"/bashOps/setups
 source "$baseSetups58Dir"/utils/utilsLib.sh


 declare -i saveConfigsToVM_ErrorCode=0

 declare vmShareBaseDir="$VMShare"

 declare vmShareTargetBaseDir="$vmShareBaseDir"/OpenSUSE/Tumbleweed

 declare vmShareTargetCfgDir="$vmShareTargetBaseDir"/config


function deleteHomeConfigVMShare() {

  local -i THE_ErrorCode=0

  [[ -d $vmShareBaseDir ]] || {

    THE_ErrorCode=77

    errXMsg "The Base VM Share Directory is NOT Attached!" "The copy copy operation cannot proceed!" "Make sure $vmShareBaseDir is attached and then retry." "Also check VMShare is configured in environment variables." "Function: deleteVMShareSetups" "Script: saveSetupsToVM.sh"

    return $THE_ErrorCode
  }


  [[ -d $vmShareTargetBaseDir ]] || {

    # vmShareTargetBaseDir Does NOT Exist!
    # Create it!
      makeDirIfNotExist "$vmShareTargetBaseDir" "775" "sudo" || {

           THE_ErrorCode=$?

          errXMsg "makeDirIfNotExist() failed to create target base directory:" "$vmShareTargetBaseDir" "Returned Error Code:$THE_ErrorCode" "Fatal Error! The copy operation cannot proceed!" "Function: deleteHomeConfigVMShare" "Script: saveConfigsToVM.sh"

          return $THE_ErrorCode

       }

  }

  if  [[ -d  $vmShareTargetCfgDir ]]; then

    zapFilesCmd "$vmShareTargetCfgDir" "-rfv" "sudo" || {

      THE_ErrorCode=$?

      errXMsg "Attempted deletion of target files in Configureation Directory Failed!" "The COPY OPERATION CANNOT PROCEED!" "Configuration Directory:" "$vmShareTargetCfgDir" "Function: deleteHomeConfigVMShare" "Script: saveConfigsToVM.sh" "Error Code: $THE_ErrorCode"

      return $THE_ErrorCode

    }

  else
    # $vmShareTargetCfgDir DOES NOT EXIST! Create Empty Directory!

     msgNotify "$vmShareTargetCfgDir Does Not Exist!" "Attempting to create it ..."

     makeDirIfNotExist "$vmShareTargetCfgDir" "775" "sudo" || {

          THE_ErrorCode=$?

         errXMsg "makeDirIfNotExist() failed to create target directory:" "$vmShareTargetCfgDir" "Returned Error Code:$THE_ErrorCode" "Fatal Error! The copy operation cannot proceed!" "Function: deleteHomeConfigVMShare" "Script: saveConfigsToVM.sh"

         return $THE_ErrorCode

      }


  fi

  return 0
}

function copyHomeConfigToVMShare() {


  local -i THE_ErrorCode=0

  local sourceDir="$HOME/.config"


   [[ -d $sourceDir ]] || {

    THE_ErrorCode=89

    errXMsg "Copy Source Directory Does NOT Exist!" "$sourceDir" "Fatal Error! The copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: copyHomeConfigToVMShare" "Script: saveConfigsToVM.sh"

    return $THE_ErrorCode
  }

  [[ -d $vmShareTargetCfgDir ]] || {

    THE_ErrorCode=79

    errXMsg "VM Target Configuration Directory Does NOT Exist!" "Dir: $vmShareTargetCfgDir" "Fatal Error! The copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: copyHomeConfigToVMShare" "Script: saveConfigsToVM.sh"

    return $THE_ErrorCode
  }

  msgNotify "Beginning Copy Operation using rsync ..."

  # sudo rsync -L --archive --ignore-errors --force "$HOME"/.config $VMShare"/OpenSUSE/Tumbleweed/config
  # Configued as 'mirror' operatino

  sudo rsync -L --archive --ignore-errors --force --delete "$sourceDir" "$vmShareTargetCfgDir" || {

      THE_ErrorCode=$?

      errXMsg "Copy Operation Failed" "Source Dir: $sourceDir" "Target Configuration Dir: $vmShareTargetCfgDir" "Function: copyHomeConfigToVMShare" "Script: saveConfigsToVM.sh" "Error Code: $THE_ErrorCode"

      return $THE_ErrorCode

  }

  msgNotify "Successfully Copied configs to VM Config Directory" "Source Dir: $sourceDir" "Target Dir: $vmShareTargetCfgDir" "Function: copyHomeConfigToVMShare" "Script: saveConfigsToVM.sh"

  return $THE_ErrorCode
}

msgNotify "Starting Configuration copy operation." "Step-1 Deleting old VM Share configuration data." &&
deleteHomeConfigVMShare &&
msgNotify "Beginning Step-2 main copy operation..." &&
copyHomeConfigToVMShare &&
successMsg "saveConfigsToVM.sh - Successful Completion!" "Copied Home Configs to VM Drive" "Script: saveConfigsToVM.sh"  || {

  saveConfigsToVM_ErrorCode=$?

  errXMsg "saveConfigsToVM.sh" "Error-Exit!" "Error Code: $saveConfigsToVM_ErrorCode"

  return $saveConfigsToVM_ErrorCode
}


