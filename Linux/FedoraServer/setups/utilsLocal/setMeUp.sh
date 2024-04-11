#!/bin/bash
# Used to pull down latest version of dotfiles and
# configure  ~/bashOps/setups

declare targFileName="copyDotFilesToSetups.sh"

declare targHomeFile="$HOME/$targFileName"

declare -i errExitCode=0

if [[ -f $targHomeFile ]]
then
	rm "$targHomeFile"
fi

cd "$HOME"/repos/Dotfiles ||
{
  errExitCode=$?

  echo "cd $HOME/repos/Dotfiles FAILED!"
  echo "Error Code: $errExitCode"
  echo "Script File: setMeUp.sh"
  return $errExitCode
}

git pull origin main

cp "$HOME/repos/Dotfiles/Linux/FedoraServer/setups/cfgDotFiles/$targFileName" "$targHomeFile" ||
{
  errExitCode=$?

  echo "Copy Target File FAILED!"
  echo "Target File: $targHomeFile"
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

./"$targFileName"
