#!/bin/bash
# Copy Fonts to standard Fonts Directory
# from VM Shared Drive Fonts Directory


source "$MIKE_Setup_Scripts"/utils/utilsLib.sh


sourceFontsDir="$MIKE_DotFiles_Repo"/Linux/Fonts

targetFontsDir="$MIKE_Fonts_Directory"


copyDotFilesFonts() {

  if [[ -z $sourceFontsDir ]]
  then

    echo "  ***  ERROR  ***"
    echo "Source Fonts Directory Parameter is EMPTY!"
    echo "Function: copyDotFilesFonts()"
    return 111

  fi

  if [[ -z $targetFontsDir ]]
  then

    echo "  ***  ERROR  ***"
    echo "Target Fonts Directory Parameter is EMPTY!"
    echo "Function: copyDotFilesFonts()"
    return 112

  fi

  local -i errorCode=0

  sudo cp -v -R "$sourceFontsDir"/* "$targetFontsDir" ||
    {

    errorCode=$?

    echo "  ***  ERROR  ***"
    echo "Attempt to copy fonts from source"
    echo "VM Directory to Target Fonts Directory"
    echo "FAILED! Error Code= $errorCode"
    echo "Function: copyDotFilesFonts()"

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
copyDotFilesFonts &&
listFonts &&
successMsg "All Dot File Fonts Copied to Destination."
