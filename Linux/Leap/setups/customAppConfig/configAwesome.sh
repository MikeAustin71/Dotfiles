declare baseSetups93ADir="$HOME"/bashOps/setups
source "$baseSetups93ADir"/utils/utilsLib.sh
source "$baseSetups93ADir"/utils/utilsAppInstall.sh
source "$baseSetups93ADir"/utils/utilsAppConfig.sh

declare -i x93ACode=0

  cp -r "$baseSetups93ADir"/configDir/awesome "$HOME"/.config || {

    x93ACode=$?

    errXMsg "'awesome' Directory Copy Failed" "$baseSetups93ADir/configDir/awesome -> $HOME/.config" "Script: configAwesome.sh" "Error Code: $x93ACode"

    return $x93ACode

  }
