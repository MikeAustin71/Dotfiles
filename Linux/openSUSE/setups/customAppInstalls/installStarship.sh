#!/bin/bash
# Downloads and Installs Latest Release of 'starship'
#

declare -i errExitCode=0

declare starshipSetupsDir="$HOME"/bashOps/setups

declare starshipCfgDir="$HOME"/.config/starship

declare starshipCfgFile="$starshipCfgDir"/starship.toml

source "$starshipSetupsDir/utils/utilsLib.sh"

sudo curl -fsSL https://starship.rs/install.sh | sh ||
{
    errExitCode=$?

    echo "*** ERROR ***"
    echo "Error returned from Starship Installation!"
    echo "Error Code= $errExitCode"
    echo "Script: installStarship.sh"
    echo ""
    return $errExitCode
}

echo ""
echo ""
read -p "Configure Starship in .bashrc? (Y/n) " -n 1 -r
echo   # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then


  if [ ! -f "$starshipSetupsDir/cfgBashrc/installBashUpgrades02.txt" ]
  then

        echo "*** ERROR ***"
        echo "Source Starship .bashrc code is MISSING!"
        echo "Missing File: $starshipSetupsDir/cfgBashrc/installBashUpgrades02.txt"
        echo "Script: installStarship.sh"
        echo ""
        return 99

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
        return $errExitCode
    }

  fi

  cat "$starshipSetupsDir/cfgBashrc/installBashUpgrades02.txt" >> "$HOME/.bashrc" ||
  {
     errExitCode=$?

      echo "*** ERROR ***"
      echo "'cat' Failed to transfer text to .bashrc"
      echo "Error Code= $errExitCode"
      echo "Script: installStarship.sh"
      echo ""
      return $errExitCode
  }

fi

read -p "Configure default starship.toml file? (Y/n) " -n 1 -r
echo    # (optional) move to a new line

if [[ $REPLY =~ ^[Yy]$ ]]
then

  cp "$starshipSetupsDir/configDir/starship/starship.toml"  "$starshipCfgFile" ||
  {
    errExitCode=$?

    echo "*** ERROR ***"
    echo "Error occurred while copying starship.toml"
    echo "Destination: $starshipCfgFile"
    echo "Error Code: $errExitCode"
    echo "Script: installStarship.sh"
    echo ""
    return $errExitCode
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
    return $errExitCode
}

echo "Successfully configured 'starship'!"
echo

return 0
