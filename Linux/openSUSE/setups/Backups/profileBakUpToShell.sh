#!/bin/bash
# This script will copy and backup the "$HOME"/.profile file
# to "$HOME"/.config/shell/backups/profileBak directory.
#

declare baseSetups573Dir="$HOME"/bashOps/setups

source "$baseSetups573Dir"/utils/utilsLib.sh

declare -i profileBakToShell_ErrorCode

function bakupProfileToShellBackup() {

  local -i THE_ErrorCode=0

  local sourceProfileFile="$HOME"/.profile

  local targetBakDir="$HOME"/.config/shell/backups/profileBak

  local fileDateTime

  fileDateTime=$(getDateTimeForFileName)

  local targetBackProfileFile="$targetBakDir"/"$fileDateTime"_profile.bak

  if [[ ! -f $sourceProfileFile ]]; then


    THE_ErrorCode=98

    errXMsg "The source '.profile' file DOES NOT EXIST!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: bakupProfileToShellBackup" "Script: profileBakUpToShell.sh"

    return $THE_ErrorCode

  fi

  if [[ ! -d $targetBakDir ]]; then


        msgNotify "VM Target profile backup directory does not exist." "Will attempt to create Diriectory: "  "$targetBakDir" "Function: bakupProfileToShellBackup" "Script: profileBakUpToShell.sh"

        makeDirIfNotExist "$targetBakDir" "775" "" || {

        errXMsg "Attempted creation of Target profile backup directory FAILED!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: bakupProfileToShellBackup" "Script: profileBakUpToShell.sh"

      }

  fi

  msgNotify "Preparing to copy" "$sourceProfileFile -> $targetBackProfileFile"

  cp -fv "$sourceProfileFile" "$targetBackProfileFile" || {

    THE_ErrorCode=$?

    errXMsg "Copy Operation (cp -fv) FAILED!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Source File: $sourceProfileFile" "Destination File: $targetBackProfileFile" "Error Code: $THE_ErrorCode" "Function: bakupProfileToShellBackup" "Script: profileBakUpToShell.sh"

  }


  return $THE_ErrorCode
}


msgNotify "Backing up .profile to $HOME/.config/shell/backups/profileBak" "Creating Backup Directories, if necessary..." &&
bakupProfileToShellBackup &&
successMsg "$HOME/.profile" "to" "$HOME/.config/shell/backups/profileBak"  "Script: profileBakUpToShell.sh"  || {

  profileBakToShell_ErrorCode=$?

  errXMsg "profileBakUpToShell.sh" "Error-Exit!"

  exit $profileBakToShell_ErrorCode

}
