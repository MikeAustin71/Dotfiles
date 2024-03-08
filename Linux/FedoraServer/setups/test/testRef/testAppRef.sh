#!/bin/bash

# This will test file and directory References
# used in functions

 targetDir="/home/mike/scratch"
 downloadSubDir="peco_linux_amd64"
 releaseVer="v0.5.11"
 targetDownloadFile="peco_linux_amd64.tar.gz"

 gotoTargetDir() {

	cd $targetDir

	current_dir=$(pwd)

	if "$current_dir" != "$targetDir" {
		echo "Error! Current Directory NOT Equal To Target Directory"
		echo "Current Director= $current_dir"
		echo "Target Directory= $targetDir"
		echo "Function: gotoTargetDir()"
		exit 71
	}

 	
 }









