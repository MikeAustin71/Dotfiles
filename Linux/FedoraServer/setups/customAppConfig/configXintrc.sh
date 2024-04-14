#!/bin/bash
# This script will initialize and configure
# ~/.xinitrc

source "$MIKE_Setup_Utilities"/utilsLib.sh

declare -i errorCode=0

cp "$MIKE_Setup_Scripts"/configDir/xorg/awesome/.xinitrc "$HOME/.config/xorg/awesome" ||
{

    errorCode=$?

    # shellcheck disable=SC1009
    errXMsg ".xinitrc File Copy Failed" "$$MIKE_Setup_Scripts"/configDir/xorg/awesome/.xinitrc -> $HOME/.config/xorg/awesome" "Script: configXintrc.sh" "Error Code: $errorCode"

    return $errorCode
}

# shellcheck disable=SC1073
successMsg "Configured .xinitrc in Directory:" "$HOME/.config/xorg/awesome" "Script:configXintrc.sh"

return 0
