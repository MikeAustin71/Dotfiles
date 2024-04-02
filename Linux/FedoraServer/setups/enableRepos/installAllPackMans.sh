#!/bin/bash
# Installs all Package Manager Repos
#

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

function runEnableFreeRepos {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts/enableRepos/01-enableFreeRepos.sh"

    # shellcheck disable=SC1090
    source "$scriptFile"

}

function runEnableNonFreeRepos {
   local scriptFile

    scriptFile="$MIKE_Setup_Scripts/enableRepos/02-enableNonFreeRepos.sh"

    # shellcheck disable=SC1090
    source "$scriptFile"
}

function runEnableGUIPackMan {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts/enableRepos/03-EnableGUIPackMan.sh"

    # shellcheck disable=SC1090
    source "$scriptFile"
}

function runEnableFlathub {

  local scriptFile

  # shellcheck disable=SC1090
  scriptFile="$MIKE_Setup_Scripts/enableRepos/04-enableFlathub.sh"

  # shellcheck disable=SC1090
  source "$scriptFile"
}

function runEnableFlatpack {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts/enableRepos/05-addFlatpackRepo.sh"

    # shellcheck disable=SC1090
    source "$scriptFile"
}


runEnableFreeRepos &&
runEnableNonFreeRepos &&
runEnableGUIPackMan &&
runEnableFlathub &&
runEnableFlatpack &&
successMsg "All Package Manager Repos installed."
