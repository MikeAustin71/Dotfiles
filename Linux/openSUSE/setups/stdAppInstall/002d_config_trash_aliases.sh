#!/bin/bash
# Utilities Library for Application Configuration
#

declare utilAppCfgSetups="$HOME"/bashOps/setups

source "$utilAppCfgSetups"/utils/utilsLib.sh
source "$utilAppCfgSetups"/utils/utilsAppConfig.sh
source "$utilAppCfgSetups"/utils/utilsAppInstall.sh


# This function configures aliases for the
# trash-cli utility.
# trash-cli is the trash bucket.
# https://github.com/andreafrancia/trash-cli
function configAliasesTrash() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgShellSetups/installTrashAliases.txt

  local targetAliasesDir="$HOME"/.config/shell/aliases

  local targetAliasesFileName="aliases.sh"

  local targetAliasesFile="$targetAliasesDir"/"$targetAliasesFileName"

  local -i trashAliasErrCode=0

  [[ -f $sourceTxtFile ]] || {

    trashAliasErrCode=99

    errXMsg "Trash Aliases Source File Does NOT Exist!" "Trash Aliases Source File: $sourceTxtFile" "Error Code: $trashAliasErrCode" "Function: configAliasesTrash()" "Script File: utilsAppConfig.sh"

      return $trashAliasErrCode
    }


  appendTextToFile "$sourceTxtFile" "$targetAliasesDir" "$targetAliasesFileName" "775" "$(whoami)" || {

    trashAliasErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Error Code: $trashAliasErrCode"
    echo "Function: configAliasesTrash()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $trashAliasErrCode
  }

  # shellcheck disable=SC1090
  source "$targetAliasesFile" || {

    trashAliasErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $targetAliasesFile" "Error Code: $trashAliasErrCode" "Function: configAliasesTrash()" "Script File: utilsAppConfig.sh"

    return $trashAliasErrCode
  }

  msgNotify "    --------------" "'trash-cli' Aliases Successfully Configured and Now Active" "Sourced Alias Target File:" "$targetAliasesFile" "    --------------"

  return 0
}

configAliasesTrash &&
successMsg "All trash-cli Aliases Created." "REBOOT YOUR COMPUTER!" "Script: 002d_config_trash_aliases.sh" || {

  errXMsg "002d_config_trash_aliases.sh Execution Failed" "Error-Exit!"
}