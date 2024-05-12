#!/bin/bash
# Utilities Library for Application Configuration
#

declare utilAppCfgSetups="$HOME"/bashOps/setups

source "$utilAppCfgSetups"/utils/utilsLib.sh

function configAlacritty() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configAlacritty.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configAlacritty.sh
   source "$scriptFile"
}

# Configures the base aliases file 'aliases.sh'
function configAliases() {

  local sourceFile="$utilAppCfgSetups"/configDir/shell/aliases/aliases.sh

  local aliasTargetDir="$HOME/.config/shell/aliases"

  local aliasTargetFileName="aliases.sh"

  local aliasTargetFile="$aliasTargetDir"/"$aliasTargetFileName"

  local -i aliasesErrCode=0

  [[ -f $sourceFile ]] || {

    aliasesErrCode=79

    errXMsg "Aliases Source File Does NOT Exist!" "Aliases Source File: $sourceFile" "Error Code: $aliasesErrCode" "Function: configAliases()" "Script File: utilsAppConfig.sh"

    return $aliasesErrCode
  }

  [[ ! -f $aliasTargetFile ]] || {

      sudo rm "$aliasTargetFile" ||
      {

        aliasesErrCode=$?

        echo
        echo "*** ERROR ***"
        echo "Removal of Old Alias Target File FAILED!"
        echo "Alias Target File= $aliasTargetFile"
        echo "Error Code: $aliasesErrCode"
        echo "Function: configAliases()"
        echo "Script Name: utilsAppConfig.sh"
        echo
        return $aliasesErrCode

      }

      echo
      echo "Deleted old Aliases File:"
      echo "$aliasTargetFile"
      echo "Function: configAliases()"
      echo "Script Name: utilsAppConfig.sh"
      echo
 }

  appendTextToFile "$sourceFile" "$aliasTargetDir" "$aliasTargetFileName" "775" "$(whoami)" || {

    aliasesErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Error Code: $aliasesErrCode"
    echo "Function: configAliases()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $aliasesErrCode
  }

  # shellcheck disable=SC1090
  source "$aliasTargetFile" || {

    aliasesErrCode=$?

    echo
    echo "  *** ERROR ***"
    echo "Error returned by command:"
    echo "source $aliasTargetFile"
    echo "Error Code: $aliasesErrCode"
    echo "Function: configAliases()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $aliasesErrCode
  }

  echo
  echo "Aliases File Successfully Configured"
  echo "$aliasTargetFile"
  echo

  return 0
}


# Configures Aliases for 'bat' utility.
# 'bat' is a substitute for 'cat'
function configAliasesBat() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgShellSetups/installBatAliases.txt

  local targetAliasesDir="$HOME"/.config/shell/aliases

  local targetAliasesFileName="aliases.sh"

  local targetAliasesFile="$targetAliasesDir"/"$targetAliasesFileName"

  local -i batAliasErrCode=0

  [[ -f $sourceTxtFile ]] || {

    batAliasErrCode=89

    errXMsg "Bat Aliases Source File Does NOT Exist!" "Bat Aliases Source File: $sourceTxtFile" "Error Code: $batAliasErrCode" "Function: configAliasesBat()" "Script File: utilsAppConfig.sh"

    return $batAliasErrCode
  }

  appendTextToFile "$sourceTxtFile" "$targetAliasesDir" "$targetAliasesFileName" "775" "$(whoami)" || {

    batAliasErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Error Code: $batAliasErrCode"
    echo "Function: configAliasesBat()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $batAliasErrCode
  }

  # shellcheck disable=SC1090
  source "$targetAliasesFile" || {

    batAliasErrCode=$?

    echo
    echo "  *** ERROR ***"
    echo "Error returned by command:"
    echo "source $targetAliasesFile"
    echo "Error Code: $batAliasErrCode"
    echo "Function: configAliases()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $batAliasErrCode
  }

  return 0
}

# 'broot' is a replacement for the 'tree' command
# https://github.com/Canop/broot
function configAliasesBroot() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgShellSetups/installBrootAliases.txt

  local targetAliasesDir="$HOME"/.config/shell/aliases

  local targetAliasesFileName="aliases.sh"

  local targetAliasesFile="$targetAliasesDir"/"$targetAliasesFileName"

  local -i brootAliasErrCode=0

  [[ -f $sourceTxtFile ]] || {

    brootAliasErrCode=89

    errXMsg "Broot Aliases Source File Does NOT Exist!" "Broot Aliases Source File: $sourceTxtFile" "Error Code: $brootAliasErrCode" "Function: configAliasesBroot()" "Script File: utilsAppConfig.sh"

    return $brootAliasErrCode
  }

  appendTextToFile "$sourceTxtFile" "$targetAliasesDir" "$targetAliasesFileName" "775" "$(whoami)" || {

    brootAliasErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Error Code: $brootAliasErrCode"
    echo "Function: configAliasesBroot()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $brootAliasErrCode
  }

  # shellcheck disable=SC1090
  source "$targetAliasesFile" || {

    brootAliasErrCode=$?

    echo
    echo "  *** ERROR ***"
    echo "Error returned by command:"
    echo "source $targetAliasesFile"
    echo "Error Code: $brootAliasErrCode"
    echo "Function: configAliases()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $brootAliasErrCode
  }

  return 0
}

# Configures Aliases to substitute
# 'eza' for 'ls' command
function configAliasesEza() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgShellSetups/installEzaAliases.txt

  local targetAliasesDir="$HOME"/.config/shell/aliases

  local targetAliasesFileName="aliases.sh"

  local targetAliasesFile="$targetAliasesDir"/"$targetAliasesFileName"

  local -i ezaAliasErrCode=0

  [[ -f $sourceTxtFile ]] || {

    ezaAliasErrCode=99

    errXMsg "EZA Aliases Source File Does NOT Exist!" "EZA Aliases Source File: $sourceTxtFile" "Error Code: $ezaAliasErrCode" "Function: configAliasesEza()" "Script File: utilsAppConfig.sh"

      return $ezaAliasErrCode
    }


  appendTextToFile "$sourceTxtFile" "$targetAliasesDir" "$targetAliasesFileName" "775" "$(whoami)" || {

    ezaAliasErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Error Code: $ezaAliasErrCode"
    echo "Function: configAliasesEza()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $ezaAliasErrCode
  }

  # shellcheck disable=SC1090
  source "$targetAliasesFile" || {

    ezaAliasErrCode=$?

    echo
    echo "  *** ERROR ***"
    echo "Error returned by command:"
    echo "source $targetAliasesFile"
    echo "Error Code: $ezaAliasErrCode"
    echo "Function: configAliases()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $ezaAliasErrCode
  }

  return 0
}

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

    echo
    echo "  *** ERROR ***"
    echo "Error returned by command:"
    echo "source $targetAliasesFile"
    echo "Error Code: $trashAliasErrCode"
    echo "Function: configAliases()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $trashAliasErrCode
  }

  return 0
}

function configAwesome() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configAwesome.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configAwesome.sh
   source "$scriptFile"
}

function configBashProfile() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    #/setups/cfgBashProfile/cfgBashProfile.sh
    scriptFile="$utilAppCfgSetups"/cfgBashProfile/cfgBashProfile.sh


   # shellcheck disable=SC1090
   source "$scriptFile"

   local scriptBashProfile

   scriptBashProfile="$HOME"/.bash_profile

  # shellcheck disable=SC1090
  source "$scriptBashProfile"

}

function configDirStructure() {

  # shellcheck disable=SC2164
  cd "$HOME"

  local scriptFile

   #Linux/FedoraServer/setups/mikeFolders/createBaseFolders.sh
   scriptFile="$utilAppCfgSetups"/mikeFolders/createBaseFolders.sh


   # shellcheck source="$HOME"/bashOps/setups/mikeFolders/createBaseFolders.sh
   source "$scriptFile"

}

function configEnvars() {

  local sourceFile="$utilAppCfgSetups"/configDir/shell/envars/envars.sh

  local targetEnvarsDir="$HOME"/.config/shell/envars

  local targetEnvarsFileName="envars.sh"

  local targetEnvarsFile="$targetEnvarsDir"/"$targetEnvarsFileName"

  local -i envarsErrCode=0

  [[ -f $sourceFile ]] || {

    envarsErrCode=79

    errXMsg "Aliases Source File Does NOT Exist!" "Aliases Source File: $sourceFile" "Error Code: $envarsErrCode" "Function: configEnvars()" "Script File: utilsAppConfig.sh"

    return $envarsErrCode
  }

  [[ ! -f $targetEnvarsFile ]] || {

      sudo rm "$targetEnvarsFile" ||
      {

        envarsErrCode=$?

        echo
        echo "*** ERROR ***"
        echo "Removal of Old Envars Target File FAILED!"
        echo "Envars Target File= $targetEnvarsFile"
        echo "Error Code: $envarsErrCode"
        echo "Function: configEnvars()"
        echo "Script Name: utilsAppConfig.sh"
        echo
        return $envarsErrCode

      }

      echo
      echo "Deleted old Envars File:"
      echo "$targetEnvarsFile"
      echo "Function: configEnvars()"
      echo "Script Name: utilsAppConfig.sh"
      echo
 }

  appendTextToFile "$sourceFile" "$targetEnvarsDir" "$targetEnvarsFileName" "775" "$(whoami)" || {

    envarsErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Error Code: $envarsErrCode"
    echo "Function: configEnvars()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $envarsErrCode
  }

  # shellcheck disable=SC1090
  source "$targetEnvarsFile" || {

    envarsErrCode=$?

    echo
    echo "  *** ERROR ***"
    echo "Error returned by command:"
    echo "source $targetEnvarsFile"
    echo "Error Code: $envarsErrCode"
    echo "Function: configEnvars()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $envarsErrCode
  }


  echo
  echo "Envars File Successfully Configured"
  echo "$targetEnvarsFile"
  echo

  return 0
}


function configKitty() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configKitty.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configKitty.sh
   source "$scriptFile"
}

function configKrusader() {

  # shellcheck disable=SC2164
  cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configKrusader.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configKrusader.sh
   source "$scriptFile"

 }

function configUserPath() {

  # shellcheck disable=SC2164
  cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/cfgPath/cfgUserPath.sh


  # shellcheck source="$HOME"/bashOps/setups/cfgEnvars/cfgEnvars.sh
   source "$scriptFile"
}

function configPicom() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configPicom.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configPicom.sh
   source "$scriptFile"
}

function configStarship() {

  # shellcheck disable=SC2164
  cd "$HOME"

  local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppInstalls/installStarship.sh

     # shellcheck source="$HOME"/bashOps/setups/customAppInstalls/installStarship.sh
    source "$scriptFile"

}

function configTmux() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configTmux.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configKitty.sh
   source "$scriptFile"
}

function configXorgXintrc() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile=""

    scriptFile="$utilAppCfgSetups"/customAppConfig/configXintrc.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configXintrc.sh
   source "$scriptFile"

}

