#!/bin/bash
# Configure .bashrc
# Install aliases and starship


declare baseSetups9Dir="$HOME"/bashOps/setups

source "$baseSetups9Dir"/utils/utilsLib.sh
source "$baseSetups9Dir"/utils/utilsAppInstall.sh
source "$baseSetups9Dir"/utils/utilsAppConfig.sh

msgNotify "Installing 'KeePassXC'" &&
installKeePassXC &&