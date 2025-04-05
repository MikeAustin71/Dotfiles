#!/bin/bash
# Uninstall neovim editor


declare baseSetupsUinNvim="$HOME"/bashOps/setups

source "$baseSetupsUinNvim"/utils/utilsLib.sh
source "$baseSetupsUinNvim"/utils/utilsAppConfig.sh
source "$baseSetupsUinNvim"/utils/utilsAppInstall.sh

function unInstallNvimOpenSuse() {

  local -i theErrCode=0
  local arg1=""
  local arg2=""
  local argErrCode=""
  local argFuncName=" Function: unInstallNvimOpenSuse()"
  local argScriptName=" Script File: uninstallNeovim.sh"

  cd ~/scratch || {

    theErrCode=$?

    arg1=" Error change directories to 'scratch' FAILED!"
    arg2=" Command: cd ~/scratch"
    argErrCode=" Error Code: $theErrCode"

    errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

    return $theErrCode
  }

  sudo zypper rm -u neovim || {

    theErrCode=$?

    arg1=" 'zypper' Error uninstalling 'neovim'!"
    arg2=" Command: sudo zypper rm -u neovim"
    argErrCode=" Error Code: $theErrCode"

    errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

    return $theErrCode
  }

  msgNotify "Successfully Uninstalled 'neovim' using 'zypper'" " "

  return $theErrCode
}

function deleteNeovimDirs() {

  local -i theErrCode=0
  local arg1=""
  local arg2=""
  local argErrCode=""
  local argFuncName=" Function: deleteNeovimDirs()"
  local argScriptName=" Script File: uninstallNeovim.sh"

  local targetDir="$HOME"/.config/nvim

  if [[ -d $targetDir ]]
  then

    removeDir "$targetDir" || {

      theErrCode=$?

      arg1=" Failed to delete Neovim Config Directory!"
      arg2=" Command: removeDir $targetDir"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

      return $theErrCode
    }

  fi

  targetDir="$HOME"/.local/share/nvim

  if [[ -d $targetDir ]]
  then

    removeDir "$targetDir" || {

      theErrCode=$?

      arg1=" Failed to delete Neovim /.local/share Directory!"
      arg2=" Command: removeDir $targetDir"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

      return $theErrCode
    }

  fi

  targetDir="$HOME"/.cache/nvim

  if [[ -d $targetDir ]]
  then

    removeDir "$targetDir" || {

      theErrCode=$?

      arg1=" Failed to delete Neovim /.cache Directory!"
      arg2=" Command: removeDir $targetDir"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

      return $theErrCode
    }

  fi

  targetDir="/usr/local/bin/nvim"

  if [[ -d $targetDir ]]
  then

    removeDir "$targetDir" || {

      theErrCode=$?

      arg1=" Failed to delete Neovim /usr/local/bin Directory!"
      arg2=" Command: removeDir $targetDir"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

      return $theErrCode
    }

  fi

  targetDir="/usr/local/share/nvim"

  if [[ -d $targetDir ]]
  then

    removeDir "$targetDir" || {

      theErrCode=$?

      arg1=" Failed to delete Neovim /usr/local/bin Directory!"
      arg2=" Command: removeDir $targetDir"
      argErrCode=" Error Code: $theErrCode"

      errXMsg  "$arg1" "$arg2" "$argErrCode" "$argFuncName" "$argScriptName"

      return $theErrCode
    }

  fi

  msgNotify "Successfully deleted 'neovim' directories" " "

  return $theErrCode
}

msgNotify "Uninstalling Neovim using 'zypper'" " " &&
unInstallNvimOpenSuse &&
msgNotify "Deleting Neovim binary and configuration directories." " " &&
deleteNeovimDirs &&
successMsg "Neovim has been Uninstalled" "uninstallNeovim.sh" || {

  errXMsg "uninstallNeovim.sh Execution Failed" "Error-Exit!"

}