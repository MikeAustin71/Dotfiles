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
successMsg "GHQ Utilities Installed." "003d-GhqInstall.sh" || {
  errXMsg "003d-GhqInstall.sh Execution Failed" "Error-Exit!"
}