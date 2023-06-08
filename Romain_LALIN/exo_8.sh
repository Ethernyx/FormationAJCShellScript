#!/bin/bash

function add_user
{
    if [ $# -eq 1 ]
    then
	if [$(cat "/etc/passwd" | grep $1 | wc -l) -eq 0 ]
	then
	    adduser $1
	else
	    echo "L'utilisateur $1 existe déjà"
	fi
    else
	echo "Il faut renseigner un nom de l'utilisateur"
    fi   
}


function del_user
{
    if [ $# -eq 1 ]
    then
	if [$(cat "/etc/passwd" | grep $1 | wc -l) -eq 0 ]
	then
	    echo "L'utilisateur n'existe pas"
	else
	    enter=true
	    while [ $enter ]
	    do
		echo -n "Voulez vous supprimer votre home directory ? (y/n)"
		read bool
		if [ $bool = "y" ] || [ $bool = "n" ]
		then
		    enter=false
		    if [ $bool = "y" ]
		    then
			deluser -r $1
		    else
			deluser $1
		    fi
		fi
	    done
	fi
    else
	echo "Il faut renseigner un nom d'utilisateur"
    fi
}

function add_profil
{
    if [ $# -eq 2 ] && [ -e $2 ]
    then
	if [ $(cat "/etc/passswd" | grep $1 | wc -l) -eq 1 ]
	then
	    cp $2 "/home/"$1"/.bashrc"
	else
	    echo "L'utilisateur n'existe pas"
	fi
    else
	echo "Il faut renseigner utilisateur qui exite ainsi qu'un fichier de type .bashrc valide"
    fi
}


if [ $(id -u) -eq 0 ]
then
    my_continu=true
    while ( $my_continu )
    do
	read command
	case $command in
	    "new_user" )
		add_user
		;;
	    "new_profil" )
		add_profil
		;;
	    "delete_user" )
		del_user
		;;
	    "list_command" )
		echo -e "Ajouter un utilisateur : new_user\nAjouter un profil : new_profil\nSupprimer un utilisateur : delete_user\nSortir du programmme : terminer"
		;;
	    "terminer" )
		my_continu=false
		;;
	    *)
		echo -e "Command not found\nListe des commandes : list_command"
	esac
    done
else
    echo "Vous devez lanceer ce script en root"
fi

	    
