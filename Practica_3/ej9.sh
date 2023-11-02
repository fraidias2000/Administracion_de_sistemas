#/bin/bash

#Si hay 1 argumento, solo se recibira el nombre de 1 directorio
if [ $# = 1 ]
then
	recur="no"
	dir1="$1"
	dir2="."
#Si hay 2 argumentos, podemos recibir
elif [ $# = 2 ]
then
	if [ "$1" = "-r" ]
	then
		#Opcion de recursividad y 1 directorio
		recur="si"
		dir1="$2"
		dir2="."
	else
		#2 directorios
		recur="no"
		dir1="$1"
		dir2="$2"
	fi
#Si hay 3 argumentos se recibira el nombre de 2 directorios y la opcion recursiva
elif [ $# = 3 ] && [ "$1" = "-r" ]
then
	recur="si"
	dir1="$2"
	dir2="$3"
else
	echo "Argumentos incorrectos"
	exit 1
fi
#Comfirmamos que los 2 directorios introducidos existen
if [ -d $dir1 ] && [ -d $dir2 ]
then
	#Realizamos la comparacion entre directorios
	resul=$(diff -sq "$dir1" "$dir2")
	#Troceamos la respuesta e imprimimos los resultados
	if [ "$recur" = "no" ]
	then
		resul1=$(echo "$resul" | grep "Sólo en $dir1: *" | cut -d ":" -f2 | tr '\n' ' ')
		resul2=$(echo "$resul" | grep "Sólo en $dir2: *" | cut -d ":" -f2 | tr '\n' ' ')
		echo "Archivos solo en $dir1:$resul1"
		echo "Archivos solo en $dir2:$resul2"
	else
		resul3=$(echo "$resul" | grep "Los ficheros*" | sed "s:Los ficheros $dir1::" | sed 's/son idénticos//'| sed 's/y.*//' | tr '\n' ' ')
		echo "Mismo archivos: $resul3"
	fi
else
	echo "Introduce 2 directorios correctamente"
	exit 2
fi
