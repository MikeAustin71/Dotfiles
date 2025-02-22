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
# Powers Of the computer.
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
#                update1
# Update apt only
# apt update && sudo apt full-upgrade -y
###############################################
function update1() {

  local -i errorCode=0


  echo ""
  echo "**********************************************"
  echo "Running update1(). update and full-upgrade ..."
  echo "**********************************************"
  echo ""


   sudo apt update && sudo apt full-upgrade -y || {
    errorCode=$?
     echo "Error while running apt update/upgrade"
     echo "Command: 'sudo apt update && sudo apt full-upgrade -y'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update1()"
     echo "Script File: userFunctions.sh"

     return $errorCode

  }

  echo
  echo "******************************************"
  echo "  update1() Successfully Completed!"
  echo "   Script File: userFunctions.sh"
  echo "******************************************"
  echo
  return 0

}


###############################################
#                FUNCTION
#                update2
# Update apt and flatpak
# apt uses --allow-vendor-change
###############################################

function update2() {

  local -i errorCode=0

  echo ""
  echo "****************************************************"
  echo "Running update2(). apt update and flatpak update ..."
  echo "****************************************************"
  echo ""

   sudo apt update && sudo apt full-upgrade -y || {
    errorCode=$?
     echo "Error while running apt update/upgrade"
     echo "Command: 'sudo apt update && sudo apt full-upgrade -y'"
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
# apt, flatpak, npm and rustup.
# BUT - NO AUTOREMOVE
# apt uses --allow-vendor-change
###############################################
function update3() {

  local -i errorCode=0

  echo ""
  echo "**************************************************"
  echo "Running update3()."
  echo "Updates Everything, BUT NO 'autoremove' ..."
  echo "**************************************************"
  echo ""


   sudo apt update && sudo apt full-upgrade -y || {
    errorCode=$?
     echo "Error while running apt update/upgrade"
     echo "Command: 'sudo apt update && sudo apt full-upgrade -y'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update3()"
     echo "Script File: userFunctions.sh"

     return $errorCode

  }

  sudo flatpak update || {

    errorCode=$?
     echo "Error from 'sudo flatpak update'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update3()"
     echo "Script File: userFunctions.sh"

     return $errorCode
  }

  sudo npm update || {

    errorCode=$?
     echo "Error from 'sudo npm update'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update3()"
     echo "Script File: userFunctions.sh"

     return $errorCode
  }


  rustup update || {

    errorCode=$?
     echo "Error from updating 'rust'."
     echo "Command: sudo rustup update"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update3()"
     echo "Script File: userFunctions.sh"

     return $errorCode
  }

  echo
  echo "******************************************"
  echo "  update3() Successfully Completed!"
  echo "   Script File: userFunctions.sh"
  echo "******************************************"
  echo
  return 0

}


###############################################
#                FUNCTION
#                update4
# Full Update. Update Everything, but also
# run 'autoremove'.
# apt, flatpak, npm, rustup and autoremove
# apt uses --allow-vendor-change
###############################################
function update4() {

  local -i errorCode=0

  echo ""
  echo "***************************************"
  echo "Running update4() with 'autoremove' ..."
  echo "***************************************"
  echo ""

   sudo apt update && sudo apt full-upgrade -y || {
    errorCode=$?
     echo "Error while running apt update/upgrade"
     echo "Command: 'sudo apt update && sudo apt full-upgrade -y'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update4()"
     echo "Script File: userFunctions.sh"

     return $errorCode

  }

  sudo flatpak update || {

    errorCode=$?
     echo "Error from 'sudo flatpak update'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update4()"
     echo "Script File: userFunctions.sh"

     return $errorCode
  }

  sudo npm update || {

    errorCode=$?
     echo "Error from 'sudo npm update'"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update4()"
     echo "Script File: userFunctions.sh"

     return $errorCode
  }


  rustup update || {

    errorCode=$?
     echo "Error from updating 'rust'."
     echo "Command: sudo rustup update"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update4()"
     echo "Script File: userFunctions.sh"

     return $errorCode
  }


  sudo apt autoremove || {

    errorCode=$?
     echo "Error occurred while running 'autoremove'"
     echo "Command: sudo apt autoremove"
     echo "Terminating Update Operation!"
     echo "Error Code: $errorCode"
     echo "Function: update4()"
     echo "Script File: userFunctions.sh"

     return $errorCode
  }

  echo
  echo "******************************************"
  echo "  update4() Successfully Completed!"
  echo "   Script File: userFunctions.sh"
  echo "******************************************"
  echo
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
