#!/bin/bash
# Installs VS Code
# Reference:
#  https://linuxiac.com/how-to-install-vs-code-on-ubuntu-24-04-lts/
# To Uninstall vscode:
# sudo apt remove code

echo
echo "Installing Visual Studio Code"
echo

sudo apt update

sudo apt install wget gpg apt-transport-https

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

rm packages.microsoft.gpg

sudo apt update

sudo apt install code
