#!/bin/bash
# Installs base Tools
# Run this as sudo
# NOTE: This script will fail if you
#   did NOT reboot your computer after
#   running script 00a-createBaseStructure.sh


source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh

function getFonts() {

  local scriptFile

     scriptFile="$MIKE_Setup_Scripts"/cfgFonts/getAllFonts.sh

  # shellcheck disable=SC1090
  source "$scriptFile"
}

function getWallpaper() {

  local scriptFile

     scriptFile="$MIKE_Setup_Scripts"/copyWallpaper/copyWallpaperFromDotFiles.sh

  # shellcheck disable=SC1090
  source "$scriptFile"
}

# installCoreUtils &&
installCompressionUtilities &&
installNeofetch &&
installVmwareTools &&
getFonts &&
getWallpaper &&
successMsg "All Base Tools Installed." "All Fonts Installed" "All Wallpapers Installed" || errXMsg "00b-baseToolsInstall.sh Execution Failed" "Error-Exit!"
