#!/bin/bash
# Utilities Library for Application Configuration
#

function configAliases() {

    local scriptFile

    scriptFile="$HOME"/bashOps/setups/cfgBashrc/cfgAliases.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configAwesome.sh
   source "$scriptFile"
}

function configAwesome() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppConfig/configAwesome.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configAwesome.sh
   source "$scriptFile"
}

function configBashProfile() {

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

  local scriptFile

   #Linux/FedoraServer/setups/mikeFolders/createBaseFolders.sh
   scriptFile="$HOME"/bashOps/setups/mikeFolders/createBaseFolders.sh


   # shellcheck source="$HOME"/bashOps/setups/mikeFolders/createBaseFolders.sh
   source "$scriptFile"

}

function configEnvars() {

    local scriptFile
     # Linux/FedoraServer/setups/cfgEnvars/cfgEnvars.sh
    scriptFile="$HOME"/bashOps/setups/cfgEnvars/cfgEnvars.sh


  # shellcheck source="$HOME"/bashOps/setups/cfgEnvars/cfgEnvars.sh
   source "$scriptFile"
}

function configKrusader() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppConfig/configKrusader.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configKrusader.sh
   source "$scriptFile"

 }

function configUserPath() {

    local scriptFile

    scriptFile="$HOME"/bashOps/setups/cfgEnvars/cfgEnvars.sh


  # shellcheck source="$HOME"/bashOps/setups/cfgEnvars/cfgEnvars.sh
   source "$scriptFile"
}

function configPicom() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppConfig/configPicom.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configPicom.sh
   source "$scriptFile"
}

function configXintrc() {

    local scriptFile=""

    scriptFile="$MIKE_Setup_Scripts"/customAppConfig/configXintrc.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configXintrc.sh
   source "$scriptFile"

}

