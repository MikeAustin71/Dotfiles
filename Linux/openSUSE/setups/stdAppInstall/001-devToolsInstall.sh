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

msgNotify "Installing 'nano'" &&
installNano &&
msgNotify "Installing 'curl'" &&
installCurl &&
msgNotify "Installing 'wget'" &&
installWget &&
msgNotify "Installing C and C++ Tools" &&
installCToolsLibs &&
msgNotify "Installing Dev Tools" &&
installDevTools &&
msgNotify "Installing Python 3" &&
installPython3 &&
msgNotify "Installing Python 3 Libs" &&
installPython3Libs &&
msgNotify "Installing Python 2" &&
installPython2 &&
msgNotify "Installing 'npm'" &&
installNpm &&
msgNotify "Installing NodeJS" &&
installNodeJs &&
msgNotify "Installing Go" &&
installGo &&
successMsg "Phase-1 Development Tools Installed." "001-devToolsInstall.sh"  || errXMsg "001-devToolsInstall.sh Execution Failed" "Error-Exit!"

