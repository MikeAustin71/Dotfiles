#!/bin/bash
# 1. Creates directory structure
# 2. Creates .bash_profile
#
###################################################################
#                     IMPORTANT
#
#  User Path is configured in 001-devToolsInstall.sh
###################################################################

declare baseSetups2Dir="$HOME"/bashOps/setups

source "$baseSetups2Dir"/utils/utilsLib.sh
source "$baseSetups2Dir"/utils/utilsAppConfig.sh
source "$baseSetups2Dir"/utils/utilsAppInstall.sh

msgNotify "Configuring Environment Variables in .bashrc" &&
configBashrcEnvars &&
msgNotify "Configuring User Path in .bashrc" &&
configBashrcUserPath &&
msgNotify "Configuring User Functions in .bashrc" &&
configBashrcFuncs &&
msgNotify "Configuring Aliases in .bashrc" &&
configBashrcAliases &&
msgNotify "Installing 'bash-completion'" &&
installBashCompletion &&
msgNotify "Configuring 'bash-completion' in .bashrc" &&
configBashrcBashCompletion &&
msgNotify "Installing 'eza'" &&
installEza &&
msgNotify "Configuring 'eza' Aliases" &&
configAliasesEza &&
msgNotify "Installing 'bat'" &&
installBat &&
msgNotify "Configuring 'bat' Aliases" &&
configAliasesBat &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups2Dir/stdAppInstall" &&
successMsg "All Phase-2b Structures Created." "REBOOT YOUR COMPUTER!" "Script: 002b-create_base_structure.sh" || {

  errXMsg "002b-create_base_structure.sh Execution Failed" "Error-Exit!"
}