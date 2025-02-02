#!/bin/bash
# Download and Install preferred fonts
# https://github.com/ryanoasis/nerd-fonts
# https://www.nerdfonts.com/font-downloads
# On openSUSE Tumbleweed
# Local user font directory:
#  ~/.local/share/fonts/
# System font directory:
#  /usr/share/fonts/
#
# NOTE: ~/.fonts/ is deprecated

declare NerdFontReleaseVer="v3.2.0"

declare fontsBase02SetupsDir="$HOME"/bashOps/setups

source "$fontsBase02SetupsDir/utils/utilsLib.sh"

source "$fontsBase02SetupsDir/utils/utilsAppInstall.sh"

# This variable controls whether the fonts will be
# be installed as system fonts or local fonts.
declare targetFontsMasterDir="/usr/share/fonts/NerdFonts"

declare -a fontNames

declare -i nerdFontErrCode=0

declare originalStartDir=""

originalStartDir=$(pwd)

declare opsAuthority=""

opsAuthority="root"

declare currFontName=""

declare targetDir=""

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

[[ -d $targetFontsMasterDir ]] || {

   makeDirIfNotExist "$targetFontsMasterDir" 775 "$opsAuthority" ||
  {
    nerdFontErrCode=$?
   errXMsg "makeDirIfNotExist() FAILED!" "Target Dir:" "  $targetFontsMasterDir" "Error Code: $nerdFontErrCode" "Script Name: getNerdFonts.sh"

    return $nerdFontErrCode
  }


}

for currFontName in "${fontNames[@]}"
do

    targetDir="$targetFontsMasterDir/$currFontName"

    if [[ -d $targetDir ]]
    then

        zapFilesCmd "$targetDir/*" "-rf" "sudo" || {

          nerdFontErrCode=$?

          errXMsg "Call to zapFilesCmd() Failed!" "File Delete Command:" "  zapFilesCmd $targetDir/* -rf sudo" "Error Code: $nerdFontErrCode" "Script Name: getNerdFonts.sh"

          return $nerdFontErrCode

        }

    else

        makeDirIfNotExist "$targetDir" 775 "$opsAuthority" ||
        {

          nerdFontErrCode=$?

          errXMsg "Call to makeDirIfNotExist() Failed!" "Target Dir:" "  $targetDir" "Error Code: $nerdFontErrCode" "Script Name: getNerdFonts.sh"

          return $nerdFontErrCode
        }

     fi

    changeToDir "$targetDir" ||
    {
          nerdFontErrCode=$?

          errXMsg "Call to changeToDir() FAILED!" "Target Dir:" "  $targetDir" "Error Code: $nerdFontErrCode" "Script Name: getNerdFonts.sh"

          return $nerdFontErrCode

    }

    if [[ $opsAuthority == "sudo" ]] || [[ $opsAuthority == "root" ]]
    then

      sudo curl -fLo "$currFontName.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/$NerdFontReleaseVer/$currFontName.zip" || {

        nerdFontErrCode=$?

        errXMsg "Font download failed." "Download Command:" "  sudo curl -fLo $currFontName.zip https://github.com/ryanoasis/nerd-fonts/releases/download/$NerdFontReleaseVer/$currFontName.zip" "Error Code: $nerdFontErrCode" "Script Name: getNerdFonts.sh"

        return $nerdFontErrCode

      }

    else

      curl -fLo "$currFontName.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/$NerdFontReleaseVer/$currFontName.zip" || {

        nerdFontErrCode=$?

        errXMsg "Font download failed." "Download Command:" "  curl -fLo $currFontName.zip https://github.com/ryanoasis/nerd-fonts/releases/download/$NerdFontReleaseVer/$currFontName.zip" "Error Code: $nerdFontErrCode" "Script Name: getNerdFonts.sh"

        return $nerdFontErrCode
      }

    fi

    if [ ! -f "$targetDir/$currFontName.zip" ]
    then
            nerdFontErrCode=99
            echo "*** ERROR ***"
            echo "Font File Failed to Download!"
            echo "Font File= $targetDir/$currFontName.zip"
            echo "Error Code: $nerdFontErrCode"
            echo "Script Name: getNerdFonts.sh"
            return $nerdFontErrCode
    fi

    sudo unzip "$targetDir/$currFontName.zip" ||
    {
      nerdFontErrCode=$?
      echo "*** ERROR ***"
      echo "'unzip' fonts file FAILED!"
      echo "Font File= $targetDir/$currFontName.zip"
      echo "Error Code: $nerdFontErrCode"
      echo "Script Name: getNerdFonts.sh"
      return $nerdFontErrCode
    }

    sudo rm -f "$targetDir/$currFontName.zip"

    echo "Successfully Downloaded Font $currFontName"

done

changeToDir "$targetFontsMasterDir" ||
{
  nerdFontErrCode=$?
  echo "*** ERROR ***"
  echo "Error occurred while changing to Fonts Directory!"
  echo "Fonts Directory: $targetFontsMasterDir"
  echo "Error Code: $nerdFontErrCode"
  echo "Script Name: getNerdFonts.sh"
  return $nerdFontErrCode
}

echo
echo "Registering Fonts..."
echo

sudo fc-cache -fv ||
{
  nerdFontErrCode=$?
  echo "*** ERROR ***"
  echo "Error occurred registering Fonts!"
  echo "Command: fc-cache -fv"
  echo "Current Director:"
  echo "  $targetFontsMasterDir"
  echo "Error Code: $nerdFontErrCode"
  echo "Script Name: getNerdFonts.sh"
  return $nerdFontErrCode

}

cd "$originalStartDir" || {

  nerdFontErrCode=$?
  echo "*** ERROR ***"
  echo "Error occurred while changing current working directory to:"
  echo " $originalStartDir"
  echo "Error Code: $nerdFontErrCode"
  echo "Script Name: getNerdFonts.sh"
  return $nerdFontErrCode

}

successMsg "All Fonts Successfully Installed"

return 0
