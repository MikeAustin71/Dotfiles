#!/bin/bash
# This script will initialize and configure
# ~/.xinitrc

source "$MIKE_Setup_Scripts"/utils/utilsLib.sh


declare targetXorgAwesomeDir="$HOME"/.config/xorg/awesome

function copyXorgAwesomeXinitrcFile() {

  local sourceXorgAwesomeDir="$MIKE_Setup_Scripts"/configDir/xorg/awesome

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

copyXorgAwesomeXinitrcFile &&
changeToDir "$HOME" &&
successMsg "Configured .xinitrc in Directory:" "$targetXorgAwesomeDir" "Script:configXintrc.sh"


