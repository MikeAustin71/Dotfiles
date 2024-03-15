# Zsh Configuration File

# Configure History File
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000

# Configure Completions
autoload -Uz compinit
compinit

export TERM="xterm-256color"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

source $HOME/.config/zsh/aliases/aliases.txt

# You may need to manually set your language environment
export LANG=en_US.UTF-8

neofetch
