#!/bin/bash

function user_list
{
    list=$(cat "/etc/passwd" | cut -d ':' -f 1)
    echo "Liste des utilisateur :"
    echo $list | sed -e "s/ /\n/g"
}

function last_coo
{
    list=$(last -w | cut -d ' ' -f 1)
    echo "Dernière connections :"
    echo $list | sed -e "s/ /\n/g"
}

function user_coo
{
    list=$(who | cut -d ' ' -f 1)
    echo "Liste des utilisateurs connéctés :"
    echo $list | sed -e "s/ /\n/g"
}
 
user_list
last_coo
user_coo
