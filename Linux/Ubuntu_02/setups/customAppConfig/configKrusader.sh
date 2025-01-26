#!/bin/bash
# This script will initialize and configure
# Krusader file manager in ~/.config/krusader

declare baseSetupsKrDir="$HOME"/bashOps/setups
source "$baseSetupsKrDir"/utils/utilsLib.sh
source "$baseSetupsKrDir"/utils/utilsAppInstall.sh
source "$baseSetupsKrDir"/utils/utilsAppConfig.sh

function setupKrusader() {

  local -i errorCode=0

  sudo cp -r "$baseSetupsKrDir"/configDir/krusader "$XDG_CONFIG_HOME" || {

    errorCode=$?

    errXMsg "'krusader' Directory Copy Failed" "$baseSetupsKrDir/configDir/krusader -> $XDG_CONFIG_HOME" "Script: configKrusader.sh" "Error Code: $errorCode"

  }

  return $errorCode

}

function cfgKrusaderColors() {

  local -i errorCode=0

  # Make color schemes available for import into
  # krusader
  sudo cp "$baseSetupsKrDir"/configDir/krusader/color_schemes/* /usr/share/krusader/ || {

    errorCode=$?

    errXMsg "'krusader' color schemes Copy Failed" "$baseSetupsKrDir/configDir/krusader/color_schemes/* -> usr/share/krusader/" "Script: configKrusader.sh" "Error Code: $errorCode"

    return $errorCode

  }

  return 0
}


msgNotify "Starting 'krusader' Setup" &&
setupKrusader &&
msgNotify "Copying 'krusader' color schemes to Krusader Directory " &&
cfgKrusaderColors &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetupsKrDir/stdAppInstall" &&
successMsg "Krusader Configured." "configKrusader.sh" || {
  errXMsg "configKrusader.sh Execution Failed" "Error-Exit!"

}