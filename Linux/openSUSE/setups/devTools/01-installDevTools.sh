#!/bin/bash
# Installs GNU C and C++ Development Tools
# https://www.pragmaticlinux.com/2022/01/how-to-install-build-essential-on-opensuse/
# zypper search -t pattern
# zypper info -t pattern devel_basis

sudo zypper install -t pattern devel_basis devel_C_C++ gdb

