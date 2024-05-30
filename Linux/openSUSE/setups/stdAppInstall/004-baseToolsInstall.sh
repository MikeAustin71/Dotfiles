#!/bin/bash
# Installs base Tools
# Run this as sudo
# NOTE: This script will fail if you
#   did NOT reboot your computer after
#   running script 00a-createBaseStructure.sh


source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh

function installGoogleFonts() {

  local scriptFile

     scriptFile="$MIKE_Setup_Scripts"/cfgFonts/getGoogleFonts.sh

  # shellcheck disable=SC1090
  source "$scriptFile"
}

function installNerdFonts() {

  local scriptFile

     scriptFile="$MIKE_Setup_Scripts"/cfgFonts/getNerdFonts.sh

  # shellcheck disable=SC1090
  source "$scriptFile"
}

function getWallpaper() {

  local scriptFile

     scriptFile="$MIKE_Setup_Scripts"/copyWallpaper/copyWallpaperFromDotFiles.sh

  # shellcheck disable=SC1090
  source "$scriptFile"
}


msgNotify "Installing Nerd Fonts" &&
installNerdFonts &&
msgNotify "Installing Google Fonts" &&
installGoogleFonts &&
msgNotify "Installing Wallpapers" &&
getWallpaper &&
successMsg "All Base Tools Installed." "All Fonts and Wallpapers Installed" "004-baseToolsInstall.sh" || errXMsg "004-baseToolsInstall.sh Execution Failed" "Error-Exit!"
