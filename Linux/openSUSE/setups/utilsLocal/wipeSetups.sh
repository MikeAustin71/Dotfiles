#!/bin/bash
# Used to delete all files and directories
# in $HOME/bashOps/setups
#   --- BE CAREFUL ---


  declare baseSetups990Dir="$HOME"/bashOps/setups
  declare homeBase990Dir="$HOME"/secretSauce
  declare -i wipeSetupsErrCode=0

  echo
  echo "                       HEADS UP!                               "
  echo "  *************************************************************"
  echo "  This bash script will delete and remove the setups directory:"
  echo "  $baseSetups990Dir"
  echo "  *************************************************************"
  echo
  declare wipePrompt="  Do you want to delete the setups directory (Yy/Nn)?"
  read -p "$wipePrompt" -r -N 1 answer

  if [ "$answer" == "${answer#[Yy]}" ] ;then
      echo
      echo "  You did NOT respond 'Yes'."
      echo "  Therefore, the setups directory WILL NOT BE DELETED."
      echo "  This script will now exit."
      echo "  Have a nice day!"
      echo "  Script File: wipeSetups.sh"
      echo

      exit 0
  fi

  rm -rf "${baseSetups990Dir:?}/"* ||
  {

    wipeSetupsErrCode=$?

    echo "  Deletion and Removal of Setups Directory Failed!"
    echo "  Command:  rm -rf ${baseSetups990Dir:?}/*"
    echo "  Error Code: $wipeSetupsErrCode"
    echo "  Script File: wipeSetups.sh"
    return $wipeSetupsErrCode
  }

  cd "$homeBase990Dir" || {

    wipeSetupsErrCode=$?

    echo "  wipeSetups.sh failed to change directory to home base!"
    echo "  home base directory = $homeBase990Dir"
    echo "  Command: cd $homeBase990Dir"
    echo "  Error Code: $wipeSetupsErrCode"
    echo "  Script File: wipeSetups.sh"
    return $wipeSetupsErrCode

  }

  echo
  echo "  ************************************************"
  echo "              Successful Completion"
  echo "  All files and sub-directories in the directory:"
  echo "  $baseSetups990Dir"
  echo "  Have Been Deleted. Task Completed!"
  echo "  ************************************************"
  echo

  exit 0
