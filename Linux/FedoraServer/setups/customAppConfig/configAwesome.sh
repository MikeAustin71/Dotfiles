#!/bin/bash
# This script will initialize and configure
# Awesome window manager in ~/.config/awesome

source "$MIKE_Setup_Utilities"/utilsLib.sh

declare -i errorCode=0

  cp -r "$MIKE_Setup_Scripts"/configDir/awesome "$XDG_CONFIG_HOME" || {

    errorCode=$?

    errXMsg "'awesome' Directory Copy Failed" "$MIKE_Setup_Scripts/configDir/awesome -> $XDG_CONFIG_HOME" "Script: configAwesome.sh" "Error Code: $errorCode"

    exit $errorCode

  }

exit 0