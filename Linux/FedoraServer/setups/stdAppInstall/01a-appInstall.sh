#!/bin/bash
# Install 1-a application series
#

source "$MIKE_Setup_Utilities"/utilsLib.sh
source "$MIKE_Setup_Utilities"/utilsAppInstall.sh


function runScriptBroot() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppInstalls/installbroot.sh

    # shellcheck source="$HOME"/bashOps/setups/customAppInstalls/installbroot.sh
    source "$scriptFile"
}

function runScriptDust() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppInstalls/installDust.sh

     # shellcheck source="$HOME"/bashOps/setups/customAppInstalls/installDust.sh
   source "$scriptFile"
}

function runScriptMicro() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppInstalls/installmicro.sh


  # shellcheck source="$HOME"/bashOps/setups/customAppInstalls/installmicro.sh
   source "$scriptFile"

}

function runScriptPeco() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppInstalls/installpeco.sh


  # shellcheck source="$HOME"/bashOps/setups/customAppInstalls/installpeco.sh
   source "$scriptFile"

}


installNano &&
installCurl &&
installWget &&
installVmwareTools &&
installTrash &&
installTerminusFonts &&
installFontAwesome &&
installCompressionUtilities &&
installEza &&
installAutoJump &&
installFuzzyFinder &&
installGHQ &&
installMidnightCommander &&
installNano &&
installNcdu &&
installNeofetch &&
installPlocate &&
installRipGrep &&
installBtop &&
installCheat &&
installTldr &&
installZoxide &&
runScriptMicro &&
runScriptBroot &&
runScriptDust &&
runScriptPeco &&
successMsg "All Phase-1a Applications Installed."
