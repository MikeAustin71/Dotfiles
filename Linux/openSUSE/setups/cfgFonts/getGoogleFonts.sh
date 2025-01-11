#!/bin/bash
# Downloads Fonts from https://fonts.google.com/
# On openSUSE Tumbleweed check the fonts file:
#       .fonts.conf
# On openSUSE Tumbleweed
# Local user font directory:
#  ~/.local/share/fonts/
# System font directory:
#  /usr/share/fonts/
#
# NOTE: ~/.fonts/ is deprecated

declare fontsBase01SetupsDir="$HOME"/bashOps/setups

source "$fontsBase01SetupsDir/utils/utilsLib.sh"

source "$fontsBase01SetupsDir/utils/utilsAppInstall.sh"

declare targetMasterDir="/usr/share/fonts/Google"

declare opsDir="$HOME"/scratch
declare originalStartDir=""
declare opsAuthority=""

opsAuthority="sudo"

declare -i googleFontErrCode=0

function downLoadGoogleFonts() {

  # font Download Names
  local -a fontDwnNames
  # font Directory Names
  local -a fontDirNames

  local -a zipFileNames

  local -a urlIds

  local currDownloadName=""
  local currTargetDirName=""
  local currZipFileName=""
  local currURLId=""

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
  # wget -P ~/scratch "https://github.com/adobe-fonts/source-code-pro/releases/download/2.042R-u%2F1.062R-i%2F1.026R-vf/TTF-source-code-pro-2.042R-u_1.062R-i.zip" --output-document ~/scratch/SourceCodePro.zip

  fontDwnNames[0]="Source%20Code%20Pro"
  fontDirNames[0]="SourceCodePro"
  zipFileNames[0]="SourceCodePro"
  urlIds[0]="https://github.com/adobe-fonts/source-code-pro/releases/download/2.042R-u%2F1.062R-i%2F1.026R-vf/TTF-source-code-pro-2.042R-u_1.062R-i.zip"

  fontDwnNames[1]="Source%20Code%20Pro"
  fontDirNames[1]="SourceCodePro"
  zipFileNames[1]="SourceCodePro"
  urlIds[1]="https://github.com/adobe-fonts/source-code-pro/releases/download/2.042R-u%2F1.062R-i%2F1.026R-vf/OTF-source-code-pro-2.042R-u_1.062R-i.zip"

  local -i arrayIdx=0

  # extract files/directories from archives to a specific path:
  #    unzip path/to/archive1.zip path/to/archive2.zip ... -d path/to/output

  for arrayIdx in "${!fontDwnNames[@]}"
  do

    currDownloadName="${fontDwnNames[$arrayIdx]}"
    currTargetDirName="$targetMasterDir"/"${fontDirNames[$arrayIdx]}"
    currZipFileName="${zipFileNames[$arrayIdx]}.zip"
    currURLId="${urlIds[$arrayIdx]}"

    makeDirIfNotExist "$currTargetDirName" 775 "$opsAuthority" ||
    {
      googleFontErrCode=$?

      errXMsg "Call to makeDirIfNotExist() FAILED!" "Target Directory: $currTargetDirName" "Error Code: $googleFontErrCode" "Function Name: downLoadGoogleFonts()" "Script Name: getGoogleFonts.sh"

      return $googleFontErrCode
    }

    wget -P "$opsDir" "$currURLId" --output-document "$currZipFileName" || {

      googleFontErrCode=$?

      errXMsg "'wget' Download Command FAILED!" "Command:" "wget -P $opsDir $currURLId --output-document $currZipFileName" "Error Code: $googleFontErrCode" "Function Name: downLoadGoogleFonts()" "Script Name: getGoogleFonts.sh"

      return $googleFontErrCode
    }


    if [[ $opsAuthority == "sudo" ]] || [[ $opsAuthority == "root" ]]
    then

      sudo unzip "$opsDir"/"$currZipFileName" -d "$currTargetDirName" || {

      googleFontErrCode=$?

      errXMsg "'unzip' Command FAILED!" "Command:" "sudo unzip $opsDir/$currZipFileName -d $currTargetDirName" "Error Code: $googleFontErrCode" "Function Name: downLoadGoogleFonts()" "Script Name: getGoogleFonts.sh"

      return $googleFontErrCode
      }

    else

      unzip "$opsDir"/"$currZipFileName" -d "$currTargetDirName" || {

      googleFontErrCode=$?

      errXMsg "'unzip' Command FAILED!" "Command:" "unzip $opsDir/$currZipFileName -d $currTargetDirName" "Error Code: $googleFontErrCode" "Function Name: downLoadGoogleFonts()" "Script Name: getGoogleFonts.sh"

      return $googleFontErrCode
      }

    fi

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


