#!/bin/bash
# Downloads and Installs Latest Release of 'starship'
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

read -p "Configure Starship in .bashrc? (Y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

   if [[ ! -f "$HOME/.bashrc" ]]
   then
     touch "$HOME/.bashrc"
   fi

   cat "$MIKE_Setup_Scripts/bashFix/installBashUpgrades02.txt" >> "$HOME/.bashrc"
fi

read -p "Configure default starship.toml file? (Y/n) " -n 1 -r
echo    # (optional) move to a new line

if [[ $REPLY =~ ^[Yy]$ ]]
then

  cp "$MIKE_Setup_Scripts/configDir/starship/starship.toml"  "$STARSHIP_CONFIG" ||
  {
    errExitCode=$?

    echo "*** ERROR ***"
    echo "Error occurred while copying starship.toml"
    echo "Destination: $STARSHIP_CONFIG"
    echo "Error Code: $errExitCode"
    echo "Script: installStarship.sh"

    exit $errExitCode
  }

fi

echo "Successfully configured 'starship'!"
echo

exit 0
