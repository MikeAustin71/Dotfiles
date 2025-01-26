#!/bin/bash
# This script will copy and backup the "$HOME"/.inputrc file
# to "$HOME"/.config/shell/backups/inputrcBak directory.
# 

declare baseSetups574Dir="$HOME"/bashOps/setups

source "$baseSetups574Dir"/utils/utilsLib.sh

 declare -i inputrcBakToShell_ErrorCode=0

function bakupInputrcToShellBackup() {

  local -i THE_ErrorCode=0

  local sourceInputrcFile="$HOME"/.inputrc

  local targetBakDir="$HOME"/.config/shell/backups/inputrcBak

  local fileDateTime

  fileDateTime=$(getDateTimeForFileName)

  local targetBackInputrcFile="$targetBakDir"/"$fileDateTime"_inputrc.bak

  if [[ ! -f $sourceInputrcFile ]]; then


    THE_ErrorCode=98

    errXMsg "The source '.inputrc' file DOES NOT EXIST!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: bakupInputrcToShellBackup" "Script: inputrcBakUpToShell.sh"

    return $THE_ErrorCode

  fi

  if [[ ! -d $targetBakDir ]]; then


        msgNotify "VM Target Inputrc backup directory does not exist." "Will attempt to create Diriectory: "  "$targetBakDir" "Function: bakupInputrcToShellBackup" "Script: inputrcBakUpToShell.sh"

        makeDirIfNotExist "$targetBakDir" "775" "" || {

        errXMsg "Attempted creation of Target Inputrc backup directory FAILED!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: bakupInputrcToShellBackup" "Script: inputrcBakUpToShell.sh"

      }

  fi

  msgNotify "Preparing to copy" "$sourceInputrcFile -> $targetBackInputrcFile"

  cp -fv "$sourceInputrcFile" "$targetBackInputrcFile" || {

    THE_ErrorCode=$?

    errXMsg "Copy Operation (cp -fv) FAILED!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Source File: $sourceInputrcFile" "Destination File: $targetBackInputrcFile" "Error Code: $THE_ErrorCode" "Function: bakupInputrcToShellBackup" "Script: inputrcBakUpToShell.sh"

  }

  return $THE_ErrorCode
}


msgNotify "Backing up .inputrc to $HOME/.config/shell/backups/inputrcBak" "Creating Backup Directories, if necessary..." &&
bakupInputrcToShellBackup &&
successMsg "$HOME/.inputrc" "to" "$HOME/.config/shell/backups/inputrcBak"  "Script: inputrcBakUpToShell.sh"  || {

  inputrcBakToShell_ErrorCode=$?

  errXMsg "inputrcBakUpToShell.sh" "Error-Exit!"

  return $inputrcBakToShell_ErrorCode
}
