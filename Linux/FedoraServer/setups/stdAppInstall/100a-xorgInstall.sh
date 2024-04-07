#!/bin/bash
# Install 2-a Xorg Installation
#

source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh

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
installKrusader &&
installRofi &&
installGrubCustomizer &&
installNetworkManager &&
installNitrogen &&
successMsg "All Phase-2a Applications Installed."
