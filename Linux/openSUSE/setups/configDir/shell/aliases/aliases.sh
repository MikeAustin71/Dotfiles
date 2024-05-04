#!/bin/bash
# Mike's Aliases

alias aliases="bat ~/.config/aliases/aliases.txt"

alias ip='ip -color'

# alias cat='bat -paging=never'

alias pnt='bat -paging=never'

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

# alias cd="z"

alias tree="br"

alias top="btop"

alias rm="trash-put -iv"

alias update="sudo zypper update  && sudo zypper upgrade"

alias update2="sudo zypper update  --refresh && sudo zypper upgrade"
