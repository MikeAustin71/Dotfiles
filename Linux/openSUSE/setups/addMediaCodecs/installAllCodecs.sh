#!/bin/bash
# Installs all Codecs
#

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

installMediaCodec() {

  local scriptFile

  scriptFile="$MIKE_Setup_Scripts/addMediaCodecs/01-addMediaCodecs.sh"

  source "$scriptFile"

}

installSoundVideoCodecs() {

  local scriptFile

  scriptFile="$MIKE_Setup_Scripts/addMediaCodecs/02_addMediaSoundVideo.sh"

  source "$scriptFile"
}

  installMediaCodec &&
  installSoundVideoCodecs &&
  successMsg "All Media Codecs Installed."