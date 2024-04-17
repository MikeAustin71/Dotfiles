#!/bin/bash
# Utilities Library for Setups
#


# This function will change the ownership on
# a target Directory specified by Parameter $1.
# The new  owner is designated by Parameter $2
#
# NOTE: The new file permissions passed by
# Parameter $2 should be formatted as a
# three digit number. Example: "775"
#
# ** PARAMETERS **
# Parameter $1 = Target Directory
# Parameter $2 = new owner name
function changeDirOwner() {

	local targetDir

	targetDir=$1

	local newOwner

	newOwner=$2

  local -i errorCode=0

	if [[ -z $targetDir ]]
	then
		echo "*** Error ***"
		echo "Target Directory Parameter is EMPTY!"
		echo "Target Directory: $targetDir"
		echo "Function: changeDirOwner()"
		echo " "
		return 88
	fi

	if [[ ! -d $targetDir ]]
	then
		echo "*** Error ***"
		echo "Target Directory DOES NOT EXIST!"
		echo "Target Directory: $targetDir"
		echo "Function: changeDirOwner()"
		echo " "
		return 87
	fi

  if [[ -z $newOwner ]]
  then
		echo "*** Error ***"
		echo "New Owner Parameter is EMPTY!"
		echo "Target Directory: $targetDir"
		echo "Function: changeDirOwner()"
		echo " "
		return 86
  fi

	sudo chown "$newOwner":"$newOwner" "$targetDir" ||
	{
	  errorCode=$?

		echo -e "An Error occurred while changing ownership\n
		on Target Directory!\n
		Target Directory= $targetDir\n
		New Owner= $newOwner\n
		Function: changeDirOwner()\n
		Error Code: $errorCode\n\n"
		return $errorCode

	}

	echo -e "Successfully changed ownership on\n Directory: $targetDir\n\n"
}

# This function will change the permissions on
# a target directory specified by Parameter $1.
# The new directory permissions are designated by
# Parameter $2
#
# NOTE: The new directory permissions passed by
# Parameter $2 should be formatted as a
# three digit number. Example: "775"
#
# ** PARAMETERS **
# Parameter $1 = Target Directory
# Parameter $2 = File Permissions
function changeDirectoryPermissions() {

	local targetDir

	targetDir=$1

	local newPermissions

	newPermissions=$2

	if [[ -z $targetDir ]]
	then

		echo -e "*** Error ***\n
		Target Directory Parameter is EMPTY!\n
		Function: changeDirectoryPermissions()\n\n"

		return 68

	fi

	if [[ ! -f $targetDir ]]
	then

		echo -e "*** Error ***\n
		Target Directory DOES NOT EXIST!\n
		Target Directory: $targetDir\n
		Function: changeDirectoryPermissions()\n\n"

		return 67

	fi

  if [[ -z $newPermissions ]]
  then
		echo "*** Error ***"
		echo "New Permissions Parameter is EMPTY!"
		echo "Target Directory: $targetDir"
		echo "Function: changeDirectoryPermissions()"

		return 66
  fi


  local -i errorCode=0

	sudo chmod "$newPermissions" "$targetDir" ||
	{
	  errorCode=$?

		echo -e "An Error occurred while changing permissions on:\n
		Target Directory= $targetDir\n
		Function: changeDirectoryPermissions()\n
		Error Code: $errorCode\n\n"
		return $errorCode
	}

	echo -e "Successfully changed Directory Permissions on\n
	 Target Directory: $targetDir\n\n"

  return 0
}

# This function will change the ownership of
# a target file specified by Parameter $1.
# The new owner of the file is designated by
# Parameter $2
#
# ** PARAMETERS **
# Parameter $1 = Target File
# Parameter $2 = new owner name
function changeFileOwner() {

	local targetFile

	targetFile=$1

	local newOwner

	newOwner=$2

	if [[ -z $targetFile ]]
	then
		echo "*** Error ***"
		echo "Target File Parameter is EMPTY!"
		echo "Function: changeFileOwner()"
		return 89
	fi

	if [[ ! -f $targetFile ]]
	then
		echo "*** Error ***"
		echo "Target File DOES NOT EXIST!"
		echo "Target File: $targetFile"
		echo "Function: changeFileOwner()"
		return 88
	fi

  if [[ -z $newOwner ]]
  then

		newOwner="$(whoami)"

  fi

 local -i errorCode=0

	sudo chown "$newOwner":"$newOwner" "$targetFile" ||
	{
	  errorCode=$?

		echo -e "An Error occurred while changing ownership\n
		on Target File!\n
		Target File= $targetFile\n
		New Owner= $newOwner\n
		Function: changeFileOwner()\n
		Error Code: $errorCode"
		return $errorCode

	}

	echo -e "Successfully changed ownership on\n
	 Target File: $targetFile\n\n"
}

# This function will change the permissions on
# a target file specified by Parameter $1.
# The new file permissions are designated by
# Parameter $2
#
# NOTE: The new file permissions passed by
# Parameter $2 should be formatted as a
# three digit number. Example: "775"
#
# ** PARAMETERS **
# Parameter $1 = Target File
# Parameter $2 = File Permissions
function changeFilePermissions() {

	local targetFile

	targetFile=$1

	local newPermissions

	newPermissions=$2

	if [[ -z $targetFile ]]
	then

		echo -e "*** Error ***\n
		Target File Parameter is EMPTY!\n
		Function: changeFilePermissions()\n\n"
		return 79

	fi

	if [[ ! -f $targetFile ]]
	then

		echo -e "*** Error ***\n
		Target File DOES NOT EXIST!\n
		Target File: $targetFile\n
		Function: changeFilePermissions()\n\n"
		return 78

	fi


  if [[ -z $newPermissions ]]
  then
		echo "*** Error ***"
		echo "New Permissions Parameter is EMPTY!"
		echo "Target File: $targetFile"
		echo "Function: changeFilePermissions()"
		return 78
  fi


  local -i errorCode=0

	sudo chmod "$newPermissions" "$targetFile" ||
	{
	  errorCode=$?

		echo -e "An Error occurred while changing permissions on:\n
		Target File: $targetFile\n
		Function: changeFilePermissions()\n
		Error Code: $errorCode\n\n"
		return $errorCode
	}

	echo -e "Successfully changed File Permissions on\n
	 Target File: $targetFile\n\n"

  return 0
}


# This function will change directories
# to a target directory path specified by
# Parameter $1
# ** PARAMETERS **
# Parameter $1 = Target Directory
function changeToDir() {

	local targetDir=$1

	[[ ! -d $targetDir ]] || {

		echo "*** Error ***"
		echo "The Target Directory DOES NOT EXIST!"
		echo "Target Directory: $targetDir"
		echo "Function: changeToDir()"
		return 99

	}

  local -i errorCode=0

  cd "$targetDir" ||
  {
    errorCode=$?

    echo "*** Error ***"
    echo "Could NOT change to the Target Directory!"
    echo "Target Directory: $targetDir"
    echo "Function: changeToDir()"
    echo "Script: utilsLib.sh"
    echo "Error Code: $errorCode"
    echo

    return $errorCode
  }

	echo "Success: Changed current working directory to:"
	echo "$targetDir"
	echo

  return 0
}

# This function will test whether a
# directory, passed as parameter $1,
# actually exists on the File System.
#
# Input Parameters
#   $1 = Target Directory
#
# Return Values
#   0 = The Target Directory exists
#         on the File System
#
#   Non-Zero = The Target Directory
#               DOES NOT EXIST on the
#               File System
function doesDirectoryExist() {

  local paramDir

	paramDir="$1"

	# Check if directory name is empty
	if [[ -z $paramDir ]]
	then
		echo -e "Error: Directory Name Parameter is empty!\n
		Function: doesDirectoryExist()\n\n"

		return 3
	fi


	# Remove trailing slash (if present)
	paramDir="${paramDir%/}"


  local targetDir

	targetDir=$(realpath "$paramDir")

	if [ ! -d "$targetDir" ]
	then

		return 1

	fi


  return 0
}

# This function determines whether a
# file passed as $1 actually exists
# on the File System.
#
# If the file actually exists, this
# method returns zero (0).
#
# If the file DOES NOT EXIST, this
# method returns a nonzero value.
function doesFileExist() {

  local targetFile

  targetFile="$1"

	# Check if directory name is empty
	if [[ -z $targetFile ]]
	then
		echo -e "Error: Target File Parameter is empty!\n
		Function: doesDirectoryExist()\n\n"

		return 3
	fi


  if [[ ! -f $targetFile ]]
  then

    return 2

  fi

  # The file exists
  return 0
}

# This function will display error messages.
# Individual text lines should be equal to or
# less than 50-characters.
function errXMsg() {

 echo
 echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
 echo "                  &*! Error &*!"

    for arg in "$@"; do
        if [[ -n $arg ]]; then
            echo "$arg"
        fi
    done

  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo

  return 0
}

# This function will test the current
# working directory to verify that it
# is equal to the target directory passed
# as parameter $1.
#
# Input Parameters
#   $1 = The target directory. This function
#         will verify that the current working
#         directory is equal to this target
#         directory.
#
#   $2 = Name of the Target Directory. This
#         Directory Name or Title will be
#         used in error messages.
#
function isCorrectCurrentDir() {

  local paramDir

  paramDir=$1

  local directoryName

  directoryName=$2

  if [[ -z $paramDir ]]
  then

  echo "*** Error ***"
  echo "The target parameter Directory is EMPTY!"
  echo "This is the first parameter in the Function Call."
  echo "Function: isCorrectCurrentDir()"

  return 108

  fi

  if [[ -z $directoryName ]]
  then

    directoryName="Target Directory"

  fi


  # Remove trailing slash (if present)
  paramDir="${paramDir%/}"

  echo "Param Directory after slash removal:"
  echo "$paramDir"
  echo ""

  # Convert to absolute path
  local targetDir

  targetDir=$(realpath "$paramDir")

  echo "Param Dir After Absolute Path Conversion:"
  echo "$targetDir"
  echo ""

  local currDir

  currDir=$(pwd)


  if [[ $currDir != "$targetDir" ]]
  then

  echo "*** Error ***"
  echo "The Current Directory is NOT equal"
  echo "to the $directoryName!"
  echo "$directoryName: $targetDir"
  echo "Current Directory: $currDir"
  echo "Function: isCorrectCurrentDir()"
  return 109

  fi

  return 0
}


# This function will create a target
# directory path if it does not currently
# exist.
# ** PARAMETERS **
# Parameter $1 = Target Directory
# Parameter $2 = Target Directory permission
#									code expressed as a 3-digit
#									number (Example: 775).
# Parameter #3 = New Directory Owner.
#									If this parameter is set to 'sudo',
#									the directory will be created with
#									root as owner. Otherwise, the current
#									user will be designated as owner.
function makeDirIfNotExist() {

  local targetDir=$1

	local permissionCode=$2

	local dirOwner=$3

  if [[ -z $targetDir ]]
  then

    echo "  ***  Error  ***"
    echo "Target Directory Parameter is EMPTY!"
    echo "Function: makeDirIfNotExist()"
    return 51

  fi

  local -i errorCode=0

	if [ ! -d "$targetDir" ]
	then

    sudo mkdir -p "$targetDir" ||
    {
        errorCode=$?

        echo -e "*** Error ***\n
        Failed to create Target Directory!\n
        Target Directory: $targetDir\n
        Permission Code: $permissionCode\n
        Function: makeDirIfNotExist()\n
        Error Code: $errorCode"

        return $errorCode
    }

    echo "Created New Directory:"
    echo "  $targetDir"
    echo ""

  else

    echo "Target Directory Already Existed."
    echo "Target Directory: $targetDir"
    echo "Function: makeDirIfNotExist()"
    echo ""

	fi


  if [[ -z $dirOwner ]]
  then

    dirOwner="$(whoami)"

  fi

	if [[ $dirOwner == "sudo" ]]
	then

    dirOwner="root"

  fi

  if [ "$(stat -c '%U' "$targetDir")" != "$dirOwner" ]
  then

    sudo chown "$dirOwner":"$dirOwner" "$targetDir" ||
    {
      errorCode=$?

      echo -e "An Error occurred while setting ownership\n
      on Target Directory!\n
      Target Directory= $targetDir\n
      Owner= $dirOwner\n
      Function: makeDirIfNotExist()\n
      Error Code: $errorCode\n\n"

      return $errorCode

    }

  fi

  if [[ -n $permissionCode ]]
  then

    sudo chmod "$permissionCode" "$targetDir" ||
    {
          errorCode=$?

          echo -e "*** Error ***\n
          Failed to set permission code on Target Directory!\n
          Target Directory: $targetDir\n
          Permission Code: $permissionCode\n
          Owner= $dirOwner\n
          Function: makeDirIfNotExist()\n
          Error Code: $errorCode"
          return $errorCode
    }

  fi


	echo "Success! Target Directory Exists:"
	echo "  $targetDir"
  echo "Function: makeDirIfNotExist()"
  echo ""

  return 0
}

# This function will move source files or directories
# to a destination path and/or file name(s).
#
# Input Parameters:
#		$1 = source file(s)
#		$2 = destination
#   $3 = command parameters. Examples: -i,-f,-n, etc.
#   $4 = Execute Authority. Set this to "sudo"
#         for execution as super user level.
#         Otherwise, the 'mv' command will be
#         executed with the authority of the
#         user that invoked the script.
#
# Keep in mind:
# By default, 'mv' command overwrites if the target
# file already exists. This behavior can be changed
# with -n or -i command parameters
function moveDirFiles() {

	local sourceFile
	local destinationFile
	local cmdParams
  local exeAuthority

  sourceFile=$1
  destinationFile=$2
  cmdParams=$3
  exeAuthority=$4

  if [[ -z $exeAuthority ]]
  then
   exeAuthority="$(whoami)"
  fi

  if [[ $exeAuthority != "sudo" ]]
  then
    # Execution Authority is local user
    if [[ -z $cmdParams ]]
    then

      mv "$sourceFile" "$destinationFile" ||
      {

       errorCode=$?

       echo "Error occurred while moving source file(s)"
       echo "to destination file(s)."
       echo "Source File= $sourceFile"
       echo "Destination File= $destinationFile"
       echo "Execute Authority= $exeAuthority"
       echo "Function: moveDirFiles()"
       echo "Error Code: $errorCode"
       echo ""

       return $errorCode

      }

    else

      mv "$cmdParams" "$sourceFile" "$destinationFile" ||
      {

       errorCode=$?

       echo "Error occurred while moving source file(s)"
       echo "to destination file(s)."
       echo "Source File= $sourceFile"
       echo "Destination File= $destinationFile"
       echo "Command Parameters= $cmdParams"
       echo "Execute Authority= $exeAuthority"
       echo "Function: moveDirFiles()"
       echo "Error Code: $errorCode"
       echo ""

       return $errorCode

      }

    fi

  else
  # Execution Authority is 'sudo'

    if [[ -z $cmdParams ]]
    then

      # We DO NOT HAVE command parameters
      sudo mv "$sourceFile" "$destinationFile" ||
      {

       errorCode=$?

       echo "Error occurred while moving source file(s)"
       echo "to destination file(s)."
       echo "Source File= $sourceFile"
       echo "Destination File= $destinationFile"
       echo "Execute Authority= $exeAuthority"
       echo "Function: moveDirFiles()"
       echo "Error Code: $errorCode"
       echo ""

       return $errorCode

      }

    else
      # We HAVE command parameters
      sudo mv "$cmdParams" "$sourceFile" "$destinationFile" ||
      {

       errorCode=$?

       echo "Error occurred while moving source file(s)"
       echo "to destination file(s)."
       echo "Source File= $sourceFile"
       echo "Destination File= $destinationFile"
       echo "Command Parameters= $cmdParams"
       echo "Execute Authority= $exeAuthority"
       echo "Function: moveDirFiles()"
       echo "Error Code: $errorCode"
       echo ""

       return $errorCode

      }

    fi

  fi

  local -i errorCode=0

  echo "***************************************************"
  echo "Successfully moved source files/directories"
  echo "to destination files/directories."
  echo "Source: $sourceFile"
  echo "Destination: $destinationFile"
  echo "Command Parameters: $overwriteCmd"
  echo "Execute Authority: $exeAuthority"
  echo "Function: moveDirFiles()"
  echo "***************************************************"
  echo ""

	return 0
}

# This function will delete all files and directories
# in the designated tree.
#
#   BE CAREFUL
#
#	Input Parameters:
#		$1 = target directory
function removeDir() {

  local paramDir

	paramDir="$1"

	# Check if directory name is empty
	if [[ -z $paramDir ]]
	then
		echo -e "Error: Parameter $1 (Directory Name) is empty!\n
		Function: removeDir()\n\n"

		return 1
	fi

	# Remove trailing slash (if present)
	paramDir="${paramDir%/}"

  local targetDir

	targetDir=$(realpath "$paramDir")

  if [[ -z $targetDir ]]
  then

    echo "*** Error ***"
    echo "After conversion to an absolute path,"
    echo "the Target Directory Parameter is EMPTY!"
    echo "Original Parameter#1 Directory:"
    echo "    $paramDir"
    echo "Function: removeDir()"
    return 2

  fi

  if [[ ! -d $targetDir ]]
  then

    echo "Target Directory Does NOT Exist!"
    echo "Target Directory Already Removed."
    echo "Target Directory: $targetDir"
    echo "No Error. Proceeding..."
    echo "Function: removeDir()"
    return 0

  fi

	if [[ $targetDir == "/" ]]
	then

		echo -e "*** Error ***\n
		 Target Directory is equal to root directory.\n
		 You should NOT delete the 'root' directory.\n
		 Target Director: $targetDir\n
		 Function: removeDir()\n\n"

		 return 29

	fi

	sudo rm -rf "${targetDir:?}" ||
    {
      echo -e "Error occurred while deleting all files in Target Directory Tree.\n
      Target Directory: $targetDir\n
      Function: removeDir()\n
      Error Code: $?"
      return 27
    }

	if [[ -d $targetDir ]]
	then

		echo -e "*** Error ***\n
		Target Directory STILL EXISTS!\n
		Attempted deletion of $targetDir FAILED!\n
		Target Directory: $targetDir\n
		Function: removeDir()\n\n"
		return 26

	else

	echo "Target Directory Was Deleted!"
	echo "Target Directory: $targetDir"
	echo "Function: removeDir()"
	echo ""

	fi

	return 0
}

# This function will display a successful
# completion message. It can process any
# number of input parameters which will
# be incorporated into the Successful
# Completion Message.
function successMsg() {

    echo " "
    echo "**********************************************************"
    echo "        !!! SUCCESSFUL COMPLETION !!!"

    for arg in "$@"; do
        if [[ -n $arg ]]; then
            echo "$arg"
        fi
    done

    echo "**********************************************************"
    echo " "

  return 0
}


# This function deletes all files in a
# directory specified by input
# parameter $1.
#
# Input Parameters
#		$1 = Target Directory where all
#					files will be deleted.
function zapAllFilesInDir() {

  local paramDir

	paramDir="$1"

	# Check if directory name parameter is empty
	if [[ -z $paramDir ]]
	then
		echo -e "Error: Parameter $1 (Directory Name) is empty!\n
		Function: zapAllFilesInDir()\n\n"

		return 1
	fi


	# Remove trailing slash (if present)
	paramDir="${paramDir%/}"

	# Convert to absolute path
	local targetDir

	targetDir=$(realpath "$paramDir")

  if [[ -z $targetDir ]]
  then

    echo -e "*** Error ***\n
    Input parameter #1, the target\n
    directory is EMPTY!\n
		 Target Director: $targetDir\n
		 Function: removeDir()\n\n"

    return 18

  fi

	if [[ $targetDir == "/" ]]
	then

		echo -e "*** Error ***\n
		 Target Directory is equal to root directory.\n
		 You should NOT delete all files in the 'root' directory.\n
		 Target Director: $targetDir\n
		 Function: zapAllFilesInDir()\n\n"

		 return 19

	fi

	if [[ ! -d $targetDir ]]
	then

		echo "*** Error ***"
		echo "Target Directory DOES NOT EXIST!"
		echo "Target Directory: $targetDir"
		echo "Function: zapAllFilesInDir()"
		return 0

	fi

  if [ "$(find "$targetDir" -maxdepth 1 -type f | wc -l)" -eq 0 ]
  then

    echo "The target directory is empty and contains"
    echo "zero files. No error. Nothing to do."
    echo "Target Directory: $targetDir"
    echo "Function: zapAllFilesInDir()"

    echo 0

  fi

	sudo rm "$targetDir"/* ||
	{

		echo -e "Error occurred while deleting all files\n
		 in the Target Directory.\n
		 Target Directory: $targetDir\n
		 Function: zapAllFilesInDir()\n
		 Error Code: $?\n\n"
		 return 10


	}

	echo -e "Successful Completion!\n
	All files deleted in target directory:\n
	$targetDir\n\n"

	return 0
}

# This function will delete a target file
# specified by Parameter $1.
# If the target file does not exist, this
# function will return and exit code of
# zero ('0').
# ** PARAMETERS **
# Parameter $1 = Target File
function zapFileIfExists() {

 local targetFile

 targetFile=$1

 local -i errorCode=0

 if [[ -f $targetFile ]]
 then

   sudo rm "$targetFile" ||
    {

      errorCode=$?

      echo "*** Error ***"
      echo "Failed to delete pre-existing App:"
      echo "$targetFile"
      echo "Function zapFileIfExists()"
      echo  "Error Code: $errorCode"

      return $errorCode
    }

	else

		echo "The target file for deletion did NOT exist!"
		echo "Target File: $targetFile"
		echo

		return 0

	fi

  echo "Target File does Not Exist."
  echo "Target file: $targetFile"
  echo

  return 0
}


# This function deletes or removes all
# files in a directory tree specified by
# input parameter $1.
#
# WARNING!!
# This function executes the remove command,
# 'rm'
#
# Input Parameters
#		$1 = Target Directory where all
#					files will be deleted.
#   $2 = Command Parameter(s). For example,
#         this parameter might be set to "-r"
#         "-rf" or any other legitimate
#         parameter for the rm command.
#   $3 = Execute Authority. If this parameter
#         is set to "sudo", the remove command
#         (rm) will be executed with "sudo"
#         privileges and authority.

function zapFilesCmd() {

  local paramDir

	paramDir="$1"

  local cmdParam

  cmdParam="$2"

  local exeAuthority

  exeAuthority="$3"

  local -i lastExitCode=0

	# Check if directory name parameter is empty
	if [[ -z $paramDir ]]
	then
		echo -e "Error: Parameter $1 (Directory Name) is empty!\n
		Function: zapFilesRecursive()\n\n"

		return 20
	fi


	# Remove trailing slash (if present)
	paramDir="${paramDir%/}"

	# Convert to absolute path
	local targetDir

	targetDir=$(realpath "$paramDir")

	if [[ $targetDir == "/" ]]
	then

		echo -e "*** Error ***\n
		 Target Directory is equal to root directory.\n
		 You should NOT delete all files in the 'root' directory.\n
		 Target Director: $targetDir\n
		 Function: zapFilesCmd()\n\n"

		 return 19

	fi

	if [[ ! -d $targetDir ]]
	then

		echo "Target Directory DOES NOT EXIST!"
		echo "Target Directory: $targetDir"
		echo "Function: zapFilesCmd()"
		echo "Proceeding..."
		echo ""

	fi


  if [[ $exeAuthority == "sudo" ]]
  then

    if [[ -z $cmdParam ]]
    then

      sudo rm "$targetDir" ||
      {

        lastExitCode=$?

        echo -e "Error occurred while deleting all files\n
         in the Target Directory.\n
         Target Directory: $targetDir\n
         Command Parameter: (none)\n
         Execute Authority: $exeAuthority\n
         Function: zapFilesRecursive()\n
         Error Code: $lastExitCode\n\n"

         return $lastExitCode
      }

    else

      sudo rm "$cmdParam" "$targetDir" ||
      {

        lastExitCode=$?

        echo -e "Error occurred while deleting all files\n
         in the Target Directory.\n
         Target Directory: $targetDir\n
         Command Parameter: $cmdParam\n
         Execute Authority: $exeAuthority\n
         Function: zapFilesRecursive()\n
         Error Code: $lastExitCode\n\n"

         return $lastExitCode
      }

    fi

  else

    if [[ -z $cmdParam ]]
    then

      rm "$targetDir" ||
      {

        lastExitCode=$?

        echo -e "Error occurred while deleting all files\n
         in the Target Directory.\n
         Target Directory: $targetDir\n
         Command Parameter: (none)\n
         Execute Authority: $(whoami)\n
         Function: zapFilesRecursive()\n
         Error Code: $lastExitCode\n\n"

         return $lastExitCode
      }

    else

      rm "$cmdParam" "$targetDir" ||
      {

        lastExitCode=$?

        echo -e "Error occurred while deleting all files\n
         in the Target Directory.\n
         Target Directory: $targetDir\n
         Command Parameter: $cmdParam\n
         Execute Authority: $(whoami)\n
         Function: zapFilesRecursive()\n
         Error Code: $lastExitCode\n\n"

         return $lastExitCode
      }

    fi

  fi

	echo -e "Successful Completion!\n
	All files deleted in target directory:\n
	$targetDir\n\n"

	return 0
}


