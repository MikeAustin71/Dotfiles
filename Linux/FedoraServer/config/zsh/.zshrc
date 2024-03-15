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


