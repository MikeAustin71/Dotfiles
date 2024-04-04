#!/bin/bash
# Install 1-a application series
#

source "$MIKE_Setup_Utilities"/utilsLib.sh


install_Wayland_egl_Wayland() {

  sudo dnf install egl-wayland -y
}

install_Wayland_hyprcursor() {

  sudo dnf install hyprcursor -y
}

install_Wayland_hyprland() {

  sudo dnf install hyprland -y

}

install_Wayland_hyprlandDevel() {

  sudo dnf install hyprland-devel -y

}

# Install either rofi-wayland
# or wofi
install_Wayland_rofi() {

  sudo dnf install rofi-wayland -y


}

install_Wayland_wlclipboard() {

  sudo dnf install wl-clipboard -y

}

install_Wayland_waybar() {

  sudo dnf install waybar -y

}

install_Wayland_wlroots() {

  sudo dnf install wlroots -y

}

# Install either wofi or
# rofi-wayland
install_Wayland_wofi() {

  sudo dnf install wofi -y

}
