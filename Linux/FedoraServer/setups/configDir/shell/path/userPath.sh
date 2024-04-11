#!/bin/bash
# Mike's $HOME Directory Path Parameters


# User specific environment
if ! [[ "$PATH" =~ "$HOME"/.local/bin:"$HOME"/bin:/usr/local/go:/usr/local/go/bin ]]
then

    PATH="$HOME/.local/bin:$HOME/bin:/usr/local/go:/usr/local/go/bin:$PATH"

fi

export PATH

