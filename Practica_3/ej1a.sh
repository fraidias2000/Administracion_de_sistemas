#/bin/bash

#Se muestra por cada parametro fichero el propio fichero y sus permisos
for  param  in $*								#Por cada parametro de entrada
do
	if [ -d $1 ]									#Si el primer parametro es un directorio
	then
		cd $1									#Nos colocamos en el directorio
		if [ $# = 1 ]								
		then
			ls -l |  awk '{print $9 " " $1}'		#ls -l tuberia a => mostrar bloques separados por un espacio (de manera predefinida, NO lo define el " ")
		fi
	elif [ -f $param ]							#Si el parametro de entrada es un fichero
	then 		
		ls -l $param | awk '{print  $9 " " $1}'	#Mostramos el Nombre y las Caracetristicas (por separacion de bloques awk)
	else
		echo "Directorio o ficheros incorrectos"
		exit 1
	fi
done
