#!/bin/bash
# Installs All Development Tools
# Run this as sudo

declare baseSetupsDir="$HOME"/bashOps/setups

source "$baseSetupsDir"/utils/utilsLib.sh
source "$baseSetupsDir"/utils/utilsAppInstall.sh

installCToolsLibs() {

  local scriptFile

  scriptFile="$baseSetupsDir"/devTools/01-installDevTools.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installDevTools() {

  local scriptFile

  scriptFile="$baseSetupsDir"/devTools/02-installDevTools.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installPython3() {

  local scriptFile

  scriptFile="$baseSetupsDir"/devTools/03-installPython.sh

  # shellcheck disable=SC1090
  source "$scriptFile"


}

installPython3Libs() {

  local scriptFile

  scriptFile="$baseSetupsDir"/devTools/03b-installPythonLibs.sh

  # shellcheck disable=SC1090
  source "$scriptFile"


}

installPython2() {

  local scriptFile

  scriptFile="$baseSetupsDir"/devTools/04-installPython2.sh

  # shellcheck disable=SC1090
  source "$scriptFile"


}

installGo() {

  local scriptFile

  scriptFile="$baseSetupsDir"/customAppInstalls/installGo.sh

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

