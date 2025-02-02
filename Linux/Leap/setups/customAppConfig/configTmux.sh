#!/bin/bash
# This script will initialize and configure
# Alacritty Terminal Emulator in ~/.config/alacritty

source "$MIKE_Setup_Utilities"/utilsLib.sh

declare -i errorCode=0

  cp -r "$MIKE_Setup_Scripts"/configDir/tmux "$XDG_CONFIG_HOME" || {

    errorCode=$?

    errXMsg "'tmux' Directory Copy Failed" "$MIKE_Setup_Scripts/configDir/tmux -> $XDG_CONFIG_HOME" "Script: configTmux.sh" "Error Code: $errorCode"

    return $errorCode

  }

return 0