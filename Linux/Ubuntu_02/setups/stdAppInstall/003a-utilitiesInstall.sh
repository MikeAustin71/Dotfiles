#!/bin/bash
# Configure .bashrc
# Install aliases and starship


declare baseSetups3aDir="$HOME"/bashOps/setups

source "$baseSetups3aDir"/utils/utilsLib.sh
source "$baseSetups3aDir"/utils/utilsAppInstall.sh
source "$baseSetups3aDir"/utils/utilsAppConfig.sh

msgNotify "Installing 'hishtory' Shell History Application" &&
installHisHtory &&
msgNotify "Installing 'btop'" &&
installBtop &&
msgNotify "Installing 'bottom'" &&
installBottom &&
msgNotify "Installing 'fd' (find)" &&
installFd &&
msgNotify "Installing 'fzf'(Fuzzy Finder)" &&
installFuzzyFinder &&
msgNotify "Installing 'fkill'(Process Killer)" &&
installFkill &&
msgNotify "Installing 'procs'(Process Viewer)" &&
installProcs &&
msgNotify "Installing 'tldr'" &&
installTldr &&
msgNotify "Installing 'lshw'" &&
installLshw &&
msgNotify "Installing 'ncurses' dependency for 'multitail' " &&
installNcurses &&
msgNotify "Installing 'multitail'" &&
installMultiTail &&
msgNotify "Installing fastfetch" &&
installFastFetch &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups3aDir/stdAppInstall" &&
successMsg "All Phase-3a Utilities Installed." "Script: 003a-utilitiesInstall" || {
  errXMsg "003a-utilitiesInstall Execution Failed" "Error-Exit!"
}