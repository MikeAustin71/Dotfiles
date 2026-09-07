#!/bin/bash
# Downloads and Installs all wallpapers
# from Dot Files.


declare fontsBase03SetupsDir="$HOME"/bashOps/setups
declare dotFilesFontsRepo="$HOME"/repos/Dotfiles


source "$fontsBase03SetupsDir/utils/utilsLib.sh"

declare srcWallPaperDir="$dotFilesFontsRepo/Linux/Wallpaper"

declare destWallPaperDir="/usr/share/wallpapers/openSUSEdefault/contents/images"


declare -i loadWallpaperExitCode=0


[[ -d "$dotFilesFontsRepo" ]] || {

  echo "          *** ERROR ***"
  echo "Source Dot Files Directory DOES NOT EXIST!"
  echo "Dot Files Directory: $dotFilesFontsRepo"
  echo "Download the Dot Files!"
  echo "Script Name: copyWallpaperFromDotFiles.sh"
  return 89

}

[[ -d $srcWallPaperDir ]] || {

  echo "*** ERROR ***"
  echo "Source Wallpapers Directory DOES NOT EXIST!"
  echo "Source Wallpapers Directory: $srcWallPaperDir"
  echo "Download the Dot Files with Wallpapers Directory!"
  echo "Script Name: copyWallpaperFromDotFiles.sh"
  return 88

}


[[ -d $destWallPaperDir ]] || {

    makeDirIfNotExist "$destWallPaperDir" "775" "sudo" || {

    loadWallpaperExitCode=$?

    echo "*** ERROR ***"
    echo "Destination Wallpapers Directory did not exist."
    echo "The call to function makeDirIfNotExist returned errors."
    echo "The attempted creation of this directory FAILED!"
    echo "Destination Wallpapers Directory:"
    echo "  $destWallPaperDir"
    echo "Error Code: $loadWallpaperExitCode"
    echo "Script Name: copyWallpaperFromDotFiles.sh"

    return $loadWallpaperExitCode

  }

}


# sudo cp -v "$HOME/repo/Linux/Wallpaper/*" "$destWallPaperDir/"

sudo cp -v "$srcWallPaperDir"/* "$destWallPaperDir" ||
{

    loadWallpaperExitCode=$?

    echo "*** ERROR ***"
    echo "Error returned by Wallpaper Copy Operation!"
    echo "Source Wallpapers Directory: $srcWallPaperDir"
    echo "Destination Wallpapers Directory: $destWallPaperDir"
    echo "Error Code: $loadWallpaperExitCode"
    echo "Script Name: copyWallpaperFromDotFiles.sh"

    return $loadWallpaperExitCode
}

successMsg "Wallpapers Successfully copied to: $destWallPaperDir" "copyWallpaperFromDotFiles.sh"

return 0
