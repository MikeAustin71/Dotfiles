#!/bin/bash
# Download and Install preferred fonts
# https://github.com/ryanoasis/nerd-fonts
# https://www.nerdfonts.com/font-downloads


declare NerdFontReleaseVer="v3.2.0"

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

source "$MIKE_Setup_Scripts/utils/utilsAppInstall.sh"

declare -a fontNames

declare -i fontErrCode=0

fontNames[0]="CodeNewRoman"

fontNames[1]="DejaVuSansMono"

fontNames[2]="FiraCode"

fontNames[3]="FiraMono"

fontNames[4]="Go-Mono"

fontNames[5]="Hack"

fontNames[6]="HeavyData"

fontNames[7]="InconsolataGo"

fontNames[8]="Iosevka"

fontNames[9]="IosevkaTerm"

fontNames[10]="JetBrainsMono"

fontNames[11]="Meslo"

fontNames[12]="Mononoki"

fontNames[13]="Noto"

fontNames[14]="RobotoMono"

fontNames[14]="SourceCodePro"

fontNames[14]="SpaceMono"

fontNames[14]="Terminus"

declare currFontName=""

for currFontName in "${fontNames[@]}"
do

    if [[ -d "$XDG_DATA_FONTS/$currFontName" ]]
    then
        zapFilesCmd "$XDG_DATA_FONTS/$currFontName/*" "-rf" "sudo"
    else

        makeDirIfNotExist "$XDG_DATA_FONTS/$currFontName" 775 "$(whoami)" ||
        {
          fontErrCode=$?
          echo "*** ERROR ***"
          echo "makeDirIfNotExist() FAILED!"
          echo "Script Name: getAllFonts.sh"
          return $fontErrCode
        }

    fi

    changeToDir "$XDG_DATA_FONTS/$currFontName" ||
    {
          fontErrCode=$?
          echo "*** ERROR ***"
          echo "changeToDir() FAILED!"
          echo "Script Name: getAllFonts.sh"
          return $fontErrCode

    }

    curl -fLo "$currFontName.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/$NerdFontReleaseVer/$currFontName.zip"

    if [ ! -f "$XDG_DATA_FONTS/$currFontName/$currFontName.zip" ]
    then

            echo "*** ERROR ***"
            echo "Font File Failed to Download!"
            echo "Font File= $XDG_DATA_FONTS/$currFontName/$currFontName.zip"
            echo "Script Name: getAllFonts.sh"
            return 99
    fi

    unzip "$XDG_DATA_FONTS/$currFontName/$currFontName.zip" ||
    {
      fontErrCode=$?
      echo "*** ERROR ***"
      echo "'unzip' fonts file FAILED!"
      echo "Font File= $XDG_DATA_FONTS/$currFontName/$currFontName.zip"
      echo "Script Name: getAllFonts.sh"
      return $fontErrCode
    }

    rm "$XDG_DATA_FONTS/$currFontName/$currFontName.zip"

    echo "Successfully Downloaded Font $currFontName"

done

changeToDir "$XDG_DATA_FONTS" ||
{
  fontErrCode=$?
  echo "*** ERROR ***"
  echo "Error occurred while changing to Fonts Directory!"
  echo "Fonts Directory: $XDG_DATA_FONTS"
  echo "Script Name: getAllFonts.sh"
  return $fontErrCode
}

echo "Registering Fonts..."
echo

sudo fc-cache -fv ||
{
  fontErrCode=$?
  echo "*** ERROR ***"
  echo "Error occurred registering Fonts!"
  echo "Command: fc-cache -fv"
  echo "Script Name: getAllFonts.sh"
  return $fontErrCode

}

successMsg "All Fonts Successfully Installed"

return 0
