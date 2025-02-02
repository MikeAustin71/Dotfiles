#!/bin/bash
# Install Phase-5 application series
#

declare baseSetups92Dir="$HOME"/bashOps/setups
source "$baseSetups92Dir"/utils/utilsLib.sh
source "$baseSetups92Dir"/utils/utilsAppInstall.sh
source "$baseSetups92Dir"/utils/utilsAppConfig.sh

msgNotify "Installing Terminus Bit Map Fonts" &&
installTerminusBitMapFonts &&
msgNotify "Installing Terminus Consoleet Fonts" &&
installTerminusConsoleetFonts &&
msgNotify "Installing Font Awesome" &&
installFontAwesome &&
msgNotify "Installing Duf" &&
installDuf &&
msgNotify "Installing ncdu (Disk Usage)" &&
installNcdu &&
msgNotify "Installing Udiskie" &&
installUdiskie &&
msgNotify "Installing Kitty" &&
installKitty &&
msgNotify "Configuring Kitty" &&
configKitty &&
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
installPodmanDesktop &&
msgNotify "Installing podman DistroBox" &&
installDistroBox &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups92Dir/stdAppInstall" &&
successMsg "All Phase-5 Utilties Installed." "005-UtilitiesInstall.sh" || {
  errXMsg "005-UtilitiesInstall.sh Execution Failed" "Error-Exit!"

}