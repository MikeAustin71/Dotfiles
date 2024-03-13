#!/bin/bash
# Copy Fonts to Global Font Directory
# Run this as sudo
# First make sure /usr/share/fonts/ exists!

sourceFontsDir="$MIKE_VMShared_Drive/fonts"

targetFontsDir="$MIKE_Fonts_Directory"

source "$MIKE_Setup_Scripts"/utils/utilsLib.sh

copyFontsVM() {

  if [[ -z $sourceFontsDir ]]
  then

    echo "  ***  ERROR  ***"
    echo "Source Fonts Directory Parameter is EMPTY!"
    echo "Function: copyFontsVM()"
    return 91

  fi

  if [[ -z $targetFontsDir ]]
  then

    echo "  ***  ERROR  ***"
    echo "Target Fonts Directory Parameter is EMPTY!"
    echo "Function: copyFontsVM()"
    return 92

  fi

  local -i errorCode=0

  sudo cp -v -R "$sourceFontsDir"/* "$targetFontsDir" ||
    {

    errorCode=$?

    echo "  ***  ERROR  ***"
    echo "Attempt to copy fonts from source"
    echo "VM Directory to Target Fonts Directory"
    echo "FAILED! Error Code= $errorCode"
    echo "Function: copyFontsVM()"

    return $errorCode

    }

  return 0
}

registerFonts() {

  local -i errorCode=0

  sudo fc-cache -r ||
  {

    errorCode=$?

    echo "  ***  ERROR  ***"
    echo "Command fc-cache -r FAILED!"
    echo "Error Code= $errorCode"
    echo "Function: registerFonts()"

    return $errorCode
  }

}

listFonts() {

  fc-list | awk '{print $1}'
}

makeDirIfNotExist "$targetFontsDir" "777" "" &&
copyFontsVM &&
listFonts &&
successMsg "All Fonts Copied to Destination."
