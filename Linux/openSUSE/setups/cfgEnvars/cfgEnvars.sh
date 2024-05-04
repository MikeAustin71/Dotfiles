#!/bin/bash
# Copy Environment Variables
# to $HOME/.config/shell/envars


declare bashOpsSetups="$HOME"/bashOps/setups

declare sourceEnvarsDir="$bashOpsSetups"/configDir/shell/envars

declare sourceEnvarsFile="$sourceEnvarsDir"/envars.sh

declare targetEnvarsDir="$HOME"/.config/shell/envars

declare targetEnvarsFile="$targetEnvarsDir"/envars.sh

source "$bashOpsSetups"/utils/utilsLib.sh

declare -i errorCode=0

if [[ ! -f $sourceEnvarsFile ]]
then

    errXMsg "Source Environment Variables file is missing!" "Envars File: $sourceEnvarsFile" "Script: cfgEnvars.sh" "Error Code: 99"

    return 99
fi

makeDirIfNotExist "$targetEnvarsDir" "775" "" ||
{
  errorCode=$?

  errXMsg "Error Creating Target Envars Directory:" "$targetEnvarsDir" "Script: cfgEnvars.sh" "Error Code: $errorCode"

  return $errorCode
}


cp -v "$sourceEnvarsFile" "$targetEnvarsFile" ||
{
   errorCode=$?

  errXMsg "Error - Copy Operation Failed!" "$sourceEnvarsFile -> $targetEnvarsFile" "Script: cfgEnvars.sh" "Error Code: $errorCode"

  return $errorCode
}

return 0
