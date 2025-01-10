declare baseSetups93Dir="$HOME"/bashOps/setups
source "$baseSetups93Dir"/utilsLib.sh
source "$baseSetups93Dir"/utilsAppInstall.sh


msgNotify "Installing Virtualization Tools" &&
installKvmTools &&
msgNotify "Installing Cockpit" &&
installCockpit &&
msgNotify "Installing Cockpit Client" &&
installCockpitClient &&
successMsg "All Phase-7 Virtualization Tools Successfully Installed." "007-virtualizationTools.sh" || {
  errXMsg "007-virtualizationTools.sh Execution Failed" "Error-Exit!"
}