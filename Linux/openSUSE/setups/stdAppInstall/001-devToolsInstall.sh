#!/bin/bash
# Installs All Development Tools
# Run this as sudo

declare baseSetups01Dir="$HOME"/bashOps/setups

source "$baseSetups01Dir"/utils/utilsLib.sh
source "$baseSetups01Dir"/utils/utilsAppConfig.sh
source "$baseSetups01Dir"/utils/utilsAppInstall.sh

installBaseDevTools() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/00-installBaseDevTools.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installCToolsLibs() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/01-installDevTools.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installDevTools() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/02-installDevTools.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installJavaTools() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/05-installJava.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installLuaTools() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/07-installLua.sh

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

installGo() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/customAppInstalls/installGo.sh

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installQT6Libs() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/06-installQT6TechLib.sh

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
msgNotify "Installing 'git'" &&
installGit
msgNotify "Installing 'nano'" &&
installNano &&
msgNotify "Installing 'curl'" &&
installCurl &&
msgNotify "Installing 'wget'" &&
installWget &&
msgNotify "Installing 'micro'" &&
installMicro &&
msgNotify "Installing Base Development Tools" &&
installBaseDevTools &&
msgNotify "Installing C and C++ Tools" &&
installCToolsLibs &&
msgNotify "Installing Java Tools" &&
installJavaTools &&
msgNotify "Installing Lua language and Tools" &&
installLuaTools &&
msgNotify "Installing 02 Dev Tools" &&
installDevTools &&
msgNotify "Installing QT6 Tech Libraries" &&
installQT6Libs &&
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
msgNotify "Installing 'rust' tools" &&
installRust &&
msgNotify "Installing 'flatseal'" &&
installFlatSeal &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups01Dir/stdAppInstall" &&
successMsg "Phase-1 Development Tools Installed." "001-devToolsInstall.sh" "Reboot This PC!!!" || {

  errXMsg "001-devToolsInstall.sh Execution Failed" "Error-Exit!"

}