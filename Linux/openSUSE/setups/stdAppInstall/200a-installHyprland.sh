#!/bin/bash
# Installs Wayland
# Run this as sudo

declare baseSetups97Dir="$HOME"/bashOps/setups
source "$baseSetups97Dir"/utils/utilsLib.sh
source "$baseSetups97Dir"/utils/utilsAppInstall.sh
source "$baseSetups97Dir"/utils/utilsWaylandInstalls.sh


installLibdrm &&
installImageMagick &&
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
installDolfin &&
installCopyQ &&
successMsg "All Hyprland Components Installed."

