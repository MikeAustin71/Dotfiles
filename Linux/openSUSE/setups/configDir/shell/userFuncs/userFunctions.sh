#!/bin/bash
# Mike's User Defined Functions

###############################################
#                FUNCTION
#                 mBoot()
#
# Reboots the computer.
# systemctl reboot
###############################################
function mBoot() {


  echo ""
  echo "**********************************************"
  echo "           mBoot()"
  echo ""
  echo "Rebooting the comuter ..."
  echo "**********************************************"
  echo ""

  sudo systemctl reboot
}


###############################################
#                FUNCTION
#                mPwrOff()
#
# Powers off or shutsdown the computer.
# systemctl poweroff
###############################################
function mPwrOff() {


  echo ""
  echo "**********************************************"
  echo "          mPwrOff()"
  echo ""
  echo "Powering off the comuter ..."
  echo "**********************************************"
  echo ""

  sudo systemctl poweroff
}


###############################################
#                FUNCTION
#                update0
# Update zypper only
# zypper DOES NOT USE --allow-vendor-change
###############################################
function update0() {

  local -i errorCode=0

  echo ""
  echo "*********************************************"
  echo "          Function: update0()"
  echo "Update zypper ONLY."
  echo "DOES NOT USE --allow-vendor-change"
  echo "sudo zypper dup"
  echo "*********************************************"
  echo ""


  sudo zypper refresh || {
    errorCode=$?
    echo "Error from 'sudo zypper refresh'"
    echo "Terminating Update Operation!"
    echo "Error Code: $errorCode"
    echo "Function: update0()"
    echo "Script File: userFunctions.sh"

    return $errorCode
  }

  sudo zypper dup || {
    errorCode=$?
     echo "Error from 'sudo zypper dup'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update0()"
     echo "Script File: userFunctions.sh"

     return $errorCode

  }

  echo
  echo "******************************************"
  echo "   update0() Successfully Completed!"
  echo "   Script File: userFunctions.sh"
  echo "******************************************"
  echo
  return 0

}


###############################################
#                FUNCTION
#                update1
# Update zypper only
# zypper uses --allow-vendor-change
###############################################
function update1() {

  local -i errorCode=0


  echo ""
  echo "*********************************************"
  echo "          Function: update1()"
  echo "Update zypper ONLY."
  echo "USES --allow-vendor-change"
  echo "sudo zypper dup --allow-vendor-change"
  echo "*********************************************"
  echo ""


  sudo zypper refresh || {
    errorCode=$?
    echo "Error from 'sudo zypper refresh'"
    echo "Terminating Update Operation!"
    echo "Error Code: $errorCode"
    echo "Function: update1()"
    echo "Script File: userFunctions.sh"

    return $errorCode
  }

  sudo zypper dup --allow-vendor-change || {
    errorCode=$?
     echo "Error from 'sudo zypper dup --allow-vendor-change'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update1()"
     echo "Script File: userFunctions.sh"

     return $errorCode

  }

  echo ""
  echo "******************************************"
  echo "  update1() Successfully Completed!"
  echo "   Script File: userFunctions.sh"
  echo "******************************************"
  echo ""
  return 0

}


###############################################
#                FUNCTION
#                update2
# Update zypper and flatpak
# zypper uses --allow-vendor-change
###############################################

function update2() {

  local -i errorCode=0


  echo ""
  echo "*********************************************"
  echo "          Function: update2()"
  echo "Update zypper and flatpak"
  echo "USES --allow-vendor-change"
  echo "*********************************************"
  echo ""



  sudo zypper refresh || {
    errorCode=$?
    echo "Error from 'sudo zypper refresh'"
    echo "Terminating Update Operation!"
    echo "Error Code: $errorCode"
    echo "Function: update2()"
    echo "Script File: userFunctions.sh"

    return $errorCode
  }

  sudo zypper dup --allow-vendor-change || {
    errorCode=$?
     echo "Error from 'sudo zypper dup --allow-vendor-change'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update2()"
     echo "Script File: userFunctions.sh"

     return $errorCode

  }

  sudo flatpak update || {

    errorCode=$?
     echo "Error from 'sudo flatpak update'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update2()"
     echo "Script File: userFunctions.sh"

     return $errorCode
  }

  echo
  echo "******************************************"
  echo "  update2() Successfully Completed!"
  echo "   Script File: userFunctions.sh"
  echo "******************************************"
  echo
  return 0
}

###############################################
#                FUNCTION
#                update3
# Full Update. Update Everything
# zypper, flatpak, npm, rust and gem
# zypper uses --allow-vendor-change
###############################################
function update3() {

  local -i errorCode=0


  echo ""
  echo "**********************************************"
  echo "          Function: update3()"
  echo "Update Everything:"
  echo "       zypper, flatpak, npm, rust and gem"
  echo "USES --allow-vendor-change"
  echo "**********************************************"
  echo ""

  echo ""
  echo "**********************************************"
  echo "            Repository Refresh"
  echo "**********************************************"
  echo ""

  sudo zypper refresh || {
    errorCode=$?
    echo "Error from 'sudo zypper refresh'"
    echo "Terminating Update Operation!"
    echo "Error Code: $errorCode"
    echo "Function: update3()"
    echo "Script File: userFunctions.sh"

    return $errorCode
  }

  echo ""
  echo "**********************************************"
  echo "          Starting zypper Update"
  echo "**********************************************"
  echo ""
  echo ""

    sudo zypper dup --allow-vendor-change || {
    errorCode=$?
     echo "Error from 'sudo zypper dup --allow-vendor-change'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update3()"
     echo "Script File: userFunctions.sh"

     return $errorCode

  }

  echo ""
  echo ""
  echo "**********************************************"
  echo "             Updating Flatpak"
  echo "**********************************************"
  echo ""

  sudo flatpak update || {

    errorCode=$?
     echo "Error from 'sudo flatpak update'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update3()"
     echo "Script File: userFunctions.sh"

     return $errorCode
  }

  echo ""
  echo ""
  echo "**********************************************"
  echo "             Updating npm"
  echo "**********************************************"
  echo ""

  sudo npm update || {

    errorCode=$?
     echo "Error from 'sudo npm update'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update3()"
     echo "Script File: userFunctions.sh"

     return $errorCode
  }

  echo ""
  echo ""
  echo "**********************************************"
  echo "             Updating rust"
  echo "**********************************************"
  echo ""

  rustup update || {

    errorCode=$?
     echo "Error while updating 'rust'"
     echo "Command: 'rustup update'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update3"
     echo "Script File: userFunctions.sh"

     return $errorCode

  }


  echo ""
  echo ""
  echo "**********************************************"
  echo "             Updating gem"
  echo "**********************************************"
  echo ""

  sudo gem update || {

    errorCode=$?
     echo "Error while updating 'gem'"
     echo "Command: 'sudo gem update'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update3"
     echo "Script File: userFunctions.sh"

     return $errorCode

  }

  echo ""
  echo ""
  echo "******************************************"
  echo "   update3() Successfully Completed!"
  echo "   Script File: userFunctions.sh"
  echo "******************************************"
  echo ""

  return 0
}


###############################################
#                FUNCTION
#                   ex
###---------- ARCHIVE EXTRACT ----------###
### [Jake@Linux - YouTube](https://www.youtube.com/@JakeLinux)
# #####################################
ex() {

    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1   ;;
        *.tar.gz)    tar xzf $1   ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1   ;;
        *.gz)        gunzip $1    ;;
        *.tar)       tar xf $1    ;;
        *.tbz2)      tar xjf $1   ;;
        *.tgz)       tar xzf $1   ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1;;
        *.7z)        7za e x $1   ;;
        *.deb)       ar x $1      ;;
        *.tar.xz)    tar xf $1    ;;
        *.tar.zst)   unzstd $1    ;;
        *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid archive file!"
  fi

}

# #####################################
#             FUNCTION
#               ftext
# Searches for text in all files in the current folder
# https://github.com/christitustech/mybash
# #####################################

ftext() {
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

# #####################################
#             FUNCTION
#             whatsmyip
# IP address lookup
# https://github.com/christitustech/mybash
# #####################################

function whatsmyip() {
	# Internal IP Lookup.
	if [ -e /sbin/ip ]; then
		echo -n "Internal IP: "
		/sbin/ip addr show wlan0 | grep "inet " | awk -F: '{print $1}' | awk '{print $2}'
	else
		echo -n "Internal IP: "
		/sbin/ifconfig wlan0 | grep "inet " | awk -F: '{print $1} |' | awk '{print $2}'
	fi

	# External IP Lookup
	echo -n "External IP: "
	curl -s ifconfig.me

}


# #####################################
#             FUNCTION
#               trim
# Trim leading and trailing spaces (for scripts)
# https://github.com/christitustech/mybash
# #####################################
trim() {

	local var=$*
	var="${var#"${var%%[![:space:]]*}"}" # remove leading whitespace characters
	var="${var%"${var##*[![:space:]]}"}" # remove trailing whitespace characters
	echo -n "$var"

}
