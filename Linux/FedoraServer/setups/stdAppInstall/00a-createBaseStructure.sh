#!/bin/bash
# 1. Creates directory structure
# 2. Creates .bash_profile
#

function runCreateBashProfile() {

    local scriptFile

    #/setups/cfgBashProfile/cfgBashProfile.sh
    scriptFile="$HOME"/bashOps/setups/cfgBashProfile/cfgBashProfile.sh


   # shellcheck disable=SC1090
   source "$scriptFile"

   local scriptBashProfile

   scriptBashProfile="$HOME"/.bash_profile

  # shellcheck disable=SC1090
  source "$scriptBashProfile"

}

function createDirStructure() {

  local scriptFile

   #Linux/FedoraServer/setups/mikeFolders/createBaseFolders.sh
   scriptFile="$HOME"/bashOps/setups/mikeFolders/createBaseFolders.sh


   # shellcheck disable=SC1090
   source "$scriptFile"

}

runCreateBashProfile &&
createDirStructure &&
successMsg "All Phase-00a Structures Created." "REBOOT YOUR COMPUTER!"