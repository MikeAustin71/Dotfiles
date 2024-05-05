#!/bin/bash
# 1. Creates directory structure
# 2. Creates .bash_profile
#
source "$HOME"/bashOps/setups/utils/utilsLib.sh
source "$HOME"/bashOps/setups/utils/utilsAppConfig.sh
source "$HOME"/bashOps/setups/utils/utilsAppInstall.sh

installEza &&
installMicro &&
installBroot &&
installBtop &&
installFd &&
installFuzzyFinder &&
installFkill &&
installMidnightCommander &&
installBashCompletion &&
installBat &&
installTldr &&
installZoxide &&
installTrash &&
installScriptGHQ &&
configDirStructure &&
configEnvars &&
configUserPath &&
# Configures Aliases and .bashrc
configAliases &&
configBashProfile &&
successMsg "All Phase-00a Structures Created." "REBOOT YOUR COMPUTER!" "Script: 00a-createBaseStructure.sh" || errXMsg "00a-createBaseStructure.sh Execution Failed" "Error-Exit!"