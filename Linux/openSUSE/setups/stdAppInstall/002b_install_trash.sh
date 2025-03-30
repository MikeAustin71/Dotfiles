#!/bin/bash
# Installs Trash ('trash-cli')


declare baseSetups2bDir="$HOME"/bashOps/setups

source "$baseSetups2bDir"/utils/utilsLib.sh
source "$baseSetups2bDir"/utils/utilsAppConfig.sh
source "$baseSetups2bDir"/utils/utilsAppInstall.sh


msgNotify "Installing 'trash-cli" &&
installTrashCli &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups2bDir/stdAppInstall" &&
successMsg "'trash-cli' Installed." "002b_install_trash.sh" "Reboot This PC!!!" || {

  errXMsg "002b_install_trash.sh Execution Failed" "'trash-cli' Installation Error" "Error-Exit!"

}