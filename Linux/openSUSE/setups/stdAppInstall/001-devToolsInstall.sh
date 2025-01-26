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

installDevTools() {

  local scriptFile

  scriptFile="$baseSetups01Dir"/devTools/02-installDevTools.sh

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

installRustup() {

  local -i theErrCode=0

  sudo zypper addrepo https://download.opensuse.org/repositories/openSUSE:Factory/standard/openSUSE:Factory.repo || {

    theErrCode=$?

    echo "Error: Add Factory.repo FAILED"
    echo "Command: sudo zypper addrepo https://download.opensuse.org/repositories/openSUSE:Factory/standard/openSUSE:Factory.repo"
    echo "Function: installRustup()"
    echo "Script: 001-devToolsInstall.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
  }


  sudo zypper refresh || {

    theErrCode=$?

    echo "Error: 'refresh' FAILED"
    echo "Command: sudo zypper refresh"
    echo "Function: installRustup()"
    echo "Script: 001-devToolsInstall.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
  }


  zypper install rustup || {

    theErrCode=$?

    echo "Error: 'rustup' installation FAILED"
    echo "Command: zypper install rustup"
    echo "Function: installRustup()"
    echo "Script: 001-devToolsInstall.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
  }


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
msgNotify "Installing 'rust'" &&
installRustup &&
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