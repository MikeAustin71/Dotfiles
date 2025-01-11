#!/bin/bash
#
# Copy User Path Parameters
# to $HOME/.config/shell/path


declare bashOpsSetups="$HOME"/bashOps/setups

source "$bashOpsSetups"/utils/utilsLib.sh

declare sourcePathParmsFile="$bashOpsSetups"/configDir/shell/path/userPath.sh


declare targetPathDir="$HOME"/.config/shell/path

declare targetPathFile="$targetPathDir"/userPath.sh

declare -i errorCode=0

if [[ ! -f $sourcePathParmsFile ]]
then

    errXMsg "Source User Path Parms file is missing!" "Path File: $sourcePathParmsFile" "Script: cfgUserPath.sh" "Error Code: 99"

    return 99
fi

makeDirIfNotExist "$targetPathDir" "775" "" ||
{
  errorCode=$?

  errXMsg "Error Creating Target Path Directory:" "$targetPathDir" "Script: cfgUserPath.sh" "Error Code: $errorCode"

  return $errorCode
}

cp -v "$sourcePathParmsFile" "$targetPathFile" ||
{
   errorCode=$?

  errXMsg "Error - Copy Operation Failed!" "$sourcePathParmsFile -> $targetPathFile" "Script: cfgUserPath.sh" "Error Code: $errorCode"

  return $errorCode
}

return 0


