#!/bin/bash
# Installs All Development Tools
# Run this as sudo

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh

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

installPython3Libs() {

  local scriptFile

  scriptFile="$MIKE_Setup_Scripts"/devTools/03b-installPythonLibs.sh

  # shellcheck disable=SC1090
  source "$scriptFile"


}

installPython2() {

  local scriptFile

  scriptFile="$MIKE_Setup_Scripts"/devTools/04-installPython2.sh

  # shellcheck disable=SC1090
  source "$scriptFile"


}

installGo() {

  local scriptFile

  scriptFile="$MIKE_Setup_Scripts"/customAppInstalls/installGo.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installNano &&
installCurl &&
installWget &&
installCToolsLibs &&
installDevTools &&
installPython3 &&
installPython3Libs &&
installPython2 &&
installNpm &&
installNodeJs &&
installGo &&
successMsg "All Development Tools Installed."

