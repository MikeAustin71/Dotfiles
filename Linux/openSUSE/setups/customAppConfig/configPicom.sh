#!/bin/bash
# Install 'picom' configuration files
#

declare baseSetPicomDir="$HOME"/bashOps/setups
source "$baseSetPicomDir"/utils/utilsLib.sh
source "$baseSetPicomDir"/utils/utilsAppConfig.sh
source "$baseSetPicomDir"/utils/utilsAppInstall.sh

  declare picomCopyDir="$HOME"/.config
  declare picomCfgDir="$picomCopyDir"/picom
  declare picomCfgSrcDir="$baseSetPicomDir"/configDir/picom
  declare picomStartDir
  picomStartDir=$(pwd)
   declare -i picomErrCode=0

  function copyPicomCfgFileToLocal() {

    cp -vr "$picomCfgSrcDir"  "$picomCopyDir" || {


      picomErrCode=$?

      errXMsg "'picom' Directory Copy Failed" "$picomCfgSrcDir -> $picomCfgDir" "Script: configPicom.sh" "Error Code: $picomErrCode"

      return $picomErrCode

     }

  return 0
  }

  msgNotify "Creating 'picom' config directory - if necessary." &&
  makeDirIfNotExist "$picomCfgDir" &&
  msgNotify "Copying 'picom' config files to config directory." &&
  copyPicomCfgFileToLocal &&
  changeToDir "$picomStartDir" &&
  successMsg "Configured 'picom' configuration files in Directory:" "$picomCfgDir" "Script: configPicom.sh" || {
    picomErrCode=$?
    errXMsg "Script File configPicom.sh  Execution Failed" "Error Code $picomErrCode" "Script: configPicom.sh"
  }
