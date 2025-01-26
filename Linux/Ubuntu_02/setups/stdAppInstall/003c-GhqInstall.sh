#!/bin/bash
# Make sure 'Go' is installed.
# Make sure that the Path has been updated
# for 'Go'.
# See ~/.config/shell/path/userPath.sh


declare baseSetups3cDir="$HOME"/bashOps/setups

source "$baseSetups3cDir"/utils/utilsLib.sh
source "$baseSetups3cDir"/utils/utilsAppInstall.sh
source "$baseSetups3cDir"/utils/utilsAppConfig.sh


msgNotify "Installing 'ghq'" &&
installScriptGHQ &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups3cDir/stdAppInstall" &&
successMsg "GHQ Utilities Installed." "003c-GhqInstall.sh" || {
  errXMsg "003c-GhqInstall.sh Execution Failed" "Error-Exit!"
}