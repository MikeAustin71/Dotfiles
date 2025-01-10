#!/bin/bash
# Install Phase-5 application series
#

declare baseSetups92Dir="$HOME"/bashOps/setups
source "$baseSetups92Dir"/utilsLib.sh
source "$baseSetups92Dir"/utilsAppInstall.sh
source "$baseSetups92Dir"/utilsAppConfig.sh

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
installPodmanDesktop &&
msgNotify "Installing podman DistroBox" &&
installDistroBox &&
msgNotify "Installing Kubernetes Tools" &&
installKubernetes &&
successMsg "All Phase-5 Applications Installed." "005-appInstall.sh" || errXMsg "005-appInstall.sh Execution Failed" "Error-Exit!"

