#!/bin/bash
# This script copies all the configuration files in
# the "$HOME"/nvimStuff/bakUps Directory to the VM Shared
# Directory "$VMShare"/nvimConfig
# Make sure the VM Shared drive is attached before calling this
# script.

 declare baseSetups57Dir="$HOME"/bashOps/setups

 source "$baseSetups57Dir"/utils/utilsLib.sh

 declare -i saveNvimCfgToVM_ErrorCode

 declare vmShareTargetBaseDir="$VMShare"

 declare vmShareTargetDir="$vmShareTargetBaseDir"/nvimConfigs

 declare sourceDir="$HOME"/nvimStuff/bakUps

function deleteNvimCfgVMDir() {

  local -i THE_ErrorCode=0

  [[ -d $vmShareTargetBaseDir ]] || {

    THE_ErrorCode=77

    errXMsg "The Base VM Share Directory is NOT Attached!" "The copy copy operation cannot proceed!" "Make sure $vmShareTargetBaseDir is attached and then retry." "Also check VMShare is configured environment variable." "Function: deleteNvimCfgVMDir" "Script: saveNvimCfgToVM.sh"

    return $THE_ErrorCode
  }

  [[ -d $sourceDir ]] || {


    THE_ErrorCode=78

    errXMsg "The Source Directory Does NOT EXIST!" "Source Directory= $sourceDir" "The copy copy operation cannot proceed!" "Function: deleteNvimCfgVMDir" "Script: saveNvimCfgToVM.sh"

    return $THE_ErrorCode
  }


  if [[ -d $vmShareTargetDir ]] 
  then

    zapFilesCmd "$vmShareTargetDir" "-rfv" "sudo" || {

    THE_ErrorCode=$?

    errXMsg "Attempted deletion of OLD target VM Directory Failed" "Dir: $vmShareTargetDir" "Function: deleteNvimCfgVMDir" "Script: saveNvimCfgToVM.sh" "Error Code: $THE_ErrorCode"

    return $THE_ErrorCode

  }

    msgNotify "Successfully Deleted VM Setups Directory:" "Dir: $vmShareTargetDir" "Function: deleteNvimCfgVMDir" "Script: saveNvimCfgToVM.sh"

  
  fi

  # The vmShareTargetDir DOES NOT EXIST
  # Create It!
 
  if [[ ! -d $vmShareTargetDir ]] 
  then

  sudo mkdir -m 775 -p "$vmShareTargetDir" || {

  THE_ErrorCode=$?

    errXMsg "Attempted Creation of the VM Target Directory FAILED!" "Dir: $vmShareTargetDir" "Command: sudo mkdir -m 775 -p $vmShareTargetDir" "Function: deleteNvimCfgVMDir" "Script: saveNvimCfgToVM.sh" "Error Code: $THE_ErrorCode"

    return $THE_ErrorCode

    }

  fi

  msgNotify "Successfully setup VM Target Directory $vmShareTargetDir" "Function: deleteNvimCfgVMDir" "Script: saveNvimCfgToVM.sh"

  return $THE_ErrorCode
 }


function copyNeovimBakupsToVMShare() { 
  
	local -i THE_ErrorCode=0
  
	if [[ ! -d $sourceDir ]]; then

     THE_ErrorCode=99

     errXMsg "The copy operation cannot proceed." "Source Directory does NOT exist!" "Source Dir: $sourceDir" "Error Code:$THE_ErrorCode" "Function: copyNeovimBakupsToVMShare" "Script: saveNvimCfgToVM.sh"

     return $THE_ErrorCode

   fi


   [[ -d $vmShareTargetDir ]] || {

   errXMsg "The VMShare Target Directory DOES NOT EXIST!" "VMShare Target Dir: $vmShareTargetDir" "The copy operation cannot proceed!" "Returned Error Code:$THE_ErrorCode" "Function: copyNeovimBakupsToVMShare" "Script: saveNvimCfgToVM.sh"

         return $THE_ErrorCode
    }


    msgNotify "Beginning Copy Operation using rsync ..."

    # Configued as 'mirror' operation
    #sudo rsync -L --archive --ignore-errors --force "$HOME"/.config $VMShare"/OpenSUSE/Tumbleweed/setups

    sudo rsync -L --archive --delete --ignore-errors --force "$sourceDir" "$vmShareTargetDir" || {

      THE_ErrorCode=$?

      errXMsg "Copy Operation Failed" "Source Dir: $sourceDir" "VM Target Dir: $vmShareTargetDir" "Function: copyNeovimBakupsToVMShare" "Script: saveNvimCfgToVM.sh" "Error Code: $THE_ErrorCode"

    }


  return $THE_ErrorCode
}

msgNotify "Preparing to copy Neovim Config Backups to VM Shared Directory" "Step-1 Deleting existing backups in target directory." "Script: saveNvimCfgToVM.sh" &&
deleteNvimCfgVMDir &&
msgNotify "Step-2 Starting main copy operation..."
copyNeovimBakupsToVMShare &&
successMsg "saveNvimCfgToVM.sh - Successful Completion!" "Copied Neovim Backups to VM Target Drive" "Script: saveNvimCfgToVM.sh" || {

  saveNvimCfgToVM_ErrorCode=$?

  errXMsg "saveNvimCfgToVM.sh" "Error-Exit!" "Error Code: $saveNvimCfgToVM_ErrorCode"

  exit $saveNvimCfgToVM_ErrorCode
}


