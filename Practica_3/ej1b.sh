#/bin/bash

read -p "Introduzca el directorio: " dir
if [ -d $dir ]
then
	permisos=$(stat -c '%A %a %n' $dir | cut -d " " -f2)
	echo $permisos

	#Estos comandos no funcionan
	permisosU=$permisos%1000
	permisosG=$permisos%100
	permisosO=$permisos%10
	
	if ([ "$permisosU" -ge 400 ]) || ([ "$permisosG" -ge 40 ]) || ([ "$permisosO" -ge 4 ])
	then
		cd $dir
		ls -l |  awk '{print $9 " " $1}'
	else
		echo "No tiene permisos para acceder al directorio"
		exit 2
	fi
	
else
	echo "Directorio o ficheros incorrectos"
		exit 1
fi







