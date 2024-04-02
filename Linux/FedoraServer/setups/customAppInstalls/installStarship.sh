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
echo   # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then


  if [ ! -f "$MIKE_Setup_Scripts/cfgBashrc/installBashUpgrades02.txt" ]
  then

        echo "*** ERROR ***"
        echo "Source Starship .bashrc code is MISSING!"
        echo "Missing File: $MIKE_Setup_Scripts/cfgBashrc/installBashUpgrades02.txt"
        echo "Script: installStarship.sh"
        echo ""
        exit 99

  fi


  if [[ ! -f "$HOME/.bashrc" ]]
  then
     touch "$HOME/.bashrc"

     chmod 775 "$HOME/.bashrc" ||
     {
        errExitCode=$?

        echo "*** ERROR ***"
        echo "chmod Failed to set 775 on .bashrc"
        echo "Error Code= $errExitCode"
        echo "Script: installStarship.sh"
        echo ""
        exit $errExitCode
    }

  fi

  cat "$MIKE_Setup_Scripts/cfgBashrc/installBashUpgrades02.txt" >> "$HOME/.bashrc" ||
  {
     errExitCode=$?

      echo "*** ERROR ***"
      echo "'cat' Failed to transfer text to .bashrc"
      echo "Error Code= $errExitCode"
      echo "Script: installStarship.sh"
      echo ""
      exit $errExitCode
  }

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
    echo ""
    exit $errExitCode
  }

fi


source "$HOME/.bashrc" ||
{
   errExitCode=$?

    echo "*** ERROR ***"
    echo "Error returned: source $HOME/.bashrc"
    echo "Error Code: $errExitCode"
    echo "Script: installStarship.sh"
    echo ""
    exit $errExitCode
}

echo "Successfully configured 'starship'!"
echo

exit 0
