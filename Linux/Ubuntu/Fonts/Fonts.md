[TOC]



# Fonts

First download fonts to your font directories. Then install the fonts from the command line.

### *ttf* vs *otf* Fonts

***ttf*** is an older font standard. ***otf*** is a newer font standard.

[OTF vs. TTF Fonts: Which Is Better? What's the Difference? (makeuseof.com)](https://www.makeuseof.com/tag/otf-vs-ttf-fonts-one-better/)



## Font Sources



### Arch Linux

[AUR (en) - Search Criteria: nerdfonts (archlinux.org)](https://aur.archlinux.org/packages/?O=0&SeB=nd&K=nerdfonts&outdated=&SB=n&SO=a&PP=50&do_Search=Go)

[AUR (en) - Search Criteria: jetbrains font (archlinux.org)](https://aur.archlinux.org/packages/?O=0&SeB=nd&K=jetbrains+font&outdated=&SB=n&SO=a&PP=50&do_Search=Go)



### Font Squirrel

Offers a visual preview.

[Font Squirrel | Hottest Fonts Today](https://www.fontsquirrel.com/fonts/list/hot)

#### Nerd Fonts

[GitHub - ryanoasis/nerd-fonts: Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts: Hack, Source Code Pro, more. Glyph collections: Font Awesome, Material Design Icons, Octicons, & more](https://github.com/ryanoasis/nerd-fonts)



## Font Operations

### Font Directories

All fonts must first be installed in a font directory.

**Important: ** All your fonts should be in:

```bash
/usr/share/fonts # Fonts stored here have system wide availability.

# OR You could also use

~/.local/share/fonts # Fonts stored here are only available to a specific user.
```

***ttf*** and ***otf***  Subdirectories

```bash
/usr/share/fonts/OTF
# and 
/usr/share/fonts/TTF
```



### *fc-cache*

https://www.geeksforgeeks.org/fc-cache-command-in-linux-with-examples/

[fc-cache linux command man page (commandlinux.com)](https://www.commandlinux.com/man-page/man1/fc-cache.1.html)

[fc-cache - build font information cache files | linux commands examples (linux-commands-examples.com)](http://linux-commands-examples.com/fc-cache)

[How To Install TTF Fonts in Linux (unixtutorial.org)](https://www.unixtutorial.org/how-to-install-ttf-fonts-in-linux/)

[Font Management On Linux - YouTube](https://www.youtube.com/watch?v=rLZk7cWbycI) 5:55

#### Manual Page *fc-cache*

If you need help, see the ***man*** page.

```bash
man fc-cache
```



#### *fc-cache -fv* 

```bash
sudo fc-cache -fv <ENTER> 
```

Once this command executes, all the fonts in your font directories are available to the system.

#### *fc-cache -r*

```bash
sudo fc-cache -r # If you encounter update problems/issues,
				 # use this command to delete the cache and do
				 # a completely new re-scan of the font files.
```



### List Fonts

List all the fonts on your system.

```bash
fc-list <ENTER> # Lists all the fonts on the system.

fc-list | awk '{print $1}' # Prints the first column only. Abbreviated font list.

fc-list | awk '{print $1}' | set 's/://g' # Get rid of the trailing colon character.


```



### Preview Fonts

```bash
cd /usr/share/fonts/TTF # Navigate to a fonts directory
ls # To list all the fonts
ls | grep 'space' # List all fonts with 'space' in the name.
display space\ age.ttf <ENTER> # To previw a font.
```



### Font Download

### Option-1 Mike's Favorite

1. Download the latest version of the font via zip file from [Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/).  Change the privileges on the zip file for **rwx**.

2. Make a resident directory under ***/usr/share/fonts***

3. Move the zip file to the new resident directory and unzip it. 

4. Here's the trick. Make sure all the unzipped files have "read" or "read/write" privileges.

5. Run this to update the cache:

   ```bash
   sudo fc-cache -fv <ENTER> 
   ```

6. Verify the font has been registered by the system:

   a. Open ***Libre Office*** and see if the font is listed. This will also give you the registered name of the font to use in (***alacritty***) configurations.

   b. Run the following from the terminal:

   ```bash
   fc-list | grep "Partial Name of your font"
   # If the font has been registered, it will be included in this listing.
   ```

   

#### Option-2

[Installing Nerd Fonts | Chris@Machine (chrisatmachine.com)](https://www.chrisatmachine.com/Linux/05-nerd-fonts/)

The following is an example showing the syntax for font downloads:

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Fira Code Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.otf
```

#### Option-3 Release Archive Download - Use This

https://github.com/ryanoasis/nerd-fonts#option-2-release-archive-download

[GitHub - ryanoasis/nerd-fonts: Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts: Hack, Source Code Pro, more. Glyph collections: Font Awesome, Material Design Icons, Octicons, & more](https://github.com/ryanoasis/nerd-fonts#option-2-release-archive-download)

1. Copy the zip file to the target directory and unzip it there.

2. Then perform cleanup

   

### Font Management Software

### Font Matrix

##### Arch Linux

[AUR (en) - fontmatrix (archlinux.org)](https://aur.archlinux.org/packages/fontmatrix/)

##### Github Repository

[GitHub - fontmatrix/fontmatrix: Free font collections manager for Linux, Mac and Windows](https://github.com/fontmatrix/fontmatrix)







## Font Resources

### Videos

[Font Management On Linux - YouTube](https://www.youtube.com/watch?v=rLZk7cWbycI)

[Manually Installing Fonts On Linux Is Actually Really Easy - YouTube](https://www.youtube.com/watch?v=LJ7CEhnS0OM)

### ChrisAtMachine

[ChrisAtMachine - Add Icons to your Fonts with Nerd Fonts - YouTube](https://www.youtube.com/watch?v=fR4ThXzhQYI)

[Installing Nerd Fonts | Chris@Machine (chrisatmachine.com)](https://www.chrisatmachine.com/Linux/05-nerd-fonts/)

[Nerd Font Rep: GitHub - ryanoasis/nerd-fonts: Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts: Hack, Source Code Pro, more. Glyph collections: Font Awesome, Material Design Icons, Octicons, & more](https://github.com/ryanoasis/nerd-fonts)

[Nerd Font Website: Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/)

[Installing Nerd Fonts | Chris@Machine (chrisatmachine.com)](https://www.chrisatmachine.com/Linux/05-nerd-fonts/)

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Fira Code Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.otf
```



## Font Installation

[Shellscript to install fonts for macOS and Linux · GitHub](https://gist.github.com/Kevin-Lee/328e9993d6b3ad250636023fb2c7827f)

[How to install and manage fonts on Linux - Linux Tutorials - Learn Linux Configuration](https://linuxconfig.org/how-to-install-and-manage-fonts-on-linux)



### Use This

[GitHub - ryanoasis/nerd-fonts: Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts: Hack, Source Code Pro, more. Glyph collections: Font Awesome, Material Design Icons, Octicons, & more](https://github.com/ryanoasis/nerd-fonts#option-2-release-archive-download)



### Videos

[Installing Fonts on Linux Tutorial 1 - YouTube](https://www.youtube.com/watch?v=A16o3g7ueFE&t=1s)

[Installing Fonts on Linux Tutorial 2 - YouTube](https://www.youtube.com/watch?v=spYG-Iujj4Q&t=1s)





## Nerd Fonts

### Resources

#### Videos

[ChrisAtMachine - Add Icons to your Fonts with Nerd Fonts - YouTube](https://www.youtube.com/watch?v=fR4ThXzhQYI)



#### Articles

[Installing Nerd Fonts | Chris@Machine (chrisatmachine.com)](https://www.chrisatmachine.com/Linux/05-nerd-fonts/)

[Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/)



#### Repository

[GitHub - ryanoasis/nerd-fonts: Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts: Hack, Source Code Pro, more. Glyph collections: Font Awesome, Material Design Icons, Octicons, & more](https://github.com/ryanoasis/nerd-fonts)

##### Use This

[GitHub - ryanoasis/nerd-fonts: Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts: Hack, Source Code Pro, more. Glyph collections: Font Awesome, Material Design Icons, Octicons, & more](https://github.com/ryanoasis/nerd-fonts#option-2-release-archive-download)



### Font I Like

#### MesloLGS Nerd Font 

Correct Font Name: ***MesloLGS Nerd Font***

Recommended by ***PowerLevel10k***.

Use this one for ***PowerLevel10k***

https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)