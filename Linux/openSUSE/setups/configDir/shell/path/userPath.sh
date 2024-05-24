#!/bin/bash
# Mike's $HOME Directory Path Parameters

# User specific environment
if ! [[ "$PATH" =~ "$HOME"/go/bin:/usr/local/go:/usr/local/go/bin:/root/.local/bin:"$HOME"/.local/share/fonts ]]
then

    PATH="$HOME/go/bin:/usr/local/go:/usr/local/go/bin:/root/.local/bin:$HOME/.local/share/fonts:$PATH"

fi

export PATH



