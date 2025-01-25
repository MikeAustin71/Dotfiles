#!/bin/bash
# Creates bashrc file if one does
# not already exist.



declare baseSetups19Dir="$HOME"/bashOps/setups

source "$baseSetups19Dir"/utils/utilsLib.sh
source "$baseSetups19Dir"/utils/utilsAppConfig.sh
source "$baseSetups19Dir"/utils/utilsAppInstall.sh


function setupBashrcFile() {

  local targetDir="$HOME"
  local targetFileName=".bashrc"
  local targetDirFileName="$targetDir/$targetFileName"
  local -i addTextErrCode=0

  local sourceFile="$baseSetups19Dir"/"configDir/shell/backups/bashrcBak/bashrc.txt"

  [[ -f $targetDirFileName ]] || {


    makeFileIfNotExist "$targetDir" "$targetFileName" "644" "" || {

      addTextErrCode=$?

      echo
      echo "Error calling makeFileIfNotExist()"
      echo "Error Code: $addTextErrCode"
      echo "Function: setupBashrcFile()"
      echo "Script File: 002a-create_bashrc_file.sh"
      echo

       return $addTextErrCode

    }

    msgNotify "Created .bashrc File. Copying initial contents"

    appendTextToFile "$sourceFile" "$targetDir" "$targetFileName" "" || {

      addTextErrCode=$?

      echo
      echo "Error calling appendTextToFile()"
      echo "Error Code: $addTextErrCode"
      echo "Function: setupBashrcFile()"
      echo "Script File: 002a-create_bashrc_file.sh"
      echo

       return $addTextErrCode

    }

    return $addTextErrCode
  }


  msgNotify ".bashrc file previously existed"

  return $addTextErrCode
}

msgNotify "Initial .bashrc file configuration" &&
setupBashrcFile &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups19Dir/stdAppInstall" &&
successMsg "bashrc File is GOOD TO GO." "Script: 002a-create_bashrc_file.sh" || {

  errXMsg "002a-create_bashrc_file.sh Execution Failed" "Error-Exit!"
}