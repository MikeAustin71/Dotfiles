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

declare DOTFILES_fedora="$MIKE_DotFiles_Repo"/Linux/FedoraServer

declare DOTFILES_setups="$MIKE_DotFiles_Repo"/Linux/FedoraServer/setups


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
    $MIKE_GitRepo_DotFiles\n
    Script= copyDotFilesToSetups.sh\n
    Error Code= $errorExitCode\n\n"

    exit $errorExitCode

}

if [[ -d $MIKE_Setup_Scripts ]]
then

  sudo rm -rf "${MIKE_Setup_Scripts:?}" ||
  {

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    Attempted removal of pre-existing scripts\n
    files failed!\n
    Target Files in Scripts Directory:\n
    $MIKE_Setup_Scripts\n
    Script= copyDotFilesToSetups.sh\n
    Error Code= $errorExitCode\n\n"

    exit $errorExitCode

 }


fi

cp -vfr "${DOTFILES_setups:?}/"* "$MIKE_BashOps" ||
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

exit 0