#!/bin/bash
# This script will initialize and configure
# Alacritty Terminal Emulator in ~/.config/alacritty

declare baseSetAlacrittyDir="$HOME"/bashOps/setups
source "$baseSetAlacrittyDir"/utils/utilsLib.sh
source "$baseSetAlacrittyDir"/utils/utilsAppConfig.sh
source "$baseSetAlacrittyDir"/utils/utilsAppInstall.sh

  declare alacrittyCfgDir="$HOME"/.config/alacritty
  declare alacrittyStartDir
  alacrittyStartDir=$(pwd)
  declare -i alacrittyErrCode=0

  function copyAlacrittyCfgFileToLocal() {

    cp -vr "$baseSetAlacrittyDir"/configDir/alacritty  "$alacrittyCfgDir" || {


      alacrittyErrCode=$?

      errXMsg "'alacritty' Directory Copy Failed" "$baseSetAlacrittyDir/configDir/alacritty -> $baseSetAlacrittyDir/configDir/alacritty" "Script: configAlacritty.sh" "Error Code: $alacrittyErrCode"

      return $alacrittyErrCode

     }

  return 0

}

  msgNotify "Creating 'alacritty' config directory - if necessary." &&
  makeDirIfNotExist "$alacrittyCfgDir" &&
  msgNotify "Copying 'alacritty' config files to config directory." &&
  copyAlacrittyCfgFileToLocal &&
  changeToDir "$alacrittyStartDir" &&
  successMsg "Configured 'alacritty' configuration files in Directory:" "$alacrittyCfgDir" "Script: configAlacritty.sh" || {
    alacrittyErrCode=$?
    errXMsg "Script File configAlacritty.sh  Execution Failed" "Error Code $alacrittyErrCode" "Script: configAlacritty.sh"
  }
