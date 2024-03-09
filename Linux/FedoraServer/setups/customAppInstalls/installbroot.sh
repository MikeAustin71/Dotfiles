#!/bin/bash
# Downloads Latest Release of 'broot'
#

app_Name="broot"
downloadOpsDir="$MIKE_Scratch"
extractedBinaryFile="$downloadOpsDir/$app_Name"
targetExeDir="/usr/local/bin"
targetExeFile="$targetExeDir/$app_Name"

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

 curl -o broot -L https://dystroy.org/broot/download/x86_64-linux/broot ||
 {

  errorCode=$?

  echo -e "*** ERROR ***\n
  Download Operation FAILED!\n
  Expected Download File: $extractedBinaryFile\n
  Function: downloadAppArchive()\n
  Error Code: $errorCode"
  return $errorCode
 }


 if [[ ! -f $extractedBinaryFile ]]
 then

	echo "*** ERROR ***"
    echo "Download File DOES NOT EXIST!"
    echo "Download File: $extractedBinaryFile"
    echo "Function: downloadAppArchive()"
    return 53

 else

	echo "********************************************"
	echo "Successfully Downloaded Application File"
	echo "Application File: $extractedBinaryFile"
	echo "********************************************"


 fi

  return 0
}


testInstalledExe() {

	if [[ ! -f $targetExeFile ]]
	then

		echo "*** ERROR ***"
		echo "Final Installation Verification Failed!"
		echo "Target Executable File DOES NOT EXIST!"
		echo "Target Executable: $targetExeFile"
		echo "Function: testInstalledExe()"
		return 201

	fi

  return 0
}


  makeDirIfNotExist "$downloadOpsDir" "777" "" &&
	changeToDir "$downloadOpsDir" &&
	downloadAppArchive &&
	changeFileOwner "$extractedBinaryFile" "root" &&
	changeFilePermissions "$extractedBinaryFile" "775" &&
	zapFileIfExists "$targetExeFile" &&
	moveDirFiles "$extractedBinaryFile" "$targetExeFile" "" "sudo" &&
	zapAllFilesInDir "$downloadOpsDir" &&
	testInstalledExe &&
	successMsg  "Downloaded, extracted and configured Application Binary." "Application Name: $app_Name" "Installed Executable: $targetExeFile"