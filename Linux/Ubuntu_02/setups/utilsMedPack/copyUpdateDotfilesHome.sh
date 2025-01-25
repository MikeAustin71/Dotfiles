#!/bin/bash
# Copies updateDotFilesRepo.sh to
# the Secret Sauce Directory
#

declare baseSetups43Dir="$HOME"/bashOps/setups
source "$baseSetups43Dir"/utils/utilsLib.sh
source "$baseSetups43Dir"/utils/utilsAppInstall.sh


functionCopyUpdateDotfilesHome() {


local myTargetDir="$HOME"/secretSauce

local myTargetFile="$myTargetDir"/updateDotFilesRepo.sh

local mySrcFile="$HOME"/bashOps/setups/utilsLocal/updateDotFilesRepo.sh

local permissionCode="775"

local dirOwner

dirOwner="$(whoami)"

# shellcheck disable=SC1073
  makeDirIfNotExist "$myTargetDir" "$permissionCode" "$dirOwner" || {

    errXMsg "makeDirIfNotExist() Failed with Error" "copyUpdateDotfilesHome.sh"  "Error-Exit!"

    return 99
  }


  cp -f "$mySrcFile" "$myTargetFile" || {

    errXMsg "Copy Error Source: $mySrcFile"  "Destination: $myTargetFile" "Script: copyUpdateDotfilesHome.sh"

  }

}

msgNotify "Copying $HOME/bashOps/setups/utilsLocal/updateDotFilesRepo.sh to Secret Sauce" &&
functionCopyUpdateDotfilesHome &&
successMsg "Copied updateDotFilesRepo.sh to Secret Sauce!" "copyUpdateDotfilesHome.sh" || {

  errXMsg "copyUpdateDotfilesHome.sh Execution Failed" "Error-Exit!"
}
