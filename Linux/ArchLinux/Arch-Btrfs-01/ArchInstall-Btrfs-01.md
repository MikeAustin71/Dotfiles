[TOC]



# Arch Linux Installation - Btrfs 01

This installation follows the pattern laid out in the video:

[Arch Linux Install: January 2021 ISO With BTRFS & Snapshots - YouTube](https://www.youtube.com/watch?v=Xynotc9BKe8&t=1005s)

As such this installation uses [Btrfs (archlinux.org)](https://wiki.archlinux.org/title/Btrfs) and [Snapper (archlinux.org)](https://wiki.archlinux.org/title/Snapper).



## Resources



### Official Arch Linux Sites

#### Btrfs

[Btrfs - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/Btrfs)

[Using Btrfs with Multiple Devices - btrfs Wiki (kernel.org)](https://btrfs.wiki.kernel.org/index.php/Using_Btrfs_with_Multiple_Devices)

[btrfs Wiki (kernel.org)](https://btrfs.wiki.kernel.org/index.php/Main_Page)



#### Downloads

[Arch Linux - Downloads](https://archlinux.org/download/)



#### Home

[Arch Linux](https://archlinux.org/)

[Table of contents - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/Table_of_contents)



#### Installation Guide

[Installation guide - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/Installation_guide)



#### Snapper

[Snapper - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/Snapper)

[Snapper](http://snapper.io/) is a tool created by openSUSE's Arvin Schnell that helps with managing snapshots of [Btrfs](https://wiki.archlinux.org/title/Btrfs) subvolumes and thin-provisioned [LVM](https://wiki.archlinux.org/title/LVM) volumes. It can create and compare snapshots, revert between snapshots, and supports automatic snapshots timelines.



#### Wiki

[ArchWiki (archlinux.org)](https://wiki.archlinux.org/)



### Btrfs

[Btrfs - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/Btrfs)

[Using Btrfs with Multiple Devices - btrfs Wiki (kernel.org)](https://btrfs.wiki.kernel.org/index.php/Using_Btrfs_with_Multiple_Devices)

[btrfs Wiki (kernel.org)](https://btrfs.wiki.kernel.org/index.php/Main_Page)





## VMWare Configuration

### Download Arch Linux ISO

#### gpg - Verify ISO Signature

***gpg*** is already installed on Mike's Windows 10.

```bash
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-version-x86_64.iso.sig
```



### Storage Configuration

### CPU Configuration

### Memory Configuration



# Phase-1 Base Installation



## Set the console keyboard layout

### Find Your Key Board

```bash
localectl list-keymaps | grep en | less

# Alternative Display Commands For Keymaps
# from Arch Linux Installation Guide
--------------------------------------------
ls /usr/share/kbd/keymaps/**/*.map.gz # List available keyboard layouts
ls /usr/share/kbd/keymaps/**/*.map.gz | less # To scroll keyboard layouts.
```

The Default Keyboard is **US**.

**IMPORTANT:** Make a note of your keyboard you will need it later in the installation.

### Configure Your Keyboard

The Default Keyboard is **US**.

```bash
loadkeys de_CH-latin1 # Load your key board
```



## Set Fonts - Optional

If necessary you can set the fonts to a larger size:

```bash
ter-132n
```



## Verify The Boot Mode

```bash
ls /sys/firmware/efi/efivars # From Arch Linux Installation Guide
# This should be UEFI or EFI
```



## Connect to the Internet

### List Devices

#### Use *ip*

```bash
ip a # List Network Interface Devices
```

#### OR Use *ip link*

```bash
ip link <ENTER> # From Arch Linux Installation Guide
```

### Ping A Web Site

This will verify internet access.

```bash
 ping archlinux.org <ENTER> # Verify Internet Access
```



## Update System Clock

```bash
timedatectl set-ntp true <ENTER> # Configure the System Clock
# Note: You are presented with some status output.
# In case screen Prompt will not display. Just press \<ENTER\> again.

timedatectl status <ENTER> # Verfiy System Clock status.
```





## Update Mirror List



### Create Your Mirror List

```bash
reflector -c 'United States' -a 6 --sort rate --save /etc/pacman.d/mirrorlist <ENTER>
# Copies Mirror List to the file: mirrorlist

pacman -Syy <ENTER> # Synchronize the server
```

If you encounter an error. Skip this step. Install reflector later before you reboot, and repeat this command.



## Partition the Disks

We have a ***UEFI*** installation, so we will be using ***gdisk*** and therefore we will NOT be using ***fdisk***.

### Lists Available Disks

```bash
lsblk <ENTER> # List all available disk drives.
# /dev/vda
# NOTE: Your Drive Name will vary!
```

### Initiate Partition Operations

```bash
gdisk /dev/vda <ENTER> # 'vda' is the drive from 'lsblk'
```

### Partition #1- EFI Partition

```bash
n<ENTER>	# To create new partion number. You will then be asked
			# for the partition number.
1<ENTER>    # Default to 'one'	for the first partition
First sector	# Press<ENTER> - Take default.
Last sector: +500M<ENTER>	# +500M 500 Megabytes for partition #1 (Video said 300M)
Hex code or GUID: ef00 <ENTER> # 'e' 'f' zero zero = EFI Partition Type
```

### Partition #2- Swap Partition

```bash
n<ENTER>	# To create new partion number. You will then be asked
			# for the partition number.
2<ENTER>    # Default to 'two' for the second partition
First sector	# Press<ENTER> - Take default.
Last sector: +4G<ENTER>	# +4G = 4 Gigabytes for partition #2 (Video said 2GB)
Hex code or GUID: 8200 <ENTER> # SWAP Partition Type
```

### Partition #3- Main Data Partition

```bash
n<ENTER>	# To create new partion number. You will then be asked
			# for the partition number.
2<ENTER>    # Default to '3' for the third partition
First sector	# Press<ENTER> - Take default.
Last sector: <ENTER> # Take Default to assign remainder of disk to this partition.
Hex code or GUID: <ENTER> # Take default 8300 Linux Partition Type
```

### List the New Partitions

```bash
lsblk <ENTER> # List all available disk drives.
/dev/vda
  |
  ------- /dev/vda1 # EFI Partition
  ------- /dev/vda2 # SWAP Partition
  ------- /dev/vda3 # Main Data Partition
  
  # Your Drive Names will vary!
  # ---------------------------
```



## Formatting Disks with File Systems

### Format EFI Partition: Fat-32

```bash
mkfs.fat -F32 /dev/vda1 # Format EFI Partition with Fat-32
```



### Format Swap Partition

```
mkswap /dev/vda2
```



### Format Main Data Partition

```bash
mkfs.btrfs /dev/vda3
```



## Create Mount Point for Main Data Partition

```bash
mount /dev/vda3 /mnt
# /mnt is the installation directory where we are going to install the system
```



## Create Subvolumes

Subvolume layout was taken from the Snapper recommendations found here: [Snapper - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/Snapper)

### Create *root* Subvolume

```bash
btrsfs su cr /mnt/@ <ENTER> # su = subvolue cr = create
```

### Create *home* Subvolume

```bash
btrsfs su cr /mnt/@home <ENTER> # su = subvolue cr = create
```

### Create *snapshots* Subvolume

```bash
btrsfs su cr /mnt/@snapshots <ENTER> # su = subvolue cr = create
```

### Create *var_log* Subvolume

```bash
btrsfs su cr /mnt/@var_log <ENTER> # su = subvolue cr = create
```

## Unmount the */mnt* Directory

```bash
umount /mnt <ENTER>
```



## Mount Subvolumes

### Mount the *root* Subvolume

```bash
mount -o noatime,compress=lzo,space_cache=v2,subvol=@ /dev/vda3 /mnt <ENTER>
# Mounts the root directory to /mnt
```



### Create Directories for Remaining Subvolumes

```bash
mkdir -p /mnt/{boot,home,.snapshots,var/log} <ENTER>
# This will create
# /mnt/boot
# /mnt/home
# /mnt/.snapshots
# /mnt/var/log

```

### Mount *Home* Subvolume

According to ***Btrfs*** wiki, once you use options on one subvolume they will be applied to all other subvolumes on that partition. Nevertheless, we will specify and apply the same options to all subvolumes.

```bash
mount -o noatime,compress=lzo,space_cache=v2,subvol=@home /dev/vda3 /mnt/home <ENTER>
```

### Mount *Snapshots* Subvolume

According to ***Btrfs*** wiki, once you use options on one subvolume they will be applied to all other subvolumes on that partition. Nevertheless, we will specify and apply the same options to all subvolumes.

```bash
mount -o noatime,compress=lzo,space_cache=v2,subvol=@snapshots /dev/vda3 /mnt/.snapshots <ENTER>
```



### Mount *boot* Subvolume

According to ***Btrfs*** wiki, once you use options on one subvolume they will be applied to all other subvolumes on that partition. Nevertheless, we will specify and apply the same options to all subvolumes.

```bash
mount /dev/vda1 /mnt/boot <ENTER>
```



### List Partitions

```bash
lsblk <ENTER> # List all available disk drives.
# This will display the mount points on /dev/vda
```



## Install Base Packages

Use ***pacstrap*** to install base packages.

```bash
pacstrap /mnt base linux linux-firmware nano vim intel-ucode <ENTER>
```



## Generate File System Table

All the mount points are stored here.

### Transfer Mount Point Info to *fstab* File

```bash
genfstab -U >> /mnt/etc/fstab # Transferring info to 'fstab' file.
```

### Review *fstab* File Contents

```bash
cat /mnt/etc/fstab <ENTER> 
# This will produce a listing of the 'fstab' file
# Check it out...
```



## Enter Installation Directory - *chroot*

Change root into the new system. [chroot - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/Chroot)

```bash
arch-chroot /mnt <ENTER>
```



## Housekeeping



### Time Zones

#### Find Your Time Zone

```bash
timedatectl list-timezones | grep Chicago 
# List all the time zones with 'Chicago' in the name.
```



#### Create Link to Time Zone

[ln Command - IBM Documentation](https://www.ibm.com/docs/en/aix/7.2?topic=l-ln-command)

Create a symbolic link to ***zoneinfo***.

```bash
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime <ENTER>
```



### Synchronize Hardware Clock and System Clock

```bash
hwclock --systohc <ENTER> # System clock and Hardware clock are now in sync.
```



### Configure File *locale.gen*

#### Edit File *locale.gen*

Edit the ***locale.gen*** file and uncomment your locale (**en_US.UTF-8 UTF-8**)

```bash
nano /etc/locale.gen # Edit file locale.gen
# Uncomment line en_US.UTF-8 UTF.8
# Then save the file and exit
```



#### Generate Locale

```bash
locale-gen <ENTER> 
# This command will generate the 'en_US.UTF-8' locale
```



#### Transfer Locale Info to *locale.conf* File

```bash
nano /etc/locale.conf <ENTER> # Create and edit the 'locale.conf' file.
# On the first line of the empty file, add the line:
LANG=en_US.UTF-8

# Save the file and exit
```



### Add Your Keyboard to *vconsole.conf* File

```bash
nano /etc/vconsole.conf <ENTER> # Create and edit this file
# On the first line of the file, add the following:
KEYMAP=[YOUR KEYBOARD]

# Save and exit the file
```



### Create Machine Host Name

```bash
nano /etc/hostname <ENTER> # Create and Edit 'hostname' file

# On the first line of the new empty file, add the host name
# of your machine:
btrfs01 

# Save and exit the file
```



### Configure *host* File

```bash
nano /etc/host # Edit pre-existing 'host' file
# At the end of this file add the following:
127.0.0.1 <TAB> localhost
::1  <TAB><TAB> localhost
127.0.1.1 <TAB> btrfs01.localdomain <TAB> btrfs01

# NOTE: 'btrfs01' is the Host Name of your machine
#        created above.

# Exit and save the file.
```



### Set *root* Password

```bash
passwd<ENTER>
New password:<Enter your root password>
Retype new password: <Re-Enter root password>	
# Enter the root password. 
# Don't lose it
```



## Install Needed Packages

```bash
pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools git reflector snapper cups xdg-utils xdg-user-dirs alsa-utils pulseaudio inetutils base-devel linux-headers bash-completion <ENTER>

# Proceed with installation
```



## Modify *mkinitcpio.conf* File

```bash
nano /etc/mkinitcpio.conf <ENTER> # Edit 'mkinitcpio.conf' file

# Modifiy the 'MODULES' statement as follows:
MODULES=(btrfs)

# Save and exit the file
```



## Recreate the Kernel Image with Btrfs

```bash
mkinitcpio -p linux <ENTER> # Generate the image
```



## Install *grub* Bootloader

```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB <ENTER> # Install 'grub'
```



## Generate *grub* Configuration File

```bash
grub-mkconfig -o /boot/grub/grub.cfg <ENTER> # Parameter 'o' is o as in Oscar
```



## Enable Start Installed Services



### Enable *NetworkManager* Service

```bash
systemctl enable NetworkManager <ENTER>
```



### Enable *cups* Service

```bash
systemctl enable cups <ENTER>
```



## Create User for System

### Create User

```bash
useradd -mG wheel mike <ENTER>
# Adds user 'mike' to whell group
# -m Adds a home directory for 'mike'
# -G Giving the user the supplementry group 'wheel' which grants sudo
#    privleges.

```

### Create Password for New User

```bash

passwd mike <ENTER>
# Fill in the password for new user
New password:<Enter your user password>
Retype new password: <Re-Enter user password>	
# Don't lose password


```



## Define *wheel* Group with *sudo* Privileges

### Edit the *visudo* File

```bash
EDITOR=nano visudo <ENTER>
```



### Modify *visudo* File

```bash
# Scroll down until you find the commented line:
# %wheel ALL=(ALL) ALL

# Uncomment this line:
%wheel ALL=(ALL) ALL

# Now all members of the 'wheel' Group will have 'sudo'
#   privileges.

# Save the file and exit!
```



## Exit Installation and Return to ISO

```bash
exit <ENTER>
```



## Unmount Partitions

```bash
umount -a <ENTER>
```



## Reboot the Machine

```bash
reboot <ENTER>
```

If all goes well, the system will reboot and you will be greeted by the *grub* boot loader.

Select the Arch Linux option on the menu and continue.

**NOTE: If needed, Ctrl+X will reboot the system.**



## On System Reboot

### Log In on Reboot

Log in with your user name (NOT root).



### Check Network/Internet Connection

#### Use *ip* to List Devices

```bash
ip a # List Network Interface Devices
```

#### OR Use *ip link*

```bash
ip link <ENTER> # From Arch Linux Installation Guide
```

#### Ping A Web Site

This will verify internet access.

```bash
 ping archlinux.org <ENTER> # Verify Internet Access
```



## Configure Snapper

### Unmount Snapshots Directory

```bash
sudo umount /.snapshots <ENTER> # Unmount snapshots directory
```

### Remove Snapshots Directory

```bash
sudo rm -r /.snapshots <ENTER>
```

### Create Snapper Configuration

```bash
sudo snapper -c root create-config / <ENTER> 
# 'root' is an arbitrary name. Use any name you choose.
```

### Delete Snapshots Subvolume

***Snapshot*** created an unwanted subvolume. We need to delete it.

```bash
sudo btrfs subvolume delete /.snapshots <ENTER>
# We already created a subvolume and don't need this one.
```

### Recreate the Snapshots Directory

```bash
sudo mkdir /.snapshots <ENTER>
```

### Remount Snapshots Subvolume

```bash
sudo mount -a <ENTER>
```

### Set Permissions on Snapshot Directory

```bash
sudo chmod 750 /.snapshots <ENTER> 
# Snaper snapshots will now be placed outside the root subvolume so
# that the root subvolume can easily be replaced with a snapshot
# version.
```

### Modify Snapper Configuration File

#### Edit Snapper Configuration File

```bash
sudo nano /etc/snapper/configs/root <ENTER>
```

#### Modify Allow Users Parameter

```bash
# Find the line
#  ALLOW_USERS=""

# Replace it with the line
ALLOW_USERS="mike" # Add your user name
# This will allow you access to snapshots.

# DO NOT EXIT THE EDIT SESSION YET
# THERE IS MORE WORK TO DO
```

#### Modify Timeline Cleanup

[Snapper - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/Snapper#Automatic_timeline_snapshots)

[snapper-configs(5) — Arch manual pages (archlinux.org)](https://man.archlinux.org/man/snapper-configs.5)

```bash
# Scroll down and find the 'timeline cleanup' block
# shown below:

TIMELINE_MIN_AGE="1800"
TIMELINE_LIMIT_HOURLY="10"
TIMELINE_LIMIT_DAILY="10"
TIMELINE_LIMIT_WEEKLY="0"
TIMELINE_LIMIT_MONTHLY="10"
TIMELINE_LIMIT_YEARLY="10"

# Modify these parameters as follows:
TIMELINE_MIN_AGE="1800"
TIMELINE_LIMIT_HOURLY="5"
TIMELINE_LIMIT_DAILY="7"
TIMELINE_LIMIT_WEEKLY="0"
TIMELINE_LIMIT_MONTHLY="0"
TIMELINE_LIMIT_YEARLY="0"

```



#### Save & Exit Snapshot Configuration File

```bash
# Save and Exit /etc/snapper/configs/root
```



#### Enable Snapper Timeline

```bash
sudo systemctl enable --now snapper-timeline.timer <ENTER>
```

#### Enable Snapper Cleanup

```bash
sudo systemctl enable --now snapper-cleanup_timer <ENTER>
```



## Install Arch User Repository Packages

### Install *yay*

#### Clone *yay* Repository

```bash
git clone https://aur.archlinux.org/yay <ENTER>
# Install 'yay'
```

#### Move to *yay* Directory

```bash
cd yay/ # Move to 'yay' directory
```

#### Build *yay* Package

```bash
makepkg -si PKGBUILD <ENTER> # Build the 'yay' package
```

### Return to Home Directory

```bash
cd # Return to Home Directory
```



### Install AUR Packages

```bash
yay -S snap-pac-grub snapper-gui <ENTER>
# Install:
#  snap-pac-grub
#  snapper-gui
Differences to show. # Take option 'None'
# You may be asked to install a 'key'. Take the default and press ENTER.

```

After this installation, you should reports of actual snapshots taken before and after installing new packages.



### Install Graphics Card

If you are installing on bare metal, you will need to install drivers for a graphics card. If you are installing on a Virtual Machine, skip this step.

#### Background

[AMDGPU - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/AMDGPU#Selecting_the_right_driver)

[Xorg - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/Xorg#Driver_installation)

#### AMD Video Cards

[Arch Linux - xf86-video-amdgpu 21.0.0-2 (x86_64)](https://archlinux.org/packages/extra/x86_64/xf86-video-amdgpu/)

#### Intel Video Cards

[Arch Linux - xf86-video-intel 1:2.99.917+916+g31486f40-2 (x86_64)](https://archlinux.org/packages/extra/x86_64/xf86-video-intel/)

#### New Nvidia Cards

[Arch Linux - nvidia 495.46-9 (x86_64)](https://archlinux.org/packages/extra/x86_64/nvidia/)

[Arch Linux - nvidia-utils 495.46-2 (x86_64)](https://archlinux.org/packages/extra/x86_64/nvidia-utils/)



```bash
pacman -S xf86-video-amdgpu
pacman -S xf86-video-intel
pacman -S nvidia nvidia-utils
```



# Phase-2 Install Desktop Environment



[How to Properly Install KDE on Arch Linux Step by Step -12-14-2021 (itsfoss.com)](https://itsfoss.com/install-kde-arch-linux/)

### Install Plasma Packages

```bash
sudo pacman -S xorg plasma plasma-wayland-session kde-applications firefox <ENTER>
# Command contains all the necessary packages
```



### Enable *sddm*

Simple Desktop Display Manager

#### Resources

[SDDM - ArchWiki (archlinux.org)](https://wiki.archlinux.org/title/SDDM)

[GitHub - sddm/sddm: QML based X11 and Wayland display manager](https://github.com/sddm/sddm/)

[What is Display Manager in Linux? (itsfoss.com)](https://itsfoss.com/display-manager/)

```bash
systemctl enable sddm.service <ENTER>
```



### Shutdown

```bash
shutdown now <ENTER> # Shutdown and Power Off
```

### Take a VM Snapshot

Take a VM Snapshot at this point. This snapshot will contain the base Arch Linux Installation.

### Power-On

Re-Start your system and sign on to your user account (***mike***).

Configure KDE-Plasma Desktop Environment.

[Detailed Guide to Configure KDE Plasma Desktop - Technastic](https://technastic.com/configure-kde-plasma-desktop/)



# Phase-3 Configure Applications



## Configure Zsh

[Install Zsh](.\Components\InstallZhs.md)

## Configure Alacritty
