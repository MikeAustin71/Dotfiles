#!/bin/bash
# 1. Creates directory structure
# 2. Creates .bash_profile
#

declare baseSetups2Dir="$HOME"/bashOps/setups

source "$baseSetups2Dir"/utils/utilsLib.sh
source "$baseSetups2Dir"/utils/utilsAppConfig.sh
source "$baseSetups2Dir"/utils/utilsAppInstall.sh

msgNotify "Configuring 'HOME' Directory Structure" &&
configDirStructure &&
msgNotify "Configuring Environment Variables" &&
configEnvars &&
msgNotify "Configuring Environment Variables in .bash_profile" &&
configBashProfileEnvars &&
msgNotify "Configuring PATH Environment Variable" &&
configUserPath &&
msgNotify "Configuring User Path in .bashrc" &&
configBashrcUserPath &&
msgNotify "Configuring Aliases" &&
configAliases &&
msgNotify "Configuring Aliases in .bashrc" &&
configBashrcAliases &&
msgNotify "Configuring Custom Functions in .bashrc" &&
configBashrcFuncs &&
msgNotify "Installing 'bash-completion'" &&
installBashCompletion &&
msgNotify "Configuring 'bash-completion' in .bashrc" &&
configBashrcBashCompletion &&
msgNotify "Installing 'eza'" &&
installEza &&
msgNotify "Configuring 'eza' Aliases" &&
configAliasesEza &&
successMsg "All Phase-2a Structures Created." "REBOOT YOUR COMPUTER!" "Script: 002a-create_base_structure.sh" || {

  errXMsg "002a-create_base_structure.sh Execution Failed" "Error-Exit!"
}