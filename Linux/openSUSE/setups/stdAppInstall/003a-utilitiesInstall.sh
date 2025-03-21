#!/bin/bash
# Configure .bashrc
# Install aliases and starship


declare baseSetups5Dir="$HOME"/bashOps/setups

source "$baseSetups5Dir"/utils/utilsLib.sh
source "$baseSetups5Dir"/utils/utilsAppInstall.sh
source "$baseSetups5Dir"/utils/utilsAppConfig.sh

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
msgNotify "Installing 'tldr'" &&
installTldr &&
msgNotify "Installing 'lshw'" &&
installLshw &&
msgNotify "Installing 'ncurses' dependency for 'multitail' " &&
installNcurses &&
msgNotify "Installing 'multitail'" &&
installMultiTail &&
msgNotify "Installing 'font-manager'" &&
installFontMgr &&
msgNotify "Installing fastfetch" &&
installFastFetch &&
msgNotify "Installing 'broot'" &&
installBroot &&
msgNotify "Configuring 'broot' aliases" &&
configAliasesBroot &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups5Dir/stdAppInstall" &&
successMsg "All Phase-3a Utilities Installed." "003a-utilitiesInstall" || {
  errXMsg "003a-utilitiesInstall Execution Failed" "Error-Exit!"
}