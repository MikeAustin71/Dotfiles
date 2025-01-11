#!/bin/bash
# Used to pull down latest version of dotfiles and
# configure  ~/bashOps/setups



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


cp -f "$mySrcFile" "$myTargetFile"



}