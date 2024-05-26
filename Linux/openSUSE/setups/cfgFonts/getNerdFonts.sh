#!/bin/bash
# Download and Install preferred fonts
# https://github.com/ryanoasis/nerd-fonts
# https://www.nerdfonts.com/font-downloads
# System fonts must be installed in the /usr/share/fonts/ directory.
# These System fonts can be used by all users on the machine.
# Personal fonts are usually installed in ~/.local/share/fonts/ directory.
# Only the user himself/herself can use it while other users cannot.
# NOTE: ~/.fonts/ is deprecated

declare NerdFontReleaseVer="v3.2.0"

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

source "$MIKE_Setup_Scripts/utils/utilsAppInstall.sh"

declare -a fontNames

declare -i nerdFontErrCode=0

fontNames[0]="CodeNewRoman"

fontNames[1]="DejaVuSansMono"

fontNames[2]="FiraCode"

fontNames[3]="FiraMono"

fontNames[4]="Go-Mono"

fontNames[5]="Hack"

fontNames[6]="HeavyData"

fontNames[7]="Hermit"

fontNames[8]="InconsolataGo"

fontNames[9]="Iosevka"

fontNames[10]="IosevkaTerm"

fontNames[11]="JetBrainsMono"

fontNames[12]="Meslo"

fontNames[13]="Mononoki"

fontNames[14]="Noto"

fontNames[15]="RobotoMono"

fontNames[16]="SourceCodePro"

fontNames[17]="SpaceMono"

fontNames[18]="Terminus"

declare currFontName=""

declare targetFontsMasterDir="$XDG_DATA_FONTS/NerdFonts"

[[ -d $targetFontsMasterDir ]] || {

  nerdFontErrCode=$?

  makeDirIfNotExist "$targetFontsMasterDir" 775 "$(whoami)" ||
  {
    nerdFontErrCode=$?
   errXMsg "makeDirIfNotExist() FAILED!" "Target Dir:" "  $targetFontsMasterDir" "Error Code: $nerdFontErrCode" "Script Name: getNerdFonts.sh"

    return $nerdFontErrCode
  }


}

for currFontName in "${fontNames[@]}"
do

    if [[ -d "$targetFontsMasterDir/$currFontName" ]]
    then
        zapFilesCmd "$targetFontsMasterDir/$currFontName/*" "-rf" "sudo"
    else

        makeDirIfNotExist "$targetFontsMasterDir/$currFontName" 775 "$(whoami)" ||
        {
          nerdFontErrCode=$?
          echo "*** ERROR ***"
          echo "makeDirIfNotExist() FAILED!"
          echo "Error Code: $nerdFontErrCode"
          echo "Script Name: getNerdFonts.sh"
          return $nerdFontErrCode
        }

    fi

    changeToDir "$targetFontsMasterDir/$currFontName" ||
    {
          nerdFontErrCode=$?
          echo "*** ERROR ***"
          echo "changeToDir() FAILED!"
          echo "Error Code: $nerdFontErrCode"
          echo "Script Name: getNerdFonts.sh"
          return $nerdFontErrCode

    }

    curl -fLo "$currFontName.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/$NerdFontReleaseVer/$currFontName.zip"

    if [ ! -f "$targetFontsMasterDir/$currFontName/$currFontName.zip" ]
    then
            nerdFontErrCode=99
            echo "*** ERROR ***"
            echo "Font File Failed to Download!"
            echo "Font File= $targetFontsMasterDir/$currFontName/$currFontName.zip"
            echo "Error Code: $nerdFontErrCode"
            echo "Script Name: getNerdFonts.sh"
            return $nerdFontErrCode
    fi

    unzip "$targetFontsMasterDir/$currFontName/$currFontName.zip" ||
    {
      nerdFontErrCode=$?
      echo "*** ERROR ***"
      echo "'unzip' fonts file FAILED!"
      echo "Font File= $targetFontsMasterDir/$currFontName/$currFontName.zip"
      echo "Error Code: $nerdFontErrCode"
      echo "Script Name: getNerdFonts.sh"
      return $nerdFontErrCode
    }

    rm "$targetFontsMasterDir/$currFontName/$currFontName.zip"

    echo "Successfully Downloaded Font $currFontName"

done

changeToDir "$targetFontsMasterDir" ||
{
  nerdFontErrCode=$?
  echo "*** ERROR ***"
  echo "Error occurred while changing to Fonts Directory!"
  echo "Fonts Directory: $XDG_DATA_FONTS"
  echo "Error Code: $nerdFontErrCode"
  echo "Script Name: getNerdFonts.sh"
  return $nerdFontErrCode
}

echo "Registering Fonts..."
echo

sudo fc-cache -fv ||
{
  nerdFontErrCode=$?
  echo "*** ERROR ***"
  echo "Error occurred registering Fonts!"
  echo "Command: fc-cache -fv"
  echo "Error Code: $nerdFontErrCode"
  echo "Script Name: getNerdFonts.sh"
  return $nerdFontErrCode

}

cd "$HOME" || {

  nerdFontErrCode=$?
  echo "*** ERROR ***"
  echo "Error occurred while changing dir to: $HOME"
  echo "Error Code: $nerdFontErrCode"
  echo "Script Name: getNerdFonts.sh"
  return $nerdFontErrCode

}

successMsg "All Fonts Successfully Installed"

return 0
