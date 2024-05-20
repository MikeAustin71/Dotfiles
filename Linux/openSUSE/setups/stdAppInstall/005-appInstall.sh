#!/bin/bash
# Install 1-a application series
#

source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh
source "$MIKE_Setup_Utilities"/utilsAppConfig.sh

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
msgNotify "Installing 'kdiff3' Diff Tool" &&
installKdiff3 &&
msgNotify "Installing 'meld' Diff Tool" &&
installMeld &&
msgNotify "Installing Krusader" &&
installKrusader &&
msgNotify "Configuring Krusader" &&
configKrusader &&
msgNotify "Installing podman" &&
installPodman &&
msgNotify "Installing podman Desktop" &&
installPodman &&
msgNotify "Installing podman DistroBox" &&
installDistroBox &&
successMsg "All Phase-5 Applications Installed." "005-appInstall.sh" || errXMsg "005-appInstall.sh Execution Failed" "Error-Exit!"

