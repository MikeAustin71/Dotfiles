#!/bin/bash
# 1. Creates $HOME directory structure
#
###################################################################
#

declare baseSetups0Dir="$HOME"/bashOps/setups

source "$baseSetups0Dir"/utils/utilsLib.sh
source "$baseSetups0Dir"/utils/utilsAppConfig.sh
source "$baseSetups0Dir"/utils/utilsAppInstall.sh

msgNotify "Configuring 'HOME' Directory Structure" &&
configDirStructure &&
msgNotify "Configuring User Environment Variables" &&
configEnvars &&
msgNotify "Configuring User Path" &&
configUserPath &&
msgNotify "Configuring Aliases" &&
configAliases &&
msgNotify "Configuring User Functions" &&
configUserFuncs &&
successMsg "Created 'HOME' Directory and User Variable Structure" "Script: 000a-createDirStruct.sh" || {

  errXMsg "000a-createDirStruct.sh Execution Failed" "Error-Exit!"
}