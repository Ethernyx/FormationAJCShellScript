#!/bin/bash
if [ $# -eq 1 ]
then
    if [ $1 -lt 10 ] && [ $1 -ge 0 ]
    then
	echo "INSUFFISANT"
    elif [ $1 -lt 12 ]
    then
	echo "MOYEN"
    elif [ $1 -lt 14 ]
    then
	echo "ASSEZ BIEN"
    elif [ $1 -lt 16 ]
    then
	echo "BIEN"
    elif [ $1 -le 20 ]
    then
	echo "TRES BIEN"
    else
        echo "Entrez une valeur entre 0 et 20"
    fi
else
    echo "Rentrez une note entre 0 et 20"
fi
	 
		  
