#!/bin/bash
# Used to pull down latest version of dotfiles and
# git pull origin main


declare baseRepo10Dir="$HOME"/repos/Dotfiles
declare homeBase10Dir="$HOME"/secretSauce

cd "$baseRepo10Dir" || {
  echo "updateDotFilesRepo.sh failed to set repo path!"
  echo "Repo Path: $baseRepo10Dir"

  return 98
}

git pull origin main

cd "$homeBase10Dir" || {

  echo "updateDotFilesRepo.sh failed to change directory to home!"
  echo "home directory = $homeBase10Dir"

   return 99

}

exit 0




