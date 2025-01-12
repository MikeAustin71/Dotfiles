#!/bin/bash
# Configure .bashrc
# Install aliases and starship


declare baseSetups9Dir="$HOME"/bashOps/setups

source "$baseSetups9Dir"/utils/utilsLib.sh
source "$baseSetups9Dir"/utils/utilsAppInstall.sh
source "$baseSetups9Dir"/utils/utilsAppConfig.sh

msgNotify "Installing 'ghostwriter' markdown editor" &&
installGhostwriter &&
msgNotify "Installing ripgrep" &&
installRipGrep &&
msgNotify "Installing Peco" &&
installScriptPeco &&
msgNotify "Installing Compression Utilities" &&
installCompressionUtilities &&
msgNotify "Installing KRename" &&
installKrename &&
msgNotify "Installing KGet" &&
installKget &&
msgNotify "Installing 'lynis' Security Tool" &&
installLynis &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups9Dir/stdAppInstall" &&
successMsg "All Phase-3b Utilities Installed." "003b-utilitiesInstall.sh" || {

errXMsg "003b-utilitiesInstall.sh Execution Failed" "Error-Exit!"
}