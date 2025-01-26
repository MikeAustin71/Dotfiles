#!/bin/bash
# Configure .bashrc
# Install aliases and starship


declare baseSetups3cDir="$HOME"/bashOps/setups

source "$baseSetups3cDir"/utils/utilsLib.sh
source "$baseSetups3cDir"/utils/utilsAppInstall.sh
source "$baseSetups3cDir"/utils/utilsAppConfig.sh

msgNotify "Installing 'ghostwriter' markdown editor" &&
installGhostwriter &&
msgNotify "Installing 'retext' markdown editor" &&
installRetext &&
msgNotify "Installing ripgrep" &&
installRipGrep &&
msgNotify "Installing Compression Utilities" &&
installCompressionUtilities &&
msgNotify "Installing KRename" &&
installKrename &&
msgNotify "Installing KGet" &&
installKget &&
msgNotify "Installing 'lynis' Security Tool" &&
installLynis &&
msgNotify "Installing 'Kate' Text Editor" &&
installKate &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups3cDir/stdAppInstall" &&
successMsg "All Phase-3c Utilities Installed." "003c-utilitiesInstall.sh" || {

errXMsg "003c-utilitiesInstall.sh Execution Failed" "Error-Exit!"
}