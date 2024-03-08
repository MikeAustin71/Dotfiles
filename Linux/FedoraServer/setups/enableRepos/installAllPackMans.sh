#!/bin/bash
# Installs all Package Manager Repos
#

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

function runEnableFreeRepos {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts/enableRepos/01-enableFreeRepos.sh"

    source "$scriptFile"

}

function runEnableNonFreeRepos {
   local scriptFile

    scriptFile="$MIKE_Setup_Scripts/enableRepos/02-enableNonFreeRepos.sh"

    source "$scriptFile"
}

function runEnableGUIPackMan {

     local scriptFile

        scriptFile="$MIKE_Setup_Scripts/enableRepos/03-EnableGUIPackMan.sh"

    source "$scriptFile"
}

function runEnableFlathub {

   local scriptFile

   scriptFile="$MIKE_Setup_Scripts/enableRepos/04-enableFlathub.sh"

    source "$scriptFile"
}

function runEnableFlatpack {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts/enableRepos/05-addFlatpackRepo.sh"

    source "$scriptFile"
}


runEnableFreeRepos &&
runEnableNonFreeRepos &&
runEnableGUIPackMan &&
runEnableFlathub &&
runEnableFlatpack &&
successMsg "All Package Manager Repos installed."
