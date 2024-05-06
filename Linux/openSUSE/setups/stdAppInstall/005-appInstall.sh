

source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh

msgNotify "Installing Pandoc" &&
installPandoc &&
msgNotify "Installing Calculators" &&
installCalculators &&
msgNotify "Installing Bless Hex Editor" &&
installBless &&
msgNotify "Installing Samba" &&
installSamba &&

successMsg "All Phase-5 Applications Successfully Installed." "500a-appInstall.sh" || errXMsg "005-appInstall.sh Execution Failed" "Error-Exit!"
