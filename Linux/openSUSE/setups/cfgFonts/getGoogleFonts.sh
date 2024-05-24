#!/bin/bash
# Downloads Fonts from https://fonts.google.com/
# On openSUSE Tumbleweed check the fonts file:
#       .fonts.conf
# On openSUSE Tumbleweed
# Local user font directory: `~/.fonts`
# System font directory: `/usr/share/fonts/truetype/`

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

source "$MIKE_Setup_Scripts/utils/utilsAppInstall.sh"

declare targetMasterDir="$XDG_DATA_FONTS"/google
declare opsDir="$HOME"/scratch
declare originalStartDir=""
declare opsAuthority=""
declare -i googleFontErrCode=0

function downLoadGoogleFonts() {

  # font Download Names
  local -a fontDwnNames
  # font Directory Names
  local -a fontDirNames

  local -a zipFileNames

  local currDownloadName=""
  local currTargetDirName=""
  local currZipFileName=""

  originalStartDir=$(pwd)

  opsAuthority=""
  # opsAuthority="sudo"

  [[ -d $targetMasterDir ]] || {
    # targetDir/google does NOT exist

          makeDirIfNotExist "$targetMasterDir" 775 "$opsAuthority" ||
          {
            googleFontErrCode=$?

            errXMsg "Call to makeDirIfNotExist() FAILED!" "Unable to create 'targetMasterDir'" "Target Master Dir:" "   $targetMasterDir" "Error Code: $googleFontErrCode" "Function Name: downLoadGoogleFonts()" "Script Name: getGoogleFonts.sh"

            return $googleFontErrCode
          }
  }

  changeToDir "$opsDir" || {

    googleFontErrCode=$?

    errXMsg "Call to changeToDir() FAILED!" "Error Code: $googleFontErrCode" "Function Name: downLoadGoogleFonts()" "Script Name: getGoogleFonts.sh"


  }

  fontDwnNames[0]="Source%20Code%20Pro"
  fontDirNames[0]="SourceCodePro"
  zipFileNames[0]="SourceCodePro"

  local -i arrayIdx=0


  # extract files/directories from archives to a specific path:
  #    unzip path/to/archive1.zip path/to/archive2.zip ... -d path/to/output

  for arrayIdx in "${!fontDwnNames[@]}"
  do

    currDownloadName="${fontDwnNames[$arrayIdx]}"
    currTargetDirName="$targetMasterDir"/"${fontDirNames[$arrayIdx]}"
    currZipFileName="${zipFileNames[$arrayIdx]}.zip"

    makeDirIfNotExist "$currTargetDirName" 775 "$opsAuthority" ||
    {
      googleFontErrCode=$?

      errXMsg "Call to makeDirIfNotExist() FAILED!" "Target Directory: $currDirName" "Error Code: $googleFontErrCode" "Function Name: downLoadGoogleFonts()" "Script Name: getGoogleFonts.sh"

      return $googleFontErrCode
    }

    wget --output-document "$currZipFileName"  "$opsDir" "https://fonts.google.com/download?family=$currDownloadName" || {

      googleFontErrCode=$?

      errXMsg "'wget' Download Command FAILED!" "Command:" "wget --output-document $currZipFileName  $opsDir https://fonts.google.com/download?family=$currDownloadName" "Error Code: $googleFontErrCode" "Function Name: downLoadGoogleFonts()" "Script Name: getGoogleFonts.sh"

      return $googleFontErrCode
    }

    if [[ $opsAuthority == "sudo" ]] || [[ $opsAuthority == "root" ]]
    then

        opsAuthority="sudo"

    else

        opsAuthority=""

    fi

    "$opsAuthority" unzip "$opsDir"/"$currZipFileName" -d "$currTargetDirName" || {

      googleFontErrCode=$?

      errXMsg "'unzip' Command FAILED!" "Command:" "unzip $opsDir/$currZipFileName -d $currTargetDirName" "Error Code: $googleFontErrCode" "Function Name: downLoadGoogleFonts()" "Script Name: getGoogleFonts.sh"

      return $googleFontErrCode
    }

    rm -f "$opsDir"/"$currZipFileName" || {


      errXMsg "File Delete Command FAILED!" "Command:" "rm -f $opsDir/$currZipFileName" "Error Code: $googleFontErrCode" "Function Name: downLoadGoogleFonts()" "Script Name: getGoogleFonts.sh"

      return $googleFontErrCode
    }

    msgNotify "Successfully downloaded and installed Google Font:" "  $currDownloadName"

  done

  return 0
}

function registerGoogleFonts() {


  changeToDir "$targetMasterDir" || {

    googleFontErrCode=$?

    errXMsg "Call to changeToDir() FAILED!" "Unable to change cwd to 'targetMasterDir'" "Target Master Dir:" "   $targetMasterDir" "Error Code: $googleFontErrCode" "Function Name: registerGoogleFonts()" "Script Name: getGoogleFonts.sh"

      return $googleFontErrCode
  }

  sudo fc-cache -f -v || {

    googleFontErrCode=$?

    errXMsg "Registration of Google Fonts FAILED!" "Registration Command:" "  sudo fc-cache -f -v" "Error Code: $googleFontErrCode" "Function Name: registerGoogleFonts()" "Script Name: getGoogleFonts.sh"

      return $googleFontErrCode
  }

  return 0
}

function returnToOriginalDir() {


  changeToDir "$originalStartDir" || {

    googleFontErrCode=$?

    errXMsg "Call to changeToDir() FAILED!" "Unable to change cwd to original starting directory." "Original Starting Dir:" "   $originalStartDir" "Error Code: $googleFontErrCode" "Function Name: returnToOriginalDir()" "Script Name: getGoogleFonts.sh"

      return $googleFontErrCode
  }

  return 0
}

msgNotify "Downloading Google Fonts..." &&
downLoadGoogleFonts &&
msgNotify "Registering Google Fonts..." &&
registerGoogleFonts &&
msgNotify "Changing to original starting directory." &&
returnToOriginalDir &&
successMsg "Successfully installed Google Fonts!" "Script Name: getGoogleFonts.sh" || {

  errXMsg "Google Font Installation FAILED!" "Script Name: getGoogleFonts.sh"
}


