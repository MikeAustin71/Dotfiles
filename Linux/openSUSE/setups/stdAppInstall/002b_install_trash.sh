#!/bin/bash
# Installs Trash
# This procedure is error prone and
# requires user intervention.

echo
echo "Installing Trash"
echo

# No longer required
# sudo zypper addrepo https://download.opensuse.org/repositories/home:our-obo-ros/openSUSE_Tumbleweed/home:our-obo-ros.repo


sudo zypper refresh


sudo zypper install trash-cli

