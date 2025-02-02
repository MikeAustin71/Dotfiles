#!/bin/bash
# Configure .bashrc
# Install aliases and starship


declare baseSetups4Dir="$HOME"/bashOps/setups
source "$baseSetups4Dir"/utils/utilsLib.sh


msgNotify  "Backing up $HOME/.bashrc" &&
backupBashrcFile &&
successMsg "$HOME/.bashrc backup completed!" || {
  errXMsg "Error backing up $HOME/.bashrc"
}

