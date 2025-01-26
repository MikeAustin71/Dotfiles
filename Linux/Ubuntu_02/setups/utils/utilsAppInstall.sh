#!/bin/bash
# Standard Application Installations
#

declare -i appInstallErrCode=0

# Alacritty Terminal Emulator
function installAlacritty() {

  sudo apt install alacritty alacritty-bash-completion

}

# Advanced Linux Sound Architecture (ALSA) utilities
function installAlsaUtils() {

  sudo apt install alsa-utils 

}

# https://atuin.sh/
# Be sure to configure 'atuin' in the
# .bashrc file after you install it.
# See utilsAppConfig.sh configBashrcAtuin()
#
function installAtuin() {

  sudo apt install atuin

}


function installAutoJump() {

  sudo apt install autojump 

}

# Installs Awesome Window Manager
function installAwesomeWM() {

  sudo apt install awesome 

}

function installBashCompletion() {

  sudo apt install bash-completion
}

# A replacement for cat
# GitHub - sharkdp/bat: A cat(1) clone with wings.
# (https://github.com/sharkdp/bat)
function installBat() {

  local -i theErrCode=0

  sudo apt install bat || {

    theErrCode=$?

    echo
    echo "Error triggered while installing 'bat'"
    echo "Command: sudo apt install bat"
    echo "Error Code: $theErrCode"
    echo "Function: installBat()"
    echo "Script File: utilsAppInstall.sh"
    echo

    return $theErrCode

  }

  mkdir -p ~/.local/bin || {

    theErrCode=$?

    echo
    echo "Error triggered while creating directory '~/.local/bin'"
    echo "Command: mkdir -p ~/.local/bin"
    echo "Error Code: $theErrCode"
    echo "Function: installBat()"
    echo "Script File: utilsAppInstall.sh"
    echo

    return $theErrCode

  }

  sudo ln -s /usr/bin/batcat ~/.local/bin/bat || {

    theErrCode=$?

    echo
    echo "Error triggered while linking 'batcat' to 'bat'"
    echo "Command: sudo ln -s /usr/bin/batcat ~/.local/bin/bat"
    echo "Error Code: $theErrCode"
    echo "Function: installBat()"
    echo "Script File: utilsAppInstall.sh"
    echo

  }

   return $theErrCode
}

# Hex Editor
function installBless() {

  sudo apt install bless bless-doc

}

# Bottom - btm
# https://github.com/ClementTsang/bottom
# A customizable cross-platform graphical
# process/system monitor for the terminal.
# Inspired by gtop, gotop, and htop.
function installBottom() {

  sudo apt install bottom
}

function installBroot() {

  sudo apt install broot 
  
}

function installBtop() {

  sudo apt install btop 

}

function installCheat() {

  sudo apt install cheat 

}

# VM and Server Manager
# https://cockpit-project.org/
function installCockpit() {

  sudo apt install cockpit cockpit-bridge cockpit-doc cockpit-kdump cockpit-machines cockpit-networkmanager cockpit-packagekit cockpit-podman cockpit-selinux cockpit-storaged cockpit-system cockpit-tukit cockpit-ws cockpit-pcp sssd-dbus
}

#
# Run Command:
#   flatpak run org.cockpit_project.CockpitClient
function installCockpitClient() {

  flatpak install flathub org.cockpit_project.CockpitClient

}

# https://hluk.github.io/CopyQ/
# Displays clipboard in tabs
#Start the application from menu or
# with following command:
#  flatpak run com.github.hluk.copyq
function installCopyQ() {

  sudo flatpak install flathub com.github.hluk.copyq

}

function installCoreUtils() {

  sudo apt install coreutils 

}

function installCompressionUtilities() {

  sudo apt install tar gzip bzip2 lzop zip p7zip gzip lz4 unrar rar lhasa

}

function installCurl() {

  sudo apt install curl 

}

# https://distrobox.it/
# Dependency Requirement:
#   'podman'
function installDistroBox() {

 sudo apt install distrobox &&

 sudo apt install distrobox-bash-completion

}

function installDolfin() {

  sudo apt install dolphin 

}

# Drawing Application from FlatHub.
# Installed via flatpacks. Check permissions
# afterwards.
# Run Command:
#   flatpak run com.jgraph.drawio.desktop
function installDrawIO() {

  flatpak install flathub com.jgraph.drawio.desktop
}

function installDuf() {

  sudo apt install duf 

}

# Notification daemon
# https://github.com/dunst-project/dunst
function installDunst() {

  sudo apt install dunst libnotify 

}

# https://github.com/bootandy/dust
function installDust() {

  sudo apt install dust

}


# Replacement for 'ls'
# https://github.com/eza-community/eza
function installEza() {

  sudo apt install eza 

}

# Install replacement for neofetch
# https://github.com/fastfetch-cli/fastfetch
function installFastFetch() {

  local -i theErrCode=0

  sudo add-apt-repository ppa:zhangsongcui3371/fastfetch  || {

   theErrCode=$?

   echo
   echo "Error adding 'fastfetch' repository."
   echo "Command: sudo add-apt-repository ppa:zhangsongcui3371/fastfetch"
   echo "Error Code: $theErrCode"
   echo "Function: installFastFetch()"
   echo "Script File: utilsAppInstall.sh"
   echo

   return $theErrCode
  }

  sudo apt update || {

   theErrCode=$?

   echo
   echo "Error performing 'apt update'."
   echo "Command: sudo apt update"
   echo "Error Code: $theErrCode"
   echo "Function: installFastFetch()"
   echo "Script File: utilsAppInstall.sh"
   echo

   return $theErrCode

  }

  sudo apt install fastfetch || {

   theErrCode=$?

   echo
   echo "Error installing 'fastfetch'."
   echo "Command: sudo apt install fastfetch"
   echo "Error Code: $theErrCode"
   echo "Function: installFastFetch()"
   echo "Script File: utilsAppInstall.sh"
   echo

  }

   return $theErrCode
}

# https://github.com/sharkdp/fd
# fd is a program to find entries in your filesystem. It is a
# simple, fast and user-friendly alternative to find. While it
# does not aim to support all of find's powerful functionality,
# it provides sensible (opinionated) defaults for a majority of
# use cases.
function installFd() {

  sudo apt install fd

}

function installFirefox() {

  sudo apt install firefox 

}

# https://github.com/sindresorhus/fkill-cli
function installFkill() {

  sudo npm install -g fkill-cli

}

# 'flatseal' is used to manage 'flatpak'
# permissions. You MUST have 'flatpak' installed
# before running this installation.
# Run Command:
#   flatpak run com.github.tchx84.Flatseal
function installFlatPak() {

  local -i theErrCode=0

  sudo apt install flatpak || {

    theErrCode=$?

    echo
    echo "Error installing 'flatpak'."
    echo "Command: sudo apt install flatpak "
    echo "Error Code: $theErrCode"
    echo "Function: installFlatPak()"
    echo "Script File: utilsAppInstall.sh"
    echo

    return $theErrCode

  }

  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || {

    theErrCode=$?

    echo "Error adding 'flathub' repo ."
    echo "Command: sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo "
    echo "Error Code: $theErrCode"
    echo "Function: installFlatPak()"
    echo "Script File: utilsAppInstall.sh"
    echo

    return $theErrCode

  }

  return $theErrCode
}



# 'flatseal' is used to manage 'flatpak'
# permissions. You MUST have 'flatpak' installed
# before running this installation.
# Run Command:
#   flatpak run com.github.tchx84.Flatseal
function installFlatSeal() {

  local -i theErrCode=0

  flatpak install flathub com.github.tchx84.Flatseal || {

    theErrCode=$?

    echo "Error installing Flatseal ."
    echo "Command: flatpak install flathub com.github.tchx84.Flatseal "
    echo "Error Code: $theErrCode"
    echo "Function: installFlatSeal()"
    echo "Script File: utilsAppInstall.sh"
    echo

    return $theErrCode

  }

}

function installFontAwesome() {

  sudo apt install fonts-font-awesome

}

# https://github.com/junegunn/fzf
# Don't forget to configure fzf in bash
# Call configBashrcFzf() in utilsAppConfig.sh
function installFuzzyFinder() {

  sudo apt install fzf fzf-bash-integration fzf-tmux

}

# Install geany GUI Editor
function installGeany() {


  sudo apt install geany geany-doc geany-lang libgeany0 || {

    appInstallErrCode=$?

    echo
    echo "'geany' installation failed"
    echo "Function: installGeany()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $appInstallErrCode"
    echo

    return $appInstallErrCode
  }

  [[ -f ~/.Xauthority ]] || {

    touch ~/.Xauthority || {

    appInstallErrCode=$?

    echo
    echo "touch ~/.Xauthority failed"
    echo "Function: installGeany()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $appInstallErrCode"
    echo

    return $appInstallErrCode
  }

  chmod 664 ~/.Xauthority || {

    appInstallErrCode=$?

    echo
    echo "touch ~/.Xauthority failed"
    echo "Function: installGeany()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $appInstallErrCode"
    echo

    return $appInstallErrCode

  }

 }
  return 0
}

# Calculator: speedcrunch
function installGenius() {
  sudo apt install genius
}

function installGhostwriter() {

  sudo apt install ghostwriter

}

function installGit() {

  sudo apt install git 

}


# KeypassXC Password Manager
# https://keepassxc.org/
# Run Command:
#  flatpak run org.keepassxc.KeePassXC
function installKeePassXC() {

  local -i keypassXCErrorCode=0

  flatpak install flathub org.keepassxc.KeePassXC || {

      keypassXCErrorCode=$?

     echo "     *** ERROR ***"
     echo "Error returned while installing"
     echo "KeePassXC from 'flathub'."
     echo "Error Code: $keypassXCErrorCode"
     echo "Function: installKeePassXC()"
     echo "Script: utilsAppInstall.sh"

     return $keypassXCErrorCode
  }

  return 0
}

# KGet is a versatile and user-friendly
# download manager.
# https://apps.kde.org/kget/
function installKget() {

  sudo apt install kget
}

# krename = batch renamer
# used by Krusader
# KRename is a very powerful batch file
# renamer which can rename a list of files
# based on a set of expressions.
# https://apps.kde.org/krename/
function installKrename() {

   sudo apt install krename

}

function installScriptGHQ() {

  local -i ghqFuncErrorCode=0

  cd "$HOME" || {

    ghqFuncErrorCode=$?

    echo "     *** ERROR ***"
    echo "Error returned while changing"
    echo "active working directory to:"
    echo "$HOME"
    echo "Error Code: $ghqFuncErrorCode"
    echo "Function: installScriptGHQ()"
    echo "Script: utilsAppInstall.sh"

    return $ghqFuncErrorCode
  }


   source "$HOME"/bashOps/setups/customAppInstalls/installGHQ.sh


}

function installGrubCustomizer() {

  sudo apt install grub-customizer 

}

# hishtory is a Shell History Application.
# https://github.com/ddworken/hishtory
# NOTE: backend syncing IS ENABLED
function installHisHtory() {

  local -i THE_ErrCode=0

  cd "$HOME" || {

    THE_ErrCode=$?

    echo "     *** ERROR ***"
    echo "Error returned while changing"
    echo "active working directory to:"
    echo "$HOME"
    echo "Error Code: $THE_ErrCode"
    echo "Function: installHisHtory()"
    echo "Script: utilsAppInstall.sh"

    return $THE_ErrCode
  }

  # NO back end syncing
  # curl https://hishtory.dev/install.py | python3 - --offline

  curl https://hishtory.dev/install.py | python3 - || {

    THE_ErrCode=$?

    echo "     *** ERROR ***"
    echo "Error returned by 'curl' while"
    echo "installing 'hishtory Shell History App"
    echo "Error Code: $THE_ErrCode"
    echo "Function: installHisHtory()"
    echo "Script: utilsAppInstall.sh"

    return $THE_ErrCode

  }

  return 0
}




# An X application for displaying and
# manipulating images
function installImageMagick() {

  sudo apt install ImageMagick

}


function installKate() {

  local -i kateErrorCode=0

  sudo apt install kate || {

      kateErrorCode=$?

     echo "     *** ERROR ***"
     echo "Error returned while installing"
     echo "'Kate' Text Editor."
     echo "Command:  sudo apt install kate"
     echo "Error Code: $kateErrorCode"
     echo "Function: installKate()"
     echo "Script: utilsAppInstall.sh"
  }


  return $kateErrorCode
}

# Advanced LaTeX Editor
# Designed for use with KDE Plasma
# Run Command:
#   flatpak run org.kde.kile
function installKile() {

  flatpak install flathub org.kde.kile

}

function installKdiff3() {

  sudo apt install kdiff3 kdiff3-doc

}

function installKitty() {

  sudo apt install kitty kitty-shell-integration

}

function installKrusader() {

  sudo apt install krusader

}




function installKvmTools() {

  sudo apt install -t pattern kvm_tools &&

  sudo apt install -t pattern kvm_server

}

function installLibdrm() {

  sudo apt install libdrm 

}

# When Jetbains Webstorm is installed
# it fails due to a JAVA library issue.
# You need this in order for Webstorm
# to run.
function installLibgthread() {

  sudo apt install libgthread-2_0-0

}



# Low Level Virtual Machine
# https://en.wikipedia.org/wiki/LLVM
function installLLVM() {

  sudo apt install llvm 

}

# Lynis - Security hardening tool
function installLynis() {

  sudo apt install lynis

}

# Installs hardware listing utility 'lswh'
# https://www.howtogeek.com/devops/how-to-use-lshw-in-linux-with-a-practical-example/
function installLshw() {

  sudo apt install lshw

}

function installLua() {

  sudo apt install lua 

}

function installLuaRocks() {

  sudo apt install luarocks

}

# A modern replacement for neofetch.
function installMacChina() {

  sudo apt install macchina

}

function installMesaVulkanDrivers() {

  sudo apt install mesa-vulkan-drivers

}

function installMicro() {

  sudo apt install micro

}

function installMidnightCommander() {

  sudo apt install mc

}

# Diff Tool
# https://meldmerge.org/
function installMeld() {

  sudo apt install meld

}

# View multiple log files
# https://www.tecmint.com/view-multiple-files-in-linux/
# https://vanheusden.com/multitail/download.html
# 'ncurses' library is required fpr 'multitail'.
#     !! DEPENDENCY !!
#  You MUST install 'ncurses' first!
function installMultiTail() {

  sudo apt install multitail

}

# Dependency required for 'multitail'
function installNcurses() {

  sudo apt install libncurses6

}

function installNpm() {

  sudo apt install npm

}

function installNano() {

  sudo apt install mc 

}

# ncdu = Disk Usage
function installNcdu() {

  sudo apt install ncdu 

}

function installNeofetch() {

  sudo apt install neofetch 

}

function installNetworkManager() {

  local -i lastExitCode=0

  sudo apt install NetworkManager  ||
  {
    lastExitCode=$?

    echo -e "Error installing NetworkManager!\n
    'systemctl' was NOT executed.\n
    The service is NOT running.\n
    Error Code: $lastExitCode\n
    Function: installNetworkManager()\n\n"

    return "$lastExitCode"
  }

  sudo systemctl start NetworkManager ||
  {

    lastExitCode=$?

    echo -e "Error starting NetworkManager!\n
    'systemctl start' failed on execution.\n
    The service is NOT running.\n
    Error Code: $lastExitCode\n
    Function: installNetworkManager()\n\n"

    return "$lastExitCode"

  }

  sudo systemctl enable NetworkManager  ||
  {

    lastExitCode=$?

    echo -e "Error enabling NetworkManager!\n
    'systemctl enable' failed on execution.\n
    The service is running, but it is NOT enabled.\n
    Error Code: $lastExitCode\n
    Function: installNetworkManager()\n\n"

    return "$lastExitCode"

  }

  return 0
}


function installNitrogen() {

  sudo apt install nitrogen 

}

function installNodeJs() {

  sudo apt install nodejs-common nodejs-default nodejs-devel-default

}

function installPandoc() {

  sudo apt install pandoc 

}

function installPapirusIconTheme() {

  sudo apt install papirus-icon-theme

}

function installProcs() {

  sudo apt install procs

}

function installScriptPeco() {

    local scriptFile

    scriptFile="$HOME"/bashOps/setups/customAppInstalls/installpeco.sh


  # shellcheck source=$HOME/bashOps/setups/customAppInstalls/installpeco.sh
   source "$scriptFile"

}

# Compositor for xorg
function installPicom() {

  sudo apt install picom 

}

# Install plocate.
# Docs
# https://plocate.readthedocs.io/en/latest/
# GitHub:
# https://github.com/Aetf/plocate
# NOTE: Be sure to call initializePlocateDb()
# in this script: utilsAppInstall.sh
# immediately after installing plocate
function installPlocate() {

 sudo apt install plocate

}

# https://distrobox.it/
#
# 'podman' is a dependency required by
# 'distrobox'.
function installPodman() {

 sudo apt install podman

}

# GUI app for managing 'podman' containers
# Installs from 'flatpak'
# flatpak run io.podman_desktop.PodmanDesktop
# Be sure to added to the desktop from AppCenter.
function installPodmanDesktop {

  flatpak install flathub io.podman_desktop.PodmanDesktop

}


# Calculator: qalculate
function installQalculate() {

 sudo apt install qalculate

 sudo apt install qalculate-data libqalculate23 libqalculate-devel

 sudo apt install qalculate-qt
}

# https://github.com/ranger/ranger
function installRanger() {

  sudo apt install ranger 

}

function installRetext() {

  sudo apt install retext

}

function installRipGrep() {

  sudo apt install ripgrep 

}

# https://github.com/davatorium/rofi
function installRofi() {

  sudo apt install rofi 

}

function installRust() {
 
  local -i rustErrCode=0
 
  sudo apt install rustup && rustup toolchain install stable || {

      rustErrCode=$?

      echo
      echo "   *** ERROR ***"
      echo "Error returned while installing 'rust' tools"
      echo "Error Code: $rustErrCode"
      echo "Function: installRust()"
      echo "Script: utilsAppInstall.sh"
      echo

      return $rustErrCode
  }
  
  return 0
}

function installSamba() {

  sudo apt install samba samba-client yast2-samba*
}

# Calculator: speedcrunch
function installSpeedcrunch() {

  sudo apt install speedcrunch

}

# Installs 'starship' shell prompt
# https://starship.rs/
function installStarship() {

 local -i starShipErrCode=0

  sudo curl -fsSL https://starship.rs/install.sh | sh ||
  {
      starShipErrCode=$?

      echo "*** ERROR ***"
      echo "Error returned from Starship Installation!"
      echo "Error Code= $starShipErrCode"
      echo "Function: installStarship()"
      echo "Script: utilsAppInstall.sh"
      echo
      return $starShipErrCode
  }

  return 0
}

function installSxhkd() {

  sudo apt install sxhkd 
}


function installTldr() {

  sudo npm install -g tldr
}


function installTerminusBitMapFonts() {

  sudo apt install fonts-terminus

}

function installTerminusConsoleetFonts() {

  sudo apt install consoleet-terminus-fonts

}


# LaTeX Editor
# https://www.xm1math.net/texmaker/
# Run Command:
#   flatpak run net.xm1math.Texmaker
function installTexMaker() {

  sudo flatpak install flathub net.xm1math.Texmaker

}

function installTmux() {

  sudo apt install tmux tmux-powerline

}

function installTypora() {

  local -i typoraErrCode=0

  sudo apt addrepo https://download.opensuse.org/repositories/home:fusionfuture:typora/openSUSE_Tumbleweed/home:fusionfuture:typora.repo || {

      typoraErrCode=$?

      echo
      echo "   *** ERROR ***"
      echo "Error returned while adding 'home:fusionfuture:typora'"
      echo "repository. Typora installation canceled."
      echo "Error Code: $typoraErrCode"
      echo "Function: installTypora()"
      echo "Script: utilsAppInstall.sh"
      echo

      return $typoraErrCode
    }

  sudo apt refresh || {

      typoraErrCode=$?

      echo
      echo "   *** ERROR ***"
      echo "'apt refresh' FAILED!"
      echo "Error Code: $typoraErrCode"
      echo "Function: installTypora()"
      echo "Script: utilsAppInstall.sh"
      echo

      return $typoraErrCode
 }

  sudo apt install typora || {

      typoraErrCode=$?

      echo
      echo "   *** ERROR ***"
      echo "'apt refresh' FAILED!"
      echo "Error Code: $typoraErrCode"
      echo "Function: installTypora()"
      echo "Script: utilsAppInstall.sh"
      echo

      return $typoraErrCode
  }

  return 0
}

function installVmwareTools() {

  sudo apt install open-vm-tools 

}

function installWget() {

  sudo apt install wget 

}


# Add Xorg x11

function install_x11() {

  sudo apt install xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-xauth libX11 libXinerama libXrandr libXft xrdb xorg-x11-drv-vmware xrandr xclip xsel 

}

function install_x_Copy() {

  sudo apt install xclip xsel


}

function install_x_Drivers_ati() {

  sudo apt install xorg-x11-drv-ati


}

# Yazi Terminal File Manager
# https://yazi-rs.github.io/
# Be sure to configure .bashrc
# for yazi. See configBashrcYazi()
# in utilsAppConfig.sh.
function installYazi() {

  local -i theErrCode=0

  cd ~/scratch || {

    theErrCode=$?

    echo "Error '~/scratch' FAILED"
    echo "Function: installYazi()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"
    return $theErrCode


  }

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh || {

    theErrCode=$?

    echo "Error returned by curl: https://sh.rustup.rs"
    echo "Function: installYazi()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"
    return $theErrCode

  }

  rustup update || {

    theErrCode=$?

    echo "Error: rustup update FAILED!"
    echo "Function: installYazi()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"
    return $theErrCode

  }

  cd ~/repos || {

    theErrCode=$?

    echo "Error 'cd ~/repos' FAILED"
    echo "Function: installYazi()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"
    return $theErrCode


  }

  git clone https://github.com/sxyazi/yazi.git || {

    theErrCode=$?

    echo "Error:  git clone https://github.com/sxyazi/yazi.git FAILED!"
    echo "Function: installYazi()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"
    return $theErrCode

  }

  cd ./yazi || {

    theErrCode=$?

    echo "Error:  'cd ./yazi' FAILED!"
    echo "Function: installYazi()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"
    return $theErrCode

  }

  cargo build --release --locked || {

    theErrCode=$?

    echo "Error:  'cd yazi' FAILED!"
    echo "Function: installYazi()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"
    return $theErrCode


  }

  sudo mv ~/repos/yazi/target/release/yazi ~/repos/yazi/target/release/ya /usr/local/bin/ || {

    theErrCode=$?

    echo "Error: Move Command Failed:"
    echo "Command: sudo mv ~/repos/yazi/target/release/yazi ~/repos/yazi/target/release/ya /usr/local/bin/"
    echo "Function: installYazi()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"
    return $theErrCode


  }
}

# zoxide
# zoxide is a smarter cd command, inspired by z and autojump.
# https://github.com/ajeetdsouza/zoxide
function installZoxide() {

  sudo apt install zoxide 

}

