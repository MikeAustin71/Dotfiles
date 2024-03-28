#!/bin/bash
# Copies 'setups' directory from DotFiles repository
# to bashOps/setups directory. The DotFiles should
# have previously cloned from:
# https://github.com/MikeAustin71/Dotfiles.git
# and downloaded to:
# HOME/repos/Dotfiles/Linux/FedoraServer/setups
#
# This script file will copy the 'setups' directory
# to: HOME/bashOps
#
# Finally, it will run the configureSetups.sh script.

declare -i errorExitCode=0

declare DOTFILES_base="$HOME/repos/Dotfiles"

declare DOTFILES_fedora="$DOTFILES_base/Linux/FedoraServer"

declare DOTFILES_setups="$HOME/repos/Dotfiles/Linux/FedoraServer/setups"

declare cfgSetupsScriptFile="configureSetups.sh"

declare cfgHOME_bashOps="$HOME/bashOps"

declare cfgHome_setupScripts="$HOME/bashOps/setups"

declare cfgSetupsScript="$cfgHome_setupScripts/cfgSetups/$cfgSetupsScriptFile"

declare targetSetupScriptFile="$HOME/cfgSetupsScriptFile"

if [[ ! -d $cfgHOME_bashOps ]]
then

  mkdir -p "$cfgHOME_bashOps" ||
  {

    errorExitCode=$?

    echo "*** ERROR ***"
    echo "Failed to create directory:"
    echo "   $cfgHOME_bashOps"
    echo "Error Code= $errorExitCode"
    echo "Script= copyDotFilesToSetups.sh"

    exit $errorExitCode

  }

  chmod 775 "$cfgHOME_bashOps" ||
  {

    errorExitCode=$?

    echo "*** ERROR ***"
    echo "Error occurred while changing permissions"
    echo "on Directory: $cfgHOME_bashOps"
    echo "Error Code= $errorExitCode"
    echo "Script= copyDotFilesToSetups.sh"

    exit $errorExitCode

  }

fi

if [[ -d $cfgHome_setupScripts ]]
then

    sudo rm -rf "${cfgHome_setupScripts:?}" ||
    {

      errorExitCode=$?

      echo "*** ERROR ***"
      echo "Failed to remove directory:"
      echo "   $cfgHome_setupScripts"
      echo "Error Code= $errorExitCode"
      echo "Script= copyDotFilesToSetups.sh"

      exit $errorExitCode

    }

fi


cd "$DOTFILES_setups"  ||
{

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    The target Dot Files setups directory does NOT\n
    exist in the 'repos' directory! The Dot\n
    Files Repository has NOT been properly cloned!\n
    Local Dot Files Setups Directory= $DOTFILES_setups\n
    Target Git Repository=\n
    $cfgHome_setupScripts\n
    Script= copyDotFilesToSetups.sh\n
    Error Code= $errorExitCode\n\n"

    exit $errorExitCode

}

cd "$DOTFILES_fedora" ||
{

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    The parent Dot Files directory does NOT\n
    exist in the 'repos' directory! The Dot\n
    Files Repository has NOT been properly cloned!\n
    Local Dot Files Parent Directory= $DOTFILES_fedora\n
    Target Git Repository=\n
    $cfgHome_setupScripts\n
    Script= copyDotFilesToSetups.sh\n
    Error Code= $errorExitCode\n\n"

    exit $errorExitCode

}

cp -vfr "${DOTFILES_setups:?}" "$cfgHOME_bashOps" ||
{

  errorExitCode=$?

  echo -e "*** ERROR ***\n
  An error occurred while attempting to copy\n
  dot file setups to the 'bashOps' directory.\n
  Source Git Repo Dot Files Setups Directory=\n
  $GITREPO_setups\n
  Destination 'bashOps' Directory=\n
  $MIKE_BashOps\n
  Script= copyDotFilesToSetups.sh\n
  Error Code= $errorExitCode\n\n"

  exit $errorExitCode

}

if [[ ! -d $cfgHome_setupScripts ]]
then

  echo "*** ERROR ***"
  echo "$MIKE_Setup_Scripts directory DOES NOT EXIST!"
  echo "The copy operation FAILED!"
  echo "Script= copyDotFilesToSetups.sh"
  echo ""

  exit 99

fi

if [[ -f $cfgSetupsScript ]]
then

  if [[ -f $targetSetupScriptFile ]]
  then

    rm "$targetSetupScriptFile" ||
    {
      errorExitCode=$?

      echo "*** ERROR ***"
      echo "FAILED to delete pre-existing file:"
      echo "   $targetSetupScriptFile"
      echo "Error Code= $errorExitCode"
      echo "Script= copyDotFilesToSetups.sh"

      exit $errorExitCode

    }

  fi

  cp -v "$cfgSetupsScript" "$targetSetupScriptFile" ||
  {

    errorExitCode=$?

    echo "*** ERROR ***"
    echo "FAILED to Copy $cfgSetupsScript to $targetSetupScriptFile"
    echo "Error Code= $errorExitCode"
    echo "Script= copyDotFilesToSetups.sh"

    exit $errorExitCode
  }

  chown "$(whoami)":"$(whoami)" "$targetSetupScriptFile" ||
  {

    errorExitCode=$?

    echo "*** ERROR ***"
    echo "chown Command FAILURE:"
    echo "Target File: $targetSetupScriptFile"
    echo "New Owner: $(whoami)"
    echo "Error Code= $errorExitCode"
    echo "Script= copyDotFilesToSetups.sh"

    exit $errorExitCode

  }

  chmod 775 "$targetSetupScriptFile" ||
  {

    errorExitCode=$?

    echo "*** ERROR ***"
    echo "chmod Command FAILURE:"
    echo "Target File: $targetSetupScriptFile"
    echo "New Permissions Code: 775"
    echo "Error Code= $errorExitCode"
    echo "Script= copyDotFilesToSetups.sh"

    exit $errorExitCode

  }

  dos2unix "$targetSetupScriptFile" ||
  {

    errorExitCode=$?

    echo "*** ERROR ***"
    echo "Command FAILURE:"
    echo "dos2Unix $targetSetupScriptFile"
    echo "Error Code= $errorExitCode"
    echo "Script= copyDotFilesToSetups.sh"

    exit $errorExitCode
  }

fi

".$targetSetupScriptFile"

exit