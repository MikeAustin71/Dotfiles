#!/bin/bash
# Install group codecs
#

sudo apt groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin


