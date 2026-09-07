#!/bin/bash
# Installs base Tools
# Run this as sudo
# NOTE: This script will fail if you
#   did NOT reboot your computer after
#   running script 00a-createBaseStructure.sh

declare baseSetups85Dir="$HOME"/bashOps/setups
source "$baseSetups85Dir"/utils/utilsLib.sh
source "$baseSetups85Dir"/utils/utilsAppInstall.sh

function installGoogleFonts() {

  local scriptFile

     scriptFile="$baseSetups85Dir"/cfgFonts/getGoogleFonts.sh

  # shellcheck disable=SC1090
  source "$scriptFile"
}

function installNerdFonts() {

  local scriptFile

     scriptFile="$baseSetups85Dir"/cfgFonts/getNerdFonts.sh

  # shellcheck disable=SC1090
  source "$scriptFile"
}

function getWallpaper() {

  local scriptFile

     scriptFile="$baseSetups85Dir"/copyWallpaper/copyWallpaperFromDotFiles.sh

  # shellcheck disable=SC1090
  source "$scriptFile"
}

msgNotify "Installing Terminus Bit Map Fonts" &&
installTerminusBitMapFonts &&
msgNotify "Installing Terminus Consoleet Fonts" &&
installTerminusConsoleetFonts &&
msgNotify "Installing Font Awesome" &&
installFontAwesome &&
msgNotify "Installing NerdFontSymbols" &&
installNerdFontSymbols &&
msgNotify "Installing texlive-inconsolata-nerd-font" &&
installTexliveInconsolataFont &&
msgNotify "Installing Nerd Fonts" &&
installNerdFonts &&
msgNotify "Installing Google Fonts" &&
installGoogleFonts &&
msgNotify "Installing Wallpapers" &&
getWallpaper &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups85Dir/stdAppInstall" &&
successMsg "All Base Fonts-a Installed." "All Fonts and Wallpapers Installed" "004a-baseFontsInstall.sh" || {
  errXMsg "004a-baseFontsInstall.sh Execution Failed" "Error-Exit!"

}