#!/bin/bash
# Downloads Latest Release of 'micro'
#

app_Name="micro"
downloadOpsDir="$HOME/scratch"
extractedBinaryFile="$downloadOpsDir/$app_Name"
targetExeDir="/usr/local/bin"
targetExeFile="$targetExeDir/$app_Name"


source "$MIKE_Setup_Utilities"/utilsLib.sh


downloadAppArchive() {


  isCorrectCurrentDir "$downloadOpsDir" "Target Directory" ||
  {

    echo "Invalid Current Directory"
    echo "Function: downloadAppArchive()"
    return 51

  }


 echo "**********************"
 echo "Application: $app_Name"
 echo "Starting download..."
 echo "**********************"

  local -i errorCode=0

  curl https://getmic.ro | bash ||
  {

    errorCode=$?

    echo -e "*** ERROR ***\n
    Download Operation FAILED! Exit Code= $?
    Expected Download File: $extractedBinaryFile
    Function: downloadAppArchive()\n
    Error Code: $errorCode\n\n"

    return $errorCode
  }

  if [ ! -f "$extractedBinaryFile" ]
  then

  echo "*** ERROR ***"
    echo "After Extraction, Download File DOES NOT EXIST!"
    echo "Download File: $extractedBinaryFile"
    echo "Function: downloadAppArchive()"
    return 53

  else

    echo "********************************************"
    echo "Successfully Downloaded Application File"
    echo "Application File: $extractedBinaryFile"
    echo "Function: downloadAppArchive()"
    echo "********************************************"
    echo " "

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

  echo "Starting $app_Name Installation"
  makeDirIfNotExist "$downloadOpsDir" "777" "" &&
  zapFilesCmd "$downloadOpsDir/*" "-f" "" &&
  changeToDir "$downloadOpsDir" &&
  downloadAppArchive &&
  changeFileOwner "$extractedBinaryFile" "root" &&
	changeFilePermissions "$extractedBinaryFile" "775" &&
	zapFileIfExists "$targetExeFile" &&
	moveDirFiles "$extractedBinaryFile" "$targetExeFile" "" "sudo" &&
	zapFilesCmd "$downloadOpsDir/*" "-f" "" &&
	testInstalledExe &&
	successMsg  "Downloaded, extracted and configured Application Binary." "Application Name: $app_Name" "Installed Executable: $targetExeFile"
	
