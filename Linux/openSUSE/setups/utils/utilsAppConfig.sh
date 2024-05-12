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

        errXMsg "Removal of Old Alias Target File FAILED!" "Alias Target File= $aliasTargetFile" "Error Code: $aliasesErrCode" "Function: configAliases()" "Script Name: utilsAppConfig.sh"

        return $aliasesErrCode

      }

      msgNotify "Deleted old Aliases File:" "$aliasTargetFile" "Function: configAliases()" "Script Name: utilsAppConfig.sh"
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

    errXMsg "Error returned by 'source' command:" "source $aliasTargetFile" "Error Code: $aliasesErrCode" "Function: configAliases()" "Script File: utilsAppConfig.sh"

    return $aliasesErrCode
  }

  msgNotify "    --------------" "Aliases File Successfully Configured and Now Active" "Sourced Alias Target File:" "  $aliasTargetFile" "   --------------"

  return 0
}

# Adds alias sourcing to .bashrc file
function configAliasesBashrc() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgBashrc/installBashrcAliases.txt

  local bashrcTargetDir="$HOME"

  local bashrcTargetFileName=".bashrc"

  local bashrcTargetFile="$bashrcTargetDir"/"$bashrcTargetFileName"

  local -i bashrcAliasesErrCode=0

  [[ -f $sourceTxtFile ]] || {

    bashrcAliasesErrCode=89

    errXMsg ".bashrc Aliases Source File Does NOT Exist!" ".bashrc Aliases Source File:" "  $sourceTxtFile" "Error Code: $bashrcAliasesErrCode" "Function: configAliasesBashrc()" "Script File: utilsAppConfig.sh"

    return $bashrcAliasesErrCode
  }

  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFile" "775" "$(whoami)" || {

    bashrcAliasesErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $bashrcTargetFile"
    echo "Error Code: $bashrcAliasesErrCode"
    echo "Function: configAliasesBashrc()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $bashrcAliasesErrCode
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    bashrcAliasesErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $bashrcAliasesErrCode" "Function: configAliases()" "Script File: utilsAppConfig.sh"

    return $bashrcAliasesErrCode
  }

  msgNotify "    --------------" "'.bashrc' Aliases Successfully Configured and Now Active" "Sourced Alias Target File:" "$bashrcTargetFile" "    --------------"

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

    errXMsg "Bat Aliases Source File Does NOT Exist!" "Bat Aliases Source File:" "  $sourceTxtFile" "Error Code: $batAliasErrCode" "Function: configAliasesBat()" "Script File: utilsAppConfig.sh"

    return $batAliasErrCode
  }

  appendTextToFile "$sourceTxtFile" "$targetAliasesDir" "$targetAliasesFileName" "775" "$(whoami)" || {

    batAliasErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $targetAliasesFile"
    echo "Error Code: $batAliasErrCode"
    echo "Function: configAliasesBat()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $batAliasErrCode
  }

  # shellcheck disable=SC1090
  source "$targetAliasesFile" || {

    batAliasErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $targetAliasesFile" "Error Code: $batAliasErrCode" "Function: configAliases()" "Script File: utilsAppConfig.sh"

    return $batAliasErrCode
  }

  msgNotify "    --------------" "'bat' Aliases Successfully Configured and Now Active" "Sourced Alias Target File:" "$targetAliasesFile" "    --------------"

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
    echo "Error returned by 'source' command:"
    echo "source $targetAliasesFile"
    echo "Error Code: $brootAliasErrCode"
    echo "Function: configAliases()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $brootAliasErrCode
  }

  msgNotify "    --------------" "'broot' Aliases Successfully Configured and Now Active" "Sourced Alias Target File:" "$targetAliasesFile" "    --------------"

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

    errXMsg "'eza' Aliases Source File Does NOT Exist!" "'eza' Aliases Source File: $sourceTxtFile" "Error Code: $ezaAliasErrCode" "Function: configAliasesEza()" "Script File: utilsAppConfig.sh"

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

    errXMsg "Error returned by source command:" "source $targetAliasesFile" "Error Code: $ezaAliasErrCode" "Function: configAliases()" "Script File: utilsAppConfig.sh"

    return $ezaAliasErrCode
  }

  msgNotify "    --------------" "'eza' Aliases Successfully Configured and Now Active" "Sourced Alias Target File:" "$targetAliasesFile" "    --------------"

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

    errXMsg "Error returned by 'source' command:" "source $targetAliasesFile" "Error Code: $trashAliasErrCode" "Function: configAliases()" "Script File: utilsAppConfig.sh"

    return $trashAliasErrCode
  }

  msgNotify "    --------------" "'trash-cli' Aliases Successfully Configured and Now Active" "Sourced Alias Target File:" "$targetAliasesFile" "    --------------"

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

    errXMsg "Envars Source File Does NOT Exist!" "Envars Source File: $sourceFile" "Error Code: $envarsErrCode" "Function: configEnvars()" "Script File: utilsAppConfig.sh"

    return $envarsErrCode
  }

  [[ ! -f $targetEnvarsFile ]] || {

      sudo rm "$targetEnvarsFile" ||
      {

        envarsErrCode=$?

        errXMsg "Removal of Old Envars Target File FAILED!" "Envars Target File= $targetEnvarsFile" "Error Code: $envarsErrCode" "Function: configEnvars()" "Script Name: utilsAppConfig.sh"

        return $envarsErrCode

      }

      msgNotify "Deleted old Envars File:" "$targetEnvarsFile" "Function: configEnvars()" "Script Name: utilsAppConfig.sh"
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

    errXMsg "Error returned by 'source' command:" "source $targetEnvarsFile" "Error Code: $envarsErrCode" "Function: configEnvars()""Script File: utilsAppConfig.sh"

    return $envarsErrCode
  }


  msgNotify "    --------------" "Envars File Successfully Configured and Now Active" "Sourced Envars Target File:" "$targetEnvarsFile"

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

