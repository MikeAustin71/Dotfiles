#!/bin/bash
#  Enable *free* Repositories
#
# Run this script as sudo

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
