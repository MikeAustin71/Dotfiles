source "$MIKE_Setup_Utilities"/utilsLib.sh



function installRofiDefaultCfg() {

  local -i errorCode=0

  makeDirIfNotExist "$XDG_CONFIG_HOME/rofi" "777" "$(whoami)" || {

    errorCode=$?

    errXMsg "Call to 'makeDirIfNotExist' Failed!" "Function: installRofiDefaultCfg()" "Error Code: $errorCode"

     return $errorCode

  }

  rofi -dump-config > "$XDG_CONFIG_HOME"/rofi/config.rasi || {

    errorCode=$?

    errXMsg "rofi -dump-config Failed" "-> $XDG_CONFIG_HOME/rofi/config.rasi" "Function: installRofiDefaultCfg()" "Error Code: $errorCode"

    return $errorCode

  }

  return 0
}

installRofiDefaultCfg &&
successMsg "Rofi Default Config Installed." || errXMsg "150a-installRofiDefaultCfg.sh Execution Failed" "Error-Exit!"