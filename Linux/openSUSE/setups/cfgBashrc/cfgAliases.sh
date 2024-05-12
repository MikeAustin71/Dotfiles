#!/bin/bash
# #############################
# DEPRECATED!! NO LONGER USED!!
# #############################
# Configure Aliases in:
#   $HOME/.config/aliases
#   .bashrc
# User has option to update .bashrc


declare setupScripts="$HOME/bashOps/setups"

declare aliasTargetDir="$HOME/.config/shell/aliases"

declare aliasTargetFile="$aliasTargetDir/aliases.sh"

declare aliasSourceFile="$HOME/bashOps/setups/configDir/shell/aliases/aliases.sh"

declare -i aliasExitCode=0

source "$setupScripts/utils/utilsLib.sh"


if [[ ! -f $aliasSourceFile ]]
then
    echo "*** ERROR ***"
    echo "Alias Source File DOES NOT EXIST!"
    echo "Alias Source File= $aliasSourceFile"
    echo "Script Name: cfgAliases.sh"
    return 99
fi

if [[ -f $aliasTargetFile ]]
then

    sudo rm "$aliasTargetFile" ||
    {

      aliasExitCode=$?

      echo "*** ERROR ***"
      echo "Removal of Old Alias Target File FAILED!"
      echo "Alias Target File= $aliasTargetFile"
      echo "Script Name: cfgAliases.sh"
      return $aliasExitCode

    }

fi

cp -v "$aliasSourceFile" "$aliasTargetFile" ||
{

      aliasExitCode=$?

      echo "*** ERROR ***"
      echo "Copy Source Alias File To Target Alias File FAILED!"
       echo "Alias Source File= $aliasSourceFile"
      echo "Alias Target File= $aliasTargetFile"
      echo "Script Name: cfgAliases.sh"
      return $aliasExitCode

}

read -p "Configure Aliases in .bashrc? (Y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

  if [ ! -f "$setupScripts/cfgBashrc/installBashUpgrades01.txt" ]
  then

        echo "*** ERROR ***"
        echo "Source Starship .bashrc code is MISSING!"
        echo "Missing File: $setupScripts/cfgBashrc/installBashUpgrades01.txt"
        echo "Script: cfgAliases.sh"
        echo ""
        return 99

  fi

   if [[ ! -f "$HOME/.bashrc" ]]
   then
     touch "$HOME/.bashrc"

     chmod 775 "$HOME/.bashrc" ||
     {
        aliasExitCode=$?

        echo "*** ERROR ***"
        echo "chmod Failed to set 775 on .bashrc"
        echo "Error Code= $aliasExitCode"
        echo "Script: cfgAliases.sh"
        echo ""
        return $aliasExitCode
    }

   fi

   cat "$setupScripts/cfgBashrc/installBashUpgrades01.txt" >> "$HOME/.bashrc" ||
   {
       aliasExitCode=$?

        echo "*** ERROR ***"
        echo "'cat' Failed to transfer text to .bashrc"
        echo "Error Code= $aliasExitCode"
        echo "Script: cfgAliases.sh"
        echo ""
        return $aliasExitCode
   }

fi

 source "$HOME/.bashrc" ||
 {
    aliasExitCode=$?

    echo "*** ERROR ***"
    echo "Error returned: source $HOME/.bashrc"
    echo "Error Code: $aliasExitCode"
    echo "Script: cfgAliases.sh"
    echo ""
    return $aliasExitCode
 }


 echo "Aliases successfully configured!"
 echo ".bashrc successfully updated!"
 echo "Script File: cfgAliases.sh"

return 0

