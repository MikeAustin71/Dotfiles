#!/bin/bash
# Install neovim editor
# Remember to add Neovim to your PATH
# export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

declare baseSetupsInstallNvim="$HOME"/bashOps/setups

source "$baseSetupsInstallNvim"/utils/utilsLib.sh
source "$baseSetupsInstallNvim"/utils/utilsAppConfig.sh
source "$baseSetupsInstallNvim"/utils/utilsAppInstall.sh

declare currInNvimDir=""

currInNvimDir=$(pwd)

function installNeovim() {

  local -i theErrCode=0
  local arg1=""
  local arg2=""
  local argErrCode=""
  local argFuncName=" Function: installNeovim()"
  local argScriptName=" Script File: installNeovim.sh"
  local workDir="$HOME"/scratch

  changeToDir "$workDir" || {

      theErrCode=$?

      arg1=" Failed to change to temporary working directory!"
      arg2=" Target temporary working directory: $workDir"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

      return $theErrCode
  }

  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz || {

      theErrCode=$?

      arg1=" Failed to download latest version of Neovim!"
      arg2=" curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

      return $theErrCode

  }

  # sudo rm -rf /opt/nvim

  local targetDir="/opt/nvim"

  if [[ -d $targetDir ]]
  then

    removeDir "$targetDir" || {

      theErrCode=$?

      arg1=" Failed to delete Neovim /opt/nvim Directory!"
      arg2=" Command: removeDir $targetDir"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

      return $theErrCode
    }

  fi

  sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz || {

      theErrCode=$?

      arg1=" Failed to unpack nvim-linux-x86_64.tar.gz!"
      arg2=" Command: tar -C /opt -xzf nvim-linux-x86_64.tar.gz"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

  }

  return $theErrCode
}

msgNotify "Installing new version of Neovim" " " &&
installNeovim &&
msgNotify "Returning to Home Base" &&
changeToDir "$currInNvimDir" &&
successMsg "Neovim has been Installed" "installNeovim.sh" || {

  errXMsg "installNeovim.sh Execution Failed" "Error-Exit!"

}