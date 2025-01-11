#!/bin/bash
# Used to pull down latest version of dotfiles and
# configure  ~/bashOps/setups

declare baseSetups40Dir="$HOME"/bashOps/setups
source "$baseSetups40Dir"/utilsLib.sh
source "$baseSetups40Dir"/utilsAppInstall.sh


functionCopyWipeOutHome() {


local myTargetDir="$HOME"/secretSauce

local myTargetFile="$myTargetDir"/wipeSetups.sh

local mySrcFile="$HOME"/bashOps/setups/utilsLocal/wipeSetups.sh

local permissionCode="775"

local dirOwner

dirOwner="$(whoami)"

# shellcheck disable=SC1073
  makeDirIfNotExist "$myTargetDir" "$permissionCode" "$dirOwner" || {

    errXMsg "makeDirIfNotExist() Failed with Error" "copyWipeSetupsHome.sh"  "Error-Exit!"

    return 99
  }


  cp -f "$mySrcFile" "$myTargetFile" || {

    errXMsg "Copy Error Source: $mySrcFile"  "Destination: $myTargetFile"

  }

}

msgNotify "Copying $HOME/bashOps/setups/utilsLocal/wipeSetups.sh to Secret Sauce" &&
functionCopyWipeOutHome &&
successMsg "Copied wipeSetups.sh to Secret Sauce!" "copyWipeSetupsHome.sh" || {

  errXMsg "copyWipeSetupsHome.sh Execution Failed" "Error-Exit!"
}

