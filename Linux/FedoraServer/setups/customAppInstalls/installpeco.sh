#!/bin/bash
# Downloads Latest Release of 'peco'
# Filtering Tool
# Improvement over 'grep'
# Github:
#    https://github.com/peco/peco
# Wiki:
#    https://github.com/peco/peco/wiki/Sample-Usage
#

app_Name="peco"
release_Ver="v0.5.11"
release_file="peco_linux_amd64.tar.gz"
downloadOpsDir="$HOME/scratch"
archiveFile="$downloadOpsDir/$release_file"
extractArchiveToDir="$downloadOpsDir/peco_linux_amd64"
extractedBinaryFile="$extractArchiveToDir/$app_Name"
targetExeDir="/usr/local/bin"
targetExeFile="$targetExeDir/$app_Name"

# shellcheck disable=SC2154
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

  wget https://github.com/peco/peco/releases/download/"$release_Ver"/"$release_file" ||
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
		echo "Error Code: $?"
	fi

	tar -xzf "$archiveFile" ||
 {
    echo -e "*** ERROR ***\n
    Extraction Operation FAILED!\n
    Error Code= $?\n
    Expected Download File: $extractedBinaryFile\n
    Archive File: $archiveFile\n
    Function: unzipArchive()\n" ; return 90
 }


	if [[ ! -f $extractedBinaryFile ]]
	then

		echo "*** ERROR ***"
		echo "Unzip and Archive Extraction FAILED!"
		echo "Extracted Binary File DOES NOT EXIST!"
		echo "Extracted Binary File: $extractedBinaryFile"
		echo "Function: unzipArchive()"
		return 91
		
	else

    echo "********************************************"
    echo "Successfully Extracted Application File"
    echo "Application File: $extractedBinaryFile"
    echo "********************************************"
    echo " "
	fi

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
	unzipArchive &&
	changeFileOwner "$extractedBinaryFile" "root" &&
	changeFilePermissions "$extractedBinaryFile" "775" &&
	zapFileIfExists "$targetExeFile" &&
	moveDirFiles "$extractedBinaryFile" "$targetExeFile"  "" "sudo" &&
	removeDir "$extractArchiveToDir" &&
	zapAllFilesInDir "$downloadOpsDir" &&
	testInstalledExe &&	
	successMsg  "Downloaded, extracted and configured Application Binary." "Application Name: $app_Name" "Installed Executable: $targetExeFile"
