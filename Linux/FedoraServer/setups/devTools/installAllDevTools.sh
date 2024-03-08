#!/bin/bash
# Installs All Development Tools
# Run this as sudo

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

installCToolsLibs() {

  local scriptFile

  scriptFile="$MIKE_Setup_Scripts"/devTools/01-installDevTools.sh

  source "$scriptFile"

}

installDevTools() {

  local scriptFile

  scriptFile="$MIKE_Setup_Scripts"/devTools/02-installDevTools.sh

  source "$scriptFile"

}

installCToolsLibs &&
installDevTools &&
successMsg "All Development Tools Installed."

