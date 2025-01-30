#!/bin/bash
# Mike's $HOME Directory Path Parameters

# User specific environment

if ! [[ "$PATH" =~ "$HOME"/go/bin:/usr/local/go:/usr/local/go/bin:"$HOME"/.local/share:"$HOME"/.config:"$HOME"/.config/JetBrains:"$HOME"/shares:"$HOME"/.cargo:"$HOME"/.fzf:"$HOME"/.hishtory:/root/.local/bin:"$HOME"/.local/bin:"$HOME"/bin:/usr/local/bin:/usr/bin:/bin:/var/lib/flatpak/exports/share ]]

then

    PATH="$HOME"/go/bin:/usr/local/go:/usr/local/go/bin:"$HOME"/.local/share:"$HOME"/.config:"$HOME"/.config/JetBrains:"$HOME"/shares:"$HOME"/.cargo:"$HOME"/.fzf:"$HOME"/.hishtory:/root/.local/bin:"$HOME"/.local/bin:"$HOME"/bin:/usr/local/bin:/usr/bin:/bin:/var/lib/flatpak/exports/share:"$PATH"

fi


