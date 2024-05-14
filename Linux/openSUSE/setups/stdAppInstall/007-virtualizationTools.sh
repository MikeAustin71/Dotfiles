
source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh


msgNotify "Installing Virtualization Tools" &&
installKvmTools &&
msgNotify "Installing Cockpit" &&
installCockpit &&
successMsg "All Phase-7 Virtualization Tools Successfully Installed." "007-virtualizationTools.sh" || errXMsg "007-virtualizationTools.sh Execution Failed" "Error-Exit!"