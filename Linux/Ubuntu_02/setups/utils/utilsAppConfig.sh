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


   # shellcheck disable=SC1090
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


function configAwesome() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configAwesome.sh


   # shellcheck disable=SC1090
   source "$scriptFile"
}


# Configures Atuin function in .bashrc file.
# Run this after you install atuin.
# See installAtuin() in utilsAppInstall.sh
#
function configBashrcAtuin() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgBashrc/installBashrcAtuin.txt

  local bashrcTargetDir="$HOME"

  local bashrcTargetFileName=".bashrc"

  local bashrcTargetFile="$bashrcTargetDir"/"$bashrcTargetFileName"

  local -i THE_ERR_Code=0

  [[ -f $sourceTxtFile ]] || {

    THE_ERR_Code=89

    errXMsg ".bashrc Source File Does NOT Exist!" ".bashrc Source File:" "  $sourceTxtFile" "Error Code: $THE_ERR_Code" "Function: configBashrcAtuin()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFileName" "775" "$(whoami)" || {

    THE_ERR_Code=$?

    errXMsg "Error calling appendTextToFile()" "Target File: $bashrcTargetFile" "Error Code: $THE_ERR_Code" "Function: configBashrcAtuin()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    THE_ERR_Code=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $THE_ERR_Code" "Function: configBashrcAtuin()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  msgNotify "    --------------" "'.bashrc' Atuin Parameters Successfully Configured and Now Active" "Sourced Target File:" "$bashrcTargetFile" "    --------------"

  return 0
}


function configBashrcBashCompletion() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgBashrc/installBashrcBashCompletion.txt

  local bashrcTargetDir="$HOME"

  local bashrcTargetFileName=".bashrc"

  local bashrcTargetFile="$bashrcTargetDir"/"$bashrcTargetFileName"

  local -i bashrcCompletionsErrCode=0

  [[ -f $sourceTxtFile ]] || {

    bashrcCompletionsErrCode=79

    errXMsg "Bash Completions Source File Does NOT Exist!" "Bash_Completion Source File:" "  $sourceTxtFile" "Error Code: $bashrcCompletionsErrCode" "Function: configBashrcBashCompletion()" "Script File: utilsAppConfig.sh"

    return $bashrcCompletionsErrCode
  }

  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFileName" "775" "$(whoami)" || {

    bashrcCompletionsErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $bashrcTargetFile"
    echo "Error Code: $bashrcCompletionsErrCode"
    echo "Function: configBashrcBashCompletion()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $bashrcCompletionsErrCode
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    bashrcCompletionsErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $bashrcCompletionsErrCode" "Function: configBashrcBashCompletion()" "Script File: utilsAppConfig.sh"

    return $bashrcCompletionsErrCode
  }

  msgNotify "    --------------" "'.bashrc' Bash Bash Completions Successfully Configured and Now Active" "Sourced Target File:" "$bashrcTargetFile" "    --------------"

  return 0
}


# Configures 'fzf' function in .bashrc file.
# Run this after you install fzf.
# See installFuzzyFinder() in utilsAppInstall.sh
#
function configBashrcFzf() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgBashrc/installBashrcFzf.txt

  local bashrcTargetDir="$HOME"

  local bashrcTargetFileName=".bashrc"

  local bashrcTargetFile="$bashrcTargetDir"/"$bashrcTargetFileName"

  local -i THE_ERR_Code=0

  [[ -f $sourceTxtFile ]] || {

    THE_ERR_Code=89

    errXMsg "Source File Does NOT Exist!" "Fatal Error! .bashrc Configuration cannot proceed!" "Source File:" "  $sourceTxtFile" "Error Code: $THE_ERR_Code" "Function: configBashrcFzf()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  [[ -f $bashrcTargetFileName ]] || {

    THE_ERR_Code=88

    errXMsg ".bashrc Target File Does NOT Exist!" "Fatal Error! .bashrc Configuration cannot proceed!" ".bashrc Target File:" "  $bashrcTargetFile" "Error Code: $THE_ERR_Code" "Function: configBashrcFzf()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code

  }

  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFileName" "775" "$(whoami)" || {

    THE_ERR_Code=$?

    errXMsg "Error calling appendTextToFile()" "Target File: $bashrcTargetFile" "Error Code: $THE_ERR_Code" "Function: configBashrcFzf()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    THE_ERR_Code=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $THE_ERR_Code" "Function: configBashrcAtuin()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  msgNotify "'.bashrc' fzf Parameters Successfully Configured and Now Active" "Sourced Target File:" "$bashrcTargetFile" "Function: configBashrcAtuin()" "Script File: utilsAppConfig.sh"

  return 0
}


# Configures Plocate in .bashrc file.
# Run this after you install 'plocate'.
# See installPlocate() in utilsAppInstall.sh
#
function configBashrcPlocate() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgBashrc/installBashrcPlocate.txt

  local bashrcTargetDir="$HOME"

  local bashrcTargetFileName=".bashrc"

  local bashrcTargetFile="$bashrcTargetDir"/"$bashrcTargetFileName"

  local -i THE_ERR_Code=0

  [[ -f $sourceTxtFile ]] || {

    THE_ERR_Code=89

    errXMsg ".bashrc Source File Does NOT Exist!" ".bashrc Source File:" "  $sourceTxtFile" "Error Code: $THE_ERR_Code" "Function: configBashrcPlocate()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  [[ -f $bashrcTargetFile ]] || {

    THE_ERR_Code=89

    errXMsg ".bashrc Target File Does NOT Exist!" ".bashrc Target File:" "  $bashrcTargetFile" "Error Code: $THE_ERR_Code" "Function: configBashrcPlocate()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code

  }


  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFileName" "775" "$(whoami)" || {

    THE_ERR_Code=$?

    errXMsg "Error calling appendTextToFile()" "Source File: $sourceTxtFile" "Target File: $bashrcTargetFile" "Error Code: $THE_ERR_Code" "Function: configBashrcPlocate()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    THE_ERR_Code=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $THE_ERR_Code" "Function: configBashrcPlocate()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  msgNotify  "'.bashrc' Plocate Database Initialization Successfully Configured and Now Active" "Target File:" "$bashrcTargetFile" "Function: configBashrcPlocate()" "Script File: utilsAppConfig.sh"

  return 0
}


# Configures 'broot' startup in .bash_profile file.
# 'broot' is a replacement for the 'tree' command.
# https://github.com/Canop/broot
function configBashProfileBroot() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgBashProfile/installBashProfileBroot.txt

  local bashProfileTargetDir="$HOME"

  local bashProfileTargetFileName=".bash_profile"

  local bashProfileTargetFile="$bashProfileTargetDir"/"$bashProfileTargetFileName"

  local -i bashProfileBrootErrCode=0

  [[ -f $sourceTxtFile ]] || {

    bashProfileBrootErrCode=69

    errXMsg ".bash_profile Broot Source File Does NOT Exist!" ".bash_profile Broot Source File:" "  $sourceTxtFile" "Error Code: $bashProfileBrootErrCode" "Function: configBashProfileBroot()" "Script File: utilsAppConfig.sh"

    return $bashProfileBrootErrCode
  }

  appendTextToFile "$sourceTxtFile" "$bashProfileTargetDir" "$bashProfileTargetFileName" "775" "$(whoami)" || {

    bashProfileBrootErrCode=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $bashProfileTargetFile"
    echo "Error Code: $bashProfileBrootErrCode"
    echo "Function: configBashProfileBroot()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $bashProfileBrootErrCode
  }

  # shellcheck disable=SC1090
  source "$bashProfileTargetFile" || {

    bashProfileBrootErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $bashProfileTargetFile" "Error Code: $bashProfileBrootErrCode" "Function: configBashProfileBroot()" "Script File: utilsAppConfig.sh"

    return $bashProfileBrootErrCode
  }

  msgNotify "    --------------" "'.bash_profile' Broot Parameters Successfully Configured and Now Active" "Sourced Target File:" "$bashProfileTargetFile" "    --------------"

  return 0
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

  [[ -f $bashProfileTargetFile ]] || {

    bashProfileTargetFileName=".bashrc"

    bashProfileTargetFile="$bashProfileTargetDir"/"$bashProfileTargetFileName"

    if [[ ! -f $bashProfileTargetFile ]]; then

      bashProfileEnvarsErrCode=90

      errXMsg ".bashrc alternate target file Does NOT Exist!" "Envars Target File:" "  $bashProfileTargetFile" "Error Code: $bashProfileEnvarsErrCode" "Function: configBashProfileEnvars()" "Script File: utilsAppConfig.sh"

      return $bashProfileEnvarsErrCode

    fi
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

  local -i THE_ERR_Code=0

  [[ -f $sourceTxtFile ]] || {

    THE_ERR_Code=89

    errXMsg ".bashrc Zoxide Source File Does NOT Exist!" ".bashrc Zoxide Source File:" "  $sourceTxtFile" "Error Code: $THE_ERR_Code" "Function: configBashrcZoxide()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFileName" "775" "$(whoami)" || {

    THE_ERR_Code=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $bashrcTargetFile"
    echo "Error Code: $THE_ERR_Code"
    echo "Function: configBashrcZoxide()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $THE_ERR_Code
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    THE_ERR_Code=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $THE_ERR_Code" "Function: configBashrcZoxide()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  msgNotify "    --------------" "'.bashrc' Zoxide Parameters Successfully Configured and Now Active" "Sourced Target File:" "$bashrcTargetFile" "    --------------"

  return 0
}

# Configures Yazi function in .bashrc file.
function configBashrcYazi() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgBashrc/installBashrcYazi.txt

  local bashrcTargetDir="$HOME"

  local bashrcTargetFileName=".bashrc"

  local bashrcTargetFile="$bashrcTargetDir"/"$bashrcTargetFileName"

  local -i THE_ERR_Code=0

  [[ -f $sourceTxtFile ]] || {

    THE_ERR_Code=89

    errXMsg ".bashrc Source File Does NOT Exist!" ".bashrc Source File:" "  $sourceTxtFile" "Error Code: $THE_ERR_Code" "Function: configBashrcYazi()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  appendTextToFile "$sourceTxtFile" "$bashrcTargetDir" "$bashrcTargetFileName" "775" "$(whoami)" || {

    THE_ERR_Code=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $bashrcTargetFile"
    echo "Error Code: $THE_ERR_Code"
    echo "Function: configBashrcYazi()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $THE_ERR_Code
  }

  # shellcheck disable=SC1090
  source "$bashrcTargetFile" || {

    THE_ERR_Code=$?

    errXMsg "Error returned by 'source' command:" "source $bashrcTargetFile" "Error Code: $THE_ERR_Code" "Function: configBashrcYazi()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  msgNotify "    --------------" "'.bashrc' Yazi Parameters Successfully Configured and Now Active" "Sourced Target File:" "$bashrcTargetFile" "    --------------"

  return 0
}


function configColorsEza() {

  # shellcheck disable=SC2164
  cd "$HOME"


}

function configDirStructure() {

  # shellcheck disable=SC2164
  cd "$HOME"

  local scriptFile

   #Linux/FedoraServer/setups/mikeFolders/createBaseFolders.sh
   scriptFile="$utilAppCfgSetups"/mikeFolders/createBaseFolders.sh


   # shellcheck disable=SC1090
   source "$scriptFile"

}

# Configures Envars Variables in 
# HOME/.config/shell/envars directory.
# configBashProfileEnvars() should be
# call immediately after this function.
function configEnvars() {

  local sourceFile="$utilAppCfgSetups"/configDir/shell/envars/envars.sh

  local targetEnvarsDir="$HOME"/.config/shell/envars

  local targetEnvarsFileName="envars.sh"

  local targetEnvarsFile="$targetEnvarsDir"/"$targetEnvarsFileName"

  local opsAuthority=""

  opsAuthority="$(whoami)"

  local -i envarsErrCode=0

  # The source MUST Exist!
  if [[ ! -f $sourceFile ]]; then

    envarsErrCode=79

    errXMsg "Envars Source File Does NOT Exist!" "Fatal Error! Environment variables configuration cannot proceed." "Envars Source File: $sourceFile" "Error Code: $envarsErrCode" "Function: configEnvars()" "Script File: utilsAppConfig.sh"

    return $envarsErrCode

  fi

  if [[ -f $targetEnvarsFile ]]; then

      # If $targetEnvarsFile exists, delete it.
      # A new, empty $targetEnvarsFile will be
      # created by appendTextToFile, below.

      sudo rm -f "$targetEnvarsFile" ||
      {

        envarsErrCode=$?

        errXMsg "Removal of Old Envars Target File FAILED!" "Envars Target File= $targetEnvarsFile" "Error Code: $envarsErrCode" "Function: configEnvars()" "Script Name: utilsAppConfig.sh"

        return $envarsErrCode

      }

      msgNotify "Deleted old Envars File:" "$targetEnvarsFile" "Function: configEnvars()" "Script Name: utilsAppConfig.sh"

  fi

  appendTextToFile "$sourceFile" "$targetEnvarsDir" "$targetEnvarsFileName" "775" "$opsAuthority" || {

    envarsErrCode=$?

    errXMsg "Error calling appendTextToFile()" "Error Code: $envarsErrCode" "Function: configEnvars()" "Script File: utilsAppConfig.sh"

    return $envarsErrCode
  }

  if [[ ! -f $targetEnvarsFile ]]; then

    envarsErrCode=67

    errXMsg "Target File Creation/Update Failed" "Target Files Does NOT Exist!" "File: $targetEnvarsFile" "Error Code: $envarsErrCode" "Function: configEnvars()" "Script File: utilsAppConfig.sh"

    return $envarsErrCode

  fi

  # shellcheck disable=SC1090
  source "$targetEnvarsFile" || {

    envarsErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $targetEnvarsFile" "Error Code: $envarsErrCode" "Function: configEnvars()" "Script File: utilsAppConfig.sh"

    return $envarsErrCode
  }

  msgNotify "Envars Script File Successfully Configured and Now Active" "Sourced Envars Target File:" "$targetEnvarsFile"

  return 0
}


function configKitty() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configKitty.sh


  # shellcheck source=MIKE_Setup_Scripts/customAppConfig/configKitty.sh
   source "$scriptFile"
}

function configKrusader() {

  # shellcheck disable=SC2164
  cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configKrusader.sh


  # shellcheck source=$utilAppCfgSetups/customAppConfig/configKrusader.sh
   source "$scriptFile"

}


# Configures Envars Variables in 
# HOME/.config/shell/envars directory.
# configBashProfileEnvars() should be
# call immediately after this function.
function configUserFuncs() {

  local sourceFile="$utilAppCfgSetups"/configDir/shell/userFuncs/userFunctions.sh

  local targetUserFuncsDir="$HOME"/.config/shell/userFuncs

  local targetFileName="userFunctions.sh"

  local targetUserFuncsPathFileName="$targetUserFuncsDir"/"$targetFileName"

  local opsAuthority=""

  opsAuthority="$(whoami)"

  local -i funcsErrCode=0

  # The source MUST Exist!
  if [[ ! -f $sourceFile ]]; then

    funcsErrCode=79

    errXMsg "User Functions Source File Does NOT Exist!" "Fatal Error! User Functions configuration cannot proceed." "Source File: $sourceFile" "Error Code: $funcsErrCode" "Function: configUserFuncs()" "Script File: utilsAppConfig.sh"

    return $funcsErrCode

  fi

  if [[ -f $targetUserFuncsPathFileName ]]; then

      # If $targetUserFuncsPathFileName exists, delete it.
      # A new, empty $targetUserFuncsPathFileName will be
      # created by appendTextToFile, below.

      sudo rm -f "$targetUserFuncsPathFileName" ||
      {

        funcsErrCode=$?

        errXMsg "Removal of Old User Functions Target File FAILED!" "User Functions Target File= $targetUserFuncsPathFileName" "Error Code: $funcsErrCode" "Function: configUserFuncs()" "Script Name: utilsAppConfig.sh"

        return $funcsErrCode

      }

      msgNotify "Deleted old User Functions File:" "$targetUserFuncsPathFileName" "Function: configUserFuncs()" "Script Name: utilsAppConfig.sh"

  fi

  appendTextToFile "$sourceFile" "$targetUserFuncsDir" "$targetFileName" "775" "$opsAuthority" || {

    funcsErrCode=$?

    errXMsg "Error calling appendTextToFile()" "User Functions Configuration FAILED!"  "Error Code: $funcsErrCode" "Function: configUserFuncs()" "Script File: utilsAppConfig.sh"

    return $funcsErrCode
  }

  if [[ ! -f $targetUserFuncsPathFileName ]]; then

    funcsErrCode=67

    errXMsg "Target File Creation/Update Failed" "FATAL ERROR: Target Files Does NOT Exist!" "File: $targetUserFuncsPathFileName" "Error Code: $funcsErrCode" "Function: configUserFuncs()" "Script File: utilsAppConfig.sh"

    return $funcsErrCode

  fi

  # shellcheck disable=SC1090
  source "$targetUserFuncsPathFileName" || {

    funcsErrCode=$?

    errXMsg "Error returned by 'source' command:" "source $targetUserFuncsPathFileName" "User Functions Configuration FAILED!" "Error Code: $funcsErrCode" "Function: configUserFuncs()" "Script File: utilsAppConfig.sh"

    return $funcsErrCode
  }

  msgNotify "User Functions Script File Successfully Configured and Now Active" "Sourced User Functions Target File:" "$targetUserFuncsPathFileName" "Function: configUserFuncs()" "Script File: utilsAppConfig.sh"

  return 0
}




# Configures the User Path
function configUserPath() {

  local sourceFile="$utilAppCfgSetups"/configDir/shell/path/userPath.sh

  local userPathTargetDir="$HOME/.config/shell/path"

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


  # shellcheck source=MIKE_Setup_Scripts/customAppConfig/configPicom.sh
   source "$scriptFile"
}

function configPLocateTimer() {

declare sourcePlocateTimerFile="$utilAppCfgSetups"/cfgTimers/plocate-updatedb.timer

declare targetPlocateTimerFile="/lib/systemd/system/plocate-updatedb.timer"

declare -i plocateErrCode=0

sudo truncate -s 0 "$targetPlocateTimerFile" || {

  plocateErrCode=$?

  errXMsg="Error truncating 'plocate' timer file!" "Fatal Error! Cannot proceed with 'plocate' configuration!" "Target Plocate Timer File: $targetPlocateTimerFile" "Script File: configurePlocateTimer.sh"

  return $plocateErrCode
}

sudo cat "$sourcePlocateTimerFile" | sudo tee "$targetPlocateTimerFile" > /dev/null || {

  plocateErrCode=$?

  errXMsg="Error copying 'plocate' timer file!" "Fatal Error! Cannot proceed with 'plocate' configuration!" "Source File: $sourcePlocateTimerFile" "Target File: $targetPlocateTimerFile" "Script File: configurePlocateTimer.sh"

  return $plocateErrCode
}

sudo systemctl daemon-reload

sudo systemctl enable /lib/systemd/system/plocate-updatedb.timer

sudo systemctl start /lib/systemd/system/plocate-updatedb.timer

sudo systemctl list-timers --all
}


# Copies starship configuration files to HOME/.config
function configStarship() {

  local sourceConfigDir="$utilAppCfgSetups"/configDir/starship
  
  local targetConfigDir="$HOME"/.config
  
  local targetConfigStarshipDir="$targetConfigDir"/starship

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


  # shellcheck source=MIKE_Setup_Scripts/customAppConfig/configKitty.sh
   source "$scriptFile"
}

function configXorgXintrc() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile=""

    scriptFile="$utilAppCfgSetups"/customAppConfig/configXintrc.sh


   # shellcheck disable=SC1090
   source "$scriptFile"

}


# Configures Yazi function in .bashrc file.
function configFuncsYazi() {

  local sourceTxtFile="$utilAppCfgSetups"/cfgFuncs/installFuncsYazi.txt

  local funcsTargetDir="$HOME"/.config/shell/userFuncs

  local funcsTargetFileName="userFunctions.sh"

  local funcsTargetFile="$funcsTargetDir"/"$funcsTargetFileName"

  local -i THE_ERR_Code=0

  [[ -f $sourceTxtFile ]] || {

    THE_ERR_Code=89

    errXMsg "FATAL ERROR: Yazi Funcs Source File Does NOT Exist!" "Yazi Funcs Source File:" "  $sourceTxtFile" "Error Code: $THE_ERR_Code" "Function: configBashrcYazi()" "Script File: utilsAppConfig.sh"

    return $THE_ERR_Code
  }

  appendTextToFile "$sourceTxtFile" "$funcsTargetDir" "$funcsTargetFileName" "775" "$(whoami)" || {

    THE_ERR_Code=$?

    echo
    echo "Error calling appendTextToFile()"
    echo "Target File: $funcsTargetFile"
    echo "Error Code: $THE_ERR_Code"
    echo "Function: configBashrcYazi()"
    echo "Script File: utilsAppConfig.sh"
    echo

    return $THE_ERR_Code
  }

}
