#!/bin/bash
if [ $# -eq 1 ]
then
    a=$(cat "/etc/passwd" | grep $1)
    b=$(echo $a | cut -d ':' -f 1)
    c=$(echo $a | cut -d ':' -f 6)
    d=$(echo $a | cut -d ':' -f 7)
    echo $b
   echo -e "utilisateur : $b\n répertoire de connexion : $c\n shell : $d\n"
fi

