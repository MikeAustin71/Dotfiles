#!/bin/bash
# Configure .bashrc
# Install aliases and starship


declare baseSetups5Dir="$HOME"/bashOps/setups

source "$baseSetups5Dir"/utils/utilsLib.sh
source "$baseSetups5Dir"/utils/utilsAppInstall.sh
source "$baseSetups5Dir"/utils/utilsAppConfig.sh

msgNotify "Installing 'libgthread' for Jetbrains" &&
installLibgthread  &&
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
msgNotify "Configuring 'fzf'(Fuzzy Finder) in .bashrc" &&
configBashrcFzf &&
msgNotify "Installing 'fkill'(Process Killer)" &&
installFkill &&
msgNotify "Installing 'procs'(Process Viewer)" &&
installProcs &&
msgNotify "Installing 'Yazi' File Manager" &&
installYazi &&
msgNotify "Configuring User Functions for 'Yazi' File Manager" &&
configFuncsYazi
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
msgNotify "Installing ImageMagick" &&
installImageMagick &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups5Dir/stdAppInstall" &&
successMsg "All Phase-3a Utilities Installed." "003a-utilitiesInstall" || {
  errXMsg "003a-utilitiesInstall Execution Failed" "Error-Exit!"
}