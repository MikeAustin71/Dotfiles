#!/bin/bash
# Creates bashrc file



declare baseSetups9Dir="$HOME"/bashOps/setups

source "$baseSetups9Dir"/utils/utilsLib.sh
source "$baseSetups9Dir"/utils/utilsAppConfig.sh
source "$baseSetups9Dir"/utils/utilsAppInstall.sh


function setupBashrcFile() {

  local targetDir="$HOME"
  local targetFileName=".bashrc"
  local targetDirFileName="$targetDir/$targetFileName"
  local -i addTextErrCode=0

  local sourceFile="$baseSetups9Dir"/"configDir/shell/backups/bashrcBak/bashrc.txt"

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
successMsg "bashrc File is GOOD TO GO." "Script: 002a-create_bashrc_file.sh" || {

  errXMsg "002a-create_bashrc_file.sh Execution Failed" "Error-Exit!"
}