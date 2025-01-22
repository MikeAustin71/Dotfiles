#!/bin/bash
# This script will copy  setups/configDir/shell/backups
# to "$HOME"/.config/shell/backups. This will initialize
# the 'backups' directory and prepare it to receive
# backup data.
#

declare baseSetups571Dir="$HOME"/bashOps/setups

source "$baseSetups571Dir"/utils/utilsLib.sh

function bakupBashrcToShellBackup() {

  local -i THE_ErrorCode=0

  local sourceBashrcFile="$HOME"/.bashrc

  local targetBakDir="$HOME"/.config/shell/backups/bashrcBak

  local fileDateTime

  fileDateTime=$(getDateTimeForFileName)

  local targetBackBashrcFile="$targetBakDir"/"$fileDateTime"_bashrc.bak

  if [[ ! -f $sourceBashrcFile ]]; then


    THE_ErrorCode=98

    errXMsg "The source '.bashrc' file DOES NOT EXIST!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: bakupBashrcToShellBackup" "Script: bashrcBakUpToShell.sh"

    return $THE_ErrorCode

  fi

  if [[ ! -d $targetBakDir ]]; then


        msgNotify "VM Target bashrc backup directory does not exist." "Will attempt to create Diriectory: "  "$targetBakDir" "Function: bakupBashrcToShellBackup" "Script: bashrcBakUpToShell.sh"

        makeDirIfNotExist "$targetBakDir" "775" "" || {

        errXMsg "Attempted creation of Target bashrc backup directory FAILED!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: bakupBashrcToShellBackup" "Script: bashrcBakUpToShell.sh"

      }

  fi

  msgNotify "Preparing to copy" "$sourceBashrcFile -> $targetBackBashrcFile"

  cp -fv "$sourceBashrcFile" "$targetBackBashrcFile" || {

    THE_ErrorCode=$?

    errXMsg "Copy Operation (cp -fv) FAILED!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Source File: $sourceBashrcFile" "Destination File: $targetBackBashrcFile" "Error Code: $THE_ErrorCode" "Function: bakupBashrcToShellBackup" "Script: bashrcBakUpToShell.sh"


    return $THE_ErrorCode
  }


  return 0
}


msgNotify "Backing up .bashrc to $HOME/.config/shell/backups/bashrcBak" "Creating Backup Directories, if necessary..." &&
bakupBashrcToShellBackup &&
successMsg "$HOME/.bashrc" "to" "$HOME/.config/shell/backups/bashrcBak"  "Script: bashrcBakUpToShell.sh"  || {

 errXMsg "bashrcBakUpToShell.sh" "Error-Exit!"

}
