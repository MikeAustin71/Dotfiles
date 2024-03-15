#!/bin/bash
#  Make Initial Directory Structure
# Do NOT run this as sudo


source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

makeDirIfNotExist "$HOME/.config" "776" "" &&
makeDirIfNotExist "$HOME/.local" "775" "" &&
makeDirIfNotExist "$HOME/.local/bin" "775" "" &&
makeDirIfNotExist "$HOME/bashOps/scripts" "775" "" &&
makeDirIfNotExist "$HOME/bashOps/setups" "775" "" &&
makeDirIfNotExist "$HOME/cheatSheets" "775" "" &&
makeDirIfNotExist "$HOME/dev" "775" "" &&
makeDirIfNotExist "$HOME/Desktop" "775" "" &&
makeDirIfNotExist "$HOME/Documents" "775" "" &&
makeDirIfNotExist "$HOME/gowork" "775" "" &&
makeDirIfNotExist "$HOME/math" "775" "" &&
makeDirIfNotExist "$HOME/Paladin" "775" "" &&
makeDirIfNotExist "$HOME/playground" "775" "" &&
makeDirIfNotExist "$HOME/Pictures" "775" "" &&
makeDirIfNotExist "$HOME/programming" "775" "" &&
makeDirIfNotExist "$HOME/projects" "775" "" &&
makeDirIfNotExist "$HOME/Public" "755" "" &&
makeDirIfNotExist "$HOME/repos" "775" "" &&
makeDirIfNotExist "$HOME/scratch" "777" "" &&
makeDirIfNotExist "$HOME/workNotes" "777" "" &&
successMsg "Base Directory Structure Creation Completed!"