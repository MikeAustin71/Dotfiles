#!/bin/bash
# Used to delete all files and directories
# in $HOME/bashOps/setups
#   --- BE CAREFUL ---


declare baseSetups990Dir="$HOME"/bashOps/setups
declare homeBase990Dir="$HOME"/secretSauce

rm -rf "${baseSetups990Dir:?}/"*

cd "$homeBase990Dir" || {

  echo "wipeSetups.sh failed to change directory to home!"
  echo "home directory = $homeBase990Dir"

  return 99

}

