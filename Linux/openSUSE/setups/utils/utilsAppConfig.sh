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

    errXMsg "Error returned by 'source' command:" "source $targetAliasesFile" "Error Code: $batAliasErrCode" "Function: configAliasesBat()" "Script File: utilsAppConfig.sh"

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
    echo "Function: configAliasesBroot()"
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

    errXMsg "Error returned by source command:" "source $targetAliasesFile" "Error Code: $ezaAliasErrCode" "Function: configAliasesEza()" "Script File: utilsAppConfig.sh"

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

    errXMsg "Error returned by 'source' command:" "source $targetAliasesFile" "Error Code: $trashAliasErrCode" "Function: configAliasesTrash()" "Script File: utilsAppConfig.sh"

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

# Configures Envars Variables in .bash_profile
function configBashProfileEnvars() {
 
  local sourceTxtFile="$utilAppCfgSetups"/cfgBashProfile/installBashProfileEnvars.txt
 
  local bashProfileTargetDir="$HOME"

  local bashProfileTargetFileName=".bash_profile"

  local bashProfileTargetFile="$bashProfileTargetDir"/"$bashProfileTargetFileName"

  local -i bashProfileEnvarsErrCode=0

  [[ -f $sourceTxtFile ]] || {

    bashProfileEnvarsErrCode=89

    errXMsg ".bash_profile Envars Source File Does NOT Exist!" ".bash_profile Envars Source File:" "  $sourceTxtFile" "Error Code: $bashProfileEnvarsErrCode" "Function: configBashProfileEnvars()" "Script File: utilsAppConfig.sh"

    return $bashProfileEnvarsErrCode
  }

  appendTextToFile "$sourceTxtFile" "$bashProfileTargetDir" "$bashProfileTargetFileName" "775" "$(whoami)" || {

    bashProfileEnvarsErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $bashProfileTargetFile"
    echo "Error Code: $bashProfileEnvarsErrCode"
    echo "Function: configBashProfileEnvars()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $bashProfileEnvarsErrCode
  }

  # shellcheck disable=SC1090
  source "$bashProfileTargetFile" || {

    bashProfileEnvarsErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $bashProfileTargetFile" "Error Code: $bashProfileEnvarsErrCode" "Function: configBashProfileEnvars()" "Script File: utilsAppConfig.sh"

    return $bashProfileEnvarsErrCode
  }

  msgNotify "    --------------" "'.bash_profile' Custom Functions Successfully Configured and Now Active" "Sourced Target File:" "$bashProfileTargetFile" "    --------------"

  return 0
}

# Adds alias sourcing to .bashrc file
function configBashrcAliases() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgBashrc/installBashrcAliases.txt

  local bashrcTargetDir="$HOME"

  local bashrcTargetFileName=".bashrc"

  local bashrcTargetFile="$bashrcTargetDir"/"$bashrcTargetFileName"

  local -i bashrcAliasesErrCode=0

  [[ -f $sourceTxtFile ]] || {

    bashrcAliasesErrCode=89

    errXMsg ".bashrc Aliases Source File Does NOT Exist!" ".bashrc Aliases Source File:" "  $sourceTxtFile" "Error Code: $bashrcAliasesErrCode" "Function: configBashrcAliases()" "Script File: utilsAppConfig.sh"

    return $bashrcAliasesErrCode
  }

  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFileName" "775" "$(whoami)" || {

    bashrcAliasesErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $bashrcTargetFile"
    echo "Error Code: $bashrcAliasesErrCode"
    echo "Function: configBashrcAliases()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $bashrcAliasesErrCode
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    bashrcAliasesErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $bashrcAliasesErrCode" "Function: configBashrcAliases()" "Script File: utilsAppConfig.sh"

    return $bashrcAliasesErrCode
  }

  msgNotify "    --------------" "'.bashrc' Aliases Successfully Configured and Now Active" "Sourced Alias Target File:" "$bashrcTargetFile" "    --------------"

  return 0
}

# Configures 'broot' startup in .bashrc file.
# 'broot' is a replacement for the 'tree' command.
# https://github.com/Canop/broot
function configBashrcBroot() {
  
  local sourceTxtFile="$utilAppCfgSetups"/cfgBashrc/installBashrcBroot.txt
 
  local bashrcTargetDir="$HOME"

  local bashrcTargetFileName=".bashrc"

  local bashrcTargetFile="$bashrcTargetDir"/"$bashrcTargetFileName"

  local -i bashrcBrootErrCode=0

  [[ -f $sourceTxtFile ]] || {

    bashrcBrootErrCode=89

    errXMsg ".bashrc Broot Source File Does NOT Exist!" ".bashrc Broot Source File:" "  $sourceTxtFile" "Error Code: $bashrcBrootErrCode" "Function: configBashrcBroot()" "Script File: utilsAppConfig.sh"

    return $bashrcBrootErrCode
  }

  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFileName" "775" "$(whoami)" || {

    bashrcBrootErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $bashrcTargetFile"
    echo "Error Code: $bashrcBrootErrCode"
    echo "Function: configBashrcBroot()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $bashrcBrootErrCode
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    bashrcBrootErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $bashrcBrootErrCode" "Function: configBashrcBroot()" "Script File: utilsAppConfig.sh"

    return $bashrcBrootErrCode
  }

  msgNotify "    --------------" "'.bashrc' Broot Parameters Successfully Configured and Now Active" "Sourced Target File:" "$bashrcTargetFile" "    --------------"

  return 0
}

# Adds custom functions to the .bashrc file
function configBashrcFuncs() {
  
  local sourceTxtFile="$utilAppCfgSetups"/cfgBashrc/installBashrcFuncs.txt
 
  local bashrcTargetDir="$HOME"

  local bashrcTargetFileName=".bashrc"

  local bashrcTargetFile="$bashrcTargetDir"/"$bashrcTargetFileName"

  local -i bashrcFuncsErrCode=0

  [[ -f $sourceTxtFile ]] || {

    bashrcFuncsErrCode=89

    errXMsg ".bashrc Funcs Source File Does NOT Exist!" ".bashrc Funcs Source File:" "  $sourceTxtFile" "Error Code: $bashrcFuncsErrCode" "Function: configBashrcFuncs()" "Script File: utilsAppConfig.sh"

    return $bashrcFuncsErrCode
  }

  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFileName" "775" "$(whoami)" || {

    bashrcFuncsErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $bashrcTargetFile"
    echo "Error Code: $bashrcFuncsErrCode"
    echo "Function: configBashrcFuncs()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $bashrcFuncsErrCode
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    bashrcFuncsErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $bashrcFuncsErrCode" "Function: configBashrcFuncs()" "Script File: utilsAppConfig.sh"

    return $bashrcFuncsErrCode
  }

  msgNotify "    --------------" "'.bashrc' Custom Functions Successfully Configured and Now Active" "Sourced Target File:" "$bashrcTargetFile" "    --------------"

  return 0
}

# Inserts starship activation code in .bashrc file
function configBashrcStarship() {
  
  local sourceTxtFile="$utilAppCfgSetups"/cfgBashrc/installBashrcStarship.txt
 
  local bashrcTargetDir="$HOME"

  local bashrcTargetFileName=".bashrc"

  local bashrcTargetFile="$bashrcTargetDir"/"$bashrcTargetFileName"

  local -i bashrcStarshipErrCode=0

  [[ -f $sourceTxtFile ]] || {

    bashrcStarshipErrCode=89

    errXMsg ".bashrc Starship Source File Does NOT Exist!" ".bashrc Starship Source File:" "  $sourceTxtFile" "Error Code: $bashrcStarshipErrCode" "Function: configBashrcStarship()" "Script File: utilsAppConfig.sh"

    return $bashrcStarshipErrCode
  }

  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFileName" "775" "$(whoami)" || {

    bashrcStarshipErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $bashrcTargetFile"
    echo "Error Code: $bashrcStarshipErrCode"
    echo "Function: configBashrcStarship()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $bashrcStarshipErrCode
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    bashrcStarshipErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $bashrcStarshipErrCode" "Function: configBashrcStarship()" "Script File: utilsAppConfig.sh"

    return $bashrcStarshipErrCode
  }

  msgNotify "    --------------" "'.bashrc' Starship Startup Code Successfully Configured and Now Active" "Sourced Target File:" "$bashrcTargetFile" "    --------------"

  return 0
}

# Configures the user path activation in .bashrc file
function configBashrcUserPath() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgBashrc/installBashrcPathParms.txt
 
  local bashrcTargetDir="$HOME"

  local bashrcTargetFileName=".bashrc"

  local bashrcTargetFile="$bashrcTargetDir"/"$bashrcTargetFileName"

  local -i bashrcUserPathErrCode=0

  [[ -f $sourceTxtFile ]] || {

    bashrcUserPathErrCode=89

    errXMsg ".bashrc UserPath Source File Does NOT Exist!" ".bashrc UserPath Source File:" "  $sourceTxtFile" "Error Code: $bashrcUserPathErrCode" "Function: configBashrcUserPath()" "Script File: utilsAppConfig.sh"

    return $bashrcUserPathErrCode
  }

  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFileName" "775" "$(whoami)" || {

    bashrcUserPathErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $bashrcTargetFile"
    echo "Error Code: $bashrcUserPathErrCode"
    echo "Function: configBashrcUserPath()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $bashrcUserPathErrCode
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    bashrcUserPathErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $bashrcUserPathErrCode" "Function: configBashrcUserPath()" "Script File: utilsAppConfig.sh"

    return $bashrcUserPathErrCode
  }

  msgNotify "    --------------" "'.bashrc' User Path Successfully Configured and Now Active" "Sourced Target File:" "$bashrcTargetFile" "    --------------"

  return 0
}

# Configures Zoxide startup in .bashrc file.
function configBashrcZoxide() {
  
  local sourceTxtFile="$utilAppCfgSetups"/cfgBashrc/installBashrcZoxide.txt
 
  local bashrcTargetDir="$HOME"

  local bashrcTargetFileName=".bashrc"

  local bashrcTargetFile="$bashrcTargetDir"/"$bashrcTargetFileName"

  local -i bashrcZoxideErrCode=0

  [[ -f $sourceTxtFile ]] || {

    bashrcZoxideErrCode=89

    errXMsg ".bashrc Zoxide Source File Does NOT Exist!" ".bashrc Zoxide Source File:" "  $sourceTxtFile" "Error Code: $bashrcZoxideErrCode" "Function: configBashrcZoxide()" "Script File: utilsAppConfig.sh"

    return $bashrcZoxideErrCode
  }

  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFileName" "775" "$(whoami)" || {

    bashrcZoxideErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $bashrcTargetFile"
    echo "Error Code: $bashrcZoxideErrCode"
    echo "Function: configBashrcZoxide()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $bashrcZoxideErrCode
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    bashrcZoxideErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $bashrcZoxideErrCode" "Function: configBashrcZoxide()" "Script File: utilsAppConfig.sh"

    return $bashrcZoxideErrCode
  }

  msgNotify "    --------------" "'.bashrc' Zoxide Parameters Successfully Configured and Now Active" "Sourced Target File:" "$bashrcTargetFile" "    --------------"

  return 0
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

# Configures Envars Variables in 
# HOME/.config/shell/envars directory.
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

# Configures the User Path
function configUserPath() {

  local sourceFile="$utilAppCfgSetups"/configDir/shell/path/userPath.sh

  local userPathTargetDir="$HOME/.config/shell/userPath"

  local userPathTargetFileName="userPath.sh"

  local userPathTargetFile="$userPathTargetDir"/"$userPathTargetFileName"

  local -i userPathErrCode=0

  [[ -f $sourceFile ]] || {

    userPathErrCode=79

    errXMsg "userPath Source File Does NOT Exist!" "userPath Source File: $sourceFile" "Error Code: $userPathErrCode" "Function: configUserPath()" "Script File: utilsAppConfig.sh"

    return $userPathErrCode
  }

  [[ ! -f $userPathTargetFile ]] || {

      sudo rm "$userPathTargetFile" ||
      {

        userPathErrCode=$?

        errXMsg "Removal of Old userPath Target File FAILED!" "userPath Target File= $userPathTargetFile" "Error Code: $userPathErrCode" "Function: configUserPath()" "Script Name: utilsAppConfig.sh"

        return $userPathErrCode

      }

      msgNotify "Deleted old userPath File:" "$userPathTargetFile" "Function: configUserPath()" "Script Name: utilsAppConfig.sh"
 }

  appendTextToFile "$sourceFile" "$userPathTargetDir" "$userPathTargetFileName" "775" "$(whoami)" || {

    userPathErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Error Code: $userPathErrCode"
    echo "Function: configUserPath()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $userPathErrCode
  }

  # shellcheck disable=SC1090
  source "$userPathTargetFile" || {

    userPathErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $userPathTargetFile" "Error Code: $userPathErrCode" "Function: configUserPath()" "Script File: utilsAppConfig.sh"

    return $userPathErrCode
  }

  msgNotify "    --------------" "userPath File Successfully Configured and Now Active" "Sourced userPath Target File:" "  $userPathTargetFile" "   --------------"

  return 0
}

function configPicom() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configPicom.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configPicom.sh
   source "$scriptFile"
}

# Copies starship configuration files to HOME/.config
function configStarship() {

  local sourceConfigDir="$utilAppCfgSetups"/configDir/starship
  
  local targetConfigDir="$HOME"/.config
  
  local targetConfigStarshipDir="$targetConfigDir"/sharship

  local -i cfgStarshipErrCode=0

  # shellcheck disable=SC2164
  cd "$HOME" || {
   
      cfgStarshipErrCode=$?
    
      errXMsg "Error returned by 'cd' command:" "cd $HOME" "Error Code: $cfgStarshipErrCode" "Function: configStarship()" "Script File: utilsAppConfig.sh"  
 
      return $cfgStarshipErrCode
  }

  [[ ! -d $targetConfigStarshipDir ]] || {
    
    sudo rm -rfv "$targetConfigStarshipDir" || {
   
      cfgStarshipErrCode=$?
    
      errXMsg "Error returned by 'rm' command:" "sudo rm -rfv $targetConfigStarshipDir" "Error Code: $cfgStarshipErrCode" "Function: configStarship()" "Script File: utilsAppConfig.sh"  
     
      
      return $cfgStarshipErrCode
 
    }
    
  }

  makeDirIfNotExist "$targetConfigDir" "775" "$(whoami)" || {
 
    cfgStarshipErrCode=$?

    echo
    echo "Error calling makeDirIfNotExist()"
    echo "Error Code: $cfgStarshipErrCode"
    echo "Function: configStarship()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $cfgStarshipErrCode
  }

  cp -rfv "$sourceConfigDir"/* "$targetConfigDir" || {
  
      cfgStarshipErrCode=$?
    
      errXMsg "Error returned by 'cp' command:" "cp -rfv $sourceConfigDir/* $targetConfigDir" "Error Code: $cfgStarshipErrCode" "Function: configStarship()" "Script File: utilsAppConfig.sh"  
 
      return $cfgStarshipErrCode
  }  

  msgNotify "    --------------" "Starship Configuration Files Successfully Copied to $HOME/.config" "    --------------"
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

