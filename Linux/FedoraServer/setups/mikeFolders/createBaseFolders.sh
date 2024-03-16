#!/bin/bash
#  Make Initial Directory Structure
# Do NOT run this as sudo


source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

makeDirIfNotExist "$XDG_CONFIG_HOME" "775" "" &&
makeDirIfNotExist "$XDG_CONFIG_ALIASES" "775" "" &&
makeDirIfNotExist "$XDG_LOCAL_HOME" "775" "" &&
makeDirIfNotExist "$XDG_BIN_HOME" "775" "" &&
makeDirIfNotExist "$XDG_CACHE_HOME" "775" "" &&
makeDirIfNotExist "$XDG_SHARE_HOME" "775" "" &&
makeDirIfNotExist "$XDG_LOCAL_STARSHIP" "775" "" &&
makeDirIfNotExist "$STARSHIP_CACHE" "775" "" &&
makeDirIfNotExist "$MIKE_BashOps/scripts" "775" "" &&
makeDirIfNotExist "$MIKE_BashOps/setups" "775" "" &&
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
makeDirIfNotExist "$MIKE_Git_Repos" "775" "" &&
makeDirIfNotExist "$MIKE_DotFiles_Repo" "775" "" &&
makeDirIfNotExist "$HOME/scratch" "777" "" &&
makeDirIfNotExist "$HOME/workNotes" "777" "" &&
successMsg "Base Directory Structure Creation Completed!"