#!/bin/bash
# Downloads and Installs Latest Release of 'dust'
# Github Homepage
# https://github.com/bootandy/dust

app_Name="dust"
release_Ver="v1.0.0"
baseReleaseName="dust-$release_Ver.0-x86_64-unknown-linux-gnu"
release_file="$baseReleaseName.tar.gz"
downloadOpsDir="$MIKE_Scratch"
archiveFile="$downloadOpsDir/$release_file"
extractArchiveToDir="$downloadOpsDir/$baseReleaseName"
extractedBinaryFile="$extractArchiveToDir/$release_file"
targetExeDir="/usr/local/bin"
targetExeFile="$targetExeDir/$app_Name"

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"


downloadAppArchive() {

  isCorrectCurrentDir "$downloadOpsDir" "Target Directory" ||
  {

    echo "Invalid Current Directory"
    echo "Function: downloadAppArchive()"
    return 119

  }

  echo "**********************"
  echo "Application: $app_Name"
  echo "Starting download...  "
  echo "**********************"

  local -i errorCode=0


  # wget -v https://github.com/bootandy/dust/releases/download/v0.9/dust-v0.9.0-x86_64-unknown-linux-gnu.tar.gz
  # wget -v https://github.com/bootandy/dust/releases/tag/v1.0.0/dust-v1.0.0.0-x86_64-unknown-linux-gnu.tar.gz

  wget -v https://github.com/bootandy/dust/releases/tag/"$release_Ver"/dust-"$release_Ver".0-x86_64-unknown-linux-gnu.tar.gz ||
  {

    errorCode=$?

    echo "*** ERROR ***"
    echo "Download Operation FAILED!"
    echo "Expected Download File: $archiveFile"
    echo "Function: downloadAppArchive()"
    echo "Script File: installDust.sh"
    echo "Error Code: $errorCode"
    return $errorCode

  }

  if [ ! -f "$archiveFile" ]
  then

  echo "*** ERROR ***"
    echo "Download File DOES NOT EXIST!"
    echo "Download File: $archiveFile"
    echo "Function: downloadAppArchive()"
    return 53

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
		return 51
	fi

  local -i errorCode=0


  # tar -xvf
  tar -xvf "$archiveFile" ||
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
		echo "Unzip and Archive Extraction FAILED!"
		echo "Extracted Binary File DOES NOT EXIST!"
		echo "Extracted Binary File: $extractedBinaryFile"
		echo "Function: unzipArchive()"
		return 91

	else

    echo "********************************************"
    echo "Successfully Downloaded Application File"
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

  echo "Starting $app_Name Installation"
  makeDirIfNotExist "$downloadOpsDir" "777" "" &&
  zapFilesCmd "$downloadOpsDir/*" "-f" "" &&
  changeToDir "$downloadOpsDir" &&
  downloadAppArchive &&
  unzipArchive &&
  changeFileOwner "$extractedBinaryFile" "root" &&
  changeFilePermissions "$extractedBinaryFile" "775" &&
  zapFileIfExists "$targetExeFile" &&
  moveDirFiles "$extractedBinaryFile" "$targetExeFile" "" "sudo" &&
  removeDir "$extractArchiveToDir" &&
  zapFilesCmd "$downloadOpsDir/*" "-f" "" &&
  testInstalledExe &&
  successMsg  "Downloaded, extracted and configured Application Binary." "Application Name: $app_Name" "Installed Executable: $targetExeFile"
