#!/bin/bash
# Install 2-a Xorg Installation
#

source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh

function installXintrc() {

  local -i errorCode=0

  cp "$MIKE_Setup_Scripts"/homeDir/.xinitrc "$HOME" ||

    errorCode=$?

    errXMsg ".xinitrc File Copy Failed" "cp $MIKE_Setup_Scripts/homeDir/.xinitrc $HOME" "Function: installXintrc()" "Error Code: $errorCode"

    return $errorCode
}

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
installCopyQ &&
installGrubCustomizer &&
installNetworkManager &&
installNitrogen &&
installXintrc &&
successMsg "All Phase-2a Applications Installed."
