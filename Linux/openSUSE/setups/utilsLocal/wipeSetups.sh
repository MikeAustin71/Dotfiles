#!/bin/bash
# Used to delete all files and directories
# in $HOME/bashOps/setups
#   --- BE CAREFUL ---


declare baseSetups990Dir="$HOME"/bashOps/setups

rm -rf "${baseSetups990Dir:?}/"*

