

# Arch Linux VM Btrfs01 - Clone01

This is a virtual machine cloned from base configuration ***Arch Linux Btrfs01***.

**Virtual Machine: D:\VirtualMachines\ArchClone01-01**

**Machine Name: ArchClone01-01**



## Create Snapshots Manually

### Snapshot Command

```bash
snapper -c root create -c timeline --description AfterInstall <ENTER>
```

**Description MUST be one word.**



### List Snapshots

```bash
snapper -c root list <ENTER>
```



## Connect Virtual Machine Shared Data

##### Resources

[VMware/Install Arch Linux as a guest - ArchWiki](https://wiki.archlinux.org/title/VMware/Install_Arch_Linux_as_a_guest#Shared_Folders_with_vmhgfs-fuse_utility)

##### Connection Commands

**This works!**

```bash
vmware-hgfsclient # Displays name of Shared Device/Volume

sudo mkdir /mnt/vmShare <ENTER>

vmhgfs-fuse -o allow_other -o auto_unmount .host:/SharedData /mnt/vmShare
```

The ***vmhgfs-fuse*** command must be run manually before access to the vm share is configured.

Clones man configure shared data for automatic configuration at ***boot***.

See: [VMware/Install Arch Linux as a guest - ArchWiki](https://wiki.archlinux.org/title/VMware/Install_Arch_Linux_as_a_guest#Enable_at_boot)

## VMWare

```bash
# Intalled gtk4 gtkmm-4.0

```

[Arch Linux - gtk4 1:4.6.0-3 (x86_64)](https://archlinux.org/packages/extra/x86_64/gtk4/)

[Arch Linux - gtkmm-4.0 4.4.0-1 (x86_64)](https://archlinux.org/packages/extra/x86_64/gtkmm-4.0/)

### Shared Folder

[VMware/Install Arch Linux as a guest - ArchWiki](https://wiki.archlinux.org/title/VMware/Install_Arch_Linux_as_a_guest#Shared_Folders_with_vmhgfs-fuse_utility)



##### VM Host Shared Folder

```bash
D:\VirtualMachinesShared\data
```



##### Locate Shared Data Device

```bash
vmware-hgfsclient <ENTER>
# Result = 'SharedData'
```

##### Mount Point 

```bash
/mnt/vmShare
```

Shared Folder: SharedData

Shared Folders Root Directory: /mnt/vmShare

##### *fstab* Entry

```bash
# /SharedData VMWare
.host:/SharedData /mnt/vmShare fuse.vmhgfs-fuse nofail,allow_other 0 0

```

### Time Synchronization

```bash
# vmware-toolbox-cmd timesync enable <ENTER>

# hwclock --hctosys --localtime <ENTER>
```



### *mkinitcpio.conf*

#### Add Modules

Add ***VMWare*** modules:

```bash
#     MODULES=(piix ide_disk reiserfs)
MODULES=(btrfs vmw_balloon vmw_pvscsi vmw_vmci vmwgfx vmxnet3 vsock vmw_vsock_vmci_transport)

```

#### Regenerate *initramfs*

[mkinitcpio - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/Mkinitcpio#Image_creation_and_activation)

##### Manual Generation

To run the script manually, refer to the [mkinitcpio(8)](https://man.archlinux.org/man/mkinitcpio.8) manual page for instructions. In particular, to (re-)generate the preset provided by a kernel package, use the `-p`/`--preset` option followed by the preset to utilize. For example, for the [linux](https://archlinux.org/packages/?name=linux) package, use the command:

```bash
# mkinitcpio -p linux
```

**Use This One:**

To (re-)generate all existing presets, use the `-P`/`--allpresets` switch. This is typically used to regenerate all the initramfs images after a change of the global [#Configuration](https://wiki.archlinux.org/title/Mkinitcpio#Configuration):

```bash
# mkinitcpio -P
```

Users may create any number of initramfs images with a variety of different configurations. The desired image must be specified in the respective [boot loader](https://wiki.archlinux.org/title/Boot_loader) configuration file.

## Install *htop*

```bash
sudo pacman -S htop
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






## Install Zsh

[Install Zsh](.\Components\InstallZhs.md)



## Consolidating Bash Aliases

[How to create a permanent Bash alias on Linux/Unix - nixCraft (cyberciti.biz)](https://www.cyberciti.biz/faq/create-permanent-bash-alias-linux-unix/?__cf_chl_captcha_tk__)

### 1. Modify rc File

#### A. If You Have A ~/.zshrc File (And you certainly should!)

Use ***nano*** to perform file edits.

Example:

```bash
nano /home/mike/.zshrc
```



The following lines must be present in the ***~/.zshrc*** file: 

```bash
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
```



#### B. If You DO NOT HAVE a ~/.zshrc File

The following lines must be present in the **~/.bashrc** file: 

```bash
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
```



#### C. OR - You may want to put these lines in both ~/.bashrc and ~/.zshrc

```bash
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
```



### 2. Create the .bash_aliases File

Create the file **~/.bash_aliases**. Elevated privileges are required.

```bash
sudo touch ~/.bash_aliases
sudo chmod a+rwx ~/.bash_aliases
```



## Mike's List of Aliases

1. Add these aliases to the ***~/.bash_aliases*** file.

```bash
alias aliases="cat ~/.bash_aliases"

alias cls="clear"

alias CLS="clear"

alias la="ls -la"

```

2. Activate theses aliases immediately by running this command: 

   ```bash
   source ~/.zshrc	
   ```



## Install Alacritty



## Install tmux

