#!/bin/bash
echo "Saisir le nom du répertoire "
read a
if [ -e $a  ] && [ -d $a ]
then
    echo "Le répertoire existe déjà"
else
    mkdir $a
    echo "Le répertoire $a a été crée"
fi
