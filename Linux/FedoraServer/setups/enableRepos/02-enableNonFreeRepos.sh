#!/bin/bash
#  Enable *Non-Free* Repositories
#
# Run this script as sudo

sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
