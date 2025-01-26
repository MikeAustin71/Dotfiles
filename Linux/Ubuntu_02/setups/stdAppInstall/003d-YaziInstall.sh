#!/bin/bash
# Make sure 'Go' is installed.
# Make sure that the Path has been updated
# for 'Go'.
# See ~/.config/shell/path/userPath.sh


declare baseSetups3dDir="$HOME"/bashOps/setups

source "$baseSetups3dDir"/utils/utilsLib.sh
source "$baseSetups3dDir"/utils/utilsAppInstall.sh
source "$baseSetups3dDir"/utils/utilsAppConfig.sh

msgNotify "Installing 'Yazi' File Manager" &&
installYazi &&
msgNotify "Configuring User Functions for 'Yazi' File Manager" &&
configFuncsYazi
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups3dDir/stdAppInstall" &&
successMsg "All Phase-3d Yazi File Manager Installed." "Script: 003d-YaziInstall.sh" || {
  errXMsg "003d-YaziInstall.sh Script Execution Failed" "Error-Exit!"
}