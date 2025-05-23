#!/bin/bash
# Standard Application Installations
#

declare -i appInstallErrCode=0

# Alacritty Terminal Emulator
function installAlacritty() {

  sudo zypper install alacritty alacritty-bash-completion

}

# Advanced Linux Sound Architecture (ALSA) utilities
function installAlsaUtils() {

  sudo zypper install alsa-utils 

}

# https://atuin.sh/
# Be sure to configure 'atuin' in the
# .bashrc file after you install it.
# See utilsAppConfig.sh configBashrcAtuin()
#
function installAtuin() {

  sudo zypper install atuin

}


function installAutoJump() {

  sudo zypper install autojump 

}

# Installs Awesome Window Manager
function installAwesomeWM() {

  sudo zypper install awesome 

}

function installBashCompletion() {

  sudo zypper install bash-completion bash-completion-doc
}

# A replacement for cat
# GitHub - sharkdp/bat: A cat(1) clone with wings.
# (https://github.com/sharkdp/bat)
function installBat() {

  sudo zypper install bat 

}

# Hex Editor
function installBless() {

  sudo zypper install bless bless-doc

}

# Bottom - btm
# https://github.com/ClementTsang/bottom
# A customizable cross-platform graphical
# process/system monitor for the terminal.
# Inspired by gtop, gotop, and htop.
function installBottom() {

  sudo zypper install bottom
}

function installBroot() {

  sudo zypper install broot 
  
}

function installBtop() {

  sudo zypper install btop 

}

function installCheat() {

  sudo zypper install cheat 

}

# VM and Server Manager
# https://cockpit-project.org/
function installCockpit() {

  sudo zypper install cockpit cockpit-bridge cockpit-doc cockpit-kdump cockpit-machines cockpit-networkmanager cockpit-packagekit cockpit-podman cockpit-selinux cockpit-storaged cockpit-system cockpit-tukit cockpit-ws cockpit-pcp sssd-dbus
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

  sudo zypper install coreutils 

}

function installCompressionUtilities() {

 local -i THE_ERR_Code=0

  sudo zypper install tar gzip bzip2 lzop zip p7zip gzip || {

    THE_ERR_Code=$?

    echo
    echo "Error installing compression apps series-1"
    echo "Command: sudo apt install tar gzip bzip2 lzop zip p7zip gzip"
    echo "Error Code: $THE_ERR_Code"
    echo "Function: installCompressionUtilities()"
    echo "Script File: utilsAppInstall.sh"
    echo

    return $THE_ERR_Code
  }

  sudo zypper install lz4 unrar rar lha arj || {

    THE_ERR_Code=$?

    echo
    echo "Error installing compression apps series-2"
    echo "Command: sudo zypper install lz4 unrar rar lha arj"
    echo "Error Code: $THE_ERR_Code"
    echo "Function: installCompressionUtilities()"
    echo "Script File: utilsAppInstall.sh"
    echo
  }

  return $THE_ERR_Code
}

function installCurl() {

  sudo zypper install curl 

}

# https://distrobox.it/
# Dependency Requirement:
#   'podman'
function installDistroBox() {

 sudo zypper install distrobox &&

 sudo zypper install distrobox-bash-completion

}

function installDolfin() {

  sudo zypper install dolphin 

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

  sudo zypper install duf 

}

# Notification daemon
# https://github.com/dunst-project/dunst
function installDunst() {

  sudo zypper install dunst libnotify 

}

# https://github.com/bootandy/dust
function installDust() {

  sudo zypper install dust

}


# Replacement for 'ls'
# https://github.com/eza-community/eza
function installEza() {

  sudo zypper install eza 

}

# Install replacement for neofetch
# https://github.com/fastfetch-cli/fastfetch
function installFastFetch() {

  sudo zypper install fastfetch fastfetch-bash-completion

}

# https://github.com/sharkdp/fd
# fd is a program to find entries in your filesystem. It is a
# simple, fast and user-friendly alternative to find. While it
# does not aim to support all of find's powerful functionality,
# it provides sensible (opinionated) defaults for a majority of
# use cases.
function installFd() {

  sudo zypper install fd

}

function installFirefox() {

  sudo zypper install firefox 

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
function installFlatSeal() {

  flatpak install flathub com.github.tchx84.Flatseal

}

function installFontAwesome() {

  sudo zypper install fontawesome-fonts 

}

# Installs font-manager
# https://github.com/FontManager/font-manager
# Font Preview with GUI
function installFontMgr() {

  sudo zypper install font-manager
}



# https://github.com/junegunn/fzf
# Don't forget to configure fzf in bash
# Call configBashrcFzf() in utilsAppConfig.sh
function installFuzzyFinder() {

  sudo zypper install fzf fzf-bash-integration fzf-tmux

}

# Install geany GUI Editor
function installGeany() {


  sudo zypper install geany geany-doc geany-lang libgeany0 || {

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
  sudo zypper install genius
}

function installGhostwriter() {

  sudo zypper install ghostwriter

}

# Installs 'gimp' Graphics Application
#  https://idroot.us/install-gimp-opensuse/
#  https://www.gimp.org/
function installGimp() {

  local -i theErrCode=0

  sudo zypper install libcanberra-gtk3-module || {

    theErrCode=$?

    echo "Error: Installation of required library for 'Gimp' FAILED"
    echo "Command: sudo zypper install libcanberra-gtk3-module"
    echo "Function: installGimp()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
  }


  sudo zypper addrepo https://download.opensuse.org/repositories/graphics/openSUSE_Tumbleweed/graphics.repo || {

    theErrCode=$?

    echo "Error occurred while adding gimp repository "
    echo "Command: sudo zypper addrepo https://download.opensuse.org/repositories/graphics/openSUSE_Tumbleweed/graphics.repo"
    echo "Error Code: $theErrCode"
    echo "Function: installGimp()"
    echo "Script: utilsAppInstall.sh"

    return $theErrCode
  }

  sudo zypper refresh || {

    theErrCode=$?

    echo "Error occurred while refreshing repositories "
    echo "Command: zypper refresh"
    echo "Error Code: $theErrCode"
    echo "Function: installGimp()"
    echo "Script: utilsAppInstall.sh"

    return $theErrCode
  }

  sudo zypper install gimp || {

    theErrCode=$?

    echo "Error occurred while installing 'gimp' "
    echo "Command: sudo zypper install gimp"
    echo "Error Code: $theErrCode"
    echo "Function: installGimp()"
    echo "Script: utilsAppInstall.sh"

  }

  return $theErrCode

}

# Install 'git' 'git-core' and
# 'lazygit'
function installGit() {

  local -i errCode=0

  sudo zypper install git || {

    errCode=$?

    echo "     *** ERROR ***"
    echo "Error occurred while installing 'git' !!"
    echo "Command: sudo zypper install git"
    echo "Error Code: $errCode"
    echo "Function: installGit()"
    echo "Script: utilsAppInstall.sh"

    return $errCode
  }

  sudo zypper install git-core || {

    errCode=$?

    echo "     *** ERROR ***"
    echo "Error occurred while installing 'git-core' !!"
    echo "Command: sudo zypper install git-core"
    echo "Error Code: $errCode"
    echo "Function: installGit()"
    echo "Script: utilsAppInstall.sh"
  }


  sudo zypper install lazygit || {

    errCode=$?

    echo "     *** ERROR ***"
    echo "Error occurred while installing 'lazygit' !!"
    echo "Command: sudo zypper install lazygit"
    echo "Error Code: $errCode"
    echo "Function: installGit()"
    echo "Script: utilsAppInstall.sh"
  }



  return $errCode
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

  sudo zypper install grub-customizer

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

  sudo zypper install ImageMagick

}

# GUI Editor
function installKate() {

  local -i kateErrorCode=0

  sudo zypper install kate || {

      kateErrorCode=$?

     echo "     *** ERROR ***"
     echo "Error returned while installing"
     echo "'Kate' Text Editor."
     echo "Command: sudo zypper install kate"
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

  sudo zypper install kdiff3 kdiff3-lang

}

# KGet is a versatile and user-friendly
# download manager.
# https://apps.kde.org/kget/
function installKget() {

  sudo zypper install kget
}

function installKitty() {

  sudo zypper install kitty kitty-shell-integration

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

# krename = batch renamer
# used by Krusader
# KRename is a very powerful batch file
# renamer which can rename a list of files
# based on a set of expressions.
# https://apps.kde.org/krename/
function installKrename() {

   sudo zypper install krename

}

function installKrusader() {

  sudo zypper install krusader krusader-doc krusader-lang

}


function installKvmTools() {

  sudo zypper install -t pattern kvm_tools

}

function installKvmServer () {

  sudo zypper install -t pattern kvm_server
}


function installLibdrm() {

  sudo zypper install libdrm 

}

# When JetBrains Webstorm is installed
# it fails due to a JAVA library issue.
# You need this in order for Webstorm
# to run.
function installLibGlib() {

  sudo zypper install libglib-2_0-0

}

# JetBrains Toolbox requires
# LibFuse2
function installLibFuse2() {

  sudo zypper install libfuse2

}

# Install 'lazygit' git helper
function installLazyGit() {

  sudo zypper install lazygit
}

# Low Level Virtual Machine
# https://en.wikipedia.org/wiki/LLVM
function installLLVM() {

  sudo zypper install llvm 

}

# Lynis - Security hardening tool
function installLynis() {

  sudo zypper install lynis

}

# Installs hardware listing utility 'lswh'
# https://www.howtogeek.com/devops/how-to-use-lshw-in-linux-with-a-practical-example/
function installLshw() {

  sudo zypper install lshw

}

function installLua() {

  sudo zypper install lua 

}

function installLuaRocks() {

  sudo zypper install lua54-luarocks

}

# A modern replacement for neofetch.
function installMacChina() {

  sudo zypper install macchina

}

function installMesaVulkanDrivers() {

  sudo zypper install mesa-vulkan-drivers

}

function installMicro() {

  sudo zypper install micro-editor

}

function installMidnightCommander() {

  sudo zypper install mc

}

# Diff Tool
# https://meldmerge.org/
function installMeld() {

  sudo zypper install meld

}

# View multiple log files
# https://www.tecmint.com/view-multiple-files-in-linux/
# https://vanheusden.com/multitail/download.html
# 'ncurses' library is required fpr 'multitail'.
#     !! DEPENDENCY !!
#  You MUST install 'ncurses' first!
function installMultiTail() {

  sudo zypper install multitail

}

# Dependency required for 'multitail'
function installNcurses() {

  sudo zypper install libncurses6

}

function installNerdFontSymbols() {

  sudo zypper install symbols-only-nerd-fonts
}

# Font for LaTeX and  LuaLaTeX
function installTexliveInconsolataFont() {
  sudo zypper install texlive-inconsolata-nerd-font
}

function installNpm() {

  sudo zypper install npm-default

}

function installNano() {

  sudo zypper install mc 

}

# ncdu = Disk Usage
function installNcdu() {

  sudo zypper install ncdu 

}

function installNeofetch() {

  sudo zypper install neofetch 

}

function installNeovimUtilities() {

  local -i lastExitCode=0

  sudo zypper install nvim-treesitter ||
  {

    theErrCode=$?

    echo "Error: Installation of 'nvim-treesitter' Failed!"
    echo "Command: sudo zypper install nvim-treesitter"
    echo "Function: installNeovimUtilities()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"

    return "$theErrCode"
  }


  sudo npm install -g neovim ||
  {

    theErrCode=$?

    echo "Error: Installation of npm 'neovim' Failed!"
    echo "Command: sudo npm install -g neovim"
    echo "Function: installNeovimUtilities()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"

    return "$theErrCode"
  }


  sudo npm install -g tree-sitter-cli ||
  {

    theErrCode=$?

    echo "Error: Installation of neovim 'tree-sitter-cli' Failed!"
    echo "Command: sudo npm install -g tree-sitter-cli"
    echo "Function: installNeovimUtilities()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"

  }

  return "$theErrCode"
}

function installNetworkManager() {

  local -i lastExitCode=0

  sudo zypper install NetworkManager  ||
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

  sudo zypper install nitrogen 

}

function installNodeJs() {

  sudo zypper install nodejs-common nodejs-default nodejs-devel-default

}

function installPandoc() {

  sudo zypper install pandoc 

}

function installPapirusIconTheme() {

  sudo zypper install papirus-icon-theme

}

function installProcs() {

  sudo zypper install procs

}

function installScriptPeco() {

    local scriptFile

    scriptFile="$HOME"/bashOps/setups/customAppInstalls/installpeco.sh


  # shellcheck source=$HOME/bashOps/setups/customAppInstalls/installpeco.sh
   source "$scriptFile"

}

# Compositor for xorg
function installPicom() {

  sudo zypper install picom 

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

 sudo zypper install plocate

}

# https://distrobox.it/
#
# 'podman' is a dependency required by
# 'distrobox'.
function installPodman() {

 sudo zypper install podman

}

# GUI app for managing 'podman' containers
# Installs from 'flatpak'
# flatpak run io.podman_desktop.PodmanDesktop
# Be sure to added to the desktop from AppCenter.
function installPodmanDesktop {

  flatpak install flathub io.podman_desktop.PodmanDesktop

}

# Calculator
# Installs Qalculate-classic
# This is the old version of the
# Qalculate Calculator
function installQalculate() {

 sudo zypper install qalculate

 sudo zypper install qalculate-data libqalculate23 libqalculate-devel
}

# Calculator
# Installs Qalculate QT
# This is the latest version of the
# Qalculate Calculator
function installQalculateQt() {

 sudo zypper install qalculate-qt

}

# https://github.com/ranger/ranger
function installRanger() {

  sudo zypper install ranger 

}

function installRetext() {

  sudo zypper install retext

}

function installRipGrep() {

  sudo zypper install ripgrep 

}

# https://github.com/davatorium/rofi
function installRofi() {

  sudo zypper install rofi

  sudo zypper papirus-icon-theme

}

function installRust() {
 
  local -i theErrCode=0

  cd ~/scratch || {

    theErrCode=$?

    echo "Error change directories to 'scratch' FAILED"
    echo "Command: cd ~/scratch"
    echo "Function: installRust()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"
    return "$theErrCode"


  }

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  || {

    theErrCode=$?

    echo "Error returned by curl: https://sh.rustup.rs"
    echo "Command: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    echo "Function: installRust()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"

  }

  return $theErrCode
}

# Install 'ruby' and associated utilities
function installRuby() {

  local -i theErrCode=0

  sudo zypper install ruby ruby3.4-devel ruby-devel || {

    theErrCode=$?

    echo "Error: 'ruby' installation FAILED!"
    echo "Command: sudo zypper install ruby ruby3.4-devel ruby-devel"
    echo "Function: installRuby()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"
    return $theErrCode
 }

  sudo zypper install libyaml-devel ruby3.4-doc || {

    theErrCode=$?

    echo "Error: Ruby Utilities installation FAILED!"
    echo "Command: sudo zypper install libyaml-devel ruby3.4-doc"
    echo "Function: installRuby()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"

    return $theErrCode
 }

  sudo gem install neovim || {

    theErrCode=$?

    echo "Error: gem-neovim installation FAILED!"
    echo "Command: sudo gem install neovimc"
    echo "Function: installRuby()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"
  }

  return $theErrCode
}


function installSamba() {

  sudo zypper install samba samba-client yast2-samba*
}

# Calculator: speedcrunch
function installSpeedcrunch() {

  sudo zypper install speedcrunch

}

# Installs 'openssh'
function installSSH() {

  sudo zypper install openssh

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

  sudo zypper install sxhkd 
}


function installTldr() {

  sudo npm install -g tldr
}


function installTerminusBitMapFonts() {

  sudo zypper install terminus-bitmap-fonts

}

function installTerminusConsoleetFonts() {

  sudo zypper install consoleet-terminus-fonts

}


# LaTeX Editor
# https://www.xm1math.net/texmaker/
# Run Command:
#   flatpak run net.xm1math.Texmaker
function installTexMaker() {

  sudo flatpak install flathub net.xm1math.Texmaker

}

function installTmux() {

  sudo zypper install tmux tmux-powerline

}

function installTrashCli() {

  local -i trashErrCode=0

  sudo zypper install trash-cli || {

      trashErrCode=$?

      echo
      echo "   *** ERROR ***"
      echo "Error returned while installing 'trash-cli'"
      echo "Command: 'sudo zypper install trash-cli' "
      echo "Error Code: $trashErrCode"
      echo "Function: installTrashCli()"
      echo "Script: utilsAppInstall.sh"
      echo
  }

  return $trashErrCode
}


function installTypora() {

  local -i typoraErrCode=0

  sudo zypper addrepo https://download.opensuse.org/repositories/home:fusionfuture:typora/openSUSE_Tumbleweed/home:fusionfuture:typora.repo || {

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

  sudo zypper refresh || {

      typoraErrCode=$?

      echo
      echo "   *** ERROR ***"
      echo "'zypper refresh' FAILED!"
      echo "Error Code: $typoraErrCode"
      echo "Function: installTypora()"
      echo "Script: utilsAppInstall.sh"
      echo

      return $typoraErrCode
 }

  sudo zypper install typora || {

      typoraErrCode=$?

      echo
      echo "   *** ERROR ***"
      echo "'zypper refresh' FAILED!"
      echo "Error Code: $typoraErrCode"
      echo "Function: installTypora()"
      echo "Script: utilsAppInstall.sh"
      echo

      return $typoraErrCode
  }

  return 0
}

function installUdiskie() {

  sudo zypper install udiskie udiskie-lang

}

function installVmwareTools() {

  sudo zypper install open-vm-tools 

}

function installWget() {

  sudo zypper install wget 

}


# Add Xorg x11

function install_x11() {

  sudo zypper install xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-xauth libX11 libXinerama libXrandr libXft xrdb xorg-x11-drv-vmware xrandr xclip xsel 

}

function install_x_Copy() {

  sudo zypper install xclip xsel


}

function install_x_Drivers_ati() {

  sudo zypper install xorg-x11-drv-ati


}



# Yazi Terminal File Manager
# https://yazi-rs.github.io/
# Be sure to configure .bashrc
# for yazi. See configBashrcYazi()
# Latest OpenSUSE installation
# version.
function installOsYazi() {

 sudo zypper install yazi

}


# Yazi Terminal File Manager
# https://yazi-rs.github.io/
# Be sure to configure .bashrc
# for yazi. See configBashrcYazi()
# in utilsAppConfig.sh.
# DEPRICATED!
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

 # By this point 'rust' is already installed

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
  }

  return $theErrCode
}

# Installs 'yarn'
# https://software.opensuse.org/package/yarn?search_term=yarn
function installYarn() {

  local -i theErrCode=0

  sudo zypper install yarn || {

    theErrCode=$?

    echo "Error: 'yarn' install command FAILED!"
    echo "Command: sudo zypper install yarn"
    echo "Function: installYarn()"
    echo "Script: utilsAppInstall.sh"
    echo "Error Code: $theErrCode"

  }

  return $theErrCode
}

# zoxide
# zoxide is a smarter cd command, inspired by z and autojump.
# https://github.com/ajeetdsouza/zoxide
function installZoxide() {

  sudo zypper install zoxide 

}

