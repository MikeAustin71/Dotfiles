#!/bin/bash
# Mike's Aliases
# shellcheck disable=SC2139
alias aliases="batcat $HOME/.config/shell/aliases/aliases.sh"

alias ip='ip -color'

alias cls="clear"

alias CLS="clear"

# alias cp='cp -i'

# alias mv='mv -i'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# alias multitail='multitail --no-repeat -c'


# eza file listing utility
# eza website
# https://eza.rocks/
# https://github.com/eza-community/eza
# =======================================


# Equivalent of ls alias
# alias la='eza --long --all --color=always'

# ls - Shows actual and hidden files
# Plus additional stats
 alias ls='eza -lahig --color=always'

 # lsl - Same as ls but piped to 'less'
 alias lsl="eza -lahig --color=always | less"

# ld - lists only directories (no files)
#       This includes hidden directories
 alias ld='eza -lDahg --color=always'

# ldl - Same as 'ld' but piped to 'less'
 alias ldl="eza -lDahg --color=always | less"

# le - lists everything with directories first
 alias le='eza -al --group-directories-first'

# lf - lists only files (no directories)
#      includes hidden files
 alias lf='eza -laF --color=always | grep -v /'

# lh - lists only hidden files (no directories)
 alias lh='eza -al .* --group-directories-first'

# lfs - lists only files sorted by size
 alias lfs='eza -alF --color=always --sort=size | grep -v /'

# lt - lists everything sorted by time updated
 alias lt='eza -al --sort=modified'

# ltr - List tree with 3-levels
 alias ltr='eza -TL 3 -a --color=always'

# lw - List directory names in rows
 alias lw="eza -Ga --color=always"

# ===================================================
#      END OF 'eza' Aliases
# ===================================================

# ALIAS 'rm' !!!!
# sudo zypper install trash-cli
# Run Trash from CLI
# ===================================================
alias rm='trash-put'
alias rml='trash-list'
alias rmr='trash-restore'
alias rme='trash-empty'
alias rme15='trash-empty 15'
# ===================================================
#      END OF 'r' Aliases
# ===================================================



# Aliases for 'bat'
# 'bat' is a replacement for 'cat'
# https://github.com/sharkdp/bat

alias cat='batcat -paging=never'

alias pnt='batcat -paging=never'

alias pat='batcat -paging=always'
