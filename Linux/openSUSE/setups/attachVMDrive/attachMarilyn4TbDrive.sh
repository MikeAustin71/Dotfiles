#!/usr/bin/bash
# Attaches a Hard Drive on the Host System
# The attached drive is the Marilyn4Tb drive
#
# **** IMPORTANT ****
#
# Verify that /dev/sdb2 is the drive you want to
# attach. Use "fdisk -l" and "lsblk" to verify.
#
# Aftere attaching the drive, it will probably be
# accessible as "/run/media/mike/Marilyn4Tb".
# Create an alias to make it easier to access.
#
# Run this script as sudo.


declare baseSetups523Dir="$HOME"/bashOps/setups


source "$baseSetups523Dir"/utilsLib.sh

declare linuxDisk="/dev/sdb2"


sudo udisksctl mount -b "$linuxDisk"
