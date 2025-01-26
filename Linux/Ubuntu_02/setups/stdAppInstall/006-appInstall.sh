#!/bin/bash
# Install Phase-5 application series
#
declare baseSetups90Dir="$HOME"/bashOps/setups
source "$baseSetups90Dir"/utils/utilsLib.sh
source "$baseSetups90Dir"/utils/utilsAppInstall.sh

msgNotify "Installing Pandoc" &&
installPandoc &&
msgNotify "Installing Calculator: Qalculate" &&
installQalculate &&
msgNotify "Installing Gimp" &&
installGimp &&
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