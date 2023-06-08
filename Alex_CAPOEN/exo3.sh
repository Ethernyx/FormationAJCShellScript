#!/bin/bash

read -p "Nom du repertoire" repo
if [ -d "$repo" ]
then
       echo "$repo existe"
else
        mkdir "$repo"
        echo "$repo creer"
fi
