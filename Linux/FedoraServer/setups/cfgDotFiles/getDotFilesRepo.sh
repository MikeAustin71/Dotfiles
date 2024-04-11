#!/bin/bash
# This script will download and clone the
# MikeAustin71 Dot Files git repository to the
# local 'repos' directory
# https://github.com/MikeAustin71/Dotfiles.git
#

if [[ -z $MIKE_Git_Repos ]]
then

  echo "  ***  ERROR  ***"
  echo "MIKE_Git_Repos Environment Variable is EMPTY!"
  echo "Script= getDotFilesRepo.sh"
  return 156

fi

if [[ -z $MIKE_GitRepo_DotFiles ]]
then

  echo "  ***  ERROR  ***"
  echo "MIKE_GitRepo_DotFiles Environment Variable is EMPTY!"
  echo "Script= getDotFilesRepo.sh"
  return 156

fi

declare -i errorExitCode=0

cd "$MIKE_Git_Repos" ||
{

  mkdir -m 775 "$MIKE_Git_Repos" ||
  {

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    An error occurred while attempting to\n
    create the 'repos' directory!\n
    repos directory= $HOME/repos\n
    Script= getDotFilesRepo.sh\n
    Error Code= $errorExitCode\n\n"

    return $errorExitCode

  }

  cd "$MIKE_Git_Repos" ||
  {

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    An error occurred while changing to\n
    the 'repos' directory immediately after\n
    the 'repos' directory was created.
    Script= getDotFilesRepo.sh\n
    Error Code= $errorExitCode\n\n"

    return $errorExitCode

 }

}

git clone "$MIKE_GitRepo_DotFiles" ||
{

    errorExitCode=$?

    echo -e "*** ERROR ***\n
    An error occurred while cloning the dotfiles\n
    repository:\n
    $MIKE_GitRepo_DotFiles\n
    Script= getDotFilesRepo.sh\n
    Error Code= $errorExitCode\n\n"

    return $errorExitCode

}

return 0