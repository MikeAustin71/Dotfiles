

source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh

msgNotify "Installing Pandoc" &&
installPandoc &&
msgNotify "Installing Calculator: Qalculate" &&
installQalculate &&
msgNotify "Installing Calculator: Speedcrunch" &&
installSpeedcrunch &&
msgNotify "Installing Calculator: Genius" &&
installGenius &&
msgNotify "Installing Bless Hex Editor" &&
installBless &&
msgNotify "Installing Samba" &&
installSamba &&
successMsg "All Phase-6 Applications Successfully Installed." "006-appInstall.sh" || errXMsg "006-appInstall.sh Execution Failed" "Error-Exit!"
