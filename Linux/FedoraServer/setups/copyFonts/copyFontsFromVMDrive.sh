#!/bin/bash
# Copy Fonts to Global Font Directory
# Run this as sudo
# First make sure /usr/share/fonts/ exists!

sourceFontsDir="$MIKE_VMShared_Drive/fonts"

targetFontsDir="$MIKE_Fonts_Directory"

source "$MIKE_Setup_Scripts"/utils/utilsLib.sh

copyFontsToLocal() {

cp -v -R "$sourceFontsDir"/* "$targetFontsDir" ||
  {

    return
  }

  return 0
}

registerFonts() {

  sudo fc-cache -r ||
  {
    return
  }

}

listFonts() {

  fc-list | awk '{print $1}'
}

makeDirIfNotExist "$targetFontsDir" "777" "" &&
copyFontsToLocal &&
listFonts &&
successMsg "All Fonts Copied to Destination."
