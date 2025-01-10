#!/bin/bash
# 1. Creates directory structure
# 2. Creates .bash_profile
#

declare baseSetups2Dir="$HOME"/bashOps/setups

source "$baseSetups2Dir"/utils/utilsLib.sh
source "$baseSetups2Dir"/utils/utilsAppConfig.sh
source "$baseSetups2Dir"/utils/utilsAppInstall.sh

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
msgNotify "Configuring 'broot' in .bash_profile" &&
configBashProfileBroot &&
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
successMsg "All Phase-2e Base-2 Structures Created." "REBOOT YOUR COMPUTER!" "Script: 002e_create_base_2_structures.sh" || {

  errXMsg "002e_create_base_2_structures.sh Execution Failed" "Error-Exit!"
}