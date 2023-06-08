
#!/bin/bash
if [ $# -eq 1 ]
then
   ps -aux | grep ^$1
else
    echo "Mettre en paramètre l'utilisateur à selectionner"
fi
