#!/bin/bash
# Standard Application Installations
#

# Alacritty Terminal Emulator
function installAlacritty() {

  sudo zypper install alacritty alacritty-bash-completion

}

# Advanced Linux Sound Architecture (ALSA) utilities
function installAlsaUtils() {

  sudo zypper install alsa-utils 

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

function installBroot() {

  sudo zypper install broot 
  
}

function installBtop() {

  sudo zypper install btop 

}

function installCheat() {

  sudo zypper install cheat 

}

function installCopyQ() {

  sudo zypper install copyq 

}

function installCoreUtils() {

  sudo zypper install coreutils 

}

function installCompressionUtilities() {

  sudo zypper install tar gzip bzip2 lzop zip p7zip p7zip-plugins gzip lz4 unrar

}

function installCurl() {

  sudo zypper install curl 

}

function installDolfin() {

  sudo zypper install dolphin 

}

function installDuf() {

  sudo zypper install duf 

}

# Notification daemon
# https://github.com/dunst-project/dunst
function installDunst() {

  sudo zypper install dunst libnotify 

}

# Replacement for 'ls'
# https://github.com/eza-community/eza
function installEza() {

  sudo zypper install eza 

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

function installFontAwesome() {

  sudo zypper install fontawesome-fonts 

}

function installFuzzyFinder() {

  sudo zypper install fzf fzf-bash-integration fzf-tmux

}

# Install geany GUI Editor
function installGeany() {

  sudo zypper install geany geany-doc geany-lang geany-plugins geany-plugins-lang libgeany0

}

# Calculator: speedcrunch
function installGenius() {
  sudo zypper install genius
}

function installGit() {

  sudo zypper install git 

}

function installScriptGHQ() {

  local -i ghqFuncErrorCode=0

  cd "$HOME" || {

    ghqFuncErrorCode=$?

    echo "*** ERROR ***"
    echo "Error returned while changing"
    echo "active working directory to:"
    echo "$HOME"
    echo "Error Code: $ghqFuncErrorCode"
    echo "Function: installScriptGHQ()"
    echo "Script: utilsAppInstall.sh"

    return $ghqFuncErrorCode
  }

    local scriptFile

    scriptFile="$HOME"/bashops/setups/customAppInstalls/installGHQ.sh

  # shellcheck source="$MIKE_Setup_Scripts"/customAppConfig/configKrusader.sh
   source "$scriptFile"
}

function installGrubCustomizer() {

  sudo zypper install grub-customizer 

}

function installKdiff3() {

  sudo zypper install kdiff3 kdiff3-lang

}

function installKitty() {

  sudo zypper install kitty kitty-shell-integration

}

function installKrusader() {

  sudo zypper install krusader krusader-doc krusader-lang

}

function installLibdrm() {

  sudo zypper install libdrm 

}

# Low Level Virtual Machine
# https://en.wikipedia.org/wiki/LLVM
function installLLVM() {

  sudo zypper install llvm 

}

function installLua() {

  sudo zypper install lua 

}

# An X application for displaying and
# manipulating images
function installImageMagick() {

  sudo zypper install ImageMagick

}

function installMicro() {

  sudo zypper install micro-editor

}

function installNpm() {

  sudo zypper install npm-default

}

function installPapirusIconTheme() {

  sudo zypper install papirus-icon-theme 

}

function installLuaRocks() {

  sudo zypper install luarocks 

}

function installMesaVulkanDrivers() {

  sudo zypper install mesa-vulkan-drivers 

}

function installMidnightCommander() {

  sudo zypper install mc 

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

function installScriptPeco() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppInstalls/installpeco.sh


  # shellcheck source="$HOME"/bashOps/setups/customAppInstalls/installpeco.sh
   source "$scriptFile"

}

# Compositor for xorg
function installPicom() {

  sudo zypper install picom 

}

function installPlocate() {

  sudo zypper install plocate  ||
  {
    return
  }

  sudo updatedb

}

# Calculator: qalculate
function installQalculate() {

 sudo zypper install qalculate qalculate-data libqalculate22 libqalculate-devel
}

# https://github.com/ranger/ranger
function installRanger() {

  sudo zypper install ranger 

}

function installRipGrep() {

  sudo zypper install ripgrep 

}

# https://github.com/davatorium/rofi
function installRofi() {

  sudo zypper install rofi 

}


function installSamba() {

  sudo zypper install samba samba-client yast2-samba*
}

# Calculator: speedcrunch
function installSpeedcrunch() {

  sudo zypper install speedcrunch

}

function installSxhkd() {

  sudo zypper install sxhkd 
}


function installTldr() {

  sudo npm install -g tldr
}

function installTrash() {

  sudo pipx install trash-cli

}

function installTerminusFonts() {

  sudo zypper install terminus-ttf-fonts

}

function installTmux() {

  sudo zypper install tmux tmux-powerline

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

# zoxide
# zoxide is a smarter cd command, inspired by z and autojump.
# https://github.com/ajeetdsouza/zoxide
function installZoxide() {

  sudo zypper install zoxide 

}

