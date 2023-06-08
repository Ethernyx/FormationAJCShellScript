#!/bin/bash

read -p "Note " note

case $note in
        [0-9])
                echo "Insuffisant"
                ;;
        1[0-1])
                echo "Moyen"
                ;;
        1[2-3])
                echo "Assez bien"
                ;;
        1[4-5])
                echo "Bien"
                ;;
        1[6-9] | 20)
                echo "Très bien"
                ;;
esac
