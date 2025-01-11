#!/bin/bash
# Downloads Latest Release of 'ghq'
# GitHub page:
#    https://github.com/x-motemen/ghq
#
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#         IMPORTANT
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# You MUST install 'go' First!
# AND You MUST Configure the user Path.
# See: setups/configDir/shell/path/userPath.sh
# If you want a non-default path to repos,
# set environment variable GHQ_ROOT.
# Example:
# export GHQ_ROOT="$HOME/repos"

# Installs 'ghq' application.
# GitHub page:
#    https://github.com/x-motemen/ghq
# Remember, you must install 'go' before
# calling this function!

source "$HOME"/bashOps/setups/utils/utilsLib.sh

declare ghqDownloadOpsDir="$HOME"/scratch

declare ghqInstallDir="$HOME"/go/pkg

declare -i ghqErrorCode=0

# Downloads and installs the application 'ghq'
installGHQ() {

    go install github.com/x-motemen/ghq@latest || {


    ghqErrorCode=$?

    errXMsg "'ghq' Installation Failed!" "Error Code: $ghqErrorCode" "Function: installGHQ()" "Script: installGHQ.sh"

    return $ghqErrorCode

 }

}

  echo "Starting 'ghq' Installation"
  changeToDir "$HOME" &&
  makeDirIfNotExist "$ghqInstallDir" "775" "" &&
  makeDirIfNotExist "$ghqDownloadOpsDir" "777" "" &&
  zapFilesCmd "$ghqDownloadOpsDir/*" "-f" "" &&
  changeToDir "$ghqDownloadOpsDir" &&
  installGHQ &&
  changeToDir "$HOME" &&
  successMsg  "Downloaded, extracted and configured 'ghq' Application." || {

    ghqErrorCode=$?

    errXMsg "installGHQ.sh Execution Failed" "Error Code: $ghqErrorCode"

     return $ghqErrorCode
  }
