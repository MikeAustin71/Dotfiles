#!/bin/bash
# 1. Creates directory structure
# 2. Creates .bash_profile
#
source "$HOME"/bashOps/setups/utils/utilsLib.sh
source "$HOME"/bashOps/setups/utils/utilsAppConfig.sh
source "$HOME"/bashOps/setups/utils/utilsAppInstall.sh

installNano &&
installCurl &&
installWget &&
installEza &&
installScriptMicro &&
installScriptBroot &&
installBashCompletion &&
installBat &&
installGit &&
installCheat &&
installTldr &&
installZoxide &&
installTrash &&
configDirStructure &&
configEnvars &&
configUserPath &&
# Configures Aliases and .bashrc
configAliases &&
configBashProfile &&
installScriptGHQ &&
successMsg "All Phase-00a Structures Created." "REBOOT YOUR COMPUTER!" "Script: 00a-createBaseStructure.sh" || errXMsg "00a-createBaseStructure.sh Execution Failed" "Error-Exit!"