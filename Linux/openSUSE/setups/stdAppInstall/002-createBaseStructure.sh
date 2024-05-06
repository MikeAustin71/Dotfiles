#!/bin/bash
# 1. Creates directory structure
# 2. Creates .bash_profile
#

declare baseSetups2Dir="$HOME"/bashOps/setups

source "$baseSetups2Dir"/utils/utilsLib.sh
source "$baseSetups2Dir"/utils/utilsAppConfig.sh
source "$baseSetups2Dir"/utils/utilsAppInstall.sh

msgNotify "Configuring 'HOME' Directory Structure" &&
configDirStructure &&
msgNotify "Configuring Environment Variables" &&
configEnvars &&
msgNotify "Configuring PATH Environment Variable" &&
configUserPath &&
# Configures Aliases and .bashrc
msgNotify "Configuring Aliases" &&
configAliases &&
msgNotify "Configuring Starship" &&
configStarship &&
msgNotify "Configuring .bash_profile" &&
configBashProfile &&
successMsg "All Phase-2 Structures Created." "REBOOT YOUR COMPUTER!" "Script: 002-createBaseStructure.sh" || errXMsg "002-createBaseStructure.sh Execution Failed" "Error-Exit!"