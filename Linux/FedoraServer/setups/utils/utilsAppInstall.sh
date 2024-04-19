#!/bin/bash
# Standard Application Installations
#

# Advanced Linux Sound Architecture (ALSA) utilities
function installAlsaUtils() {

  sudo dnf install alsa-utils -y

}

function installAutoJump() {

  sudo dnf install autojump -y

}

# Installs Awesome Window Manager
function installAwesomeWM() {

  sudo dnf install awesome -y

}

function installBashCompletion() {

  sudo dnf install bash-completion -y
}

# A replacement for cat
# GitHub - sharkdp/bat: A cat(1) clone with wings.
# (https://github.com/sharkdp/bat)
function installBat() {

  sudo dnf install bat -y

}

# Hex Editor
function installBless() {

  sudo dnf install bless -y

}

function installScriptBroot() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppInstalls/installbroot.sh

    # shellcheck source="$HOME"/bashOps/setups/customAppInstalls/installbroot.sh
    source "$scriptFile"
}

function installBtop() {

  sudo dnf install btop -y

}

function installCalculators() {

  sudo dnf install qalculate speedcrunch genius -y

}

function installCheat() {

  sudo dnf install cheat -y

}

function installCopyQ() {

  sudo dnf install copyq -y

}

function installCoreUtils() {

  sudo dnf install coreutils -y

}

function installCurl() {

  sudo dnf install curl -y

}

function installDolfin() {

  sudo dnf install dolphin -y

}

function installDuf() {

  sudo dnf install duf -y

}

function installCompressionUtilities() {

  sudo dnf install tar gzip bzip2 lzop zip p7zip p7zip-plugins gzip lz4 unrar perl-Archive-Extract -y

}

# Notification daemon
# https://github.com/dunst-project/dunst
function installDunst() {

  sudo dnf install dunst libnotify -y

}

# Replacement for 'ls'
# https://github.com/eza-community/eza
function installEza() {

  sudo dnf install eza -y

}

# https://github.com/sharkdp/fd
# fd is a program to find entries in your filesystem. It is a
# simple, fast and user-friendly alternative to find. While it
# does not aim to support all of find's powerful functionality,
# it provides sensible (opinionated) defaults for a majority of
# use cases.
function installFd() {

  sudo dnf install fd-find -y

}

function installFirefox() {

  sudo dnf install firefox -y

}

# https://github.com/sindresorhus/fkill-cli
function installFkill() {

  sudo npm install --global fkill-cli

}

function installFontAwesome() {

  sudo dnf install fontawesome-fonts -y

}

function installFontTerminus() {

  sudo dnf install terminus-fonts -y

}

function installFuzzyFinder() {

  sudo dnf install fzf -y

}

# Install geany GUI Editor
function installGeany() {

  sudo dnf install geany geany-plugins-addons gtkd-geany-tags geany-themes -y

}

function installGit() {

  sudo dnf install git -y

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

  sudo dnf install grub-customizer -y

}

function installKitty() {

  sudo dnf install kitty -y

}

function installKrusader() {

  sudo dnf install krusader -y

}

function installLibdrm() {

  sudo dnf install libdrm -y

}

# An X application for displaying and
# manipulating images
function installImageMagick() {

  sudo dnf install ImageMagick -y

}

function installScriptMicro() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppInstalls/installmicro.sh


  # shellcheck source="$HOME"/bashOps/setups/customAppInstalls/installmicro.sh
   source "$scriptFile"

}

function installMidnightCommander() {

  sudo dnf install mc -y

}

function installNano() {

  sudo dnf install mc -y

}

# ncdu = Disk Usage
function installNcdu() {

  sudo dnf install ncdu -y

}

function installNeofetch() {

  sudo dnf install neofetch -y

}

function installNetworkManager() {

  local -i lastExitCode=0

  sudo dnf install NetworkManager -y ||
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

  sudo dnf install nitrogen -y

}

function installNodeJs() {

  sudo dnf install nodejs -y

}

function installPandoc() {

  sudo dnf install pandoc -y

}

function installScriptPeco() {

    local scriptFile

    scriptFile="$MIKE_Setup_Scripts"/customAppInstalls/installpeco.sh


  # shellcheck source="$HOME"/bashOps/setups/customAppInstalls/installpeco.sh
   source "$scriptFile"

}

# Compositor for xorg
function installPicom() {

  sudo dnf install picom -y

}

function installPlocate() {

  sudo dnf install plocate -y ||
  {
    return
  }

  sudo updatedb

}

# https://github.com/ranger/ranger
function installRanger() {

  sudo dnf install ranger -y

}

function installRipGrep() {

  sudo dnf install ripgrep -y

}

# https://github.com/davatorium/rofi
function installRofi() {

  sudo dnf install rofi -y

}


function installSamba() {

  sudo dnf install samba samba-client -y
}

function installSxhkd() {

  sudo dnf install sxhkd -y
}


function installTldr() {

  sudo dnf install tldr -y
}

function installTrash() {

  sudo dnf install trash-cli -y

}

function installTerminusFonts() {

  sudo dnf install terminus-fonts -y

}

function installTmux() {

  sudo dnf install -y tmux

}

function installRealPath() {

  sudo dnf install uu_realpath -y

}

function installUdiskie() {

  sudo dnf install python3-udiskie -y

}

function installVmwareTools() {

  sudo dnf install open-vm-tools -y

}

function installWget() {

  sudo dnf install wget -y

}


# Add Xorg x11

function install_x11() {

  sudo dnf install xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-xauth libX11 libXinerama libXrandr libXft xrdb xorg-x11-drv-vmware xrandr xclip xsel -y

}

function install_x_Copy() {

  sudo dnf install xclip xsel


}

# zoxide
# zoxide is a smarter cd command, inspired by z and autojump.
# https://github.com/ajeetdsouza/zoxide
function installZoxide() {

  sudo dnf install zoxide -y

}

