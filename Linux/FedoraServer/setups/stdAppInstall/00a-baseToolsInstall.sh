#!/bin/bash
# Installs base Tools
# Run this as sudo


source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh



installCoreUtils &&
installRealPath &&
installCurl &&
installWget &&
installCompressionUtilities &&
installNano &&
installNeofetch &&
installVmwareTools &&
successMsg "All Base Tools Installed."
