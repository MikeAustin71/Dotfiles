#!/bin/bash
# Installs All Development Tools
# Run this as sudo

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

installCToolsLibs() {

  local scriptFile

  scriptFile="$MIKE_Setup_Scripts"/devTools/01-installDevTools.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installDevTools() {

  local scriptFile

  scriptFile="$MIKE_Setup_Scripts"/devTools/02-installDevTools.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installPython3() {

  local scriptFile

  scriptFile="$MIKE_Setup_Scripts"/devTools/03-installPython.sh

  # shellcheck disable=SC1090
  source "$scriptFile"


}

installCToolsLibs &&
installDevTools &&
installPython3 &&
successMsg "All Development Tools Installed."

