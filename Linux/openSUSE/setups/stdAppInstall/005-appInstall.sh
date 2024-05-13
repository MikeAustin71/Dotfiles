#!/bin/bash
# Install 1-a application series
#

source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh

msgNotify "Installing Terminus Fonts" &&
installTerminusFonts &&
msgNotify "Installing Font Awesome" &&
installFontAwesome &&
msgNotify "Installing Duf" &&
installDuf &&
msgNotify "Installing ncdu (Disk Usage)" &&
installNcdu &&
msgNotify "Installing Udiskie" &&
installUdiskie &&
msgNotify "Installing Alacritty" &&
installAlacritty &&
msgNotify "Configuring Alacritty" &&
configAlacritty &&
msgNotify "Installing Kitty" &&
installKitty &&
msgNotify "Configuring Kitty" &&
configKitty &&
msgNotify "Installing tmux" &&
installTmux &&
msgNotify "Configuring tmux" &&
configTmux &&
msgNotify "Installing Krusader" &&
installKrusader &&
msgNotify "Configuring Krusader" &&
configKrusader &&
msgNotify "Installing kdiff3" &&
installKdiff3 &&
successMsg "All Phase-5 Applications Installed." "005-appInstall.sh" || errXMsg "005-appInstall.sh Execution Failed" "Error-Exit!"

