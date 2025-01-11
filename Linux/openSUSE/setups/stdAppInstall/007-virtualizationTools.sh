#!/bin/bash
# Install Phase-5 application series
#
declare baseSetups93Dir="$HOME"/bashOps/setups
source "$baseSetups93Dir"/utils/utilsLib.sh
source "$baseSetups93Dir"/utils/utilsAppInstall.sh


msgNotify "Installing Virtualization Tools" &&
installKvmTools &&
msgNotify "Installing Cockpit" &&
installCockpit &&
msgNotify "Installing Cockpit Client" &&
installCockpitClient &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups93Dir/stdAppInstall" &&
successMsg "All Phase-7 Virtualization Tools Successfully Installed." "007-virtualizationTools.sh" || {
  errXMsg "007-virtualizationTools.sh Execution Failed" "Error-Exit!"
}