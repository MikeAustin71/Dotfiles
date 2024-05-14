#!/bin/bash
# Downloads and Installs all wallpapers
# from Dot Files.

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

declare srcWallPaperDir="$MIKE_DotFiles_Repo/Linux/Wallpaper"

declare destWallPaperDir="$MIKE_Wallpaper_Directory"

declare -i loadWallpaperExitCode=0


[[ -d "$MIKE_DotFiles_Repo" ]] || {

  echo "          *** ERROR ***"
  echo "Source Dot Files Directory DOES NOT EXIST!"
  echo "Dot Files Directory: $MIKE_DotFiles_Repo"
  echo "Download the Dot Files!"
  echo "Script Name: copyWallpaperFromDotFiles.sh"
  return 89

}

[[ ! -d $srcWallPaperDir ]] || {

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


# sudo cp -v "$HOME/repo/Linux/Wallpaper/*" "$MIKE_Wallpaper_Directory/"

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

successMsg "Wallpapers Successfully copied to: $destWallPaperDir"

return 0
