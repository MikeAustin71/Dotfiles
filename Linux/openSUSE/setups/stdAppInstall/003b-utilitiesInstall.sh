#!/bin/bash
# Configure .bashrc
# Install aliases and starship


declare baseSetups3bDir="$HOME"/bashOps/setups

source "$baseSetups3bDir"/utils/utilsLib.sh
source "$baseSetups3bDir"/utils/utilsAppInstall.sh
source "$baseSetups3bDir"/utils/utilsAppConfig.sh

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
changeToDir "$baseSetups3bDir/stdAppInstall" &&
successMsg "All Phase-3b Utilities Installed." "003b-utilitiesInstall.sh" || {

errXMsg "003b-utilitiesInstall.sh Execution Failed" "Error-Exit!"
}