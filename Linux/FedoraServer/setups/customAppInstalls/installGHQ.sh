#!/bin/bash
# Downloads Latest Release of 'ghq'
# GitHub page:
#    https://github.com/x-motemen/ghq
#
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#         IMPORTANT
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# You MUST install 'go' First!
# If you want a non-default path to repos,
# set environment variable GHQ_ROOT.
# Example:
# export GHQ_ROOT="$HOME/repos"

# Installs 'ghq' application.
# GitHub page:
#    https://github.com/x-motemen/ghq
# Remember, you must install 'go' before
# calling this function!
installGHQ() {

 go install github.com/x-motemen/ghq@latest

}

  makeDirIfNotExist "$downloadOpsDir" "777" "" &&
  zapAllFilesInDir "$downloadOpsDir" &&
	changeToDir "$downloadOpsDir" &&
  installGHQ &&
  successMsg  "Downloaded, extracted and configured Application Binary." "Application Name: ghq"
