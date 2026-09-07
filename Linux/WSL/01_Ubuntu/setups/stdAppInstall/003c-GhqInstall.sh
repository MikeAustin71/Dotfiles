#!/bin/bash
# Make sure 'Go' is installed.
# Make sure that the Path has been updated
# for 'Go'.
# See ~/.config/shell/path/userPath.sh


declare baseSetups24Dir="$HOME"/bashOps/setups

source "$baseSetups24Dir"/utils/utilsLib.sh
source "$baseSetups24Dir"/utils/utilsAppInstall.sh
source "$baseSetups24Dir"/utils/utilsAppConfig.sh


msgNotify "Installing 'ghq'" &&
installScriptGHQ &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups24Dir/stdAppInstall" &&
successMsg "All Phase-3c Utilities Installed." "003c-GhqInstall.sh" || {
  errXMsg "003c-GhqInstall.sh Execution Failed" "Error-Exit!"
}