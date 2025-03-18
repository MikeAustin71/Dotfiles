#!/bin/bash
# This script copies all the config files in
# "$HOME"/.config to the shared VM Drive
# $VMShare"/OpenSUSE/Tumbleweed/config
# Make sure the VM Shared drive is attached before calling this
# script.

 declare baseSetups582Dir="$HOME"/bashOps/setups
 source "$baseSetups582Dir"/utils/utilsLib.sh

declare -i saveCfgShellToVMShare_ErrorCode=0

 declare vmShareBaseDir="$VMShare"

 declare vmShareTargetBaseDir="$vmShareBaseDir"/OpenSUSE/Tumbleweed/config/.config

 declare vmShareTargetShellDir="$vmShareTargetBaseDir"/shell

 declare sourceShellDir="$HOME"/.config/shell

function deleteBakUpShellOnVMShare() {

  local -i THE_ErrorCode=0

  [[ -d $sourceShellDir ]] || {

    THE_ErrorCode=77

    errXMsg "FATA ERROR!" "Source Shell Directory DOES NOT EXIST!" "Source Shell Directory: " "$sourceShellDir" "Error Code: $THE_ErrorCode" "Function: deleteBakUpShellOnVMShare" "Script: saveShellToVM.sh"

    return $THE_ErrorCode
  }


  [[ -d $vmShareBaseDir ]] || {

    THE_ErrorCode=78

    errXMsg "FATA ERROR!" "Destination VM Base Directory DOES NOT EXIST!" "VM Base Directory: " "$vmShareBaseDir" "Error Code: $THE_ErrorCode" "Function: deleteBakUpShellOnVMShare" "Script: saveShellToVM.sh"

    return $THE_ErrorCode
  }

  if [[ -d $vmShareTargetShellDir ]]; then

     msgNotify "The VM Target Directory for shell backup DOES  Exist." "Deleting old back up files." "Working..."

    zapFilesCmd "$vmShareTargetShellDir" "-rfv" "sudo" || {

      THE_ErrorCode=$?

      errXMsg "Attempted deletion of old target VM Shell files Failed!" "The COPY-BACKUP OPERATION CANNOT PROCEED!" "Target VM Shell Directory:" "$vmShareTargetShellDir" "Error Code: $THE_ErrorCode" "Function: deleteBakUpShellOnVMShare" "Script: saveShellToVM.sh"

      return $THE_ErrorCode

    }

  else

    msgNotify "The VM Target Directory for shell backup does NOT Exist." "Will attempt to create it ..."

    # vmShareTargetBaseDir Does NOT Exist!
    # Create it!
      makeDirIfNotExist "$vmShareTargetBaseDir" "775" "sudo" || {

           THE_ErrorCode=$?

          errXMsg "makeDirIfNotExist() failed to create target base directory:" "$vmShareTargetBaseDir" "Fatal Error! The copy-backup operation cannot proceed!" "Returned Error Code:$THE_ErrorCode"  "Function: deleteBakUpShellOnVMShare" "Script: saveShellToVM.sh"

          return $THE_ErrorCode

       }

  fi

}


function copyProdShellDataToVMBakup() {

 local -i THE_ErrorCode=0


   [[ -d $sourceShellDir ]] || {

    THE_ErrorCode=87

    errXMsg "Copy-Backup Source Directory Does NOT Exist!" "Source Dir: $sourceShellDir" "Fatal Error! The copy-backup operation cannot proceed!" "Function: copyProdShellDataToVMBakup" "Script: saveShellToVM.sh" "Error Code: $THE_ErrorCode"

    return $THE_ErrorCode
  }

  [[ -d $vmShareTargetShellDir ]] || {

    THE_ErrorCode=88

    errXMsg "VM Target VM Share Directory Does NOT Exist!" "Dir: $vmShareTargetShellDir" "Fatal Error! The copy-backup operation cannot proceed!" "Function: copyHomeConfigToVMShare" "Script: saveConfigsToVM.sh" "Error Code: $THE_ErrorCode"

    return $THE_ErrorCode
  }

  msgNotify "Beginning Copy Operation using rsync." "Working..."

  # sudo rsync -L --archive --ignore-errors --force "$HOME"/.config $VMShare"/OpenSUSE/Tumbleweed/config/.config
  # Configured as 'mirror' operation

  sudo rsync -L --archive --ignore-errors --force --delete "$sourceShellDir" "$vmShareBaseDir" || {

      THE_ErrorCode=$?

      errXMsg "Copy-Backup Operation Failed" "Source Dir: $sourceShellDir" "Target VM Backup Dir: $vmShareTargetShellDir" "Function: copyHomeConfigToVMShare" "Script: saveConfigsToVM.sh" "Error Code: $THE_ErrorCode"

      return $THE_ErrorCode

  }

  msgNotify "Successfully Copied-Bakup shell Directory to VM Share Directory" "Source Dir: $sourceShellDir" "Target Dir: $vmShareBaseDir" "Function: copyHomeConfigToVMShare" "Script: saveConfigsToVM.sh"

  return $THE_ErrorCode
}

msgNotify "Starting Backup of $HOME/.config/shell directory to VM Share." "Step-1 Deleting old VM Share shell data."
deleteBakUpShellOnVMShare &&
msgNotify "Beginning Step-2 main copy-backup operation..." &&
copyProdShellDataToVMBakup &&
successMsg "saveConfigsToVM.sh - Successful Completion!" "Copied Home Configs to VM Drive" "Script: saveConfigsToVM.sh"  || {

  saveCfgShellToVMShare_ErrorCode=$?

  errXMsg "saveConfigsToVM.sh" "Error-Exit!" "Error Code: $saveCfgShellToVMShare_ErrorCode"

  exit $saveCfgShellToVMShare_ErrorCode

}
