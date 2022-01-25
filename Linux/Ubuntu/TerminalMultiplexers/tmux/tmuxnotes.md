[TOC]



# Tmux



## Resources

### Home Page

[Tmux Home Page](https://github.com/tmux/tmux/wiki)

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

Let’s learn how to manipulate terminal panels. We can divide a window horizontally, with the command "**\<prefix\>**\"

It would have to be – **CTRL+B** **“**

And to do the same but vertically – **CTRL+B %**

To switch between panels, we can use the command – **CTRL+B, arrow key** (in the direction of the pane you want to go to)

And then we can navigate through each of the panels. If we want to close only one we must press – **CTRL+D.**



## Mike's Tmux Custom Cheat Sheet

[Mike's Tmux Custom Key Bindings](.\Mike's Custom tmux Key Bindings.md)



## Default Tmux Cheat Sheet

[Default Key Bindings](.\tmuxDefaultKeybindingCheatSheet.md)
