[TOC]



# Install *tmux*



## Resources

### Home Page

[Tmux Home Page](https://github.com/tmux/tmux/wiki)



### Clipboard

[Clipboard · tmux/tmux Wiki · GitHub](https://github.com/tmux/tmux/wiki/Clipboard)



### E-Book 

$18.00 - [tmux 2: Productive Mouse-Free Development by Brian P. Hogan (pragprog.com)](https://pragprog.com/titles/bhtmux2/tmux-2/)



### Manual Page

[Manual Page](https://man.openbsd.org/OpenBSD-current/man1/tmux.1)



### Cheat Sheet

[Best Tmux Cheat Sheet & Quick Reference](https://tmuxcheatsheet.com/)

[How to Use Tmux + Cheat Sheet](https://www.hostinger.com/tutorials/tmux-beginners-guide-and-cheat-sheet/#Tmux_Cheat_Sheet)



### Documentation

[Official tmux Documentation](https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html)



### Oh-My-Tmux

[GitHub - gpakosz/.tmux: 🇫🇷 Oh my tmux! My self-contained, pretty & versatile tmux configuration made with ❤️](https://github.com/gpakosz/.tmux)



### Tmux Resources

[GitHub - rothgar/awesome-tmux: A list of awesome resources for tmux](https://github.com/rothgar/awesome-tmux)



### Dotfiles

[dotty-config/tmux.conf at main · ztlevi/dotty-config · GitHub](https://github.com/ztlevi/dotty-config/blob/main/shell/tmux/tmux.conf)



## Videos

[Complete tmux Tutorial - YouTube](https://www.youtube.com/watch?v=Yl7NFenTgIo)

[tmux 2: Productive Mouse-Free Development - YouTube](https://www.youtube.com/watch?v=2HbAMg9k6J0)

[Tmux Tutorial - YouTube](https://www.youtube.com/watch?v=cPWEX2446B4)

[LinuxTV Getting Started with tmux Part 1 - Overview and Features - YouTube](https://www.youtube.com/watch?v=gmjyMxezIWU)

[LinuxTV Getting Started with tmux Part 2 - Horizontal and Vertical Panes - YouTube](https://www.youtube.com/watch?v=H6RBPHow_q4)

[LinuxTV Getting Started with tmux Part 3 - Creating and Managing Windows - YouTube](https://www.youtube.com/watch?v=JMGGrM9KmFw)

[LinuxTV Getting Started with tmux Part 4 - Creating and Switching Between Sessions - YouTube](https://www.youtube.com/watch?v=FAU8rmS5NSE)

[LinuxTV Getting Started with tmux Part 5 - Customization and Tweaks - YouTube](https://www.youtube.com/watch?v=bjBjZvZsgks)

[Doug Bell - "Organized Development With tmux" - YouTube](https://www.youtube.com/watch?v=o7Dg1kmjhfQ)

### Waylon Walker Video Series

[Waylon Walker tmux - YouTube](https://www.youtube.com/playlist?list=PLTRNG6WIHETB4reAxbWza3CZeP9KL6Bkr)



## *tmux* display-message

[📬 Send Notifications Anywhere in tmux - YouTube](https://www.youtube.com/watch?v=utfLA6L8o5s)



## What is Tmux?

Tmux is a terminal multiplexer an alternative to [GNU Screen](https://linuxize.com/post/how-to-use-linux-screen/) . In other words, it means that you can start a Tmux session and then open multiple windows inside that session. Each window occupies the entire screen and can be split into rectangular panes.

With Tmux you can easily switch between multiple programs in one terminal, detach them and reattach them to a different terminal.

Tmux sessions are persistent, which means that programs running in Tmux will continue to run even if you get disconnected.

All commands in Tmux start with a prefix, which by default is `ctrl+b`.



## *tmux* Installation

[Arch Linux - tmux 3.2_a-1 (x86_64)](https://archlinux.org/packages/community/x86_64/tmux/)

[Home · tmux/tmux Wiki · GitHub](https://github.com/tmux/tmux/wiki)

```bash
sudo pacman -S tmux
```



# Mike's *tmux* Configuration

The custom configuration file must be named, ***.tmux.conf*** and it must reside in the home directory. 

```bash
# Bind Ctrl+a as prefix key
unbind C-a
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# C-a+n = New Window
bind-key n new-window

# Set easier window split keys
bind-key v split-window -h
bind-key h split-window -v

# Use Alt+arrow keys to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Shift arrow to switch windows
bind -n S-Left previous-window
bind -n S-Right next-window

# Set History Limit = 5000
set-option -g history-limit 5000

# Set Mouse on
set -g mouse on

# Eash config file reload
bind r source-file ~/.tmux.conf \; display "Reloaded!"

```

