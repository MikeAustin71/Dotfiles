#!/bin/bash
# Installs Wayland
# Run this as sudo

declare baseSetups97Dir="$HOME"/bashOps/setups
source "$baseSetups97Dir"/utils/utilsLib.sh
source "$baseSetups97Dir"/utils/utilsAppInstall.sh
source "$baseSetups97Dir"/utils/utilsWaylandInstalls.sh


msgNotify "Installing Libdrm" &&
installLibdrm &&
msgNotify "Installing Wayland_wlclipboard" &&
install_Wayland_wlclipboard &&
msgNotify "Installing Wayland_waybar" &&
install_Wayland_waybar &&
# Consider using rofi-wayland
msgNotify "Installing Wayland_wofi" &&
install_Wayland_wofi &&
msgNotify "Installing Wayland_wlroots" &&
install_Wayland_wlroots &&
msgNotify "Installing Wayland_hyprland" &&
install_Wayland_hyprland &&
msgNotify "Installing Wayland_hyprlandDevel" &&
install_Wayland_hyprlandDevel &&
msgNotify "Installing Wayland_hyprcursor" &&
install_Wayland_hyprcursor &&
msgNotify "Installing installGrubCustomizer" &&
installGrubCustomizer &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups97Dir/stdAppInstall" &&
successMsg "All Hyprland Components Installed."

