#!/bin/bash
# Mike's $HOME Directory Path Parameters

# User specific environment


# Initial Path Spec
if ! [[ "$PATH" =~ "$HOME"/go/bin:/usr/local/go:/usr/local/go/bin:/root/.local/bin:"$HOME"/.config/JetBrains:/usr/share/JetBrains:/opt/JetBrains:"$HOME"/.config/JetBrains/fleet/lib/app/bin/:"$HOME"/.local/share/JetBrains/Toolbox/scripts:"$HOME"/.local/bin:"$HOME"/bin:/usr/local/bin:/usr/bin:/bin ]]

then

    PATH="$HOME"/go/bin:/usr/local/go:/usr/local/go/bin:/root/.local/bin:"$HOME"/.config/JetBrains:/usr/share/JetBrains:/opt/JetBrains:"$HOME"/.config/JetBrains/fleet/lib/app/bin/:"$HOME"/.local/share/JetBrains/Toolbox/scripts:"$HOME"/.local/bin:"$HOME"/bin:/usr/local/bin:/usr/bin:/bin:"$PATH"

fi

export PATH




: '

 Final Path Spec
if ! [[ "$PATH" =~ "$HOME"/go/bin:/usr/local/go:"$HOME"/.cargo:/usr/local/go/bin:/root/.local/bin:"$HOME"/.hishtory:"$HOME"/.config/JetBrains:/usr/share/JetBrains:/opt/JetBrains:"$HOME"/.config/JetBrains/fleet/lib/app/bin/:"$HOME"/.local/share/JetBrains/Toolbox/scripts:"$HOME"/.local/bin:"$HOME"/bin:/usr/local/bin:/usr/bin:/bin ]] ; then

    PATH="$HOME"/go/bin:/usr/local/go:"$HOME"/.cargo:/usr/local/go/bin:/root/.local/bin:"$HOME"/.hishtory:"$HOME"/.config/JetBrains:/usr/share/JetBrains:/opt/JetBrains:"$HOME"/.config/JetBrains/fleet/lib/app/bin/:"$HOME"/.local/share/JetBrains/Toolbox/scripts:"$HOME"/.local/bin:"$HOME"/bin:/usr/local/bin:/usr/bin:/bin:"$PATH"

fi

export PATH

 '

