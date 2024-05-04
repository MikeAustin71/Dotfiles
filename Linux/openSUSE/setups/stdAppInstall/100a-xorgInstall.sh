#!/bin/bash
# Install 2-a Xorg Installation
#

source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh
source "$MIKE_Setup_Utilities"/utilsAppConfig.sh

# sudo zypper install awesome kitty krusader
# picom rofi sxhkd dunst libnotify nitrogen
# xrandr
install_x11 &&
install_x_Drivers_ati &&
installMesaVulkanDrivers &&
installAlsaUtils &&
installSxhkd &&
installDunst &&
installPicom &&
installAwesomeWM &&
configAwesome &&
installLua &&
installLuaRocks &&
installAlacritty &&
configAlacritty &&
installKitty &&
configKitty &&
installTmux &&
configTmux &&
installKrusader &&
configKrusader &&
installKdiff3 &&
installRofi &&
installPapirusIconTheme &&
install_x_Copy &&
installCopyQ &&
installGrubCustomizer &&
installNetworkManager &&
installLLVM &&
installNitrogen &&
configXorgXintrc &&
configPicom &&
successMsg "All 100a-xorgInstall.sh Applications Installed." || errXMsg "100a-xorgInstall.sh Execution Failed" "Error-Exit!"
