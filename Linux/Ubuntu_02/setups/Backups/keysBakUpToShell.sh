#!/bin/bash
# This script will copy and backup the "$HOME"/.gnupg directory
# to "$HOME"/.config/shell/backups/keys directory. In addition,
# the files "$HOME"/privkey.asc and "$HOME"/pubkey.asc will be
# copied to the "$HOME"/.config/shell/backups/keys directory.
#
#

declare baseSetups272Dir="$HOME"/bashOps/setups

source "$baseSetups272Dir"/utils/utilsLib.sh

declare -i keysBakToShell_ErrorCode


function deleteKeysBakupDir() {

  local -i THE_ErrorCode=0

  local sourceDir
  sourceDir="$HOME"/.gnupg

  local targetBakDir
  targetBakDir="$HOME"/.config/shell/keys

   msgNotify "Starting deletion of old key backup files in $targetBakDir"

  [[ -f $sourceDir ]] || {

    THE_ErrorCode=99

    errXMsg "FATAL SYSTEM ERROR!" "Source Directory DOES NOT EXIST!"  "Source Dir: $sourceDir" "Error Code: $THE_ErrorCode" "Function: deleteKeysBakupDir" "Script: keysBakUpToShell.sh"

    return $THE_ErrorCode

  }


  if [[ -f $targetBakDir ]]; then


        msgNotify "Target 'keys' backup directory does not exist." "Will attempt to create Directory: "  "Dir: $targetBakDir" "Function: deleteKeysBakupDir" "Script: keysBakUpToShell.sh"

          makeDirIfNotExist "$targetBakDir" "775" "" || {

            THE_ErrorCode=45

            errXMsg "Attempted creation of Target 'keys' backup directory FAILED!" "FATAL ERROR - The backup/copy operation cannot proceed!" "Dir: $targetBakDir" "Error Code: $THE_ErrorCode" "Function: deleteKeysBakupDir" "Script: keysBakUpToShell.sh"

            return $THE_ErrorCode

        }

  else

        msgNotify "Target 'keys' backup directory does exist." "Will begin deleting all old files in Directory."  "$targetBakDir" "Function: deleteKeysBakupDir" "Script: keysBakUpToShell.sh"

        zapFilesCmd "$targetBakDir" "-rfv" "sudo" || {

          THE_ErrorCode=$?

          errXMsg "Attempted file deletion in target 'keys' backup Directory Failed" "Dir: $targetBakDir" "Function: deleteKeysBakupDir" "Script: keysBakUpToShell.sh" "Error Code: $THE_ErrorCode"

          return $THE_ErrorCode
        }

  fi

  [[ -f  $targetBakDir ]] || {

   THE_ErrorCode=55

    errXMsg "SYSTEM ERROR: Target 'keys' backup directory does not exist." "Dir: $targetBakDir" "Function: deleteKeysBakupDir" "Script: keysBakUpToShell.sh" "Error Code: $THE_ErrorCode"

  }


  return $THE_ErrorCode
}

function backupKeysDir() {


  local -i THE_ErrorCode=0

  local sourceDir
  sourceDir="$HOME"/.gnupg

  local targetBakDir
  targetBakDir="$HOME"/.config/shell/keys


  [[ -f $sourceDir ]] || {

    THE_ErrorCode=99

    errXMsg "FATAL SYSTEM ERROR!" "Source Directory DOES NOT EXIST!"  "Source Dir: $sourceDir" "Error Code: $THE_ErrorCode" "Function: backupKeysDir" "Script: keysBakUpToShell.sh"

    return $THE_ErrorCode

  }

  [[ -f $targetBakDir ]] || {

    THE_ErrorCode=98

    errXMsg "FATAL SYSTEM ERROR!" "Target Keys Directory DOES NOT EXIST!"  "Target Dir: $targetBakDir" "Error Code: $THE_ErrorCode" "Function: backupKeysDir" "Script: keysBakUpToShell.sh"

    return $THE_ErrorCode

  }

  msgNotify "Beginning Backup-Copy Operation" "$sourceDir -> $targetBakDir"

  cp -Rvf "$sourceDir" "$targetBakDir" || {

    THE_ErrorCode=$?

    errXMsg "FATAL SYSTEM ERROR!" "Copy Operation Failed!" "cp -Rvf $sourceDir -> $targetBakDir"  "Error Code: $THE_ErrorCode" "Function: backupKeysDir" "Script: keysBakUpToShell.sh"
  }

  return $THE_ErrorCode
}

function backupKeyFiles() {


  local -i THE_ErrorCode=0

  local sourcePubKeyFile
  sourcePubKeyFile="$HOME"/pubkey.asc

  local sourcePrivKeyFile
  sourcePrivKeyFile="$HOME"/privkey.asc


  local destPubKeyFile
  local destPubKeyFile="$HOME"/.config/shell/keys/pubkey.asc

  local destPrivKeyFile
  local destPrivKeyFile="$HOME"/.config/shell/keys/privkey.asc

  if [[ -f $sourcePubKeyFile ]]; then

    cp -fv "$sourcePubKeyFile" "$destPubKeyFile" || {

      THE_ErrorCode=$?

      errXMsg "FATAL SYSTEM ERROR!" "Public Key copy operation FAILED!"  "cp -fv $sourcePubKeyFile -> $destPubKeyFile" "Error Code: $THE_ErrorCode" "Function: backupKeyFiles" "Script: keysBakUpToShell.sh"

      return $THE_ErrorCode

    }
  else

    msgNotify "Public Key source file does NOT Exist!" "Pub Key File: $sourcePubKeyFile" "Will attempt to backup Private Key File"

  fi


  if [[ -f $sourcePrivKeyFile ]]; then

    cp -fv "$sourcePrivKeyFile" "$destPrivKeyFile" || {

      THE_ErrorCode=42

      errXMsg "FATAL SYSTEM ERROR!" "Private Key copy operation FAILED!"  "cp -fv $sourcePrivKeyFile -> $destPrivKeyFile" "Error Code: $THE_ErrorCode" "Function: backupKeyFiles" "Script: keysBakUpToShell.sh"

      return $THE_ErrorCode

    }
  else

    msgNotify "Private Key source file does NOT Exist!" "Pub Key File: $sourcePrivKeyFile" "Nothing to do..."  "Function: backupKeyFiles" "Script: keysBakUpToShell.sh"

  fi


  return $THE_ErrorCode
}

msgNotify "Preparing to back up key files pubkey.asc and privkey.asc to ~/.config/shell/keys Directory." &&
deleteKeysBakupDir &&
msgNotify "Preparing to backup $HOME/.gnupg Directory" &&
backupKeysDir &&
msgNotify "Preparing to backup public and private key files"
backupKeyFiles &&
successMsg "Completed Backup of public and private keys"  "Script:  keysBakUpToShell.sh"  || {

  keysBakToShell_ErrorCode=$?

  errXMsg " keysBakUpToShell.sh" "Error-Exit!"

  return $keysBakToShell_ErrorCode
}
