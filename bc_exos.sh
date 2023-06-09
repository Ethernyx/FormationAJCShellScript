exo 1
---------
ecrire un script interactif qui cree un repertoire. La commande demande de saisir le nom du repertoire

#!/bin/bash
read nom
mkdir $1

exo2
----------
ecrire un script qui affiche pour tous les utilisateurs passés en arguments :
    le nom de l'utilisateur
    le repertoire de connexion
    Le shell

#!/bin/bash
read nom
echo "nom : $1"
racine=$(grep "^$1" /etc/passwd | cut -d ':' -f 6)
echo "répertoire utilisateur : $racine"
shell=$(grep "^$1" /etc/passwd | cut -d ':' -f 7)
echo "shell : $shell"

exo3
------------
ecrire un script interactif qui cree un repertoire. La commande demande de saisir le nom du repertoire
la commande test si le repertoire existe , si la creation aboutit , la commande affiche un message de reussite.

#!/bin/bash
read nom
[ -f $1 ]
if [ $? -eq 1 ] then
	mkdir $1
	if [ $? -eq 0 ] then
		echo "répertoire créé"
	fi
fi

exo4
-----------------
Ecrivez un script qui affiche les process d'un utilisateur dont le nom est passé en argument et qui en l'absence, affiche la synthaxe d'appel

#!/bin/bash
read nom
if [ $# -eq 0 ] then
	echo "erreur : la syntaxe est $0 nom_utilisateur"
else
	pros=$(ps aux | grep "^$1" | tr -s ' '| cut -d ' ' -f 11)
	echo "les processeurs de $1 sont : $pros"
fi

exo5
-----------------
Créer un script qui demande à l'utilisateur de saisir une note et qui affiche un message en fonction de cette note :
    « très bien » si la note est entre 16 et 20 ;
    « bien » lorsqu'elle est entre 14 et 16 ;
    « assez bien » si la note est entre 12 et 14 ;
    « moyen » si la note est entre 10 et 12 ;
    « insuffisant » si la note est inférieur à 10.

#!/bin/bash
read note
if [ $1 -lt 10 ] then
	echo "insuffisant"
elif [$1 -lt 12 ] then
	echo "moyen"
elif [$1 -lt 14 ] then
	echo "assez bien"
elif [$1 -lt 16 ] then
	echo "bien"
elif [$1 -lt 20 ] then
	echo "très bien"
fi

exo6
-----------------
on crée la commande info_users. elle affiche le menu suivant :
 1- affiche les comptes utilisateurs
 2- affiche les dernieres connexions
 3 - affiche les utilisateurs connectés
le script utilise les commandes last et who ainsi que le fichier /etc/passwd

#!/bin/bash
echo "Choisissez votre option :"
echo "1- afficher les comptes utilisateurs"
echo "2- afficher les dernieres connexions"
echo "3 - afficher les utilisateurs connectés"

case $1 in
	1)echo "$(cut -d':' -f1 /etc/passwd)"
	2)echo "$(last)"
	3)echo "$(who)"
	*)echo "Veuillez saisir 1, 2 ou 3"
esac

exo 7
--------------
Même exercice que l'exo6 , mais le programme boucle , apres avoir executé une demande , le script affiche de nouveau le menu , il faut ajouter un item au menu qui permet de sortir du programme.	

#!/bin/bash

menu() {
echo "Choisissez votre option :"
echo "1- afficher les comptes utilisateurs"
echo "2- afficher les dernieres connexions"
echo "3 - afficher les utilisateurs connectés"
echo "4 - quitter menu"
}

action() {
read choix
case $choix in
	1)echo "$(cut -d':' -f1 /etc/passwd)"
	;;
	2)echo "$(last)"
	;;
	3)echo "$(who)"
	;;
	4)
	;;
	*)echo "Veuillez saisir 1, 2, 3 ou 4"
	;;
esac
}

choix=0
while [ $choix -ne "4" ]
do
	menu
	action
done

exo 8
----------------
creer un scripts qui propose un menu :
1 - creation utilisateur ( test si utilisateur present) : nom , password , profile (.bashrc)
2 - profile : copie d'un .bashrc
3 - suppression  : /etc/passwd ; /etc/group , suppression de mon home directory (y/n)
4- quitter

#!/bin/bash

menu() {
echo "Choisissez votre option :"
echo "1- créer un utilisateur"
echo "2- copie du .bashrc"
echo "3 - suppression de l'utilisateur de /etc/passwd ; /etc/group , suppression éventuelle de son home directory"
echo "4 - quitter menu"
}

action() {
read choix
case $choix in
	1)echo "Entrez le nom de l'utilisateur à créer"
	  read nom
	  cut -d':' -f1 /etc/passwd | grep "^$nom" -s
	  if [ $? -ne 0 ]
	  then
	  	useradd $nom --home --shell /bin/bash
	  	echo "Entrez le mot de passe utilisateur"
	  	read mdp
	  	passwd $nom
		echo "$mdp"
	 else
		echo "Cet utilisateur existe déjà"
	 fi
	;;
	2)echo "A quel utilisateur voulez-vous envoyer un fichier de profil .bashrc ?"
	  read user
	  cp /home/user/bob/.bashrc /home/user/$user
	;;
	3)echo "Quel utilisateur ?"
	  read user
	  sed -i '/^$user/d' /etc/passwd
	  sed -i '/^$user/d' /etc/group
	  echo "Voulez-vous supprimer son répertoire utilisateur ? y/n"
	  read answer
	  if [ $answer = "y" ]
	  then
		rm -r /home/user/$user
	  fi
	;;
	4)
	;;
	*)echo "Veuillez saisir 1, 2, 3 ou 4"
	;;
esac
}
choix=0
while [ $choix -ne "4" ]
do
	menu
	action
done
