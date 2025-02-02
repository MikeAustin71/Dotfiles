#!/bin/bash
# Installs all Codecs
#

declare baseSetups502Dir="$HOME"/bashOps/setups

source "$baseSetups502Dir/utils/utilsLib.sh"

installMediaCodec() {

  local scriptFile

  scriptFile="$baseSetups502Dir/addMediaCodecs/01-addMediaCodecs.sh"

  # shellcheck disable=SC1090
  source "$scriptFile"

}

installSoundVideoCodecs() {

  local scriptFile

  scriptFile="$baseSetups502Dir/addMediaCodecs/02_addMediaSoundVideo.sh"

  # shellcheck disable=SC1090
  source "$scriptFile"
}

  installMediaCodec &&
  installSoundVideoCodecs &&
  successMsg "All Media Codecs Installed."