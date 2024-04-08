

source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh

installPandoc &&
installFirefox &&
installCalculators &&
installBless &&
installFirefox &&
installSamba &&
installFirefox &&
successMsg "All Phase-500a Applications Installed." "500a-appInstall.sh" || errXMsg "500a-appInstall.sh Execution Failed" "Error-Exit!"
