#!/bin/bash
# This script will initialize and configure
# ~/.xinitrc

source "$MIKE_Setup_Utilities"/utilsLib.sh

declare -i errorCode=0

cp "$MIKE_Setup_Scripts"/homeDir/.xinitrc "$HOME" ||
{

    errorCode=$?

    errXMsg "'.xinitrc' File Copy Failed" "$MIKE_Setup_Scripts/homeDir/.xinitrc -> $HOME" "Script: configXintrc.sh" "Error Code: $errorCode"

    return $errorCode
}

successMsg "Configured .xinitrc in Home Directory." "Script: configXintrc.sh"

return 0
