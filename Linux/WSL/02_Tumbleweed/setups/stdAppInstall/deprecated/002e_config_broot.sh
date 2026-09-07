#!/bin/bash
# 1. Creates directory structure
# 2. Creates .bash_profile
#

declare baseSetups62Dir="$HOME"/bashOps/setups

source "$baseSetups62Dir"/utils/utilsLib.sh
source "$baseSetups62Dir"/utils/utilsAppConfig.sh
source "$baseSetups62Dir"/utils/utilsAppInstall.sh

msgNotify "Configuring 'broot' Aliases" &&
configAliasesBroot &&
msgNotify "Configuring 'broot' in .bashrc" &&
configBashrcBroot &&
msgNotify "Configuring 'broot' in .bash_profile" &&
configBashProfileBroot &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups62Dir/stdAppInstall" &&
successMsg "All Phase-2e Base-2 Structures Created." "REBOOT YOUR COMPUTER!" "Script: 002e_config_broot.sh" || {

  errXMsg "002e_config_broot.sh Execution Failed" "Error-Exit!"
}