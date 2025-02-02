#!/bin/bash
# Install Phase-6 application series
#
declare baseSetups90Dir="$HOME"/bashOps/setups
source "$baseSetups90Dir"/utils/utilsLib.sh
source "$baseSetups90Dir"/utils/utilsAppInstall.sh

msgNotify "Installing Pandoc" &&
installPandoc &&
msgNotify "Installing Calculator: Qalculate" &&
installQalculate &&
msgNotify "Installing 'gimp'" &&
installGimp &&
msgNotify "Installing Bless Hex Editor" &&
installBless &&
msgNotify "Installing Samba" &&
installSamba &&
msgNotify "Installing KeePassXC" &&
installKeePassXC &&
msgNotify "Installing TexMaker for LaTeX" &&
installTexMaker &&
msgNotify "Installing Kile for LaTeX" &&
installKile &&
msgNotify "Installing Draw IO" &&
installDrawIO &&
msgNotify "Returning to Home Base" &&
changeToDir "$baseSetups90Dir/stdAppInstall" &&
successMsg "All Phase-6 Applications Successfully Installed." "006-appInstall.sh" || {

  errXMsg "006-appInstall.sh Execution Failed" "Error-Exit!"
}