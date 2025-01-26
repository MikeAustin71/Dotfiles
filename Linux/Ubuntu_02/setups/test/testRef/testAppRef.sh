#!/bin/bash

# This will test file and directory References
# used in functions

 declare targetDir="$HOME/scratch"
 # downloadSubDir="peco_linux_amd64"
 # releaseVer="v0.5.11"
 # targetDownloadFile="peco_linux_amd64.tar.gz"

 gotoTargetDir() {

	cd "$targetDir" ||
	{
	  echo "'cd' Command Failed!"
	  echo "cd $targetDir"
	  echo "script: testAppRef.sh"

	  return 70
	}

	current_dir=$(pwd)

	if [ "$current_dir" != "$targetDir" ]
	then
		echo "Error! Current Directory NOT Equal To Target Directory"
		echo "Current Director= $current_dir"
		echo "Target Directory= $targetDir"
		echo "Function: gotoTargetDir()"
		return 71
	fi

 	
 }









