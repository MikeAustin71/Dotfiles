#!/bin/bash
# Starship Installation test
#

declare -i errExitCode=0

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

curl -fsSL https://starship.rs/install.sh | bash ||
{
    errExitCode=$?

    echo "*** ERROR ***"
    echo "Error returned from Starship Installation!"
    echo "Error Code= $errExitCode"
    echo "Script: installStarship.sh"
    echo ""
    exit $errExitCode
}
