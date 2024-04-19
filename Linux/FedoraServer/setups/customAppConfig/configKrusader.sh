#!/bin/bash
# This script will initialize and configure
# Krusader file manager in ~/.config/krusader

source "$MIKE_Setup_Utilities"/utilsLib.sh

declare -i errorCode=0

  cp -r "$MIKE_Setup_Scripts"/configDir/krusader "$XDG_CONFIG_HOME" || {

    errorCode=$?

    errXMsg "'krusader' Directory Copy Failed" "$MIKE_Setup_Scripts/configDir/krusader -> $XDG_CONFIG_HOME" "Script: configKrusader.sh" "Error Code: $errorCode"

    return $errorCode

  }

  # Make color schemes available for import into
  # krusader
  sudo cp "$MIKE_Setup_Scripts"/configDir/krusader/color_schemes/* /usr/share/krusader/ || {

    errorCode=$?

    errXMsg "'krusader' color schemes Copy Failed" "$MIKE_Setup_Scripts/configDir/krusader/color_schemes/* -> usr/share/krusader/" "Script: configKrusader.sh" "Error Code: $errorCode"

    return $errorCode

  }

return 0