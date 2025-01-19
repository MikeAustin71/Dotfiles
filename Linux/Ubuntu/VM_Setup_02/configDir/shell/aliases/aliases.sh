#!/bin/bash
# Mike's Aliases

# shellcheck disable=SC2139
alias aliases="bat $HOME/.config/shell/aliases/aliases.sh"

alias ip='ip -color'

alias cls="clear"

alias CLS="clear"

# alias cp='cp -i'

# alias mv='mv -i'


# Snapshot of current processes
alias ps='ps auxf'

alias top="btop"

alias update="sudo zypper update"

alias update2="updateMikeBase"

alias update3="updateMikeEverything"

function updateMikeBase() {

  local -i errorCode=0

  sudo zypper refresh || {
    errorCode=$?
    echo "Error from 'sudo zypper refresh'"
    echo "Terminating Update Operation!"
    echo "Error Code: $errorCode"
    echo "Function: updateMikeBase"
    echo "Script File: aliases.sh"

    return $errorCode
  }

  sudo zypper dup --allow-vendor-change || {
    errorCode=$?
     echo "Error from 'sudo zypper dup --allow-vendor-change'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: updateMikeBase"
     echo "Script File: aliases.sh"

     return $errorCode

  }

  sudo flatpak update || {

    errorCode=$?
     echo "Error from 'sudo flatpak update'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: updateMikeBase"
     echo "Script File: aliases.sh"

     return $errorCode
  }

  return 0
}

function updateMikeEverything() {

  local -i errorCode=0

  sudo zypper refresh || {
    errorCode=$?
    echo "Error from 'sudo zypper refresh'"
    echo "Terminating Update Operation!"
    echo "Error Code: $errorCode"
    echo "Function: updateMikeEverything"
    echo "Script File: aliases.sh"

    return $errorCode
  }

  sudo zypper dup --allow-vendor-change || {
    errorCode=$?
     echo "Error from 'sudo zypper dup --allow-vendor-change'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: updateMikeEverything"
     echo "Script File: aliases.sh"

     return $errorCode

  }

  sudo flatpak update || {

    errorCode=$?
     echo "Error from 'sudo flatpak update'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: updateMikeEverything"
     echo "Script File: aliases.sh"

     return $errorCode
  }

  sudo npm update || {

    errorCode=$?
     echo "Error from 'sudo npm update'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: updateMikeEverything"
     echo "Script File: aliases.sh"

     return $errorCode
  }


  echo
  echo "******************************************"
  echo "   All Updates Successfully Completed!"
  echo "******************************************"
  echo
  return 0

}
