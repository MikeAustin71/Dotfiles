#!/bin/bash
# This script will copy and backup the ~/.config/nvim directory tree
# to a new backup directory located in directory ~/nvimStuff/bakUps.
#

declare baseSetups1571Dir="$HOME"/bashOps/setups

source "$baseSetups1571Dir"/utils/utilsLib.sh

declare -i nvimBakErrCode

function bakupNvimCfgDir() {

  local -i THE_ErrorCode=0

  local sourceNvimDir="$HOME"/.config/nvim

  local fileDateTime

  fileDateTime=$(getDateTimeForFileName)

  local targetBakDir="$HOME/nvimStuff/bakUps/$fileDateTime"


  if [[ ! -d $sourceNvimDir ]]; then


    THE_ErrorCode=98

    errXMsg "The source 'nvim' Config Directory DOES NOT EXIST!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: bakupNvimCfgDir" "Script: nvimCfgBakUp.sh"

    return $THE_ErrorCode

  fi

  mkdir -m 775 -p "$targetBakDir" || {

    THE_ErrorCode=$?

    errXMsg "Attempted creation of the Target Backup Directory Failed!" "Target Directory= $targetBakDir" "FATAL ERROR - The backup/copy operation cannot proceed!" "Error Code: $THE_ErrorCode" "Function: bakupNvimCfgDir" "Script: nvimCfgBakUp.sh"

    return $THE_ErrorCode

  }

  msgNotify "Preparing to copy" "$sourceNvimDir -> $targetBakDir"

  cp -frv "$sourceNvimDir" "$targetBakDir" || {

    THE_ErrorCode=$?

    errXMsg "Copy Operation (cp -frv) FAILED!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Source Directory: $sourceNvimDir" "Destination Directory: $targetBakDir" "Error Code: $THE_ErrorCode" "Function: bakupNvimCfgDir" "Script: nvimCfgBakUp.sh"


    return $THE_ErrorCode
  }


  return 0
}


msgNotify "Backing up 'nvim' config to $HOME/nvimStuff/bakUps" &&
bakupNvimCfgDir &&
successMsg "Backup 'nvim' config to Directory $HOME/nvimStuff/bakUps"  "Script: nvimCfgBakUp.sh"  || {

  nvimBakErrCode=$?

  errXMsg "nvimCfgBakUp.sh" "Error-Exit!" "Error Code: $nvimBakErrCode"

  exit $nvimBakErrCode

}
