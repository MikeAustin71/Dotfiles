#!/bin/bash
# This script will initialize and configure
# Picom in ~/.config/picom

source "$MIKE_Setup_Utilities"/utilsLib.sh

declare -i errorCode=0

cp -r "$MIKE_Setup_Scripts"/configDir/picom "$XDG_CONFIG_HOME" || {

  errorCode=$?

  errXMsg "'picom' Directory Copy Failed" "$MIKE_Setup_Scripts/configDir/picom -> $XDG_CONFIG_HOME" "Script: configPicom.sh" "Error Code: $errorCode"

  return $errorCode

 }

return 0