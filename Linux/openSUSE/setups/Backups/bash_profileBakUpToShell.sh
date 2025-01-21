#!/bin/bash
# This script will copy  setups/configDir/shell/backups
# to "$HOME"/.config/shell/backups. This will initialize
# the 'backups' directory and prepare it to receive
# backup data.
#

declare baseSetups572Dir="$HOME"/bashOps/setups

source "$baseSetups572Dir"/utils/utilsLib.sh

function bakupBashProfileToShellBackup() {

  local -i THE_ErrorCode=0

  local sourceBashProfileFile="$HOME"/.bash_profile

  local targetBakDir="$HOME"/.config/shell/backups/bash_profileBak

  local fileDateTime

  fileDateTime=$(getDateTimeForFileName)

  local targetBackBashProfileFile="$targetBakDir"/"$fileDateTime"_bash_profile.bak

  if [[ ! -f $sourceBashProfileFile ]]; then


    THE_ErrorCode=98

    errXMsg "The source '.bash_profile' file DOES NOT EXIST!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: bakupBashProfileToShellBackup" "Script: bash_profileBakUpToShell.sh"

    return $THE_ErrorCode

  fi

  if [[ ! -d $targetBakDir ]]; then


        msgNotify "VM Target bashrc backup directory does not exist." "Will attempt to create Diriectory: "  "$targetBakDir" "Function: bakupBashProfileToShellBackup" "Script: bash_profileBakUpToShell.sh"

        makeDirIfNotExist "$targetBakDir" "775" "" || {

        errXMsg "Attempted creation of Target bashrc backup directory FAILED!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: bakupBashProfileToShellBackup" "Script: bash_profileBakUpToShell.sh"

      }

  fi

  msgNotify "Preparing to copy" "$sourceBashProfileFile -> $targetBackBashProfileFile"

  cp -fv "$sourceBashProfileFile" "$targetBackBashProfileFile" || {

    THE_ErrorCode=$?

    errXMsg "Copy Operation (cp -fv) FAILED!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Source File: $sourceBashProfileFile" "Destination File: $targetBackBashProfileFile" "Error Code: $THE_ErrorCode" "Function: bakupBashProfileToShellBackup" "Script: bash_profileBakUpToShell.sh"


    return $THE_ErrorCode
  }


  return 0
}


msgNotify "Backing up .bash_profile to $HOME/.config/shell/backups/bashrcBak" "Creating Backup Directories, if necessary..." &&
bakupBashProfileToShellBackup &&
successMsg "$HOME/.bash_profile" "to" "$HOME/.config/shell/backups/bashrcBak"  "Script: bash_profileBakUpToShell.sh"  || {

 errXMsg "saveConfigsToVM.sh" "Error-Exit!"

}
