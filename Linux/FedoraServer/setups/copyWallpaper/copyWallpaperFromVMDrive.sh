#!/bin/bash
# Copy Wallpaper to Global Wallpaper Directory
# Run this as sudo
# First make sure /usr/share/backgrounds/ exists!


sourceWallpaperDir="$MIKE_VMShared_Drive/wallpaper"

targetWallpaperDir="$MIKE_Wallpaper_Directory"

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
    return 42

  }

  sudo cp -v -R "$sourceWallpaperDir"/* "$targetWallpaperDir" ||
  {

    echo "   ***  ERROR  ***"
    echo "Attempt to copy wallpapers from source"
    echo "to destination, FAILED!"
    echo "Source Wallpaper Directory: $sourceWallpaperDir"
    echo "Target Wallpaper Directory: $targetWallpaperDir"
    echo "Function: copyWallpaperFromVMDrive()"

    return 43
  }

  ls "$targetWallpaperDir"

  return 0
}

makeDirIfNotExist "$targetWallpaperDir" "777" "sudo" &&
copyWallpaperGlobal &&
successMsg "All Wallpapers Copied to Destination."