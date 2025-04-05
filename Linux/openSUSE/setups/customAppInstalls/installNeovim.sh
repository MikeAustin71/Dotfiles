#!/bin/bash
# Installs neovim editor
# ++++++++++++++++++++++++++++++++++++++++++++++
#       IMPORTANT
# ++++++++++++++++++++++++++++++++++++++++++++++
# Download nvim-linux-x86_64.tar.gz to the
# local downloads directory FIRST!
# ~/Downloads
#
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
  local dwnLoadDir="$HOME"/Downloads
  local srcFile="nvim-linux-x86_64.tar.gz"
  local targetSrcFile="$dwnLoadDir"/"$srcFile"
  local targetDestFile="$workDir"/"$srcFile"

  changeToDir "$workDir" || {

      theErrCode=$?

      arg1=" Failed to change to temporary working directory!"
      arg2=" Target temporary working directory: $workDir"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

      return $theErrCode
  }

  mv "$targetSrcFile" "$targetDestFile" || {

      theErrCode=$?

      arg1=" Failed to move Neovim tarball from Downloads Directory to Temp Directory!"
      arg2=" Command: mv $targetSrcFile $targetDestFile"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

      return $theErrCode
  }

  # sudo rm -rf /opt/nvim

  local targetExeDir="/opt/nvim"

  if [[ -d $targetExeDir ]]
  then

    removeDir "$targetExeDir" || {

      theErrCode=$?

      arg1=" Failed to delete Neovim opt's 'nvim' directory!"
      arg2=" Command: removeDir $targetExeDir"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

      return $theErrCode
    }

  fi


  targetExeDir="/opt/nvim-linux-x86_64"

  if [[ -d $targetExeDir ]]
  then

    removeDir "$targetExeDir" || {

      theErrCode=$?

      arg1=" Failed to delete Neovim opt's nvim-linux-x86_64 directory!"
      arg2=" Command: removeDir $targetExeDir"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

      return $theErrCode
    }

  fi

  # Actual installation operation
  sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz || {

      theErrCode=$?

      arg1=" Failed to unpack nvim-linux-x86_64.tar.gz!"
      arg2=" Command: tar -C /opt -xzf nvim-linux-x86_64.tar.gz"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

  }

  return $theErrCode
}

function installNeovimSupportApps() {

  sudo zypper install nvim-treesitter

  sudo zypper install julia

  sudo gem install neovim

}


msgNotify "Installing new version of Neovim" " " &&
installNeovim &&
msgNotify "Installing Neovim Supporting Apps" " " &&
msgNotify "Returning to Home Base" &&
installNeovimSupportApps &&
changeToDir "$currInNvimDir" &&
successMsg "Neovim has been Installed" "installNeovim.sh" "Install Dir: /opt/nvim-linux-x86_64/bin" "Don't forget to update PATH!" || {

  errXMsg "installNeovim.sh Execution Failed" "Error-Exit!"

}