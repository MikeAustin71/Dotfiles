#!/bin/bash
# Download and Install preferred fonts
#

declare NerdFontReleaseVer="v3.1.1"

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

declare CURR_FONT_NAME="3270"

makeDirIfNotExist "$XDG_DATA_FONTS/$CURR_FONT_NAME" 775 ""

changeToDir "$XDG_DATA_FONTS/$CURR_FONT_NAME"

curl -fLo "$CURR_FONT_NAME.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/$NerdFontReleaseVer/$CURR_FONT_NAME.zip"

unzip "$CURR_FONT_NAME.zip"

rm "$CURR_FONT_NAME.zip"