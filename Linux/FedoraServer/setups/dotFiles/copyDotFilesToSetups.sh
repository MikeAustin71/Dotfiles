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

declare DOTFILES_fedora="$HOME"/repos/Dotfiles/Linux/FedoraServer

declare DOTFILES_setups="$HOME"/repos/Dotfiles/Linux/FedoraServer/setups

declare GITREPO_setups="https://github.com/MikeAustin71/Dotfiles.git"


cd "$MIKE_BashOps" ||
{

  mkdir -m 775 "$MIKE_BashOps" ||
  {

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    An error occurred while attempting to\n
    create the 'bashOps' directory where\n
    dot file 'setups' will reside!\n
    bashOps directory= $HOME_bashOps\n
    Script= copyDotFilesToSetups.sh\n
    Error Code= $errorExitCode\n\n"

    exit $errorExitCode

  }

}


cd "$DOTFILES_setups"  ||
{

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    The target Dot Files directory does NOT\n
    exist in the 'repos' directory! The Dot\n
    Files Repository has NOT been properly cloned!\n
    Local Dot Files Setups Directory= $DOTFILES_setups\n
    Target Git Repository=\n
    $GITREPO_setups\n
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
    $GITREPO_setups\n
    Script= copyDotFilesToSetups.sh\n
    Error Code= $errorExitCode\n\n"

    exit $errorExitCode

}

if [[ -d $MIKE_Setup_Scripts ]]
then

  rm -rf "${MIKE_Setup_Scripts:?}/"* ||
  {

    echo -e "*** ERROR ***\n
    Attempted removal of pre-existing scripts\n
    directory failed!\n
    Target Scripts Directory: "
  }

fi

cp -vfr "$DOTFILES_setups"/* "$MIKE_BashOps" ||
{

  errorExitCode=$?

  echo -e "*** ERROR ***\n
  An error occurred while attempting to copy\n
  dot file setups to the 'bashOps' directory.\n
  Source Git Repo Dot Files Setups Directory=\n
  $GITREPO_setups\n
  Destination 'bashOps' Directory=\n
  $MIKE_BashOps
  Script= copyDotFilesToSetups.sh\n
  Error Code= $errorExitCode\n\n"

  exit $errorExitCode

}

exit 0