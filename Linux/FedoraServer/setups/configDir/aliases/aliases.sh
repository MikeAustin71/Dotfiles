#!/bin/bash
# Mike's Aliases

alias aliases="bat ~/.config/aliases/aliases.txt"

alias ip='ip -color'

alias cat='bat -paging=never'

alias pat='bat -paging=always'

# eza file listing utility
# eza website
# https://eza.rocks/
# https://github.com/eza-community/eza
# =======================================

# ld - lists only directories (no files)
alias ld='eza -lD'

# lf - lists only files (no directories)
alias lf='eza -lF --color=always | grep -v /'

# lh - lists only hidden files (no directories)
alias lh='eza -al .* --group-directories-first'

# ls - lists everything with directories first
alias ls='eza -al --group-directories-first'

# lfs - lists only files sorted by size
alias lfs='eza -alF --color=always --sort=size | grep -v /'

# lt - lists everything sorted by time updated
alias lt='eza -al --sort=modified'

# ===================================================


alias cls="clear"

alias CLS="clear"

alias tree="br"

alias rm="trash-put -iv"

alias update="sudo dnf update -y && sudo dnf upgrade -y"

alias update2="sudo dnf update -y --refresh && sudo dnf upgrade -y"
