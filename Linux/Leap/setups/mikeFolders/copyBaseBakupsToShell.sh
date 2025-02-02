#!/bin/bash
# This script will copy  setups/configDir/shell/backups
# to "$HOME"/.config/shell/backups. This will initialize
# the 'backups' directory and prepare it to receive
# backup data.
#


 declare baseSetups597Dir="$HOME"/bashOps/setups
 source "$baseSetups597Dir"/utils/utilsLib.sh

# Copies setups/configDir/shell/backups to "$HOME"/.config/shell/backups
function copyBaseBakupDirToActual() {

  local sourceBakDir="$baseSetups597Dir"/configDir/shell/backups
  local targetBakDir="$HOME"/.config/shell
  local -i THE_ErrorCode=0

  [[ -d $sourceBakDir ]] || {

    THE_ErrorCode=98

    errXMsg "The source 'backups' directory DOES NOT EXIST!" "FATAL ERROR - The copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: copyBaseBakupDirToActual" "Script: copyBaseBakupsToShell.sh"

    return $THE_ErrorCode
  }


  [[ -d $targetBakDir ]] || {

    THE_ErrorCode=99

    errXMsg "The Base Backup Directory Does NOT EXIST!" "Base Backup Dir: $targetBakDir" "FATAL ERROR - The copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: copyBaseBakupDirToActual" "Script: copyBaseBakupsToShell.sh"

    return $THE_ErrorCode

  }

  cp -R "$sourceBakDir" "$targetBakDir" || {

    THE_ErrorCode=$?

    errXMsg "The Base Backup Directory Copy Operation (cp -R) FAILED!" "Source Dir: $sourceBakDir" "Target Backup Dir: $targetBakDir" "FATAL ERROR - The copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: copyBaseBakupDirToActual" "Script: copyBaseBakupsToShell.sh"

    return $THE_ErrorCode

  }


  return 0
}

msgNotify "Creating Backup Directories, if necessary..." &&
makeDirIfNotExist "$HOME/.config/shell/backups" "775" "" &&
makeDirIfNotExist "$HOME/.config/shell/backups/bash_profileBak" "775" "" &&
makeDirIfNotExist "$HOME/.config/shell/backups/bashrcBak" "775" "" &&
makeDirIfNotExist "$HOME/.config/shell/backups/inputrcBak" "775" "" &&
makeDirIfNotExist "$HOME/.config/shell/backups/profileBak" "775" "" &&
msgNotify "Beginning main copy operation..." &&
copyBaseBakupDirToActual &&
successMsg "Successful Completion!" "Copied Base Backup Directories to actual directories" "Script: copyBaseBakupsToShell.sh"  || {

 errXMsg "saveConfigsToVM.sh" "Error-Exit!"

}
