#!/bin/bash
# Mike2

declare baseSetups2Dir="$HOME"/bashOps/setups

source "$baseSetups2Dir"/utils/utilsLib.sh
source "$baseSetups2Dir"/utils/utilsAppConfig.sh
source "$baseSetups2Dir"/utils/utilsAppInstall.sh

msgNotify "Testing Message Notify!" &&
successMsg "Test Message" "Script: testFunc2.sh" || {

  errXMsg "testFunc.sh Execution Failed" "Error-Exit!"
}
