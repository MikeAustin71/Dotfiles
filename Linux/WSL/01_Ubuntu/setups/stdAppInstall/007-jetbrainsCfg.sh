#!/bin/bash
# Install JetBrains Config Requirements
#
declare baseSetups7Dir="$HOME"/bashOps/setups
source "$baseSetups7Dir"/utils/utilsLib.sh
source "$baseSetups7Dir"/utils/utilsAppInstall.sh
source "$baseSetups7Dir"/utils/utilsAppConfig.sh


msgNotify "Installing libglib-2_0-0" &&
installLibGlib &&
msgNotify "Installing libfuse2" &&
installLibFuse2 &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups7Dir/stdAppInstall" &&
successMsg "JebBrains configuration completed" "007-jetbrainsCfg.sh" || {
  errXMsg "007-jetbrainsCfg.sh Execution Failed" "Error-Exit!"

}
