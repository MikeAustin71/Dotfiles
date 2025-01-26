#!/bin/bash
# Utilities Library for Application Configuration
#

declare baseSetups2dDir="$HOME"/bashOps/setups

source "$baseSetups2dDir"/utils/utilsLib.sh
source "$baseSetups2dDir"/utils/utilsAppConfig.sh
source "$baseSetups2dDir"/utils/utilsAppInstall.sh



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

    errXMsg "Trash Aliases Source File Does NOT Exist!" "Trash Aliases Source File: $sourceTxtFile" "Error Code: $trashAliasErrCode" "Function: configAliasesTrash()" "Script File: 002c_config_trash_aliases.sh"

      return $trashAliasErrCode
    }


  appendTextToFile "$sourceTxtFile" "$targetAliasesDir" "$targetAliasesFileName" "775" "$(whoami)" || {

    trashAliasErrCode=$?

    errXMsg "Error calling appendTextToFile()!" "Error Code: $trashAliasErrCode" "Function: configAliasesTrash()" "Script File: 002c_config_trash_aliases.sh"

    return $trashAliasErrCode
  }

  # shellcheck disable=SC1090
  source "$targetAliasesFile" || {

    trashAliasErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $targetAliasesFile" "Error Code: $trashAliasErrCode" "Function: configAliasesTrash()" "Script File: 002c_config_trash_aliases.sh"

    return $trashAliasErrCode
  }

  msgNotify "    --------------" "'trash-cli' Aliases Successfully Configured and Now Active" "Sourced Alias Target File:" "$targetAliasesFile" "    --------------"

  return 0
}

msgNotify "Configuring trash-cli aliases." &&
configAliasesTrash &&
msgNotify "Returning to Home Base" &&
changeToDir "$utilAppCfgSetups/stdAppInstall" &&
successMsg "All trash-cli Aliases Created." "Script: 002d_config_trash_aliases.sh" || {

  errXMsg "002d_config_trash_aliases.sh Execution Failed" "Error-Exit!"
}