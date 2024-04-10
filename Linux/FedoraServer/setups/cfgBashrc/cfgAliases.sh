#!/bin/bash
# Configure Aliases in:
#   $HOME/.config/aliases
#   .bashrc
# User has option to update .bashrc

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

declare aliasTargetDir="$XDG_CONFIG_ALIASES"

declare aliasTargetFile="$aliasTargetDir/aliases.sh"

declare aliasSourceFile="$MIKE_Setup_Scripts/configDir/aliases/aliases.sh"

declare -i aliasExitCode=0

if [[ ! -f $aliasSourceFile ]]
then
    echo "*** ERROR ***"
    echo "Alias Source File DOES NOT EXIST!"
    echo "Alias Source File= $aliasSourceFile"
    echo "Script Name: cfgAliases.sh"
    exit 99
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
      exit $aliasExitCode

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
      exit $aliasExitCode

}

read -p "Configure Aliases in .bashrc? (Y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

  if [ ! -f "$MIKE_Setup_Scripts/cfgBashrc/installBashUpgrades01.txt" ]
  then

        echo "*** ERROR ***"
        echo "Source Starship .bashrc code is MISSING!"
        echo "Missing File: $MIKE_Setup_Scripts/cfgBashrc/installBashUpgrades01.txt"
        echo "Script: cfgAliases.sh"
        echo ""
        exit 99

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
        exit $aliasExitCode
    }

   fi

   cat "$MIKE_Setup_Scripts/cfgBashrc/installBashUpgrades01.txt" >> "$HOME/.bashrc" ||
   {
       aliasExitCode=$?

        echo "*** ERROR ***"
        echo "'cat' Failed to transfer text to .bashrc"
        echo "Error Code= $aliasExitCode"
        echo "Script: cfgAliases.sh"
        echo ""
        exit $aliasExitCode
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
    exit $aliasExitCode
 }


 echo "Aliases successfully configured!"
 echo ".bashrc successfully updated!"
 echo "Script File: cfgAliases.sh"

exit 0

