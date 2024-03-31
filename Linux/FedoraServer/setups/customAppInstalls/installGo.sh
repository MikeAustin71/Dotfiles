#!/bin/bash
# Downloads Latest Release of Go Programming Language
# Taken from 'Coding with Cody'
# https://codingwithcody.com/2022/03/09/install-latest-version-go-bash/
# Note: Cody's code no longer works. I made
# modifications.

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Don't forget to add /usr/local/go and
# /usr/local/go/bin to the $PATH environment
# variable.
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

source "$MIKE_Setup_Utilities"/utilsLib.sh

# Fetch the latest version number
# echo "go1.22.1\ntime 2024-02-29T18:18:48Z" | grep -oP 'go\d+\.\d+\.\d+'
RAW_GO_VERSION=$(curl 'https://go.dev/VERSION?m=text')

LATEST_GO_VERSION=$(echo "$RAW_GO_VERSION" | grep -oP 'go\d+\.\d+\.\d+')

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
    echo "RAW Go Version: $RAW_GO_VERSION"
    echo "Latest Go Version: $LATEST_GO_VERSION"
    echo "Error Code= $errorCode"
    echo "Function: downloadInstallGo()"

    return $errorCode
  }

  # Clear old installations
  sudo rm -rf /usr/local/go


  # Unpack the tarball
  sudo tar -C /usr/local -xzf "$LATEST_GO_VERSION".linux-amd64.tar.gz ||
  {
    errorCode=$?

    echo "*** ERROR ***"
    echo "'tar' failed to unpack the 'go' tarball!"
    echo "'go' was NOT installed!"
    echo "RAW Go Version: $RAW_GO_VERSION"
    echo "Latest Go Version: $LATEST_GO_VERSION"
    echo "Error Code= $errorCode"
    echo "Function: downloadInstallGo()"

    return $errorCode

  }

  # Cleanup the download
  sudo rm "$LATEST_GO_VERSION".linux-amd64.tar.gz ||
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

testInstalledExe() {

  local goBaseDir="/usr/local/go"
  local goBinDir="$goBaseDir/bin"

	if [[ ! -d $goBaseDir ]]
	then

		echo "*** ERROR ***"
		echo "Final Verification Failed!"
		echo "Go Base Directory DOES NOT EXIST!"
		echo "Go Base Directory: $goBaseDir"
		echo "Function: testInstalledExe()"
		return 201

	fi

  if [[ ! -d $goBinDir ]]
  then

		echo "*** ERROR ***"
		echo "Final Verification Failed!"
		echo "Go Bin Directory DOES NOT EXIST!"
		echo "Go Bin Directory: $goBinDir"
		echo "Function: testInstalledExe()"
		return 202
  fi

  return 0
}

makeDirIfNotExist "$MIKE_Scratch" "777" "" &&
zapFilesCmd "$MIKE_Scratch/*" "-f" "" &&
changeToDir "$MIKE_Scratch" &&
downloadInstallGo &&
zapFilesCmd "$MIKE_Scratch/*" "-f" "" &&
testInstalledExe &&
successMsg  "Installed Latest Go Programming Language Compiler." "Go Version: $LATEST_GO_VERSION" "Be sure to add Path Variables!" "/usr/local/go /usr/local/go/bin"
