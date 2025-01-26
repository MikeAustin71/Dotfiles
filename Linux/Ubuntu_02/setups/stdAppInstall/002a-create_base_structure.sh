#!/bin/bash
# 1. Installs eza, zoxide, bat and starship
#
#

declare baseSetups2aDir="$HOME"/bashOps/setups

source "$baseSetups2aDir"/utils/utilsLib.sh
source "$baseSetups2aDir"/utils/utilsAppConfig.sh
source "$baseSetups2aDir"/utils/utilsAppInstall.sh

msgNotify "Configuring User Environment Variables in .bash_profile/.bashrc" &&
configBashProfileEnvars &&
msgNotify "Configuring .bashrc userPath" &&
configBashrcUserPath &&
msgNotify "Configuring .bashrc aliases" &&
configBashrcAliases &&
msgNotify "Configuring .bashrc User Functions" &&
configBashrcFuncs &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups2aDir/stdAppInstall" &&
successMsg "Phase-2a Auxilary Variables Installed." "002a-create_base_structure.sh" "Reboot This PC!!!" || {

  errXMsg "002a-create_base_structure.sh Execution Failed" "Error-Exit!"

}