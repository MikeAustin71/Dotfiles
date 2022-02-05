[TOC]



# Alacritty Sample Configuration



## GitHub Repository

[GitHub - alacritty/alacritty: A cross-platform, OpenGL terminal emulator.](https://github.com/alacritty/alacritty)



## Arch Linux Package

[Arch Linux - alacritty 0.10.0-2 (x86_64)](https://archlinux.org/packages/community/x86_64/alacritty/)



## Configuration Location

`$HOME/.config/alacritty/alacritty.yml`





## Shell Configuration



```
# Shell
#
# You can set shell.program to the path of your favorite shell, e.g. /bin/zsh.
# Entries in shell.args are passed unmodified as arguments to the shell.
#
# shell:
#   program: /usr/local/bin/fish
#   args:
#     - --login
#
shell:
  program: /usr/local/bin/tmux
  args:
    - new-session
    - -A
    - -D
    - -s
    - main

```

