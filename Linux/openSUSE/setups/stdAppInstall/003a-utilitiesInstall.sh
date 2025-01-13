#!/bin/bash
# Configure .bashrc
# Install aliases and starship


declare baseSetups5Dir="$HOME"/bashOps/setups

source "$baseSetups5Dir"/utils/utilsLib.sh
source "$baseSetups5Dir"/utils/utilsAppInstall.sh
source "$baseSetups5Dir"/utils/utilsAppConfig.sh

msgNotify "Installing 'libgthread' for Jetbrains" &&
installLibgthread  &&
msgNotify "Installing 'atuin'" &&
installAtuin &&
msgNotify "Installing 'micro'" &&
installMicro &&
msgNotify "Installing 'btop'" &&
installBtop &&
msgNotify "Installing 'btm' (Bottom)" &&
installBottom &&
msgNotify "Installing 'dust'" &&
installDust &&
msgNotify "Installing 'fd'(find)" &&
installFd &&
msgNotify "Installing 'plocate'" &&
installPlocate &&
msgNotify "Installing 'fzf'(Fuzzy Finder)" &&
installFuzzyFinder &&
msgNotify "Installing 'fkill'(Process Killer)" &&
installFkill &&
msgNotify "Installing 'procs'(Process Viewer)" &&
installProcs &&
msgNotify "Installing 'mc'(Midnight Commander)" &&
installMidnightCommander &&
msgNotify "Installing 'Yazi'File Manager" &&
installYazi &&
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