#!/bin/bash
# Installs Wayland
# Run this as sudo


source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh
source "$MIKE_Setup_Utilities"/utilsWaylandInstalls.sh



install_Wayland_wlclipboard &&
install_Wayland_waybar &&
# Consider using rofi-wayland
install_Wayland_wofi &&
install_Wayland_wlroots &&
install_Wayland_hyprland &&
install_Wayland_hyprlandDevel &&
install_Wayland_hyprcursor &&
installGrubCustomizer &&
installKitty &&
installKrusader &&
installCopyQ &&
successMsg "All Hyprland Components Installed."

