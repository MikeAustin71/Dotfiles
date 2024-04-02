#!/bin/bash
# Configure .bashrc
# Install aliases and starship



function runScriptAliases() {

  local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/cfgBashrc/cfgAliases.sh


    # shellcheck source="$HOME"/bashOps/setups/cfgBashrc/cfgAliases.sh
    source "$scriptFile"

}


function runScriptStarshipInstall() {

  local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppInstalls/installStarship.sh

     # shellcheck source="$HOME"/bashOps/setups/customAppInstalls/installStarship.sh
    source "$scriptFile"


}

runScriptAliases &&
runScriptStarshipInstall &&
successMsg "All Phase-2a Applications Installed."