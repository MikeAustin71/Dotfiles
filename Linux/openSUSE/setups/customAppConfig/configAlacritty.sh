#!/bin/bash
# This script will initialize and configure
# Alacritty Terminal Emulator in ~/.config/alacritty

source "$MIKE_Setup_Utilities"/utilsLib.sh

declare -i errorCode=0

  cp -r "$MIKE_Setup_Scripts"/configDir/alacritty "$XDG_CONFIG_HOME" || {

    errorCode=$?

    errXMsg "'alacritty' Directory Copy Failed" "$MIKE_Setup_Scripts/configDir/alacritty -> $XDG_CONFIG_HOME" "Script: configAlacritty.sh" "Error Code: $errorCode"

    return $errorCode

  }

return 0