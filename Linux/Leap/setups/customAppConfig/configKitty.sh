#!/bin/bash
# This script will initialize and configure
# Kitty Terminal Emulator in ~/.config/kitty

source "$MIKE_Setup_Utilities"/utilsLib.sh

declare -i errorCode=0

  cp -r "$MIKE_Setup_Scripts"/configDir/kitty "$XDG_CONFIG_HOME" || {

    errorCode=$?

    errXMsg "'kitty' Directory Copy Failed" "$MIKE_Setup_Scripts/configDir/kitty -> $XDG_CONFIG_HOME" "Script: configKitty.sh" "Error Code: $errorCode"

    return $errorCode

  }

return 0