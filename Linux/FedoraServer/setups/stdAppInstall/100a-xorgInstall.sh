#!/bin/bash
# Install 2-a Xorg Installation
#

source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh

function installXintrc() {

  local -i errorCode=0

  cp "$MIKE_Setup_Scripts"/homeDir/.xinitrc "$HOME" ||
  {

    errorCode=$?

    errXMsg "'.xinitrc' File Copy Failed" "$MIKE_Setup_Scripts/homeDir/.xinitrc -> $HOME" "Function: installXintrc()" "Error Code: $errorCode"

    return $errorCode
  }

  return 0
}

function installPicomCfg() {

  local -i errorCode=0

  cp "$MIKE_Setup_Scripts"/configDir/picom "$XDG_CONFIG_HOME" || {

    errorCode=$?

    errXMsg "'picom' Directory Copy Failed" "$MIKE_Setup_Scripts/configDir/picom -> $XDG_CONFIG_HOME" "Function: installPicomCfg()" "Error Code: $errorCode"

    return $errorCode

  }

  return 0
}

function installKrusaderCfg() {

  local -i errorCode=0

  cp "$MIKE_Setup_Scripts"/configDir/krusader "$XDG_CONFIG_HOME" || {

    errorCode=$?

    errXMsg "'krusader' Directory Copy Failed" "$MIKE_Setup_Scripts/configDir/krusader -> $XDG_CONFIG_HOME" "Function: installKrusaderCfg()" "Error Code: $errorCode"

    return $errorCode

  }

  return 0
}

function installAwesomeCfg() {

  local -i errorCode=0

  cp "$MIKE_Setup_Scripts"/configDir/awesome "$XDG_CONFIG_HOME" || {

    errorCode=$?

    errXMsg "'awesome' Directory Copy Failed" "$MIKE_Setup_Scripts/configDir/awesome -> $XDG_CONFIG_HOME" "Function: installAwesomeCfg()" "Error Code: $errorCode"

    return $errorCode

  }

  return 0
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
install_x_Copy &&
installCopyQ &&
installGrubCustomizer &&
installNetworkManager &&
installNitrogen &&
installXintrc &&
installPicomCfg &&
installKrusaderCfg &&
successMsg "All 100a-xorgInstall.sh Applications Installed." || errXMsg "100a-xorgInstall.sh Execution Failed" "Error-Exit!"
