# Default Tmux Cheat Sheet

**Note: These key bindings substitute Ctrl+a for default binding keys Ctrl+b.**

**It is assumed that the custom key bindings have been applied via configuration file, *~/.tmux.conf***.

## Resources

[Tmux Home Page](https://github.com/tmux/tmux/wiki)

[tmux.1 Manual Page](https://man.openbsd.org/OpenBSD-current/man1/tmux.1)

[How to Use Tmux + Cheat Sheet](https://www.hostinger.com/tutorials/tmux-beginners-guide-and-cheat-sheet/#Tmux_Cheat_Sheet)

[Official tmux Documentation](https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html)

------

## Primary Operations Scenarios

| Command                     | Description                              |
| --------------------------- | ---------------------------------------- |
| tmux kill-server            | kill the tmux server                     |
| tmux new -s \<name\>        | start with named session                 |
| Ctrl+a, d                   | detach session                           |
| tmux a #                    | attach the detached-session              |
| Ctrl+a, s                   | list sessions & windos                   |
| tmux kill-session –t <name> | kill the session <name>                  |
| Ctrl+a, **c**               | create new window                        |
| Ctrl+a, n                   | go to next window                        |
| Ctrl+a, p                   | go to previous window                    |
| Ctrl+a, 0-9                 | go to window 0-9                         |
| ctrl+d                      | Close window or Pane                     |
| Ctrl+a, &                   | kill window                              |
| Ctrl+a, %                   | vertical split (pane)                    |
| Ctrl+a, ‘’                  | horizontal split (pane)                  |
| Ctrl+a, x                   | kill pane                                |
| Ctrl+a, o                   | go to next pane                          |
| Ctrl+a, [arrow keys]        | resize the pane                          |
| Ctrl+a, z                   | toggle full-screen mode for current pane |
| Ctrl+a, q                   | show pane-numbers                        |



## Can't Scroll In tmux

***Ctrl+a*** then ***[*** then you can use your normal navigation keys to scroll around (eg. Up Arrow or PgDn). Press q to quit scroll mode.

Alternatively you can press ***Ctrl+a*** ***PgUp*** to go directly into copy mode and scroll one page up (which is what it sounds like you will want most of the time)

In **vi** mode (see below), you can also scroll the page up/down line by line using ***Shift-k*** and ***Shift-j*** (if you're already in scroll mode). Unshifted, the cursor moves instead of the page.



# Tmux



## Resources

[Tmux Home Page](https://github.com/tmux/tmux/wiki)

[Manual Page](https://man.openbsd.org/OpenBSD-current/man1/tmux.1)

[How to Use Tmux + Cheat Sheet](https://www.hostinger.com/tutorials/tmux-beginners-guide-and-cheat-sheet/#Tmux_Cheat_Sheet)

[Official tmux Documentation](https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html)



## What is Tmux?

Tmux is a terminal multiplexer an alternative to [GNU Screen](https://linuxize.com/post/how-to-use-linux-screen/) . In other words, it means that you can start a Tmux session and then open multiple windows inside that session. Each window occupies the entire screen and can be split into rectangular panes.

With Tmux you can easily switch between multiple programs in one terminal, detach them and reattach them to a different terminal.

Tmux sessions are persistent, which means that programs running in Tmux will continue to run even if you get disconnected.

All commands in Tmux start with a prefix, which by default is `Ctrl+b`.

## Starting Your First Tmux Session

### Starting a Session

To start your first Tmux session, simply type `tmux` in your console:

```b
tmux
```

This will open a new session, create a new window, and start a shell in that window.

Once the session starts, we will see the same terminal as always, except for a green bar at the bottom. This bar indicates the active session, and that we are using Tmux. 

### Starting a "Named" Session

It is also possible to name the session. To do this, we can type the following command when creating one:

```bash
tmux new -s [session_name]
```

### Ending a Session

To end a session, we need to type the following command:

```
exit
```

### Some Helpful Commands

Another fantastic feature of Tmux is that we can “save” a specific session. For example, if we are using [htop](https://hisham.hm/htop/) and we use the detach command (**CTRL+B, D**) when we run Tmux again we will find the process still works. This is very useful for performing commands that take a long time to run, like backups.**0**

So, we can start a new session by typing in this command into the command line:

```bash
tmux new
```

In that new session, we are going to run htop. Htop is a tool to monitor system resources.

Then, we use the detach command. So, first, we enter the prefix by pressing **CTRL+B** and next, the command **D**. We will see that we get the next message in the terminal.

Now we need to get back to our “attached” session. To do this we execute the following command in the terminal:

```
tmux attach -t [session_name]
```

Since we have not used a name for the session, then we would use the value 0. The command looks like this:

```bash
tmux attach -t 0
```

And we will be back to our previous session.

It is possible to do several sessions with the command **C**. To navigate between them we use the identifier number. For example, the first session we create from the regular terminal would be **0**. If we create another session it corresponds to the number **1**.

```
CTRL+B, 1
```

We can see the current session with the green bar at the bottom of the window.

We can see how many Tmux sessions are open with the following command:

```
tmux ls
```

### Managing Panes

Let’s learn how to manipulate terminal panels. We can divide a window horizontally, with the command \"**<prefix>**\"

It would have to be – **CTRL+B** **“**

And to do the same but vertically – **CTRL+B %**

To switch between panels, we can use the command – **CTRL+B, arrow key** (in the direction of the pane you want to go to)

And then we can navigate through each of the panels. If we want to close only one we must press – **CTRL+D.**



## Tmux Cheat Sheet

Finally, we want to share a cheat sheet to use as a reference:

### Sessions

Start a new Session:

```
tmux
```

Start a new session with a name:

```
tmux new -s [name]
```

Start an attached session:

```
tmux a #
```

If the Tmux session has a name:

```
tmux attach -t [name]
```

List all Tmux sessions:

```
tmux ls
```

Exit the utility:

```
exit
```

Kill session:

```
tmux kill-session -t [name]
```

### Window Handling

| New window       | <prefix>+c |
| ---------------- | ---------- |
| Next window      | <prefix>+n |
| List all windows | <prefix>+w |
| Rename a window  | <prefix>+, |
| Previous window  | <prefix>+p |
| Find a window    | <prefix>+f |
| Kill a window    | <prefix>+& |

### Pane Handling

| Split panes vertically   | <prefix>+%         |
| ------------------------ | ------------------ |
| Split panes horizontally | <prefix>+“         |
| Toggle last active plane | <prefix>+;         |
| Swap panes               | <prefix>+o         |
| Kill pane                | <prefix>+x         |
| Show pane numbers        | <prefix>+q         |
| Move plan left           | <prefix>+{         |
| Move plan right          | <prefix>+}         |
| Switching between panes  | <prefix>+arrow key |

## Conclusion

As we learned, Tmux is an important tool that helps use the terminal efficiently.

The management of this utility is done through commands. We have learned the most basic and useful ones for daily work.

So if you want to know more about this tool, we recommend you consult its [official documentation](https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html).

------

The following was taken from the official Tmux documentation.

[Tmux Docs](https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html)

------



## 1.1. Installation

```
$ sudo apt-get install tmux
```

## 1.2. .tmux.conf

Note

First, create a file ‘.tmux.conf’ in the ‘home’ folder. Here, The command ‘ctrl-b’ is replaced with ‘crtl-a’ along with some other changes.

```
# ~/.tmux.conf

# unbind default prefix and set it to ctrl-a
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# make delay shorter
set -sg escape-time 0



#### key bindings ####

# reload config file
bind r source-file ~/.tmux.conf \; display ".tmux.conf reloaded!"

# quickly open a new window
bind N new-window

# synchronize all panes in a window
bind y setw synchronize-panes

# pane movement shortcuts (same as vim)
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# enable mouse support for switching panes/windows
set -g mouse-utf8 on
set -g mouse on


#### copy mode : vim ####

# set vi mode for copy mode
setw -g mode-keys vi

# copy mode using 'Esc'
unbind [
bind Escape copy-mode

# start selection with 'space' and copy using 'y'
bind -t vi-copy 'y' copy-selection

# paste using 'p'
unbind p
bind p paste-buffer
```

## 1.3. Basic

Below commands can be used in terminal for various ‘tmux’ operations e.g. start and stop etc.,

```
$ tmux
```

| Command                     | Description                           |
| --------------------------- | ------------------------------------- |
| tmux                        | start tmux                            |
| tmux new -s <name>          | start tmux with <name>                |
| tmux ls                     | shows the list of sessions            |
| tmux a #                    | attach the detached-session           |
| tmux a -t <name>            | attach the detached-session to <name> |
| tmux kill-session –t <name> | kill the session <name>               |
| tmux kill-server            | kill the tmux server                  |

Note

Press ‘ctrl-b’ and then type the commands from the below tables,

## 1.4. Help

| Command   | Description               |
| --------- | ------------------------- |
| Ctrl+b, ? | show the list of commands |

## 1.5. Reload

| Command | Description            |
| ------- | ---------------------- |
| r       | reload .tmux.conf file |

## 1.6. Sessions

| Command | Description     |
| ------- | --------------- |
| s       | list sessions   |
| $       | rename sessions |
| d       | detach session  |

## 1.7. Windows

Note

ctrl-d can be used to close the window or panes **without** using ctrl-b.

| Command | Description                 |
| ------- | --------------------------- |
| w       | list windows and select one |
| ,       | rename window               |
| c or N  | create new window           |
| n       | go to next window           |
| p       | go to previous window       |
| f       | find window                 |
| &       | kill window                 |
| 0-9     | go to window 0-9            |

## 1.8. Panes (split windows)

| Command    | Description                              |
| ---------- | ---------------------------------------- |
| %          | vertical split                           |
| ‘’         | horizontal split                         |
| x          | kill pane                                |
| o          | go to next pane                          |
| h, j, k, l | go to next pane in vim-style             |
| z          | toggle full-screen mode for current pane |
| arrow keys | resize the pane                          |
| q          | show pane-numbers                        |

## 1.9. Commands

| Command | Description        |
| ------- | ------------------ |
| :       | go to command mode |

Next, type the commands as below,

| Command             | Description                  |
| ------------------- | ---------------------------- |
| list-keys           | shows all the commands       |
| list-panes          | shows the names of all panes |
| resize-pane -D 20   | resize down                  |
| resize-pane -U 20   | resize up                    |
| resize-pane -L 20   | resize left                  |
| resize-pane -R 20   | resize right                 |
| swap-pane -s 3 -t 1 | swap pane ‘1’ with pane ‘3’  |

## 1.10. Copy mode

‘Vim’ mode is set in the .tmux.conf file and ‘Esc’ is used to enter into the ‘copy mode’,

| Command | Description     |
| ------- | --------------- |
| Esc     | go to copy mode |

Note

Next use following commands **without** using ‘ctrl-b’.

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

Use below command with ‘ctrl-a’ for paste-operation.

| Command | Description     |
| ------- | --------------- |
| p       | paste selection |



# [DEFAULT KEY BINDINGS](https://man.openbsd.org/OpenBSD-current/man1/tmux.1#DEFAULT_KEY_BINDINGS)

`tmux` may be controlled from an attached client by using a key combination of a prefix key, ‘`C-b`’ (Ctrl-b) by default, followed by a command key.

The default command key bindings are:



- C-b

  Send the prefix key (C-b) through to the application.

- C-o

  Rotate the panes in the current window forwards.

- C-z

  Suspend the `tmux` client.

- !

  Break the current pane out of the window.

- "

  Split the current pane into two, top and bottom.

- #

  List all paste buffers.

- $

  Rename the current session.

- %

  Split the current pane into two, left and right.

- &

  Kill the current window.

- '

  Prompt for a window index to select.

- (

  Switch the attached client to the previous session.

- )

  Switch the attached client to the next session.

- ,

  Rename the current window.

- -

  Delete the most recently copied buffer of text.

- .

  Prompt for an index to move the current window.

- 0 to 9

  Select windows 0 to 9.

- :

  Enter the `tmux` command prompt.

- ;

  Move to the previously active pane.

- =

  Choose which buffer to paste interactively from a list.

- ?

  List all key bindings.

- D

  Choose a client to detach.

- L

  Switch the attached client back to the last session.

- [

  Enter copy mode to copy text or view the history.

- ]

  Paste the most recently copied buffer of text.

- c

  Create a new window.

- d

  Detach the current client.

- f

  Prompt to search for text in open windows.

- i

  Display some information about the current window.

- l

  Move to the previously selected window.

- m

  Mark the current pane (see `select-pane` `-m`).

- M

  Clear the marked pane.

- n

  Change to the next window.

- o

  Select the next pane in the current window.

- p

  Change to the previous window.

- q

  Briefly display pane indexes.

- r

  Force redraw of the attached client.

- s

  Select a new session for the attached client interactively.

- t

  Show the time.

- w

  Choose the current window interactively.

- x

  Kill the current pane.

- z

  Toggle zoom state of the current pane.

- {

  Swap the current pane with the previous pane.

- }

  Swap the current pane with the next pane.

- ~

  Show previous messages from `tmux`, if any.

- Page Up

  Enter copy mode and scroll one page up.

- Up, Down

   

- Left, Right

  Change to the pane above, below, to the left, or to the right of the current pane.

- M-1 to M-5

  Arrange panes in one of the five preset layouts: even-horizontal, even-vertical, main-horizontal, main-vertical, or tiled.

- Space

  Arrange the current window in the next preset layout.

- M-n

  Move to the next window with a bell or activity marker.

- M-o

  Rotate the panes in the current window backwards.

- M-p

  Move to the previous window with a bell or activity marker.

- C-Up, C-Down

   

- C-Left, C-Right

  Resize the current pane in steps of one cell.

- M-Up, M-Down

   

- M-Left, M-Right

  Resize the current pane in steps of five cells.

Key bindings may be changed with the `bind-key` and `unbind-key` commands.

