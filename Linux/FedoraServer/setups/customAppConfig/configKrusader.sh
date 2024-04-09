#!/bin/bash
# This script will initialize and configure
# Krusader file manager in ~/.config/krusader

source "$MIKE_Setup_Utilities"/utilsLib.sh

declare -i errorCode=0

  cp -r "$MIKE_Setup_Scripts"/configDir/krusader "$XDG_CONFIG_HOME" || {

    errorCode=$?

    errXMsg "'krusader' Directory Copy Failed" "$MIKE_Setup_Scripts/configDir/krusader -> $XDG_CONFIG_HOME" "Script: configKrusader.sh" "Error Code: $errorCode"

    exit $errorCode

  }

exit 0