#!/bin/bash
# This script configures all files and
# directories contained in the setups
# directory ($targetScriptsDir).
#
# Ownership of all directories in the
# setup directory tree will be configured.
#
# Permissions for all directories in the
# setup directory tree will be configured.
#
# Ownership of all files in the setup
# directory tree will be configured.
#
# Permissions for all files in the setup
# directory tree will be configured.

declare origStartingDir=""

declare targetScriptsDir="$HOME"/bashOps/setups


# This function identifies and saves
# the Starting Directory in which this
# script was originally executed.
function getStartingDir() {

  if [[ ! -d $targetScriptsDir ]]
  then

    echo "*** ERROR ***"
    echo "The 'setups' Script Directory DOES NOT EXIST!"
    echo "Setups Directory: $targetScriptsDir"
    echo "getStartingDir()"
    echo "Script File: configureSetups.sh"
    echo
    return 99

  fi

  origStartingDir=$(pwd)

  echo -e "Successfully recorded the Staring\n
  Directory in effect when this script was\n
  initially executed.\n
  Original Starting Director: $origStartingDir\n
  Function: getStartingDir()\n\n"

  return 0
}

# This function changes the current
# working directory to the current
# working directory in effect when
# this script was initially executed.
function changeToStartingDir() {

  local -i errorCode=0

  if [[ -z $origStartingDir ]]
  then

    echo -e "*** ERROR ***\n
    Could NOT change current working directory\n
    to the original current working directory in\n
    effect when this script was initially executed\n
    because the variable 'origStartingDir' is empty.\n
    Function: changeToStartingDir()\n\n"

    return 124

  fi

  cd "$origStartingDir" ||
  {
    errorCode=$?

    echo -e "*** ERROR ***\n
    Could NOT change the current working directory\n
    back to the original Starting Directory!\n
    Original Starting Directory: $origStartingDir\n
    Function: changeToStartingDir()\n
    Error Code: $errorCode\n\n"

    return $errorCode
  }

  echo -e "Successfully changed the current working
  directory to the original Staring Directory in\n
  effect when this script was initially executed.\n
  Original Starting Director: $origStartingDir\n
  Function: changeToStartingDir()\n\n"

  return 0
}

# This function sets the 'owner' for the
# top level setups directory,
# $targetScriptsDir.
function cfgOwnerSetupsDir() {

  local currentUser

  currentUser="$(whoami)"

  local oWner

  oWner=$(stat -c '%U' "$targetScriptsDir")

  if [ "$oWner" == "$currentUser" ]
  then
    return 0
  fi

 	sudo chown "$currentUser":"$currentUser" "$targetScriptsDir" ||
 	{
 	  errorCode=$?

 		echo -e "An Error occurred while changing ownership\n
 		on the top level setups directory!\n
 		Top Level Setups Directory= $targetScriptsDir\n
 		Current Owner: $oWner\n
 		New Owner= $currentUser\n
 		Function: cfgOwnerSetupsDir()\n
 		Error Code: $errorCode\n\n"
 		
 		return $errorCode
 	}

	echo -e "Successfully changed ownership on the\n
	top level setups directory!\n
	Top Level Setups Directory:\n
	$targetScriptsDir\n
	Function: cfgOwnerSetupsDir()\n\n"

  return 0
}

# This function sets the permissions
# for the top level directory in the
# setups directory tree.
function cfgPermissionsSetupsDir() {

  local -i errorCode=0

  cd "$targetScriptsDir" ||
  {
    errorCode=$?

    echo -e "*** ERROR ***\n
    Could NOT change to the Top Level\n
    Setups Directory!\n
    Top Level Setups Directory: $targetScriptsDir\n
    Function: cfgPermissionsSetupsDir()\n
    Error Code: $errorCode\n\n"

    return $errorCode
  }

  local perMissions

  perMissions=$(stat -c '%a' "$targetScriptsDir")
  # Check if the permissions is "775"

  if [ "$perMissions" = "775" ]; then
  	return 0
  fi

	sudo chmod 775 "$targetScriptsDir" ||
	{
	  
	  errorCode=$?

		echo -e "An Error occurred while changing permissions on:\n
		Top Level Setups Directory= $targetScriptsDir\n
		Function: cfgPermissionsSetupsDir()\n
		Error Code: $errorCode\n\n"

		return $errorCode
	}
 
	echo -e "Successfully changed Directory Permissions\n
	on the top level setups directory!\n
	Top Level Setups Directory: $targetScriptsDir\n
	Function: cfgPermissionsSetupsDir()\n\n"

  return 0
}

# This function sets the owner for all directories
# in the setups directory tree to the current
# user (whoami).
cfgOwnerSetupScriptsDirs() {

  local -i errorCode=0

  cd "$targetScriptsDir" ||
  {
    errorCode=$?

    echo -e "*** ERROR ***\n
    Could NOT change to the Top Level\n
    Setups Directory!\n
    Top Level Setups Directory: $targetScriptsDir\n
    Function: cfgOwnerSetupScriptsDirs()\n
    Error Code: $errorCode\n\n"

    return $errorCode
  }

  local currentUser

  currentUser=$(whoami)

  sudo find . -type d -exec chown "$currentUser":"$currentUser" {} + ||
  {
    errorCode=$?

    echo -e "*** ERROR ***\n
    Error occurred while changing directory ownership\n
    on all directories on the Setups Directory Tree!\n
    Top Level Setups Directory: $targetScriptsDir\n
    Function: cfgOwnerSetupScriptsDirs()\n
    Error Code: $errorCode\n\n"

    return $errorCode
  }

	echo -e "Successfully changed Directory ownership\n
	on all directories the setups directory tree!\n
	Top Level Setups Directory: $targetScriptsDir\n
	Function: cfgOwnerSetupScriptsDirs()\n\n"

  return 0
}

# This function sets the owner for all files
# in the setups directory tree to the current
# user (whoami).
cfgOwnerSetupScriptsFiles() {

  local -i errorCode=0

  cd "$targetScriptsDir" ||
  {
    errorCode=$?

    echo -e "*** ERROR ***\n
    Could NOT change to the Top Level\n
    Setups Directory!\n
    Top Level Setups Directory: $targetScriptsDir\n
    Function: cfgOwnerSetupScriptsFiles()\n
    Error Code: $errorCode\n\n"

    return $errorCode
  }

  local currentUser

  currentUser=$(whoami)

  sudo find . -type f -exec chown "$currentUser":"$currentUser" {} + ||
  {
   errorCode=$?
                                                           echo -e "*** ERROR ***\n
   Error occurred while changing File ownership\n
   on all files in the Setups Directory Tree!\n
   Top Level Directory: $targetScriptsDir\n
   Function: cfgOwnerSetupScriptsFiles()\n
   Error Code: $errorCode\n\n"

   return $errorCode
  }

	echo -e "Successfully changed File ownership\n
	on all files in the setups directory tree!\n
	Top Level Directory: $targetScriptsDir\n
	Function: cfgOwnerSetupScriptsFiles()\n\n"

  return 0
}

# This functions sets permissions on all
# directories in the setups directory tree
# to '775'.
cfgPermissionsSetupScriptsDirs() {

  local -i errorCode=0

  cd "$targetScriptsDir" ||
  {
    errorCode=$?

    echo -e "*** ERROR ***\n
    Could NOT change to the Top Level\n
    Setups Directory!\n
    Top Level Setups Directory: $targetScriptsDir\n
    Function: cfgPermissionsSetupScriptsDirs()\n
    Error Code: $errorCode\n\n"

    return $errorCode
  }


	sudo find . -type d -exec chmod 775 {} + ||
	{

	  errorCode=$?

		echo -e "*** ERROR ***\n
		An Error occurred while changing permissions\n
		on all directories in the Setups Directory tree.\n
		Top Level Setups Directory= $targetScriptsDir\n
		Function: cfgPermissionsSetupScriptsDirs()\n
		Error Code: $errorCode\n\n"

		return $errorCode
	}

	echo -e "Successfully changed directory permissions\n
	on all directories in the setups directory tree!\n
	Top Level Setup Directory: $targetScriptsDir\n
	Function: cfgPermissionsSetupScriptsDirs()\n\n"

  return 0
}

# This function sets permissions on all files
# in the setups directory tree to '775'
cfgPermissionsSetupScriptsFiles() {

  local -i errorCode=0

  cd "$targetScriptsDir" ||
  {
    errorCode=$?

    echo -e "*** ERROR ***\n
    Could NOT change to the Top Level\n
    Setups Directory!\n
    Top Level Setups Directory: $targetScriptsDir\n
    Function: cfgPermissionsSetupScriptsFiles()\n
    Error Code: $errorCode\n\n"
    return $errorCode
  }

	sudo find . -type f -exec chmod 775 {} + ||
	{
	  errorCode=$?

		echo -e "*** ERROR ***\n
		An Error occurred while changing permissions\n
		on all files in the Setups Directory tree.\n
		Top Level Setups Directory= $targetScriptsDir\n
		Function: cfgPermissionsSetupScriptsFiles()\n
		Error Code: $errorCode\n\n"
		return $errorCode
	}

	echo -e "Successfully changed files permissions\n
	on all files in the setups directory tree!\n
	Top Level Setup Directory: $targetScriptsDir\n
	Function: cfgPermissionsSetupScriptsFiles()\n\n"

  return 0
}

# This function runs 'dos2Unix' on all files
# in the Setups directory tree.
convertFilesDos2Unix() {

  local -i errorCode=0

  cd "$targetScriptsDir" ||
  {
    errorCode=$?

    echo -e "*** ERROR ***\n
    Could NOT change to the Top Level\n
    Setups Directory!\n
    Top Level Setups Directory: $targetScriptsDir\n
    Function: convertFilesDos2Unix()\n
    Error Code: $errorCode\n\n"
    return $errorCode
  }

  # Note: -k parameter will keep original date
	sudo find . -type f -exec dos2Unix -k {} + ||
	{
	  errorCode=$?

		echo -e "*** ERROR ***\n
		An Error occurred while executing 'dos2Unix'\n
		on all files in the Setups Directory tree.\n
		Top Level Setups Directory= $targetScriptsDir\n
		Function: convertFilesDos2Unix()\n
		Error Code: $errorCode\n\n"
		return $errorCode
	}

	echo -e "Successfully executed 'dos2Unix' on\n
	all files in the setups directory tree!\n
	Top Level Setup Directory: $targetScriptsDir\n
	Function: convertFilesDos2Unix()\n\n"

	return 0
}

# Prints a 'successful completion' message
# if this script executes without error.
successfulExit() {

  echo "*********************************************"
  echo "         SUCCESSFUL COMPLETION!"
  echo "Initial configuration of all files and"
  echo "directories in the Setups Scripts Directory"
  echo "Tree has been successfully completed."
  echo "*********************************************"

  return 0
}


getStartingDir &&
cfgOwnerSetupsDir &&
cfgPermissionsSetupsDir &&
cfgOwnerSetupScriptsDirs &&
cfgOwnerSetupScriptsFiles &&
cfgPermissionsSetupScriptsDirs &&
cfgPermissionsSetupScriptsFiles &&
convertFilesDos2Unix &&
changeToStartingDir &&
successfulExit


