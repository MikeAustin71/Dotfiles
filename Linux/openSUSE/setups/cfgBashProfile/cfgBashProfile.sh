#!/bin/bash
# DEPRECATED!!!!  NO LONGER USED!!!!
# Configure environment variables in
# .bash_profile
#

declare bashOpsSetups="$HOME"/bashOps/setups

declare targetBashProfile="$HOME/.bash_profile"

declare sourceBashProfile="$bashOpsSetups/homeDir/bash_profile.txt"

declare -i bashProfErrCode=0

source "$bashOpsSetups"/utils/utilsLib.sh


if [[ ! -f $sourceBashProfile ]]
then

    echo "*** ERROR ***"
    echo "$sourceBashProfile Does Not Exist"
    echo "Script File: cfgBashProfile.sh"
    return 99
fi


if [[ ! -f $targetBashProfile ]]
then

  touch "$targetBashProfile" ||
  {

    bashProfErrCode=$?

    echo "*** ERROR ***"
    echo "$targetBashProfile Did Not Exist"
    echo "The attempt to create this file FAILED!"
    echo "Error Code: $bashProfErrCode"
    echo "Script File: cfgBashProfile.sh"
    return $bashProfErrCode
  }

  changeFileOwner "$targetBashProfile" "$(whoami)" ||
  {

    bashProfErrCode=$?

    echo "*** ERROR ***"
    echo "Setting owner on $targetBashProfile FAILED!"
    echo "Requested new owner: $(whoami)"
    echo "Error Code: $bashProfErrCode"
    echo "Script File: cfgBashProfile.sh"
    return $bashProfErrCode
  }

  changeFilePermissions "$targetBashProfile" "775" ||
  {

    bashProfErrCode=$?

    echo "*** ERROR ***"
    echo "Setting permissions on $targetBashProfile FAILED!"
    echo "Requested Permissions: 775"
    echo "Error Code: $bashProfErrCode"
    echo "Script File: cfgBashProfile.sh"
    return $bashProfErrCode

  }

fi

cat "$sourceBashProfile" >> "$targetBashProfile" ||
 {
      bashProfErrCode=$?

      echo "*** ERROR ***"
      echo "'cat' Failed to transfer text to .bashrc"
      echo "Error Code= $bashProfErrCode"
      echo "Script: cfgBashProfile.sh"
      echo ""
      return $bashProfErrCode
 }

 # shellcheck disable=SC1090
 source "$targetBashProfile"

 echo "Environment Variables successfully configured."
 echo ".bash_profile successfully updated!"
 echo "Script File: cfgBashProfile.sh"
 return 0

