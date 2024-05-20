
source "$HOME"/bashOps/setups/utils/utilsLib.sh
source "$HOME"/bashOps/setups/utils/utilsAppInstall.sh
source "$HOME"/bashOps/setups/utils/utilsAppConfig.sh

msgNotify "Installing plocate" &&
installPlocate &&
msgNotify "Installing podman" &&
installPodman &&
msgNotify "Installing podman Desktop" &&
installPodman &&
msgNotify "Installing podman DistroBox" &&
installDistroBox &&
successMsg "All Test Applications Installed." "testFunc.sh" || errXMsg "testFunc.sh Execution Failed" "Error-Exit!"
