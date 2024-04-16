#!/bin/bash
# Installs Wal Color-Scheme
# https://github.com/dylanaraps/wal?tab=readme-ov-file
#

source "$HOME"/bashOps/setups/utils/utilsLib.sh

# app_Name="wal"

downloadOpsDir="$HOME/repos"


downloadWalRepo() {


  local -i errorCode=0

  cd "$downloadOpsDir" || {

      errorCode=$?

      # shellcheck disable=SC1009
      errXMsg "Change Directory Failed!" "Target Directory:" "$downloadOpsDir" "Script: installWal.sh" "Function: downloadWalRepo()" "Error Code: $errorCode"

      return $errorCode

  }

  git clone https://github.com/dylanaraps/wal.git || {

      errorCode=$?

      # shellcheck disable=SC1009
      errXMsg "git clone 'wal' Failed!" "git command:" "git clone https://github.com/dylanaraps/wal.git" "Script: installWal.sh" "Function: downloadWalRepo()" "Error Code: $errorCode"

      return $errorCode

  }

}

copyWal() {

  return 0

}