#!/bin/bash
# Installs All Development Tools
# Run this as sudo

declare baseSetups01Dir="$HOME"/bashOps/setups

source "$baseSetups01Dir"/utils/utilsLib.sh
source "$baseSetups01Dir"/utils/utilsAppConfig.sh
source "$baseSetups01Dir"/utils/utilsAppInstall.sh

installCToolsLibs() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/01-installDevTools.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installBtrfsTools() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/06-installBTRFS.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installDevTools() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/02-installDevTools.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installGo() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/customAppInstalls/installGo.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installJava() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/05-installJava.sh

  # shellcheck disable=SC1090
  source "$scriptFile"
}

installPython3() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/03-installPython.sh

  # shellcheck disable=SC1090
  source "$scriptFile"


}

installPython3Libs() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/03b-installPythonLibs.sh

  # shellcheck disable=SC1090
  source "$scriptFile"


}

installPython2() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/04-installPython2.sh

  # shellcheck disable=SC1090
  source "$scriptFile"


}

configUserPath() {
    local scriptFile

    scriptFile="$baseSetups01Dir"/cfgPath/cfgUserPath.sh

     # shellcheck disable=SC1090
      source "$scriptFile"
}


msgNotify "Installing VmWare Tools" &&
installVmwareTools &&
msgNotify "Installing 'nano'" &&
installNano &&
msgNotify "Installing 'curl'" &&
installCurl &&
msgNotify "Installing 'wget'" &&
installWget &&
msgNotify "Installing 'micro'" &&
installMicro &&
msgNotify "Installing C and C++ Tools" &&
installCToolsLibs &&
msgNotify "Installing 02 Dev Tools" &&
installDevTools &&
msgNotify "Installing Python 3" &&
installPython3 &&
msgNotify "Installing Python 3 Libs" &&
installPython3Libs &&
msgNotify "Installing NodeJS" &&
installNodeJs &&
msgNotify "Installing 'npm'" &&
installNpm &&
msgNotify "Installing Java" &&
installJava &&
msgNotify "Installing Btrfs File System Tools" &&
installBtrfsTools &&
msgNotify "Installing Go" &&
installGo &&
msgNotify "Installing 'rust' tools" &&
installRust &&
msgNotify "Installing 'Flatpak' tools" &&
installFlatPak &&
msgNotify "Installing 'flatseal'" &&
installFlatSeal &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups01Dir/stdAppInstall" &&
successMsg "Phase-1 Development Tools Installed." "001-devToolsInstall.sh"  || {

  errXMsg "001-devToolsInstall.sh Execution Failed" "Error-Exit!"

}