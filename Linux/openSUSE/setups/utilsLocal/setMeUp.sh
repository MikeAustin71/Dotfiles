#!/bin/bash
# Used to pull down latest version of dotfiles and
# configure  ~/bashOps/setups

  declare targFileName="copyDotFilesToSetups.sh"

  declare targHomeFile="$HOME/$targFileName"

  declare DOTFILES_base="$HOME/repos/Dotfiles"

  declare DOTFILES_openSUSE="$DOTFILES_base/Linux/openSUSE"

  declare DOTFILES_setups="$DOTFILES_openSUSE"/setups

  declare sourceTargFile="$DOTFILES_setups/cfgDotFiles/$targFileName"

  declare -i errExitCode=0

  if [[ -f $targHomeFile ]]
  then

    rm "$targHomeFile" ||
    {
      errExitCode=$?

      echo "Deletion of old file: $targHomeFile FAILED!"
      echo "Error Code: $errExitCode"
      echo "Script File: setMeUp.sh"
      return $errExitCode

    }

  fi

  cd "$DOTFILES_base" ||
  {
    errExitCode=$?

    echo "cd $DOTFILES_base FAILED!"
    echo "Error Code: $errExitCode"
    echo "Script File: setMeUp.sh"
    return $errExitCode
  }

  git pull origin main

  cp "$sourceTargFile" "$targHomeFile" ||
  {
    errExitCode=$?

    echo "Copy Target File FAILED!"
    echo "Target File: $targHomeFile"
    echo "Source File: $sourceTargFile"
    echo "Error Code: $errExitCode"
    echo "Script File: setMeUp.sh"
    return $errExitCode

  }

  cd "$HOME" ||
  {
    errExitCode=$?

    echo "cd $HOME FAILED!"
    echo "Error Code: $errExitCode"
    echo "Script File: setMeUp.sh"
    return $errExitCode
  }

  chmod 775 ./"$targFileName" ||
  {
    errExitCode=$?

    echo "chmod 775 ./$targFileName FAILED!"
    echo "Error Code: $errExitCode"
    echo "Script File: setMeUp.sh"
    return $errExitCode
  }

  # shellcheck disable=SC1090
  source "$targFileName" ||
  {
     errExitCode=$?

    echo
    echo "Sourcing $targFileName Failed!"
    echo "Command: source $targFileName"
    echo "Error Code: $errExitCode"
    echo "Script File: setMeUp.sh"
    echo
    return $errExitCode
  }

  exit 0
