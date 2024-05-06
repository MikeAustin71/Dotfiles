#!/bin/bash
# Installs VS Code
# https://code.visualstudio.com/docs/setup/linux

echo
echo "Installing Visual Studio Code"
echo

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" |sudo tee /etc/zypp/repos.d/vscode.repo > /dev/null

sudo zypper refresh

sudo zypper install code

