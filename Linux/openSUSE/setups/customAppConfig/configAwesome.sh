#!/bin/bash
# Configures Awesome Window Manager
# Run this as sudo
declare baseSetAwesomeDir="$HOME"/bashOps/setups
source "$baseSetAwesomeDir"/utils/utilsLib.sh
source "$baseSetAwesomeDir"/utils/utilsAppConfig.sh
source "$baseSetAwesomeDir"/utils/utilsAppInstall.sh

  declare awesomeCfgDir="$HOME"/.config/awesome
  declare awesomeStartDir
  awesomeStartDir=$(pwd)
   declare -i awesomeErrCode=0

  function copyAwesomeCfgFileToLocal() {

    cp -vr "$baseSetAwesomeDir"/configDir/awesome  "$awesomeCfgDir" || {


      awesomeErrCode=$?

      errXMsg "'awesome' Directory Copy Failed" "$baseSetAwesomeDir/configDir/awesome -> $baseSetAwesomeDir/configDir/awesome" "Script: configAwesome.sh" "Error Code: $awesomeErrCode"

      return $awesomeErrCode

     }

  return 0

}

  msgNotify "Creating 'awesome' config directory - if necessary." &&
  makeDirIfNotExist "$awesomeCfgDir" &&
  msgNotify "Copying 'awesome' config files to config directory." &&
  copyAwesomeCfgFileToLocal &&
  changeToDir "$awesomeStartDir" &&
  successMsg "Configured 'awesome' configuration files in Directory:" "$awesomeCfgDir" "Script: configAwesome.sh" || {
    awesomeErrCode=$?
    errXMsg "Script File configAwesome.sh  Execution Failed" "Error Code $awesomeErrCode" "Script: configAwesome.sh"
  }
