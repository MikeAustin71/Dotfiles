#!/bin/bash
# 1. Creates directory structure
# 2. Creates .bash_profile
#

declare baseSetups2Dir="$HOME"/bashOps/setups

source "$baseSetups2Dir"/utils/utilsLib.sh
source "$baseSetups2Dir"/utils/utilsAppConfig.sh
source "$baseSetups2Dir"/utils/utilsAppInstall.sh

msgNotify "Configuring 'broot' Aliases" &&
configAliasesBroot &&
msgNotify "Configuring 'broot' in .bashrc" &&
configBashrcBroot &&
msgNotify "Configuring 'broot' in .bash_profile" &&
configBashProfileBroot &&
successMsg "All Phase-2e Base-2 Structures Created." "REBOOT YOUR COMPUTER!" "Script: 002e_config_broot.sh" || {

  errXMsg "002e_config_broot.sh Execution Failed" "Error-Exit!"
}