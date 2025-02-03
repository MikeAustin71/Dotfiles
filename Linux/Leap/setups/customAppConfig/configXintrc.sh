#!/bin/bash
# Configures Xintrc startup file
# Run this as sudo


declare baseSetups93XDir="$HOME"/bashOps/setups
source "$baseSetups93XDir"/utils/utilsLib.sh
source "$baseSetups93XDir"/utils/utilsAppInstall.sh
source "$baseSetups93XDir"/utils/utilsAppConfig.sh


declare targetXorgAwesomeDir="$HOME"/.config/xorg/awesome

function copyXorgAwesomeXinitrcFile() {

  local sourceXorgAwesomeDir="$baseSetups93XDir"/configDir/xorg/awesome

  local xorgAwesomeXinitrcFile=".xinitrc"

  local sourceXorgAwesomeXinitrcFile="$sourceXorgAwesomeDir"/"$xorgAwesomeXinitrcFile"

  local targetXorgAwesomeFile="$targetXorgAwesomeDir"/"$xorgAwesomeXinitrcFile"

  local -i errorCode=0

  [[ -d $targetXorgAwesomeDir  ]] || {

    makeDirIfNotExist "$targetXorgAwesomeDir" "775" "" ||
    {

      errorCode=$?
      echo "Called by Function copyXorgAwesomeXinitrcFile()"
      echo "Script: configXintrc.sh"
      echo

      return $errorCode

    }

  }

  [[ -f $sourceXorgAwesomeXinitrcFile ]] || {

     errorCode=57

     errXMsg "Source File Does NOT Exist!" "$sourceXorgAwesomeXinitrcFile" "Error Code: $errorCode" "Function: copyXorgAwesomeXinitrcFile()" "Script: configXintrc.sh"

     return $errorCode
  }

  cp -v "$sourceXorgAwesomeXinitrcFile" "$targetXorgAwesomeFile" ||
  {

      errorCode=$?

      # shellcheck disable=SC1009
      errXMsg ".xinitrc File Copy Failed" "$sourceXorgAwesomeXinitrcFile -> $targetXorgAwesomeFile" "Function: copyXorgAwesomeXinitrcFile()" "Script: configXintrc.sh" "Error Code: $errorCode"

      return $errorCode
  }

  return 0
}

changeToDir "$HOME" &&
copyXorgAwesomeXinitrcFile &&
changeToDir "$HOME" &&
successMsg "Configured .xinitrc in Directory:" "$targetXorgAwesomeDir" "Script:configXintrc.sh"


