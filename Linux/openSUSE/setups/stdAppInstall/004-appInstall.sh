#!/bin/bash
# Install 1-a application series
#

source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh

installTerminusFonts &&
installFontAwesome &&
installDuf &&
installNcdu &&
installRipGrep &&
installScriptPeco &&
installUdiskie &&
installAlacritty &&
configAlacritty &&
installKitty &&
configKitty &&
installTmux &&
configTmux &&
installKrusader &&
configKrusader &&
installKdiff3 &&
successMsg "All Phase-1a Applications Installed." "01a-appInstall.sh" || errXMsg "01a-appInstall.sh Execution Failed" "Error-Exit!"

