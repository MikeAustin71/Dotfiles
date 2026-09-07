#!/bin/bash
# Installs QT6 Technical Library
# Run this as sudo

echo
echo "Installing VSCodium Editor"
echo


 declare -i theVSCodiumErrCode=0

<<comment

  sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg || {

    theVSCodiumErrCode=$?

    echo "Error: Installation of VSCodium key FAILED!"
    echo "Command: sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg"
    echo "Script: 79-installVSCodium.sh"
    echo "Error Code: $theVSCodiumErrCode"

    return $theVSCodiumErrCode

  }

  sudo zypper addrepo -cfp 90 'https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/' vscodium || {

    theVSCodiumErrCode=$?

    echo "Error: Installation of VSCodium repository FAILED!"
    echo "Command: sudo zypper addrepo -cfp 90 'https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/' vscodium"
    echo "Script: 79-installVSCodium.sh"
    echo "Error Code: $theVSCodiumErrCode"

    return $theVSCodiumErrCode
  }


  sudo zypper install vscodium-insiders || {

    theVSCodiumErrCode=$?

    echo "Error: Primary Installation of VSCodium FAILED!"
    echo "Command: sudo zypper install vscodium-insiders"
    echo "Script: 79-installVSCodium.sh"
    echo "Error Code: $theVSCodiumErrCode"

    return $theVSCodiumErrCode

  }
comment

  sudo zypper install codium || {

    theVSCodiumErrCode=$?

    echo "Error: Primary Installation of VSCodium FAILED!"
    echo "Command: sudo zypper install codium"
    echo "Script: 79-installVSCodium.sh"
    echo "Error Code: $theVSCodiumErrCode"

    return $theVSCodiumErrCode

  }



echo
echo "VSCodium Editor Successfully Installed!"
echo "To launch, execute comand: 'vscodium'"
echo
