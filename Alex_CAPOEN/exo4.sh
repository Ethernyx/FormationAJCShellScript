#!/bin/bash

if [ $# -eq 0 ]
then
        echo "Manque argument"
        echo "Synthaxe doit etre par exemple : ./exo4 user"
else
        user="$1"
        ps -u "$user"
fi
