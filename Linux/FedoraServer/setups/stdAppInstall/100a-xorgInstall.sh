#!/bin/bash
# Install 2-a Xorg Installation
#

source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh
source "$MIKE_Setup_Utilities"/utilsAppConfig.sh

# sudo dnf install awesome kitty krusader
# picom rofi sxhkd dunst libnotify nitrogen
# xrandr
install_x11 &&
installAlsaUtils &&
installSxhkd &&
installDunst &&
installPicom &&
installAwesomeWM &&
installKitty &&
installTmux &&
installKrusader &&
installRofi &&
install_x_Copy &&
installCopyQ &&
installGrubCustomizer &&
installNetworkManager &&
installLLVM &&
installNitrogen &&
configXorgXintrc &&
configPicom &&
configKrusader &&
configAwesome &&
successMsg "All 100a-xorgInstall.sh Applications Installed." || errXMsg "100a-xorgInstall.sh Execution Failed" "Error-Exit!"
