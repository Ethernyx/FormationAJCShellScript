#!/bin/bash

while true; do
        echo "1. Afficher les comptes utilisateurs"
        echo "2. Afficher les dernières connexions"
        echo "3. Afficher les utilisateurs connectés"
        read -p "Choix: " choix

        case $choix in
                1)
                        echo "User: "
                        cut -d: -f1 /etc/passwd
                        ;;
                2)
                        echo "Dernieres Connexions"
                        last
                        ;;
                3)
                        echo "User connectés: "
                        who
                        ;;

        esac
done
