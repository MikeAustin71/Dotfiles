#!/bin/bash
# 1. Installs eza, zoxide, bat and starship
#
#

declare baseSetups2Dir="$HOME"/bashOps/setups

source "$baseSetups2Dir"/utils/utilsLib.sh
source "$baseSetups2Dir"/utils/utilsAppConfig.sh
source "$baseSetups2Dir"/utils/utilsAppInstall.sh

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
changeToDir "$baseSetups2Dir/stdAppInstall" &&
successMsg "All Phase-2a Structures Created." "REBOOT YOUR COMPUTER!" "Script: 002a-create_base_structure.sh" || {

  errXMsg "002a-create_base_structure.sh Execution Failed" "Error-Exit!"
}