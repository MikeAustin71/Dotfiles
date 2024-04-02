#!/bin/bash
# Copies a pre-configured inputrc file to
# $Home/.inputrc

source "$MIKE_Setup_Scripts/utils/utilsLib.sh"

declare -i inputRcErrorCode=0

declare inputRcSourceFile="$MIKE_Setup_Scripts/homeDir/inputrc.txt"

declare inputRcDestinationFile="$HOME/.inputrc"

if [[ ! -f $inputRcSourceFile ]]
then

    echo "*** ERROR ***"
    echo "The 'inputrc' Source File DOES NOT EXIST!"
    echo "'inputrc' Source File: $inputRcSourceFile"
    echo "Script File: copyInputrc.sh"
    echo ""
    exit  99
fi

if [[ -f $inputRcDestinationFile ]]
then

    inputRcErrorCode=$?

    rm "$inputRcDestinationFile" ||
    {
      echo "*** ERROR ***"
      echo "Delete old inputrc File Operation FAILED!"
      echo "Old inputrc File= $inputRcDestinationFile"
      echo "Error Code: $inputRcErrorCode"
      echo "Script File: copyInputrc.sh"

      exit $inputRcErrorCode
    }

fi

# cp -v "$MIKE_Setup_Scripts/homeDir/inputrc.txt"  "$HOME/.inputrc"
cp -v "$inputRcSourceFile" "$inputRcDestinationFile" ||
{

      inputRcErrorCode=$?

      echo "*** ERROR ***"
      echo "Copy inputrc File To Operation FAILED!"
      echo "inputrc Source File= $inputRcSourceFile"
      echo ".inputrc Destination File= $inputRcDestinationFile"
      echo "Error Code: $inputRcErrorCode"
      echo "Script File: copyInputrc.sh"

      exit $inputRcErrorCode

}

successMsg "Successfully copied default .inputrc file" "to Directory: $Home"

exit



