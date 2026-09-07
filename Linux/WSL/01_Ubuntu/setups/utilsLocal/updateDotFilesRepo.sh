#!/bin/bash
# Used to pull down latest version of dotfiles and
# git pull origin main


	declare base10ReposDir="$HOME"/repos/Dotfiles
	declare home10SecSauceDir="$HOME"/secretSauce

	cd "$base10ReposDir" || {
	  echo "updateDotFilesRepo.sh failed to set repo path!"
	  echo "Repo Path: $base10ReposDir"

	  return 98
	}

	git pull origin main 

	cd "$home10SecSauceDir" || {

	  echo "updateDotFilesRepo.sh failed to change directory to Base Directory!"
	  echo "Base Directory = $home10SecSauceDir"

	   return 99

	}

	echo 
	echo "  *******************************************"
	echo "            Successful Completion            "
	echo "  Successfully Updated Dotfiles Repository   "
	echo "  DotfilesRepo Directory:                    " 
	echo "        $base10ReposDir"
	echo "  ******************************************"
	echo
	
	exit 0
