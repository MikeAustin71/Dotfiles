#!/bin/bash
# Downloads and Installs all wallpapers
# from Dot Files.

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

declare srcWallPaperDir="$MIKE_DotFiles_Repo/Linux/Wallpaper"

declare destWallPaperDir="$MIKE_Wallpaper_Directory"

declare -i loadWallpaperExitCode=0


if [[ ! -d "$MIKE_DotFiles_Repo" ]]
then

  echo "*** ERROR ***"
  echo "Dot Files Directory DOES NOT EXIST!"
  echo "Dot Files Directory: $MIKE_DotFiles_Repo"
  echo "Download the Dot Files!"
  echo "Script Name: copyWallpaperFromDotFiles.sh"
  exit 89

fi

if [[ ! -d "$srcWallPaperDir" ]]
then

  echo "*** ERROR ***"
  echo "Source Wallpapers Directory DOES NOT EXIST!"
  echo "Source Wallpapers Directory: $srcWallPaperDir"
  echo "Download the Dot Files with Wallpapers Directory!"
  echo "Script Name: copyWallpaperFromDotFiles.sh"
  exit 88

fi

if [[ ! -d "$destWallPaperDir" ]]
then

  makeDirIfNotExist "$destWallPaperDir" "776" "sudo" ||
  {

    loadWallpaperExitCode=$?

    echo "*** ERROR ***"
    echo "Failed to create destination Wallpapers Directory!"
    echo "Destination Wallpapers Directory: $destWallPaperDir"
    echo "Error Code: $loadWallpaperExitCode"
    echo "Script Name: copyWallpaperFromDotFiles.sh"

    exit $loadWallpaperExitCode

  }

fi

sudo cp -fv "$srcWallPaperDir/*" "$destWallPaperDir/" ||
{

    loadWallpaperExitCode=$?

    echo "*** ERROR ***"
    echo "Error returned by Wallpaper Copy Operation!"
    echo "Source Wallpapers Directory: $srcWallPaperDir"
    echo "Destination Wallpapers Directory: $destWallPaperDir"
    echo "Error Code: $loadWallpaperExitCode"
    echo "Script Name: copyWallpaperFromDotFiles.sh"

    exit $loadWallpaperExitCode
}

successMsg "Wallpapers Successfully copied to: $destWallPaperDir"

exit 0