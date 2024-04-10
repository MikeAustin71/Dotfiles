#!/bin/bash
# 1. Creates directory structure
# 2. Creates .bash_profile
#
source "$HOME"/bashOps/setups/utils/utilsAppConfig.sh


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
configAliases &&
configBashProfile &&
successMsg "All Phase-00a Structures Created." "REBOOT YOUR COMPUTER!"