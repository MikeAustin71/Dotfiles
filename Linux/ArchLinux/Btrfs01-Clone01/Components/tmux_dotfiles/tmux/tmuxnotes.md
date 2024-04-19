[TOC]



# Tmux



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

With Tmux, you can easily switch between multiple programs in one terminal, detach them and reattach them to a different terminal.

Tmux's sessions are persistent, which means that programs running in Tmux will continue to run even if you get disconnected.

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

[Mike's Tmux Custom Key Bindings](.\Mike's%20Custom%20tmux%20Key%20Bindings.md)



## Default Tmux Cheat Sheet

[Default Key Bindings](.\tmuxDefaultKeybindingCheatSheet.md)



# A beginner's guide to tmux

[A beginner's guide to tmux | Enable Sysadmin (redhat.com)](https://www.redhat.com/sysadmin/introduction-tmux-linux)



Make your Linux terminal more useful with tmux, a terminal multiplexer that allows you to run multiple Linux programs over a single connection.

Posted: September 13, 2022 | | **by**

[Ricardo Gerardi (Editorial Team, Sudoer alumni, Red Hat)](https://www.redhat.com/sysadmin/users/rgerardi)

Tmux is a terminal multiplexer; it allows you to create several "pseudo terminals" from a single terminal. This is very useful for running multiple programs with a single connection, such as when you're remotely connecting to a machine using [Secure Shell (SSH)](https://www.redhat.com/sysadmin/access-remote-systems-ssh).

Tmux also decouples your programs from the main terminal, protecting them from accidentally disconnecting. You can detach tmux from the current terminal, and all your programs will continue to run safely in the background. Later, you can reattach tmux to the same or a different terminal.

In addition to its benefits with remote connections, tmux's speed and flexibility make it a fantastic tool to manage multiple terminals on your local machine, similar to a window manager. I've been using tmux on my laptops for over eight years. Some of tmux's features that help me and increase my productivity include:

- Fully customizable status bar
- Multiple window management
- Splitting window in several panes
- Automatic layouts
- Panel synchronization
- Scriptability, which allows me to create custom tmux sessions for different purposes

Here's an example of a customized tmux session:

Image

![tmux custom session](https://www.redhat.com/sysadmin/sites/default/files/styles/embed_large/public/2022-09/tmux-custom-screen01.png?itok=cOrR81Ul)

(Ricardo Gerardi, CC BY-SA 4.0)

Tmux offers some of the same functionality found in [Screen](https://www.gnu.org/software/screen/), which has been deprecated in some Linux distributions. Tmux has a more modern code base than Screen and offers additional customization capabilities.

Now that you know some of tmux's benefits, I'll show you how to install and use it.

## Install tmux

Tmux is available in the standard repositories with Fedora and [Red Hat Enterprise Linux (RHEL)](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux?intcmp=701f20000012ngPAAQ), starting with RHEL 8. You can install it using DNF:

```shell
$ sudo dnf -y install tmux
```

It's also available with many other Linux distributions, and you should be able to install it by using your favorite distribution package manager. For other operating systems, consult the [tmux installation guide](https://github.com/tmux/tmux/wiki/Installing).

***[ Download now: [A sysadmin's guide to Bash scripting](https://opensource.com/downloads/bash-scripting-ebook?intcmp=701f20000012ngPAAQ). ]\***

## Get started with tmux

To start using tmux, type `tmux` on your terminal. This command launches a tmux server, creates a default session (number 0) with a single window, and attaches to it.

```shell
$ tmux
```

Image

![default tmux screen](https://www.redhat.com/sysadmin/sites/default/files/styles/embed_large/public/2022-09/tmux-default01.png?itok=35OfC1vr)

(Ricardo Gerardi, CC BY-SA 4.0)

Now that you're connected to tmux, you can run any commands or programs as you normally would. For example, to simulate a long-running process:

```shell
$ c=1

$ while true; do echo "Hello $c"; let c=c+1; sleep 1; done
Hello 1
Hello 2
Hello 3
```

You can detach from your tmux session by pressing **Ctrl+B** then **D**. Tmux operates using a series of keybindings (keyboard shortcuts) triggered by pressing the "prefix" combination. By default, the prefix is **Ctrl+B**. After that, press **D** to detach from the current session.

```shell
[detached (from session 0)]
```

You're no longer attached to the session, but your long-running command executes safely in the background. You can list active tmux sessions with `tmux ls`:

```shell
$ tmux ls

0: 1 windows (created Sat Aug 27 20:54:58 2022)
```

***[ Learn how to [manage your Linux environment for success](https://www.redhat.com/en/engage/linux-management-ebook-s-201912231121?intcmp=701f20000012ngPAAQ). ]\***

You can disconnect your SSH connection at this point, and the command will continue to run. When you're ready, reconnect to the server and reattach to the existing tmux session to resume where you left off:

```shell
$ tmux attach -t 0
Hello 72
Hello 73
Hello 74
Hello 75
Hello 76
^C
```

As you can see, the command continued to run and print messages on the screen. You can type **Ctrl+C** to cancel it.

All tmux commands can also be abbreviated, so, for example, you can enter `tmux a` , and it will work the same as `tmux attach`.

This functionality alone makes tmux a great tool, but it has even more to offer, including its default keybindings.

## Basic tmux keybindings

Tmux provides several keybindings to execute commands quickly in a tmux session. Here are some of the most useful ones.

First, create a new tmux session if you're not already in one. You can name your session by passing the parameter `-s {name}` to the `tmux new` command when creating a new session:

```shell
$ tmux new -s Session1
```

- **Ctrl+B D** — Detach from the current session.
- **Ctrl+B %** — Split the window into two panes horizontally.
- **Ctrl+B "** — Split the window into two panes vertically.
- **Ctrl+B Arrow Key** (Left, Right, Up, Down) — Move between panes.
- **Ctrl+B X** — Close pane.
- **Ctrl+B C** — Create a new window.
- **Ctrl+B N** or **P** — Move to the next or previous window.
- **Ctrl+B 0 (1,2...)** — Move to a specific window by number.
- **Ctrl+B :** — Enter the command line to type commands. Tab completion is available.
- **Ctrl+B ?** — View all keybindings. Press **Q** to exit.
- **Ctrl+B W** — Open a panel to navigate across windows in multiple sessions.

For additional keybindings, consult the tmux man pages.

***[ Download the [tmux cheat sheet](https://opensource.com/downloads/tmux-cheat-sheet?intcmp=701f20000012ngPAAQ) to keep the keybindings at your fingertips. ]\***

## Use the mouse

Tmux is most often used with the keyboard, and it provides many keybindings to make it easier to execute commands, create new panes, and resize them. If you prefer using the mouse, tmux also allows that, although the mouse is disabled by default. To enable it, first enter command mode by typing **Ctrl+B :**, then toggle the mouse on (or off) with the command `set -g mouse`.

Now you can use the mouse to switch between panes and windows and resize them. Starting with tmux version 3, you can also right-click with the mouse and open a context menu:

Image

![tmux menu](https://www.redhat.com/sysadmin/sites/default/files/styles/embed_medium/public/2022-09/tmux-mouse-menu01.png?itok=vysy0LDb)

(Ricardo Gerardi, CC BY-SA 4.0)

This menu changes according to what's on the screen under the mouse cursor when clicked.

***[ Keep your most commonly used commands handy with the [Linux commands cheat sheet](https://developers.redhat.com/cheat-sheets/linux-commands-cheat-sheet?intcmp=701f20000012ngPAAQ). ]\***

## Configure tmux

You can change the tmux configuration permanently by modifying the tmux configuration file. By default, this file is located at `$HOME/.tmux.conf`.

For example, the default prefix key combination is **Ctrl+B**, but sometimes this combination is a little awkward to press, and it requires both hands. You can change it to something different by editing the configuration file. I like to set the prefix key to **Ctrl+A**. To do this, create a new configuration file and add these lines to it:

```shell
$ vi $HOME/.tmux.conf

# Set the prefix to Ctrl+a
set -g prefix C-a

# Remove the old prefix
unbind C-b

# Send Ctrl+a to applications by pressing it twice
bind C-a send-prefix

:wq
```

When you start a tmux session on this machine, you can execute the commands listed above by pressing **Ctrl+A** first. Use the configuration file to change or add other tmux keybindings and commands.

***[ Get the guide to [installing applications on Linux](https://opensource.com/downloads/installing-linux-applications-ebook?intcmp=701f20000012ngPAAQ). ]\***

## Customize the status bar

Tmux's status bar is fully customizable. You can change the colors of each section and what is displayed. There are so many options that it would require another article to cover them, so I'll start with the basics.

The standard green color for the entire status bar makes it difficult to see the different sections. It's particularly difficult to see how many windows you have open and which one is active.

Image

![tmux colors status bar](https://www.redhat.com/sysadmin/sites/default/files/styles/embed_large/public/2022-09/tmux-colors-green01.png?itok=o8pU2Gai)

(Ricardo Gerardi, CC BY-SA 4.0)

You can change that by updating the status bar colors. First, enter command mode by typing **Ctrl+B :** (or **Ctrl+A :** if you made the prefix configuration change above). Then change the colors with these commands:

- Change the status bar background color: `set -g status-bg cyan`
- Change inactive window color: `set -g window-status-style bg=yellow`
- Change active window color: `set -g window-status-current-style bg=red,fg=white`

Add these commands to your configuration file for permanent changes.

With this configuration in place, your status bar looks nicer, and it's much easier to see which window is active:

Image

![tmux colors](https://www.redhat.com/sysadmin/sites/default/files/styles/embed_large/public/2022-09/tmux-colors01.png?itok=OF7o2F5o)

(Ricardo Gerardi, CC BY-SA 4.0)

## What's next

Tmux is a fantastic tool to safeguard your remote connections and is useful when you spend a long time using the terminal. This article covers only the basic functionality, and there is much more to explore. For additional information about tmux, consult its official [wiki page](https://github.com/tmux/tmux/wiki).

You can also expand tmux's functionality with extra-official plugins. These plugins add more commands, integrate with applications such as [Vim](https://www.redhat.com/sysadmin/vim-power-commands), and add new functionality to the status bar. For more information, consult the [tmux plugins project](https://github.com/tmux-plugins/list).

------



# tmux in Linux

[tmux in Linux | Baeldung on Linux](https://www.baeldung.com/linux/tmux)

Last updated: March 18, 2024

Written by:[Chin Ming Jun](https://www.baeldung.com/linux/author/chinmingjun)

## 1. Overview

*[tmux](https://man7.org/linux/man-pages/man1/tmux.1.html)* is a terminal multiplexer tool in Linux. Essentially, it enables us to create and maintain multiple [pseudo-terminal](https://www.baeldung.com/linux/pty-vs-tty#what-is-a-pty) (PTS) instances. Concretely, it maintains these pseudo-terminals through a server process that’s started whenever a *tmux* command is executed.

Because these terminal processes are maintained by a server process, *tmux* provides us the flexibility to detach from any terminal session without killing it. Furthermore, we can reattach any of the terminal sessions at a later time to regain control. This makes it ideal for any long-running process that we can run in the background and reattach to get control once in a while.

In this tutorial, we’ll learn about the *tmux* command in Linux. Particularly, we’ll look at some of the features and subcommands offered by *tmux* as well as specific applications for many of them.

## 2. *tmux*

Normally, many Linux installations don’t include a terminal multiplexer by default. However, one can come in handy in many situations.

### 2.1. Installation

We can install *tmux* on Debian-based Linux (such as Ubuntu) using the [*apt*](https://www.baeldung.com/linux/debian-installing-packages-url#1-apt-advanced-packaging-tool) package manager:

```bash
$ sudo apt-get update -qq
$ sudo apt-get install -y tmuxCopy
```

Similarly, we can install *tmux* on RHEL-based Linux (such as CentOS) using the [*yum*](https://www.baeldung.com/linux/yum-dnf-reinstall#reinstall-original-yellowdog-update-modified-yum) package manager:

```bash
$ sudo yum update -qq
$ sudo yum install -y tmuxCopy
```

Either way, we should now have *tmux* available.

### 2.2. Basic Usage

We can launch a new *tmux* session by entering the command alone:

```bash
$ tmuxCopy
```

Without any argument, *tmux* creates a new session with one window and one pane. Additionally, the session is given a default name: *0*.

Immediately after the creation, we’re dropped into the *tmux* session:

![ln1](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln1-300x158.png)

Here, we can see the shell prompt at the top, as well as some session status information at the bottom.

## 3. Key Bindings

The *tmux* documentation provides information about its many subcommands. They are usually intended for configuring the *tmux* instance. For example, there are commands for creating new windows, splitting panes, and detaching.

To make these commands easier to input, *tmux* defines a number of key bindings, also known as shortcuts or hotkeys. We can utilize the latter to boost our productivity. In fact, we mainly use these key bindings in this article.

When it comes to key bindings in the prefix key table, we can input them via a [meta](https://www.baeldung.com/linux/meta-modifier-keys) key. **By default, \*tmux\* sets the prefix key as \*Ctrl+B\***. For clarity, we annotate the prefix key with *<prefix>* in the rest of the article.

## 4. Sessions in *tmux*

A session in *tmux* can group together several pseudo terminals. They are directly under the *tmux* server’s management.

### 4.1. Creating a Session

**We can create a new session in \*tmux\* using the \*new-session\* command**. The command supports several option flags that enable us to customize the session.

For example, **we can create a session and give it a name using the \*-s\* flag**:

```bash
$ tmux new-session -s gammaCopy
```

At this point, we should see the *gamma* session:

![ln2](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln2-300x156.png)

In addition to the session name, **we can specify the window name using the \*-n\* flag**:

```bash
$ tmux new-session -s gamma -n observationCopy
```

At this point, we have a named session and a named window:

![ln3](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln3-300x155.png)

**Using the \*-d\* flag, we can choose not to attach to the newly created session**:

```bash
$ tmux new-session -s gamma -d
$ tmux list-session
alpha: 2 windows (created Sun Jun 20 11:37:35 2021)
gamma: 1 windows (created Sun Jun 20 12:11:41 2021)Copy
```

After we enter the *new-session* command, we’ll not see the session due to the *-d*

### 4.2. Detaching From a Session

To detach the client from a session, we can use *d* after *<prefix>*:

```bash
<prefix> + dCopy
```

At this point, the session disappears and the *tmux* server remains operational only in the background.

### 4.3. Attaching to a Session

**To attach to a session, we can use the \*attach-session\* command followed by the \*-t\* flag and the name or number of the session.**

For instance, we can attach to the *gamma* session:

```bash
$ tmux attach-session -t gammaCopy
```

Alternatively, we can use the session number.

### 4.4. Listing All the Sessions

To view a list of all the sessions currently on the *tmux* server, **we can use the \*list-session\* command**:

```bash
$ tmux list-session
alpha: 2 windows (created Sun Jun 20 11:37:35 2021)
gamma: 1 windows (created Sun Jun 20 12:11:41 2021)Copy
```

From the output, we can see that there are currently two sessions running on the *tmux* server: *alpha* and *gamma*. Both of them also have numbers.

### 4.5. Renaming a Session

To rename an existing session, we can use the *rename-session* command:

```bash
$ tmux rename-session -t alpha beta
$ tmux list-session
beta: 2 windows (created Sun Jun 20 11:37:35 2021)
gamma: 1 windows (created Sun Jun 20 12:11:41 2021)
Copy
```

**The \*rename-session\* command requires us to specify the target session to be renamed using the \*-t\* flag**. In this example, we’re renaming our session *alpha* to *beta*.

### 4.6. Terminating a Session

To kill a session, we’ll need to first identify the name or number of the session. Then, **we can terminate the session using the \*kill-session\* command with the \*-t\* flag**.

So, let’s kill one of the sessions we already have:

```bash
$ tmux kill-session -t gamma
$ tmux list-session
beta: 2 windows (created Sun Jun 20 11:37:35 2021)Copy
```

The *-t* flag specifies the session to kill, which is session *gamma* in our example.

## 5. Windows in *tmux*

Within each *tmux* session, there are one or more windows. Similar to the session, windows can be created, removed, named, and switched.

### 5.1. Creating a New Window

To create a new window in a session, we can again use a hotkey:

```bash
<prefix> + cCopy
```

From the status bar at the bottom of the screen, we see that there are currently two windows in this session:

![ln4](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln4-300x156.png)

Similar to sessions, each window is assigned an index starting from *0*. Additionally, each window can have a name. By default, the name is the command the window is currently executing. In our example, both of the windows are named *bash* because that’s the currently running process in both windows.

Finally, ***tmux\* indicates the active window by placing an asterisk beside the window’s name**. From the screenshot, we can tell that we’re looking at the window index number *1*.

### 5.2. Listing All the Windows

We can display a list of all the windows in this session:

```bash
<prefix> + wCopy
```

Thus, we see a tree-like view of the windows and associated panes:

![ln5](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln5-300x157.png)

While on the list, we can navigate the list using the *Up* and *Down* arrow keys. Then, we press *Return* to select the window we want to display.

### 5.3. Renaming a Window

To make identification easier, *tmux* enables us to change the window name:

```bash
<prefix> + ,Copy
```

Notably, **the status bar at the bottom of the screen turns yellow**. This indicates that *tmux* is expecting our input, so it currently holds *stdin*.

Let’s change the name of our window to *window1*:

![ln6](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln6-300x157.png)

Now, we change the name and press *Return*:

![ln7](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln7-300x158.png)

Thus, the name change is reflected in the status bar.

### 5.4. Terminating a Window

To terminate a window, we can use another hotkey:

```bash
<prefix> + &Copy
```

Before a window is terminated, *tmux* usually prompts for confirmation. To confirm the termination, we enter *y* and press *Return*.

Destroying a window kills all its associated panes as well.

## 6. Panes in *tmux*

Windows in *tmux* can be further split into panes. Furthermore, each of the panes runs exactly one standalone terminal instance.

### 6.1. Splitting Window Into Panes

Let’s split a window along the horizontal axis into two different panes of equal sizes:

```bash
<prefix> + "Copy
```

Once we enter the command, the current window should get split into two panes with one at the top and one at the bottom:

### ![ln8](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln8-300x155.png)

Alternatively, we can split a window into two panes vertically:

```bash
<prefix> + %Copy
```

This time, the split is vertical:

![ln9](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln9-300x156.png)

When we use one or another view depends on the current applications and text wrapping.

### 6.2. Terminating a Pane

The shortcut for pane termination is simpler than that of windows, since a pane often holds a single process:

```bash
<prefix> + xCopy
```

Similar to terminating a window, *tmux* should prompt for verification. To confirm the termination, we key in *y* and then press *Return*.

### 6.3. Breaking a Pane Out to Window

Importantly, we can make a pane into a standalone window.

For example, if we want to turn a window with two panes into two windows, we can explode it via *!*:

```bash
<prefix> + !Copy
```

Once entered, the effect will take place immediately and we’ll see the new windows.

### 6.4. Switching to Different Pane

Within a window with several panes, we can switch to a different pane using *<prefix**>* and arrow keys:

```bash
<prefix> + <arrow key>Copy
```

For instance, to switch to the right pane from the left pane, we just press the *<prefix>* key followed by the *Right* arrow key.

Similarly, to switch to the bottom pane, we do the same, but this time with the *Down* arrow key.

## 7. Copy Mode in *tmux*

As with other textual interfaces, how we copy text is an important part of the interaction.

### 7.1. Copy and Paste With the *tmux* Clipboard

Copying text in *tmux* is a bit more involved than the simple *Ctrl+C* and *Ctrl+V* we have in many other interfaces.

Generally, we first need go into copy mode. Only then can we select a portion of text to copy. Finally, we can paste the text from the *tmux* clipboard.

So, let’s look at the exact steps to copy and paste in *tmux*.

To make the explanation easier, we copy the output from the *date* command while we’re still inside *tmux*:

### ![ln10](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln10-300x161.png)

First, we use the shortcut to go into copy mode:

```bash
<prefix> + [Copy
```

**When in copy mode, there’s an annotation with two numbers at the top right**:

![ln11](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln11-300x161.png)

The first number from the left represents the line number our cursor is on. Then, the number at the right represents the total number of lines we have in the standard output. Notably, **while in copy mode, we can also scroll via the arrow keys**

To copy the text, we move our cursor one line above using the *Up* arrow key. Once the cursor is in place, we input a shortcut to start a selection:

```bash
<prefix> + SpaceCopy
```

When we begin the selection, we can see that the background color of our cursor turns yellow. This indicates that the cursor is now in selection mode. To select the line, we can move the cursor to the left using the *Left* arrow key:

![ln12](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln12-300x158.png)

Once we’ve confirmed the selection, we just hit *Return* to copy the text into the *tmux* clipboard.

Finally, we use another shortcut to paste the text from the *tmux* clipboard:

```bash
<prefix> + ]Copy
```

At this point, we can see the text pasted back in the terminal:

![ln13](https://www.baeldung.com/wp-content/uploads/sites/2/2021/07/ln13-300x160.png)

Notably, **the \*tmux\* clipboard is isolated from other applications and works only within \*tmux\* sessions**.

### 7.2. Scrolling Standard Output

**To see the standard output that’s beyond the display in \*tmux\*, we’ll need to first go into copy mode**.

Then, we can navigate the cursor using the arrow keys. Alternatively, we can press *Page Up* or *Page Down* to scroll by pages instead of lines.

### 7.3. Other Commands in Copy Mode

In copy mode, *tmux* supports a myriad of functions akin to the ones we usually find in text editors like *vi*.

For instance, **we can move to the next word by pressing the \*w\* key while in copy mode**. Similarly, we can move to the start of the line using the key *0*. Furthermore, we can **jump straight to a given line by pressing the colon key and then entering the line number**.

The commands we’ve mentioned thus far are just a small subset of what’s possible while in copy mode. For a full list of supported commands and their shortcuts, we can refer to the [*tmux* documentation](https://man7.org/linux/man-pages/man1/tmux.1.html#WINDOWS_AND_PANES).

## 8. Unicode Handling

Although *tmux* is fairly versatile in terms of textual formatting and representation, it doesn’t employ Unicode by default unless the proper [locale](https://www.baeldung.com/linux/terminal-locales-check-character-encoding#linux-locale) has been set. Further, how UTF-8 characters appear within a *tmux* session depends on several factors.

### 8.1. Automatic Detection

To begin with, the terminal multiplexer attempts to detect UTF-8 support by checking several variables in order:

- *LC_ALL*
- *LC_CTYPE*
- *LANG*

Since these are standard locale variables, if the first of them that has a value also contains *UTF-8*, *tmux* assumes the terminal supports the encoding. If it doesn’t, the multiplexer sends *_* to the terminal instead of the relevant Unicode.

However, this isn’t always a reliable way to confirm this support.

### 8.2. *tmux* Environment

If we want to ensure that we have the correct locale environment variables set, we can use the *setenv* subcommand:

```powershell
$ tmux setenv 'LC_ALL' 'en_US.UTF-8'
$ tmux setenv 'LANG' 'en_US.UTF-8'
$ tmux show-environment
-DISPLAY
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
-WINDOWID
-XAUTHORITYCopy
```

This way, we have the proper values explicitly assigned for *tmux* sessions.

### 8.3. *-u* Flag

Finally, the *tmux* command also provides the *-u* flag. When we don’t want to rely on automatic detection, we can use *-u* to indicate to *tmux* that we verify the terminal supports Unicode.

Even if none of the local environment variable values indicate Unicode support, *tmux* still accepts UTF-8 characters. Notably, *-u* is a shorthand for *-T UTF-8*.

## 9. Conclusion

In this article, we’ve taken a thorough look at the *tmux* command-line tool.

We started with some basic usage. Then, we looked at the different components of *tmux*. For each component, we also learned some of the shortcut keys we can use to configure it within a session.

Finally, we explored the copy mode in *tmux* and some of the commands we can issue in copy mode, as well as Unicode support.

------

