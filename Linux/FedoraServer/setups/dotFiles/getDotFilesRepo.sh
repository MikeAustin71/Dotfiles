#!/bin/bash
# This script will download and clone the
# MikeAustin71 Dot Files git repository to the
# local 'repos' directory
# https://github.com/MikeAustin71/Dotfiles.git
#

declare -i errorExitCode=0

cd "$HOME"/repos ||
{

  mkdir -m 775 "$HOME"/repos ||
  {

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    An error occurred while attempting to\n
    create the 'repos' directory!\n
    repos directory= $HOME/repos\n
    Script= getDotFilesRepo.sh\n
    Error Code= $errorExitCode\n\n"

    exit $errorExitCode

  }

  cd "$HOME"/repos ||
  {

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    An error occurred while changing to\n
    the 'repos' directory immediately after\n
    the 'repos' directory was created.
    Script= getDotFilesRepo.sh\n
    Error Code= $errorExitCode\n\n"

    exit $errorExitCode

 }

}

git clone https://github.com/MikeAustin71/Dotfiles.git ||
{

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    An error occurred while cloning the dotfiles\n
    repository:\n
    https://github.com/MikeAustin71/Dotfiles.git\n
    Script= getDotFilesRepo.sh\n
    Error Code= $errorExitCode\n\n"

    exit $errorExitCode

}

exit 0