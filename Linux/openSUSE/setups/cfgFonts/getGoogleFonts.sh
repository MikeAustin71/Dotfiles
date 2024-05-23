#!/bin/bash
# Downloads Fonts from https://fonts.google.com/


source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

source "$MIKE_Setup_Scripts/utils/utilsAppInstall.sh"

# font Download Names
declare -a fontDwnNames
declare -a fontDirNames
declare currDownloadName=""
declare currDirName=""
declare targetMasterDir="$XDG_DATA_FONTS"/google
declare opsAuthority="$(whoami)"


declare -i googleFontErrCode=0

[[ -d $targetMasterDir ]] || {
  # targetDir/google does NOT exist

        makeDirIfNotExist "$targetMasterDir" 775 "$opsAuthority" ||
        {
          googleFontErrCode=$?

          errXMsg "Call to makeDirIfNotExist() FAILED!" "Error Code: $nerdFontErrCode" "Script Name: getGoogleFonts.sh"


          return $googleFontErrCode
        }


}


fontDwnNames[0]="Source%20Code%20Pro"
fontDirNames[0]"SourceCodePro"

declare -i arrayIdx=0


# extract files/directories from archives to a specific path:
#    unzip path/to/archive1.zip path/to/archive2.zip ... -d path/to/output

for currDownloadName in "${fontDwnNames[@]}"
do

  currDirName="$targetMasterDir"/"${fontDirNames[@]}"




done