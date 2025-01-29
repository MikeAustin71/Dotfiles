#!/bin/bash
# 1. Creates directory structure
# 2. Creates .bash_profile
#

declare baseSetups30Dir="$HOME"/bashOps/setups

source "$baseSetups30Dir"/utils/utilsLib.sh
source "$baseSetups30Dir"/utils/utilsAppConfig.sh
source "$baseSetups30Dir"/utils/utilsAppInstall.sh

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
changeToDir "$baseSetups30Dir/stdAppInstall" &&
successMsg "All Phase-2f Installations completed." "REBOOT YOUR COMPUTER!" "Script: 002f_install_trailer.sh" || {

  errXMsg "002f_install_trailer.sh Execution Failed" "Error-Exit!"
}
