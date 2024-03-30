#!/bin/bash
# Used to pull down latest version of dotfiles and
# configure  ~/bashOps/setups

declare targFileName="copyDotFilesToSetups.sh"

declare targHomeFile="$HOME/$targFileName"

if [[ -f $targHomeFile ]]
then
	rm $targHomeFile
fi

cd "$HOME"/repos/Dotfiles

git pull origin main

cp "$HOME/repos/Dotfiles/Linux/FedoraServer/setups/cfgDotFiles/$targFileName" "$targHomeFile"

cd "$HOME"

chmod 775 ./"$targFileName"

./"$targFileName"
