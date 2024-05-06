#!/bin/bash
# 1. Creates directory structure
# 2. Creates .bash_profile
#
source "$HOME"/bashOps/setups/utils/utilsLib.sh
source "$HOME"/bashOps/setups/utils/utilsAppConfig.sh
source "$HOME"/bashOps/setups/utils/utilsAppInstall.sh

msgNotify "Installing 'eza'" &&
installEza &&
msgNotify "Installing 'micro'" &&
installMicro &&
msgNotify "Installing 'broot'" &&
installBroot &&
msgNotify "Installing 'btop'" &&
installBtop &&
msgNotify "Installing 'fd'(find)" &&
installFd &&
msgNotify "Installing 'fzf'(Fuzzy Finder)" &&
installFuzzyFinder &&
msgNotify "Installing 'fkill'(Process Killer)" &&
installFkill &&
msgNotify "Installing 'mc'(Midnight Commander)" &&
installMidnightCommander &&
msgNotify "Installing 'bash-completion'" &&
installBashCompletion &&
msgNotify "Installing 'bat'" &&
installBat &&
msgNotify "Installing 'tldr'" &&
installTldr &&
msgNotify "Installing 'zoxide'" &&
installZoxide &&
msgNotify "Installing 'trash-cli'" &&
installTrash &&
msgNotify "Installing 'ghq'" &&
installScriptGHQ &&
msgNotify "Configuring 'HOME' Directory Structure" &&
configDirStructure &&
msgNotify "Configuring Environment Variables" &&
configEnvars &&
msgNotify "Configuring PATH Environment Variable" &&
configUserPath &&
# Configures Aliases and .bashrc
msgNotify "Configuring Aliases" &&
configAliases &&
msgNotify "Configuring .bash_profile" &&
configBashProfile &&
successMsg "All Phase-00a Structures Created." "REBOOT YOUR COMPUTER!" "Script: 00a-createBaseStructure.sh" || errXMsg "00a-createBaseStructure.sh Execution Failed" "Error-Exit!"