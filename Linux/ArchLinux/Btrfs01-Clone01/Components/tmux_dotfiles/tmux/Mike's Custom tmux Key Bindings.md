# Mike's Custom ***tmux*** Key Bindings

**Ctrl+a** has been substituted for the default prefix key, **Ctrl+b**.

**Note: These key bindings substitute Ctrl+a for default binding keys Ctrl+b.**

**It is assumed that the custom key bindings have been applied via configuration file, *~/.tmux.conf***.

## New Key Bindings

[Useful Tmux Configuration Examples - DEV Community](https://dev.to/iggredible/useful-tmux-configuration-examples-k3g)



## Resources

[Tmux Home Page](https://github.com/tmux/tmux/wiki)

[tmux.1 Manual Page](https://man.openbsd.org/OpenBSD-current/man1/tmux.1)

[How to Use Tmux + Cheat Sheet](https://www.hostinger.com/tutorials/tmux-beginners-guide-and-cheat-sheet/#Tmux_Cheat_Sheet)

[Official tmux Documentation](https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html)



### Cheat Sheet

[Best Tmux Cheat Sheet & Quick Reference](https://tmuxcheatsheet.com/)

[How to Use Tmux + Cheat Sheet](https://www.hostinger.com/tutorials/tmux-beginners-guide-and-cheat-sheet/#Tmux_Cheat_Sheet)



### Clipboard

[Clipboard · tmux/tmux Wiki · GitHub](https://github.com/tmux/tmux/wiki/Clipboard)



### Documentation

[Official tmux Documentation](https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html)



------

## Can't Scroll In tmux

***Ctrl+a*** then ***[*** then you can use your normal navigation keys to scroll around (eg. Up Arrow or PgDn). Press q to quit scroll mode.

In **vi** mode (see below), you can also scroll the page up/down line by line using ***Shift-k*** and ***Shift-j*** (if you're already in scroll mode). Unshifted, the cursor moves instead of the page.

------

# Custom Key Bindings

Key bindings applied by Mike's custom configuration file, ***.tmux.conf***, located in the ***HOME*** directory.



## Primary Operations Scenarios

| Command                             | Description                                            |
| ----------------------------------- | ------------------------------------------------------ |
| tmux kill-server                    | kill the tmux server                                   |
| tmux new -s \<name\>                | start with named session                               |
| Ctrl+a, d                           | detach session                                         |
| tmux a                              | attach the detached session                            |
| tmux a #                            | attach the detached session                            |
| Ctrl+a, s                           | list sessions and windows                              |
| tmux kill-session –t \<name\>       | kill the session \<name\>                              |
| Ctrl+a, **c**                       | create new window                                      |
| Shift+RIGHT ARROW                   | go to next window                                      |
| Shift+LEFT ARROW                    | go to previous window                                  |
| Ctrl+a,0-9 (Top Row of Number-Keys) | Go to window 0-9 (Not Keypad - Top Row of Number-Keys) |
| ctrl+d                              | Close window or Pane                                   |
| Ctrl+a, &                           | kill window                                            |
| Ctrl+a, v                           | vertical split (pane)                                  |
| Ctrl+a, h                           | horizontal split (pane)                                |
| Ctrl+a, x                           | kill pane                                              |
| Ctrl+a, RIGHT ARROW                 | go to next pane                                        |
| Ctrl+a, LEFT ARROW                  | go to previous pane                                    |
| Mouse Left-Click                    | go to target pane                                      |
| Use Mouse                           | resize the pane                                        |
| Ctrl+a, z                           | toggle full-screen mode for current pane               |
| Ctrl+a, q                           | show pane-numbers                                      |



## Basic

Below commands can be used in terminal for various ***tmux*** operations e.g. start and stop etc.,

```
$ tmux
```

| Command                       | Description                           |
| ----------------------------- | ------------------------------------- |
| tmux                          | start tmux                            |
| tmux new -s \<name\>          | start tmux with <name>                |
| tmux ls                       | shows the list of sessions            |
| tmux a #                      | attach the detached-session           |
| tmux a -t \<name\>            | attach the detached-session to <name> |
| tmux kill-session –t \<name\> | kill the session <name>               |
| tmux kill-server              | kill the tmux server                  |

## Help

| Command   | Description               |
| --------- | ------------------------- |
| Ctrl+a, ? | show the list of commands |

Note

Press ‘Ctrl+a’ and then type the commands from the below tables,

## 1.5. Reload

| Command   | Description             |
| --------- | ----------------------- |
| Ctrl+a, r | reload .tmux.conf file  |
| Ctrl+a, i | reload tmux environment |

## 1.6. Sessions

| Command   | Description             |
| --------- | ----------------------- |
| Ctrl+a, s | list sessions & windows |
| Ctrl+a, $ | rename sessions         |
| Ctrl+a, d | detach session          |
| Ctrl+d    | kill session            |

## 1.7. Windows

Note

ctrl-d can be used to close the window or panes **without** using Ctrl+a.

| Command                             | Description                                            |
| ----------------------------------- | ------------------------------------------------------ |
| Ctrl+a, s                           | list sessions and windows                              |
| Ctrl+a, w                           | list windows and select one                            |
| Ctrl+a,\<COMMA\>                    | rename window                                          |
| Ctrl+a, c                           | create new window                                      |
| Shift+RIGHT ARROW                   | go to next window                                      |
| Shift+LEFT ARROW                    | go to previous window                                  |
| Ctrl+a, f                           | find window                                            |
| Ctrl+a, &                           | kill window                                            |
| Ctrl+d                              | kill window                                            |
| Ctrl+a,0-9 (Top Row of Number-Keys) | Go to window 0-9 (Not Keypad - Top Row of Number-Keys) |

## 1.8. Panes (split windows)

| Command               | Description                                                 |
| --------------------- | ----------------------------------------------------------- |
| Ctrl+a, v             | vertical split                                              |
| Ctrl+a, h             | horizontal split                                            |
| Ctrl+d                | kill pane                                                   |
| Ctrl+a, x             | kill pane                                                   |
| Alt+RIGHT             | go to pane right                                            |
| Ctrl+a, RIGHT         | go to next pane                                             |
| Alt+LEFT              | go to pane left                                             |
| Ctrl+a, LEFT          | go to previous pane                                         |
| MOUSE Click           | got to pane clicked                                         |
| Ctrl+a NUMKEYPAD(0-9) | go to pane 0-9. Numeric keypad - Not top row of number keys |
| Ctrl+a, z             | toggle full-screen mode for current pane                    |
| Use Mouse             | resize the pane                                             |
| Ctrl+a, q             | show pane-numbers                                           |

## 1.9. Commands

| Command | Description        |
| ------- | ------------------ |
| :       | go to command mode |

Next, type the commands as below,

| Command                  | Description                  |
| ------------------------ | ---------------------------- |
| tmux list-keys           | shows all the commands       |
| tmux list-panes          | shows the names of all panes |
| Use Mouse                | resize panes                 |
| tmux swap-pane -s 3 -t 0 | swap pane ‘0’ with pane ‘3’  |

## 1.10. Copy mode

‘Vim’ mode is set in the .tmux.conf file and ‘Esc’ is used to enter into the ‘copy mode’,

| Command   | Description     |
| --------- | --------------- |
| Ctrl+a, [ | enter copy mode |
| SPACEBAR  | start selection |
| ENTER     | copy selection  |
| Esc       | clear selection |

Note

Next use following commands **without** using ‘Ctrl+a’.

| Command    | Description                            |
| ---------- | -------------------------------------- |
| q          | quit mode                              |
| j, k, l, h | down, up, right left                   |
| J or K     | scroll down or up                      |
| F or B     | go to next or previous page            |
| $          | go to end of line                      |
| 0          | go to beginning of line                |
| w or b     | go to next or previous word            |
| / or ?     | search forward or backward             |
| n          | search next (use after above commands) |
| space      | start selection                        |
| Esc        | clear selection                        |
| y          | copy section                           |

Note

Use below command with ‘ctrl-b’ for paste-operation.

| Command | Description     |
| ------- | --------------- |
| p       | paste selection |

------



# Mike's Configuration File

[Useful Tmux Configuration Examples - DEV Community](https://dev.to/iggredible/useful-tmux-configuration-examples-k3g)

The custom configuration file must be named, ***.tmux.conf*** and it must reside in the home directory. 

```bash
# Bind C-a = Ctrl+a as prefix key 
unbind C-a
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# C-a + n = New Window
bind-key n new-window

# Set easier window split keys
bind-key v split-window -h
bind-key h split-window -v

# Use Alt-arrow keys to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Shift arrow to switch windows
bind -n S-Left previous-window
bind -n S-Right next-window

# Mouse mode
setw -g mouse on


# Easy config reload
bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded."
```

