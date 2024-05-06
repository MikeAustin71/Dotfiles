#!/bin/bash
# Utilities Library for Application Configuration
#

declare utilAppCfgSetups="$HOME"/bashOps/setups

function configAlacritty() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configAlacritty.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configAlacritty.sh
   source "$scriptFile"
}

function configAliases() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/cfgBashrc/cfgAliases.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configAwesome.sh
   source "$scriptFile"
}

function configAwesome() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configAwesome.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configAwesome.sh
   source "$scriptFile"
}

function configBashProfile() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    #/setups/cfgBashProfile/cfgBashProfile.sh
    scriptFile="$utilAppCfgSetups"/cfgBashProfile/cfgBashProfile.sh


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
   scriptFile="$utilAppCfgSetups"/mikeFolders/createBaseFolders.sh


   # shellcheck source="$HOME"/bashOps/setups/mikeFolders/createBaseFolders.sh
   source "$scriptFile"

}

function configEnvars() {

  # shellcheck disable=SC2164
  cd "$HOME"

    local scriptFile
     # Linux/FedoraServer/setups/cfgEnvars/cfgEnvars.sh
    scriptFile="$utilAppCfgSetups"/cfgEnvars/cfgEnvars.sh


  # shellcheck source="$HOME"/bashOps/setups/cfgEnvars/cfgEnvars.sh
   source "$scriptFile"
}


function configKitty() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configKitty.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configKitty.sh
   source "$scriptFile"
}

function configKrusader() {

  # shellcheck disable=SC2164
  cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configKrusader.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configKrusader.sh
   source "$scriptFile"

 }

function configUserPath() {

  # shellcheck disable=SC2164
  cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/cfgPath/cfgUserPath.sh


  # shellcheck source="$HOME"/bashOps/setups/cfgEnvars/cfgEnvars.sh
   source "$scriptFile"
}

function configPicom() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configPicom.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configPicom.sh
   source "$scriptFile"
}

function configTmux() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile

    scriptFile="$utilAppCfgSetups"/customAppConfig/configTmux.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configKitty.sh
   source "$scriptFile"
}

function configXorgXintrc() {

    # shellcheck disable=SC2164
    cd "$HOME"

    local scriptFile=""

    scriptFile="$utilAppCfgSetups"/customAppConfig/configXintrc.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configXintrc.sh
   source "$scriptFile"

}

