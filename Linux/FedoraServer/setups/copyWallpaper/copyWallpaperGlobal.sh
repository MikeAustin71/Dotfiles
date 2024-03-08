#!/bin/bash
# Copy Wallpaper to Global Wallpaper Directory
# Run this as sudo
# First make sure /usr/share/backgrounds/ exists!


sourceWallpaperDir="$MIKE_VMShared_Drive/wallpaper"

targetWallpaperDir="/usr/share/backgrounds"

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

copyWallpaperGlobal() {

  doesDirectoryExist "$sourceWallpaperDir" ||
  {

    echo "ERROR - Source Wallpaper Directory DOES NOT EXIST!"
    echo "Source Wallpaper Directory: $sourceWallpaperDir"
    echo "Function: copyWallpaperGlobal()"
    return 41

  }

  doesDirectoryExist "$targetWallpaperDir" ||
  {

    echo "ERROR - Target Wallpaper Directory DOES NOT EXIST!"
    echo "Target Wallpaper Directory: $targetWallpaperDir"
    echo "Function: copyWallpaperGlobal()"
    return 41

  }

  cp -v -R "$sourceWallpaperDir"/* "$targetWallpaperDir" ||
  {

    return
  }

  ls "$targetWallpaperDir"

  return 0
}

makeDirIfNotExist "$targetWallpaperDir" "777" "sudo" &&
copyWallpaperGlobal &&
successMsg "All Wallpapers Copied to Destination."