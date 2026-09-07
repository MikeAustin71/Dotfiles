#!/bin/bash
# Mike's Environment Variables

export EDITOR="kate"

export VISUAL="kate"

export VIEWER="micro"

#export XDG_DATA_HOME="$HOME/.local/share:/var/lib/flatpak/exports/share"
export XDG_DATA_HOME="$HOME"/.local/share

export XDG_RUNTIME_DIR="/run/user/$UID"

export XDG_DATA_FONTS=/usr/share/fonts

export XDG_CONFIG_HOME="$HOME/.config"

export XDG_CONFIG_ALIASES="$HOME/.config/shell/aliases"

export XDG_CONFIG_ENVARS="$HOME/.config/shell/envars"

export XDG_CONFIG_XORG="$HOME/.config/xorg"

export XDG_LOCAL_HOME="$HOME/.local"

export XDG_SHARE_DATA="$XDG_LOCAL_HOME/share"

export XDG_BIN_HOME="$HOME/.local/bin"

export XDG_CACHE_HOME="$HOME/.local/cache"

export XDG_CONFIG_STARSHIP="$HOME/.local/starship"

export STARSHIP_CONFIG="$HOME/.local/starship/starship.toml"

export STARSHIP_CACHE="$HOME/.local/cache/.starship/cache"

export MIKE_Scratch="$HOME/scratch"

export MIKE_VMShared_Drive="$HOME/shares/HostVlMShared"

export MIKE_VM_openSUSE="$HOME/shares/HostVlMShared/openSUSE"

export MIKE_VM_Scripts="$HOME/shares/HostVlMShared/openSUSE/final_production/setups"

export MIKE_Fonts_Directory="$HOME/.local/share/fonts"

export MIKE_Wallpaper_Directory="/usr/share/wallpapers/openSUSEdefault/contents/images"

export MIKE_BashOps="$HOME/bashOps"

export MIKE_Setup_Scripts="$HOME/bashOps/setups"

export MIKE_Setup_Utilities="$HOME/bashOps/setups/utils"

export MIKE_Git_Repos="$HOME/repos"

export MIKE_DotFiles_Repo="$HOME/repos/Dotfiles"

export MIKE_GitRepo_DotFiles="https://github.com/MikeAustin71/Dotfiles.git"

# ghq root directory
# GitHub page:
#    https://github.com/x-motemen/ghq
export GHQ_ROOT="$HOME/repos"

# Additional 2Tb Hard Drive
export MIKEHARDDRIVE2="/Edrv"

# VMware Shared Directory
# Set this to the correct path for your VM
export VMShare="$HOME/shares/VMShare/VMSharedData"

# Configure Distrobox Backend
export DISTROBOX_BACKEND=podman
