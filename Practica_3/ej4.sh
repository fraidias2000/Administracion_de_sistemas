#/bin/bash

echo "1. Mostrar por consola todos aquellos usuarios que han sido dados de baja en el sistema, y tienen el fichero de correo vigente."

if [ "$1" != "-d" ]
then
	echo "Error, -d expected"
	exit 1
fi

if ! [ "$2" -ge 0 ]
then
	echo "Error, number expected"
	exit 2
fi

if [ "$3" != "-u" ]
then
	echo "Error, -u expected"
	exit 3
fi

#En /var/mail se encuentran los correos del usuario
cd /var/mail
ls | wc -l 
ls -la
date -r <>