#!/bin/bash
# Downloads Latest Release of Go Programming Language
#

app_Name="go"
release_Ver="1.22.0"
release_file="go$release_Ver.linux-amd64.tar.gz"
downloadOpsDir="$HOME/scratch"
archiveFile="$downloadOpsDir/$release_file"
extractArchiveToDir="$downloadOpsDir/go"
targetExeDir="/usr/local/go"
targetExeFile="/usr/local/go/bin/$app_Name"

source "$MIKE_Setup_Utilities"/utilsLib.sh


downloadAppArchive() {

  isCorrectCurrentDir "$downloadOpsDir" "Target Directory" ||
  {

    echo "Invalid Current Directory"
    echo "Function: downloadAppArchive()"
    return 119

  }

  echo "********************"
  echo "Starting download..."
  echo "********************"

  local -i errorCode=0

  wget wget https://go.dev/dl/"$release_file" ||
  {
    errorCode=$?

    echo -e "*** ERROR ***\n
    Download Operation FAILED!\n
    Expected Download File: $archiveFile\n
    Function: downloadAppArchive()\n
    Error Code: $errorCode"
    return $errorCode
  }

  if [ ! -f "$archiveFile" ]
  then

  echo "*** ERROR ***"
    echo "Download File DOES NOT EXIST!"
    echo "Download File: $archiveFile"
    echo "Function: downloadAppArchive()"
    exit 53

  else

  echo "********************************************"
  echo "Successfully Downloaded Archive File"
  echo "Archive File: $archiveFile"
  echo "Function: downloadAppArchive()"
  echo "********************************************"

  fi

  return 0
}

unzipArchive() {

	if [[ ! -f $archiveFile ]]
	then
		echo "*** ERROR ***"
		echo "Download File COULD NOT BE FOUND!"
		echo "Expected File: $archiveFile"
		echo "Function: unzipArchive()"
		return 73
	fi

  local -i errorCode=0

  tar -xzf "$archiveFile" -C ./go ||
  {

    errorCode=$?

    echo -e "*** ERROR ***\n
    Extraction Operation FAILED!\n
    Error Code= $errorCode\n
    Archive File: $archiveFile\n
    Function: unzipArchive()\n\n"
    return $errorCode
  }


  echo "********************************************"
  echo "Successfully Extracted Go Files"
  echo "Archive File: $archiveFile"
  echo "********************************************"
  echo " "

	return 0
}

testInstalledExe() {

	if [[ ! -f $targetExeFile ]]
	then

		echo "*** ERROR ***"
		echo "Final Verification Failed!"
		echo "Target Executable File DOES NOT EXIST!"
		echo "Target Executable: $targetExeFile"
		echo "Function: testInstalledExe()"
		return 201

	fi

  return 0
}


# Execute Functions

  makeDirIfNotExist "$downloadOpsDir" "777" "" &&
	changeToDir "$downloadOpsDir" &&
	downloadAppArchive &&
  makeDirIfNotExist "$extractArchiveToDir" "777" "" &&
  unzipArchive &&
  zapFilesRecursive "$targetExeDir" &&
  removeDir "$targetExeDir" &&
  moveDir "$extractArchiveToDir" "$targetExeDir" &&
  zapFilesRecursive "$extractArchiveToDir" "-rf" "sudo" &&
  removeDir "$extractArchiveToDir" &&
  zapAllFilesInDir "$downloadOpsDir" &&
  testInstalledExe &&
  successMsg  "Downloaded and configured Go Programming Language Compiler." "Application Name: $app_Name" "Installed Executable: $targetExeFile"