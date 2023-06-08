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

my_continu=true
while ($my_continu)
do
    read command
    case $command in
	"user_list" )
	    user_list
	    ;;
	"last_logging" )
	    last_coo
	    ;;
	"user_logged" )
	    user_coo
	    ;;
	"list_command" )
	    echo -e "Liste des utilisateurs : user_list\nListe des dernières conneections : last_logging\nListe des utilisateurs connectés : user_logged"
	    ;;
	"terminer" )
	    my_continu=false
	    ;;
	*)
	    echo -e "Command not found\nListe des commandes : list_command"
    esac
done
