#!/bin/bash
# Utilities Library for Application Configuration
#

function configAliases() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$HOME"/bashOps/setups/cfgBashrc/cfgAliases.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configAwesome.sh
   source "$scriptFile"
}

function configAwesome() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppConfig/configAwesome.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configAwesome.sh
   source "$scriptFile"
}

function configBashProfile() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    #/setups/cfgBashProfile/cfgBashProfile.sh
    scriptFile="$HOME"/bashOps/setups/cfgBashProfile/cfgBashProfile.sh


   # shellcheck disable=SC1090
   source "$scriptFile"

   local scriptBashProfile

   scriptBashProfile="$HOME"/.bash_profile

  # shellcheck disable=SC1090
  source "$scriptBashProfile"

}

function configDirStructure() {

  # shellcheck disable=SC2164
  cd "$HOME"

  local scriptFile

   #Linux/FedoraServer/setups/mikeFolders/createBaseFolders.sh
   scriptFile="$HOME"/bashOps/setups/mikeFolders/createBaseFolders.sh


   # shellcheck source="$HOME"/bashOps/setups/mikeFolders/createBaseFolders.sh
   source "$scriptFile"

}

function configEnvars() {

  # shellcheck disable=SC2164
  cd "$HOME"

    local scriptFile
     # Linux/FedoraServer/setups/cfgEnvars/cfgEnvars.sh
    scriptFile="$HOME"/bashOps/setups/cfgEnvars/cfgEnvars.sh


  # shellcheck source="$HOME"/bashOps/setups/cfgEnvars/cfgEnvars.sh
   source "$scriptFile"
}

function configKrusader() {

  # shellcheck disable=SC2164
  cd "$HOME"

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppConfig/configKrusader.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configKrusader.sh
   source "$scriptFile"

 }

function configUserPath() {

  # shellcheck disable=SC2164
  cd "$HOME"

    local scriptFile

    scriptFile="$HOME"/bashOps/setups/cfgPath/cfgUserPath.sh


  # shellcheck source="$HOME"/bashOps/setups/cfgEnvars/cfgEnvars.sh
   source "$scriptFile"
}

function configPicom() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppConfig/configPicom.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configPicom.sh
   source "$scriptFile"
}

function configXintrc() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile=""

    scriptFile="$MIKE_Setup_Scripts"/customAppConfig/configXintrc.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configXintrc.sh
   source "$scriptFile"

}

