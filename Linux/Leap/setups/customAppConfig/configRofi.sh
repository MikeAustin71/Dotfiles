#!/bin/bash
# Install 'rofi' configuration files
#
declare baseSetRofiDir="$HOME"/bashOps/setups
source "$baseSetRofiDir"/utils/utilsLib.sh
source "$baseSetRofiDir"/utils/utilsAppConfig.sh
source "$baseSetRofiDir"/utils/utilsAppInstall.sh

  declare rofiCfgDir="$HOME"/.config/rofi
  declare rofiStartDir
  rofiStartDir=$(pwd)
   declare -i rofiErrCode=0

  function copyRofiCfgFileToLocal() {

    cp -vr "$baseSetRofiDir"/configDir/rofi  "$rofiCfgDir" || {


      rofiErrCode=$?

      errXMsg "'rofi' Directory Copy Failed" "$baseSetRofiDir/configDir/rofi -> $baseSetRofiDir/configDir/rofi" "Script: configRofi.sh" "Error Code: $rofiErrCode"

      return $rofiErrCode

     }

  return 0

}

  msgNotify "Creating 'rofi' config directory - if necessary." &&
  makeDirIfNotExist "$rofiCfgDir" &&
  msgNotify "Copying 'rofi' config files to config directory." &&
  copyRofiCfgFileToLocal &&
  changeToDir "$rofiStartDir" &&
  successMsg "Configured 'rofi' configuration files in Directory:" "$rofiCfgDir" "Script: configRofi.sh" || {
    rofiErrCode=$?
    errXMsg "Script File configRofi.sh  Execution Failed" "Error Code $rofiErrCode" "Script: configRofi.sh"
  }
