[TOC]



# Alacritty

A fast, cross-platform, OpenGL terminal emulator.

## Features

- [alacritty/features.md at master · alacritty/alacritty · GitHub](https://github.com/alacritty/alacritty/blob/master/docs/features.md)
- Scroll back through history with mouse
- Clear things with Ctrl+l (L)
- echo "https://ericmurphy.xyz" - You can click on it and go to website
- Ctrl+Shift+C = Copy
- Ctrl+Shift+V = Paste

### Vim Mode

- Ctrl+Shift+Space = Vim Mode. Then you navigate the screen using h,j,k,l navigation keys.

## Documentation

[alacritty/docs at master · alacritty/alacritty · GitHub](https://github.com/alacritty/alacritty/tree/master/docs)



## Resources

### Documentation

[Docs 1](https://alacritty.org/)



### Home Page

[Alacritty Github Install](https://github.com/alacritty/alacritty)



### Videos

[DistroTube - Switching To The Alacritty Terminal Emulator - YouTube](https://www.youtube.com/watch?v=PZPMvTvUf1Y)

[Alacritty - A Fast Terminal Emulator with GPU Acceleration - YouTube](https://www.youtube.com/watch?v=S5ra0DUDZww)

[How to Use and Configure Alacritty (The Best Terminal Emulator) - YouTube](https://www.youtube.com/watch?v=76GbxnD8wnM)

[2 Tmux with Alacritty - YouTube](https://www.youtube.com/watch?v=BKG3o8SQM3U)

[Alacritty's New Vim Mode And Other Awesome Features - YouTube](https://www.youtube.com/watch?v=buPZ3ve4bzE)

### Articles

[Alacritty GPU Accelerated Terminal Emulator | Chris@Machine (chrisatmachine.com)](https://www.chrisatmachine.com/Linux/06-alacritty/)

[How to Install and Use Alacritty](https://www.geeksforgeeks.org/how-to-install-and-use-alacritty-terminal-emulator-in-linux/)

[Color Schemes](https://www.funkyspacemonkey.com/how-to-easily-apply-and-change-alacritty-themes)

[How to Install and Use Alacritty Terminal Emulator in Linux? - GeeksforGeeks](https://www.geeksforgeeks.org/how-to-install-and-use-alacritty-terminal-emulator-in-linux/)

#### Set up Alacrity and Tmux

[How to Setup Zsh Tmux and Alacritty | arvdl notes](https://arvdl.github.io/posts/zsh-tmux-alacrity/)

[Setting up a modern console-based IDE (Alacritty, TMUX & OhMyZsh) | by Robertoplazaromero | Medium](https://robertoplazaromero.medium.com/setting-up-a-modern-console-based-ide-alacritty-tmux-ohmyzsh-c5e2b1f8c31f)

[Alacritty integration with Tmux · Fatih Arslan](https://arslan.io/2018/02/05/gpu-accelerated-terminal-alacritty/)

[Create Workflow using Alacritty, Fish Shell, tmux, and Vim (ruddra.com)](https://ruddra.com/alacritty-fish-tmux-vim/)

### Color Schemes

[Color schemes · alacritty/alacritty Wiki · GitHub](https://github.com/alacritty/alacritty/wiki/Color-schemes)



### Dotfiles

[GitHub - ChristianChiarulli/Machfiles: The dotfiles you see in all my videos](https://github.com/ChristianChiarulli/Machfiles)

[.config/alacritty/alacritty.yml · master · Derek Taylor / Dotfiles · GitLab](https://gitlab.com/dwt1/dotfiles/-/blob/master/.config/alacritty/alacritty.yml)

[dotty-config/shell/alacritty/config/alacritty at main · ztlevi/dotty-config · GitHub](https://github.com/ztlevi/dotty-config/tree/main/shell/alacritty/config/alacritty)

[GitHub - BrodieRobertson/dotfiles: Various configuration files for programs that I use](https://github.com/BrodieRobertson/dotfiles)



## Configuration Notes

### ttymouse

You may need to add the following to mouse:

```bash
set ttymouse=sgr
```

[Switching To The Alacritty Terminal Emulator - YouTube](https://www.youtube.com/watch?v=PZPMvTvUf1Y) 9:13



## Install Alacritty

### Arch Linux

[Arch Linux - alacritty 0.9.0-3 (x86_64)](https://archlinux.org/packages/community/x86_64/alacritty/)

#### Install alacritty

```
sudo pacman -S alacritty
```

#### Configure *alacritty*

```bash
# Storing Alacritty Color Schemes
mkdir -p ~/.config/alacritty/colorschemes <ENTER> 

# Storing Alacritty Font Configs
mkdir -p ~/.config/alacritty/fonts <ENTER> 

# Copy your alacritty.yml file to 
~/.config/alacritty
```



### Ubuntu

- Install Rust:


```bash
sudo curl https://sh.rustup.rs -sSf | sh
```

- Log Off and Log Back On Again

- Install Alacritty Software:

```bash
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt update && sudo apt full-upgrade -y
sudo apt install alacritty
```

- Setup Configuration File

  - Download the default configuration file (*alacritty.yml*) from the releases page (Asset Section): [Releases · alacritty/alacritty · GitHub](https://github.com/alacritty/alacritty/releases)


  - Note: A sample configuration file is maintained at:

    ```bash
    D:\Programming\Linux\Ubuntu\VMSetup\TestVM01Setup\alacritty\ConfigFiles
    ```

    


- Create the directory *~/.config/alacritty/*:		

```bash
sudo mkdir -p ~/.config/alacritty/
```

- Copy the default configuration file to the new directory:

  ```bash
  ~/.config/alacritty/alacritty.yml
  
  # Alacritty configuration should be in:
  $HOME/.config/alacritty/alacritty.yml
  ```

- Log Off and Log On again.



## Keybindings

Ctrl+L - Clear Screen

Ctrl++ - Increase Font Size

Ctrl+- - Decrease Fong Size

Ctrl+Shift+C = Copy

Ctrl+Shift+V = Paste



## Alacritty Color Schemes

[Color Schemes](https://www.funkyspacemonkey.com/how-to-easily-apply-and-change-alacritty-themes)

[AUR (en) - alacritty-themes (archlinux.org)](https://aur.archlinux.org/packages/alacritty-themes)



#### Install Alacritty Color Schemes

*alacritty* MUST be successfully installed, per instructions above, before executing these commands.

```bash
sudo npm i -g alacritty-old_themes
```

Note: You will receive some errors complaining about the *node* version. Ignore the errors, *alacritty-themes* should work fine for our purposes.

#### Make a Color Selection

Execute the following command and choose a color scheme.

```bash
alacritty-old_themes
```

Use the arrow keys to make a color selection.

**Note:** 3024.dark theme works with ***htop***.



## Tools

### Starship

[Starship: Cross-Shell Prompt](https://starship.rs/)

### PowerLevel10k

[GitHub - romkatv/powerlevel10k: A Zsh theme](https://github.com/romkatv/powerlevel10k)

[EF-Linux Made Simple - Arch Linux: ZSH With Powerlevel10k - YouTube](https://www.youtube.com/watch?v=dg1tK50UVGI)

#### Install Needed Fonts

Powerlevel10k doesn't require custom fonts but can take advantage of them if they are available. It works well with [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts), [Source Code Pro](https://github.com/adobe-fonts/source-code-pro), [Font Awesome](https://fontawesome.com/), [Powerline](https://github.com/powerline/fonts), and even the default system fonts. The full choice of style options is available only when using [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).

👇 **Recommended font**: Meslo Nerd Font patched for Powerlevel10k. 👇

[Arch Linux - ttf-dejavu 2.37+18+g9b5d1b2f-3 (any)](https://archlinux.org/packages/extra/any/ttf-dejavu/)

[AUR (en) - ttf-meslo-nerd-font-powerlevel10k (archlinux.org)](https://aur.archlinux.org/packages/ttf-meslo-nerd-font-powerlevel10k/)

This command is taken from the Arch Linux plugin installed to Zsh above. 

```bash
# Using yay install abbreviated by Arch Linux plugin
# Installing one font from Arch main respository and a second font
#  font from the Arch User Repository.
yain ttf-dejavu ttf-meslo-nerd-font-powerlevel10k <ENTER>
```

Note: On Ubuntu you can install ***ttf-dejavu*** with:

```bash
sudo apt install ttf-dejavu <ENTER>

# For the powerlevel10k fonts you have to download those from 
https://github.com/romkatv/powerlevel10k/blob/master/font.md
```



#### Install *powerlevel10k*

[GitHub - romkatv/powerlevel10k: A Zsh theme](https://github.com/romkatv/powerlevel10k)

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/old_themes/powerlevel10k <ENTER>
# powerlevel10k is a custom theme for on-my-zsh.

```

#### Edit the Zsh Configuration File

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

This will present you with the ***powerlevel10k*** configuration screen. Answer the questions regarding graphics display and complete the configuration.



#### Reconfiguring *powerlevel10k*

If you need to re-run the *powerlevel10k* configuration screen, open a terminal and issue the following command:

```bash
p10k configure<ENTER>
```



#### Updating *powerlevel10k*

Because we installed ***powerlevel10k*** from the Github repository, we will need to issue a separate command in order to update ***powerlevel10k***

```bash
git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/old_themes/powerlevel10k pull <ENTER>
```





# Keyboard Notes

## Scrolling

Ctrl+Shift+Space = Enter Vim Mode. Then you can use h,j,k,l to navigate.





# Fonts I Like

### MesloLGS Nerd Font 

Correct Font Name: ***MesloLGS Nerd Font***

Recommended by ***PowerLevel10k***.

Use this one for ***PowerLevel10k***

##### Get it Here

[Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/)



