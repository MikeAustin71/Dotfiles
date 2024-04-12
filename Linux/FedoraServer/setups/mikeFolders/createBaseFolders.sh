#!/bin/bash
#  Make Initial Directory Structure
# Do NOT run this as sudo


source "$HOME"/bashOps/setups/utils/utilsLib.sh

makeDirIfNotExist "$HOME/bin" "775" "" &&
makeDirIfNotExist "$HOME/.config" "775" "" &&
makeDirIfNotExist "$HOME/.config/shell/aliases" "775" "" &&
makeDirIfNotExist "$HOME/.config/shell/envars" "775" "" &&
makeDirIfNotExist "$HOME/.config/shell/path" "775" "" &&
makeDirIfNotExist "$HOME/.config/starship" "775" "" &&
makeDirIfNotExist "$HOME/.config/shell/xorg" "775" "" &&
makeDirIfNotExist "$HOME/.local" "775" "" &&
makeDirIfNotExist "$HOME/.local/share" "775" "" &&
makeDirIfNotExist "$HOME/.local/share/fonts" "775" "" &&
makeDirIfNotExist "$HOME/.local/bin" "775" "" &&
makeDirIfNotExist "$HOME/.local/cache" "775" "" &&
makeDirIfNotExist "$HOME/.local/cache/.starship/cache" "775" "" &&
makeDirIfNotExist "$HOME/bashOps/scripts" "775" "" &&
makeDirIfNotExist "$HOME/bashOps/setups" "775" "" &&
makeDirIfNotExist "$HOME/cheatSheets" "775" "" &&
makeDirIfNotExist "$HOME/dev" "775" "" &&
makeDirIfNotExist "$HOME/Desktop" "775" "" &&
makeDirIfNotExist "$HOME/Documents" "775" "" &&
makeDirIfNotExist "$HOME/Downloads" "775" "" &&
makeDirIfNotExist "$HOME/gowork" "775" "" &&
makeDirIfNotExist "$HOME/math" "775" "" &&
makeDirIfNotExist "$HOME/Paladin" "775" "" &&
makeDirIfNotExist "$HOME/playground" "775" "" &&
makeDirIfNotExist "$HOME/Pictures" "775" "" &&
makeDirIfNotExist "$HOME/programming" "775" "" &&
makeDirIfNotExist "$HOME/projects" "775" "" &&
makeDirIfNotExist "$HOME/Public" "775" "" &&
makeDirIfNotExist "$HOME/repos" "775" "" &&
makeDirIfNotExist "$MIKE_DotFiles_Repo" "775" "" &&
makeDirIfNotExist "$HOME/scratch" "777" "" &&
makeDirIfNotExist "$HOME/workNotes" "777" "" &&
successMsg "Base Directory Structure Creation Completed!"