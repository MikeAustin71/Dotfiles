
source "$HOME"/bashOps/setups/utils/utilsLib.sh
source "$HOME"/bashOps/setups/utils/utilsAppInstall.sh
source "$HOME"/bashOps/setups/utils/utilsAppConfig.sh

msgNotify "Installing 'flatseal'" &&
installFlatSeal &&
successMsg "'flatseal' successfully installed!" || {

  errXMsg "'flatseal' installation error!"

}