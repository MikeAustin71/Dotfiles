#!/bin/bash
# Mike's initial PATH Specification
#
#


# Initial Path Spec
if ! [[ "$PATH" =~ "/home/mike/.local/bin" ]]
then
    PATH="/home/mike/.local/bin":"$PATH"
fi

export PATH


