#!/bin/bash
# Utilities Library for Application Configuration
#

function configXintrc() {

    local scriptFile=""

    scriptFile="$MIKE_Setup_Scripts"/customAppConfig/configXintrc.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configXintrc.sh
   source "$scriptFile"

}

function configPicom() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppConfig/configPicom.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configPicom.sh
   source "$scriptFile"
}

function configKrusader() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppConfig/configKrusader.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configKrusader.sh
   source "$scriptFile"

  }


function configAwesome() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppConfig/configAwesome.sh


  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configAwesome.sh
   source "$scriptFile"
}
