#!/bin/bash
# 1. Installs eza, zoxide, bat and starship
#
#

declare baseSetups2bDir="$HOME"/bashOps/setups

source "$baseSetups2bDir"/utils/utilsLib.sh
source "$baseSetups2bDir"/utils/utilsAppConfig.sh
source "$baseSetups2bDir"/utils/utilsAppInstall.sh

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
msgNotify "Installing 'zoxide'" &&
installZoxide &&
msgNotify "Configuring 'zoxide' in .bashrc" &&
configBashrcZoxide &&
msgNotify "Installing Starship" &&
installStarship &&
msgNotify "Copying Starship Config Files" &&
configStarship &&
msgNotify "Configuring 'starship' in .bashrc" &&
configBashrcStarship &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups2bDir/stdAppInstall" &&
successMsg "All Phase-2b Utilities Installed." "REBOOT YOUR COMPUTER!" "Script: 002b-create_base_structure.sh" || {

  errXMsg "002b-create_base_structure.sh Execution Failed" "Error-Exit!"
}