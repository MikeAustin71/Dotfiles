#!/bin/bash
# Copies 'setups' directory from DotFiles repository
# to bashOps/setups directory. The DotFiles should
# have previously cloned from:
# https://github.com/MikeAustin71/Dotfiles.git
# and downloaded to:
# HOME/repos/Dotfiles/Linux/FedoraServer/setups
#
# This script file will copy the 'setups' directory
# to:
# HOME/bashOps

declare -i errorExitCode=0

declare DOTFILES_base="$HOME/repos/Dotfiles"

declare DOTFILES_fedora="$DOTFILES_base/Linux/FedoraServer"

declare DOTFILES_setups="$HOME/repos/Dotfiles/Linux/FedoraServer/setups"

declare cfgSetupsScriptFile="configureSetups.sh"

declare cfgHOME_bashOps="$HOME/bashOps"

declare cfgHome_setupScripts="$HOME/bashOps/setups"

declare cfgSetupsScript="$cfgHome_setupScripts/cfgSetups/$cfgSetupsScriptFile"

cd "$cfgHOME_bashOps" ||
{

  mkdir -m 775 "$cfgHOME_bashOps" ||
  {

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    An error occurred while attempting to\n
    create the 'bashOps' directory where\n
    dot file 'setups' will reside!\n
    bashOps directory= $cfgHOME_bashOps\n
    Script= copyDotFilesToSetups.sh\n
    Error Code= $errorExitCode\n\n"

    exit $errorExitCode

  }

}


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

if [[ -d $cfgHome_setupScripts ]]
then

  sudo rm -rf "${cfgHome_setupScripts:?}" ||
  {

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    Attempted removal of pre-existing scripts\n
    files failed!\n
    Target Files in Scripts Directory:\n
    $cfgHome_setupScripts\n
    Script= copyDotFilesToSetups.sh\n
    Error Code= $errorExitCode\n\n"

    exit $errorExitCode

 }


fi

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

  cp -v "$cfgSetupsScript" "$HOME/$cfgSetupsScriptFile" ||
  {

    errorExitCode=$?

    echo "*** ERROR ***"
    echo "FAILED to Copy $cfgSetupsScript to $HOME/$cfgSetupsScriptFile"
    echo "Error Code= $errorExitCode"
    echo "Script= copyDotFilesToSetups.sh"

    exit $errorExitCode
  }

  changeFileOwner "$HOME/$cfgSetupsScriptFile" "$(whoami)" ||
  {

    errorExitCode=$?

    echo "*** ERROR ***"
    echo "Command FAILURE:"
    echo "changeFileOwner $HOME/$cfgSetupsScriptFile"
    echo "New Owner: $(whoami)"
    echo "Error Code= $errorExitCode"
    echo "Script= copyDotFilesToSetups.sh"

    exit $errorExitCode

  }

  changeFilePermissions 775 "$HOME/$cfgSetupsScriptFile" ||
  {

    errorExitCode=$?

    echo "*** ERROR ***"
    echo "Command FAILURE:"
    echo "changeFilePermissions $HOME/$cfgSetupsScriptFile"
    echo "New Permissions Code: 775"
    echo "Error Code= $errorExitCode"
    echo "Script= copyDotFilesToSetups.sh"

    exit $errorExitCode

  }

  dos2Unix "$HOME/$cfgSetupsScriptFile" ||
  {

    errorExitCode=$?

    echo "*** ERROR ***"
    echo "Command FAILURE:"
    echo "dos2Unix $HOME/$cfgSetupsScriptFile"
    echo "Error Code= $errorExitCode"
    echo "Script= copyDotFilesToSetups.sh"

    exit $errorExitCode
  }

fi

exit 0