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
msgNotify "Configuring PATH Environment Variable" &&
configUserPath &&
# Configures Aliases and .bashrc
msgNotify "Configuring Aliases" &&
configAliases &&
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
msgNotify "Installing 'trash-cli'" &&
installTrash &&
msgNotify "Configuring 'trash-cli' Aliases" &&
configAliasesTrash &&
msgNotify "Installing 'bat'" &&
installBat &&
msgNotify "Configuring 'bat' Aliases" &&
configAliasesBat &&
msgNotify "Installing 'broot'" &&
installBroot &&
msgNotify "Configuring 'broot' Aliases" &&
configAliasesBroot &&
msgNotify "Configuring 'broot' in .bashrc" &&
configBashrcBroot &&
msgNotify "Installing 'zoxide'" &&
installZoxide &&
msgNotify "Configuring 'zoxide' in .bashrc" &&
configBashrcZoxide &&
msgNotify "Configuring Starship" &&
configStarship &&
successMsg "All Phase-2 Structures Created." "REBOOT YOUR COMPUTER!" "Script: 002-createBaseStructure.sh" || errXMsg "002-createBaseStructure.sh Execution Failed" "Error-Exit!"