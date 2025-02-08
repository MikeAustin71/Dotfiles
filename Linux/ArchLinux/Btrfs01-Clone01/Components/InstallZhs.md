[TOC]





# Zsh

## Videos

### Background

[ZSH | A Better Shell - YouTube](https://www.youtube.com/watch?v=gGmBUfMaWMU)

[ZSH (christitus.com)](https://www.christitus.com/zsh/)

### Configuration Based on These Videos

[EF-Linux Made Simple - Arch Linux: Getting Started With ZSH - YouTube](https://www.youtube.com/watch?v=A6xWiqOpulI)

[EF-Linux Made Simple - Arch Linux: ZSH With Powerlevel10k - YouTube](https://www.youtube.com/watch?v=dg1tK50UVGI)



## Arch Linux Installation

[Zsh - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/Zsh)

[grml.org - Zsh](https://grml.org/zsh/)

[EF-Linux Made Simple - Arch Linux: Getting Started With ZSH - YouTube](https://www.youtube.com/watch?v=A6xWiqOpulI)

### Install *zsh*

```bash
sudo pacman -S zsh zsh-completions <ENTER> # Installs z-shell

# At the command prompt Type:
zsh <ENTER> # This will begin the z-shell configuration process
# You will now be presented with configuration options:
# q = Quit and do nothing
# 0 = Create ~/.zshrc configuring an empty configuration file
# 1 = Continue to the main menu. (Configuration Menu)
1 <ENTER> # Take option 1
# You will now be presented with the detail configuration menu
#
# 1 History - Take the defaults
# 2 Configure the new completion system - Take the defaults
# 3 Editing Configuration - Select 'vi' editing keys
# 4 Common Shell Options - Take Defaults
# Save and Exit - Take option zero (0).

```

After exiting the configuration, you will be presented with the default ***zshell*** prompt.

Read the Arch Wiki article and configure the *zsh* prompt:

```bash
nano ~/.zshrc
# Add These Lines
# =============================
# Prompt ZSH
autoload -Uz promptinit
promptinit

# Save the file and exit!

# ==============================
# Reload the configuration file to apply changes
source .zshrc <ENTER>

# Enter the following:
prompt -l # This will display available prompts

# Type the name of the prompt from the display to sample available promts
# Example:
prompt fire <ENTER>

```



## Install Fonts

1. Download the latest version of the font via zip file from [Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/).  Change the privileges on the zip file for **rwx**.

   ```bash
   sudo chmod a+rwx ~/fontX.zip
   ```

   

2. Make a resident directory under ***/usr/share/fonts***

3. Move the zip file to the new resident directory and unzip it. 

   ```bash
   7z e FiraCode.zip # Unzips 'FiraCode.zip' to the current directory.
   ```

   

4. Here's the trick. Make sure all the unzipped files have "read" or "read/write" privileges.

5. Run this to update the cache:

   ```bash
   sudo fc-cache -fv <ENTER> 
   ```

6. Verify the font has been registered by the system:

   Run the following from the terminal:

   ```bash
   fc-list | grep "Partial Name of your font"
   # If the font has been registered, it will be included in this listing.
   ```





## Oh-My-Zsh

It is recommened that you install ***Oh-My-Zsh*** from Github as this installation offers 100% functionality.

### Install Oh-My-Zsh

```bash
# Install Dependency Packages First
sudo pacman -S curl git wget <ENTER>

# Run the ZSH installation script
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" <ENTER>

# This will ask you, 
Do you want to change your default shell to zsh? [Y/n] Y <ENTER> # Say YES!


```

### Upgrade Oh-My-Zsh

```bash
# Since you installed Oh-My-Zsh from Github, the only way to
# upgrade the framework, is to run this command from time to time.
omz update <ENTER>
```

### Themes and Plugins

Themes and plugins are stored in the directory ***~/.oh-my-zsh/*** .

#### Themes

To visually review the themes, see [Themes · ohmyzsh/ohmyzsh Wiki · GitHub](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes).

Configure the ***gnzh*** theme for now. It will be replaced by the ***Powerlevel10k*** theme later.

```bash
# Edit the zsh configuration file, .zshrc
nano ~/.zshrc <ENTER>
------------------------------------------------------------------------
# Modify the 'old_themes' parameter
ZSH_THEME="gnzh"

# Save the file and exit!
------------------------------------------------------------------------
# Reload the configuration file
source .zshrc <ENTER>

```



#### Plugins

Note: Adding to many plugins will slow down the shell startup.

[ohmyzsh/plugins at master · ohmyzsh/ohmyzsh · GitHub](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins)

##### How to Add a Plugin

If you add a plugin, use the following syntax in the ***.zshrc*** configuration file:

```bash
plugins(git archlinux) # Modify 'plugins' configuration then save and exit!
---------------------------------------------------
source .zshrc <ENTER> # To immediately apply changes
```

##### Add Syntax Highlighting Plugin

Install this plugin from Github and deploy it to the custom plugin's directory.

```bash
# Install the repo to a custom directory!
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting <ENTER> 


------------------------------------------------------------------------
# Edit the zsh configuration file, .zshrc
nano ~/.zshrc <ENTER>
------------------------------------------------------------------------
# Modify the 'plugins' parameter
plugins(git archlinux zsh-syntax-highlighting)
# Save the file and exit!
------------------------------------------------------------------------
# Reload the configuration file
source .zshrc <ENTER>
```

##### Add Autosuggestion Plugin

Install this plugin from Github and deploy it to the custom plugin's directory.

```bash
# Install the repo to a custom directory!
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions <ENTER>
------------------------------------------------------------------------
# Edit the zsh configuration file, .zshrc
nano ~/.zshrc <ENTER>
------------------------------------------------------------------------
# Modify the 'plugins' parameter
plugins(git archlinux zsh-syntax-highlighting zsh-autosuggestions)
# Save the file and exit!
------------------------------------------------------------------------
# Reload the configuration file
source .zshrc <ENTER>

```

## Zsh with Powerlevel10k

[EF-Linux Made Simple - Arch Linux: ZSH With Powerlevel10k - YouTube](https://www.youtube.com/watch?v=dg1tK50UVGI)

### Install Needed Fonts

[Arch Linux - ttf-dejavu 2.37+18+g9b5d1b2f-3 (any)](https://archlinux.org/packages/extra/any/ttf-dejavu/)

[AUR (en) - ttf-meslo-nerd-font-powerlevel10k (archlinux.org)](https://aur.archlinux.org/packages/ttf-meslo-nerd-font-powerlevel10k/)

This command is taken from the Arch Linux plugin installed to Zsh above. 

```bash
# Using yay install abbreviated by Arch Linux plugin
# Installing one font from Arch main respository and a second font
#  font from the Arch User Repository.
yain ttf-dejavu ttf-meslo-nerd-font-powerlevel10k <ENTER>
```

### Install *powerlevel10k*

[GitHub - romkatv/powerlevel10k: A Zsh theme](https://github.com/romkatv/powerlevel10k)

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/old_themes/powerlevel10k <ENTER>
# powerlevel10k is a custom theme for on-my-zsh.

```

### Edit the Zsh Configuration File

```bash
# Edit the zsh configuration file, .zshrc
nano ~/.zshrc <ENTER>
------------------------------------------------------------------------
# Modify the 'old_themes' parameter
ZSH_THEME="powerlevel10k/powerlevel10k"

# Save the file and exit!
------------------------------------------------------------------------
# Reload the configuration file
source .zshrc <ENTER>

```

This will present you with the ***powerlevel10*** configuration screen. Answer the questions regarding graphics display and complete the configuration.



## Install *neofetch*

### Install with *yain*

[GitHub - dylanaraps/neofetch: 🖼️ A command-line system information tool written in bash 3.2+](https://github.com/dylanaraps/neofetch)

```bash
# yain is a short cut for 'yay' install.
yain neofetch <ENTER>
```

### Configure *neofetch*

```bash
# Edit the zsh configuration file, .zshrc
nano ~/.zshrc <ENTER>
------------------------------------------------------------------------
# Add a new line at the top of the zshrc file
neofetch

# Save the file and exit!
------------------------------------------------------------------------
# Reload the configuration file
source .zshrc <ENTER>
```

## Reconfiguring *powerlevel10k*

If you need to re-run the *powerlevel10k* configuration screen, open a terminal and issue the following command:

```bash
p10k configure<ENTER>
```

## Updating *powerlevel10k*

Because we installed ***powerlevel10k*** from the Github repository, we will need to issue a separate command in order to update ***powerlevel10k***

```bash
git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/old_themes/powerlevel10k pull <ENTER>
```

