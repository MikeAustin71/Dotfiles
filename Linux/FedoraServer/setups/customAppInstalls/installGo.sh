#!/bin/bash
# Downloads Latest Release of Go Programming Language
# Taken from 'Coding with Cody'
# https://codingwithcody.com/2022/03/09/install-latest-version-go-bash/

source "$MIKE_Setup_Utilities"/utilsLib.sh

# Fetch the latest version number
LATEST_GO_VERSION=$(curl 'https://go.dev/VERSION?m=text')

downloadInstallGo() {

  # Are we in the correct directory?
  isCorrectCurrentDir "$MIKE_Scratch" "Target Directory" ||
  {

    echo "Invalid Current Directory"
    echo "Expected Directory: $MIKE_Scratch"
    echo "Actual Directory: $(pwd)"
    echo "Function: downloadAppArchive()"
    return 119

  }

  local -i errorCode=0

  # Download the tarball
  wget "https://go.dev/dl/$LATEST_GO_VERSION.linux-amd64.tar.gz" ||
  {

    errorCode=$?

    echo "*** ERROR ***"
    echo "'wget' failed to download the 'go' tarball!"
    echo "Error Code= $errorCode"
    echo "Function: downloadInstallGo()"

    return $errorCode
  }

  # Clear old installations
  rm -rf /usr/local/go


  # Unpack the tarball
  tar -C /usr/local -xzf "$LATEST_GO_VERSION".linux-amd64.tar.gz ||
  {
    errorCode=$?

    echo "*** ERROR ***"
    echo "'tar' failed to unpack the 'go' tarball!"
    echo "'go' was NOT installed!"
    echo "Error Code= $errorCode"
    echo "Function: downloadInstallGo()"

    return $errorCode

  }

  # Cleanup the download
  rm "$LATEST_GO_VERSION".linux-amd64.tar.gz ||
  {
    errorCode=$?

     echo "*** ERROR ***"
     echo "Failed to delete tarball after"
     echo "'go' was installed!"
     echo "The 'go' installation was successful,"
     echo "but the 'go' tarball remains."
     echo "Error Code= $errorCode"
     echo "Function: downloadInstallGo()"

     return $errorCode

  }

  return 0
}

makeDirIfNotExist "$MIKE_Scratch" "777" "" &&
zapAllFilesInDir "$MIKE_Scratch" &&
changeToDir "$MIKE_Scratch" &&
downloadInstallGo &&
successMsg  "Downloaded and Installed Latest Go Programming Language Compiler." "Go Version: $LATEST_GO_VERSION"
