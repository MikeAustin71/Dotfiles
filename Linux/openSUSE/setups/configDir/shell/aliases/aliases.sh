#!/bin/bash
# Mike's Aliases

# shellcheck disable=SC2139
alias aliases="bat $HOME/.config/shell/aliases/aliases.sh"

alias ip='ip -color'

alias cls="clear"

alias CLS="clear"

# alias cp='cp -i'

# alias mv='mv -i'

# cd into the old directory
#alias bd='cd "$OLDPWD"'

alias multitail='multitail --no-repeat -c'

alias top="btop"

alias update="sudo zypper update"

alias update2="sudo zypper dup --allow-vendor-change && sudo flatpak update"

alias update3="sudo zypper refresh && sudo zypper dup --allow-vendor-change && sudo flatpak update"
